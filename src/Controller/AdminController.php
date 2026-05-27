<?php

namespace App\Controller;

use App\Entity\User;
use Doctrine\ORM\EntityManagerInterface;
use Symfony\Bundle\FrameworkBundle\Controller\AbstractController;
use Symfony\Component\HttpFoundation\Request;
use Symfony\Component\HttpFoundation\Response;
use Symfony\Component\Routing\Attribute\Route;
use Symfony\Component\Security\Http\Attribute\IsGranted;

#[IsGranted('ROLE_ADMIN')]
class AdminController extends AbstractController
{
    #[Route('/admin', name: 'app_admin')]
public function index(EntityManagerInterface $em): Response
{
    $usuarios = $em->getRepository(User::class)->findAll();

    $balances = [];
    foreach ($usuarios as $usuario) {
        $partidas = $em->getRepository(\App\Entity\Partida::class)->findBy(['user' => $usuario]);
        $totalApostado = 0;
        $totalGanado = 0;
        foreach ($partidas as $partida) {
            $totalApostado += (float) $partida->getCantidadApostada();
            $totalGanado += (float) $partida->getResultadoObtenido();
        }
        $balances[$usuario->getId()] = [
            'apostado' => $totalApostado,
            'ganado' => $totalGanado,
            'balance' => $totalGanado - $totalApostado
        ];
    }

    return $this->render('admin/index.html.twig', [
        'usuarios' => $usuarios,
        'balances' => $balances
    ]);
}

    #[Route('/admin/saldo/{id}', name: 'app_admin_saldo', methods: ['POST'])]
    public function editarSaldo(User $user, Request $request, EntityManagerInterface $em): Response
    {
        $user->setSaldo($request->request->get('saldo'));
        $em->flush();
        $this->addFlash('success', 'Saldo actualizado.');
        return $this->redirectToRoute('app_admin');
    }

    #[Route('/admin/eliminar/{id}', name: 'app_admin_eliminar', methods: ['POST'])]
    public function eliminarUsuario(User $user, EntityManagerInterface $em): Response
    {
        $userId = $user->getId();
        $conn = $em->getConnection();
        $conn->executeStatement('DELETE FROM transaccion WHERE user_id = :id', ['id' => $userId]);
        $conn->executeStatement('DELETE FROM partida WHERE user_id = :id', ['id' => $userId]);
        $conn->executeStatement('DELETE FROM `user` WHERE id = :id', ['id' => $userId]);

        $this->addFlash('success', 'Usuario eliminado.');
        return $this->redirectToRoute('app_admin');
    }
}