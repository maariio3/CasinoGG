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
public function historial(Request $request, EntityManagerInterface $em): Response
{
    $user = $this->getUser();
    $filtroJuego = $request->request->get('juego', '');
    $filtroFechaDesde = $request->request->get('fecha_desde', '');
    $filtroFechaHasta = $request->request->get('fecha_hasta', '');

    $qb = $em->createQueryBuilder();
    $qb->select('p')
       ->from(\App\Entity\Partida::class, 'p')
       ->join('p.juego', 'j')
       ->where('p.user = :user')
       ->setParameter('user', $user)
       ->orderBy('p.fecha', 'DESC');

    if ($filtroJuego) {
        $qb->andWhere('j.nombre = :juego')
           ->setParameter('juego', $filtroJuego);
    }

    if ($filtroFechaDesde) {
        $qb->andWhere('p.fecha >= :desde')
           ->setParameter('desde', new \DateTime($filtroFechaDesde));
    }

    if ($filtroFechaHasta) {
        $qb->andWhere('p.fecha <= :hasta')
           ->setParameter('hasta', new \DateTime($filtroFechaHasta . ' 23:59:59'));
    }

    $partidas = $qb->getQuery()->getResult();

    return $this->render('perfil/historial.html.twig', [
        'partidas' => $partidas,
        'filtroJuego' => $filtroJuego,
        'filtroFechaDesde' => $filtroFechaDesde,
        'filtroFechaHasta' => $filtroFechaHasta,
    ]);
}

#[Route('/estadisticas', name: 'app_estadisticas')]
public function estadisticas(EntityManagerInterface $em): Response
{
    $user = $this->getUser();
    $partidas = $em->getRepository(\App\Entity\Partida::class)->findBy(['user' => $user]);

    $jugadas = count($partidas);
    $ganadas = 0;
    $perdidas = 0;
    $totalGanado = 0;
    $totalApostado = 0;

    foreach ($partidas as $partida) {
        $totalApostado += (float) $partida->getCantidadApostada();
        $totalGanado += (float) $partida->getResultadoObtenido();
        if ((float) $partida->getResultadoObtenido() > 0) {
            $ganadas++;
        } else {
            $perdidas++;
        }
    }

    return $this->render('perfil/estadisticas.html.twig', [
        'jugadas' => $jugadas,
        'ganadas' => $ganadas,
        'perdidas' => $perdidas,
        'totalGanado' => $totalGanado,
        'totalApostado' => $totalApostado,
        'balance' => $totalGanado - $totalApostado
    ]);
}
#[Route('/eliminar-cuenta', name: 'app_eliminar_cuenta', methods: ['POST'])]
public function eliminarCuenta(Request $request, EntityManagerInterface $em, UserPasswordHasherInterface $hasher): Response
{
    $user = $this->getUser();
    $password = $request->request->get('password');

    if (!$hasher->isPasswordValid($user, $password)) {
        $this->addFlash('error_eliminar', 'Contraseña incorrecta.');
        return $this->redirectToRoute('app_home');
    }

    $userId = $user->getId();
    $em->getConnection()->executeStatement('DELETE FROM transaccion WHERE user_id = :id', ['id' => $userId]);
    $em->getConnection()->executeStatement('DELETE FROM partida WHERE user_id = :id', ['id' => $userId]);
    $em->getConnection()->executeStatement('DELETE FROM `user` WHERE id = :id', ['id' => $userId]);

    $request->getSession()->invalidate();
    return $this->redirectToRoute('app_register');
}
}