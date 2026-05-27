<?php

namespace App\Controller;

use Doctrine\ORM\EntityManagerInterface;
use Symfony\Bundle\FrameworkBundle\Controller\AbstractController;
use Symfony\Component\HttpFoundation\Request;
use Symfony\Component\HttpFoundation\Response;
use Symfony\Component\PasswordHasher\Hasher\UserPasswordHasherInterface;
use Symfony\Component\Routing\Attribute\Route;

class PerfilController extends AbstractController
{
    #[Route('/perfil', name: 'app_perfil')]
    public function index(Request $request, EntityManagerInterface $em, UserPasswordHasherInterface $hasher): Response
    {
        $user = $this->getUser();

        if ($request->isMethod('POST')) {
            $accion = $request->request->get('accion');

            if ($accion === 'nombre') {
                $user->setNombre($request->request->get('nombre'));
                $em->flush();
                $this->addFlash('success', 'Nombre actualizado.');
            }

            if ($accion === 'foto') {
                $file = $request->files->get('foto');
                if ($file) {
                    $nombre = uniqid() . '.' . $file->guessExtension();
                    $file->move($this->getParameter('kernel.project_dir') . '/public/uploads/avatares/', $nombre);
                    $user->setFotoPerfil($nombre);
                    $em->flush();
                    $this->addFlash('success', 'Foto actualizada.');
                }
            }

            if ($accion === 'password') {
                $actual = $request->request->get('password_actual');
                $nueva = $request->request->get('password_nueva');

                if (!$hasher->isPasswordValid($user, $actual)) {
                    $this->addFlash('error', 'La contraseña actual es incorrecta.');
                } elseif (strlen($nueva) < 6) {
                    $this->addFlash('error', 'La nueva contraseña debe tener al menos 6 caracteres.');
                } else {
                    $user->setPassword($hasher->hashPassword($user, $nueva));
                    $em->flush();
                    $this->addFlash('success', 'Contraseña actualizada.');
                }
            }

            return $this->redirectToRoute('app_perfil');
        }

        return $this->render('perfil/index.html.twig');
    }

    #[Route('/historial', name: 'app_historial')]
public function historial(EntityManagerInterface $em): Response
{
    $partidas = $em->getRepository(\App\Entity\Partida::class)->findBy(
        ['user' => $this->getUser()],
        ['fecha' => 'DESC']
    );
    return $this->render('perfil/historial.html.twig', ['partidas' => $partidas]);
}
}