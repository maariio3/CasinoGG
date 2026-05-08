<?php

namespace App\Controller;

use Symfony\Bundle\FrameworkBundle\Controller\AbstractController;
use Symfony\Component\HttpFoundation\Response;
use Symfony\Component\Routing\Attribute\Route;
use Symfony\Component\HttpFoundation\Request;
use Doctrine\ORM\EntityManagerInterface;

class HomeController extends AbstractController
{
    #[Route('/', name: 'app_home')]
    public function index(): Response
    {
        return $this->render('home/index.html.twig');
    }

    #[Route('/ruleta', name: 'app_ruleta')]
    public function ruleta(): Response
    {
        return $this->render('home/ruleta.html.twig');
    }

    #[Route('/slots', name: 'app_slots')]
    public function slots(): Response
    {
        return $this->render('home/slots.html.twig');
    }

    #[Route('/juegos', name: 'app_juegos')]
    public function juegos(): Response
    {
        return $this->render('home/juegos.html.twig');
    }

    #[Route('/ruleta/europea', name: 'app_ruleta_europea')]
    public function ruletaEuropea(): Response
    {
        return $this->render('home/ruleta_europea.html.twig');
    }

    #[Route('/ruleta/europea/girar', name: 'app_ruleta_europea_girar', methods: ['POST'])]
    public function girarRuleta(Request $request, EntityManagerInterface $em): Response
    {
        $user = $this->getUser();
        $apuesta = (float) $request->request->get('apuesta');
        $tipo = $request->request->get('tipo');

        if ($apuesta <= 0 || $apuesta > (float) $user->getSaldo()) {
            return $this->json(['error' => 'Apuesta inválida'], 400);
        }

        $numero = random_int(0, 36);
        $rojos = [1,3,5,7,9,12,14,16,18,19,21,23,25,27,30,32,34,36];
        $color = $numero === 0 ? 'verde' : (in_array($numero, $rojos) ? 'rojo' : 'negro');

        $ganancia = 0;
        if ((string)$numero === $tipo) {
            $ganancia = $apuesta * 36;
        } elseif ($tipo === $color) {
            $ganancia = $apuesta * 2;
        }

        $nuevoSaldo = (float) $user->getSaldo() - $apuesta + $ganancia;
        $user->setSaldo((string) $nuevoSaldo);

        $partida = new \App\Entity\Partida();
        $partida->setUser($user);
        $partida->setJuego($em->getRepository(\App\Entity\Juego::class)->findOneBy(['nombre' => 'Ruleta Europea']));
        $partida->setCantidadApostada((string)$apuesta);
        $partida->setResultadoObtenido((string)$ganancia);
        $partida->setFecha(new \DateTime());
        $em->persist($partida);
        $em->flush();

        return $this->json([
            'numero' => $numero,
            'color' => $color,
            'ganancia' => $ganancia,
            'saldo' => $nuevoSaldo,
            'gano' => $ganancia > 0
        ]);
    }
}