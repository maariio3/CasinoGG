<?php

namespace App\Controller;

use App\Entity\User;
use App\Entity\Transaccion;
use App\Form\RegistrationFormType;
use Doctrine\ORM\EntityManagerInterface;
use Symfony\Bundle\FrameworkBundle\Controller\AbstractController;
use Symfony\Component\HttpFoundation\Request;
use Symfony\Component\HttpFoundation\Response;
use Symfony\Component\Mailer\MailerInterface;
use Symfony\Component\Mime\Email;
use Symfony\Component\PasswordHasher\Hasher\UserPasswordHasherInterface;
use Symfony\Component\Routing\Attribute\Route;
use Symfony\Component\Routing\Generator\UrlGeneratorInterface;

class RegistrationController extends AbstractController
{
    #[Route('/register', name: 'app_register')]
    public function register(Request $request, UserPasswordHasherInterface $hasher, EntityManagerInterface $em, MailerInterface $mailer): Response
    {
        $user = new User();
        $form = $this->createForm(RegistrationFormType::class, $user);
        $form->handleRequest($request);

        if ($form->isSubmitted() && $form->isValid()) {
            $user->setPassword($hasher->hashPassword($user, $form->get('plainPassword')->getData()));
            $user->setRoles(['ROLE_USER']);
            $user->setEstadoVerificacion('pendiente');

            $saldoInicial = '1000.00';
            if ($user->isNewsletter()) {
                $saldoInicial = '1500.00';
            }
            $user->setSaldo($saldoInicial);

            $token = bin2hex(random_bytes(32));
            $user->setVerificationToken($token);

            $em->persist($user);

            $transaccion = new Transaccion();
            $transaccion->setUser($user);
            $transaccion->setTipo('bono');
            $transaccion->setCantidad($saldoInicial);
            $transaccion->setFecha(new \DateTime());
            $transaccion->setDescripcion($user->isNewsletter() ? 'Bono bienvenida + newsletter (1500€)' : 'Bono de bienvenida (1000€)');
            $em->persist($transaccion);

            $em->flush();

            $url = $this->generateUrl('app_verify_email', ['token' => $token], UrlGeneratorInterface::ABSOLUTE_URL);

            $email = (new Email())
                ->from('casinogg@casino.com')
                ->to($user->getEmail())
                ->subject('Verifica tu cuenta - CasinoGG')
                ->html('<p>Haz clic aquí para verificar tu cuenta: <a href="'.$url.'">'.$url.'</a></p>');

            $mailer->send($email);

            $this->addFlash('success', 'Registro exitoso. Revisa tu correo para verificar tu cuenta.');
            return $this->redirectToRoute('app_login');
        }

        return $this->render('registration/register.html.twig', ['form' => $form]);
    }

    #[Route('/verify/{token}', name: 'app_verify_email')]
    public function verify(string $token, EntityManagerInterface $em): Response
    {
        $user = $em->getRepository(User::class)->findOneBy(['verificationToken' => $token]);

        if (!$user) {
            $this->addFlash('error', 'Token inválido.');
            return $this->redirectToRoute('app_login');
        }

        $user->setEstadoVerificacion('verificado');
        $user->setVerificationToken(null);
        $em->flush();

        $this->addFlash('success', '¡Cuenta verificada! Ya puedes iniciar sesión.');
        return $this->redirectToRoute('app_login');
    }
}