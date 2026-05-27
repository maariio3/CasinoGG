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
    $apuestaPorCasilla = (float) $request->request->get('apuesta');
    $selecciones = explode(',', $request->request->get('selecciones'));
    $totalApuesta = $apuestaPorCasilla * count($selecciones);

    if ($apuestaPorCasilla <= 0 || $totalApuesta > (float) $user->getSaldo()) {
        return $this->json(['error' => 'Apuesta inválida'], 400);
    }

    $numero = random_int(0, 36);
    $rojos = [1,3,5,7,9,12,14,16,18,19,21,23,25,27,30,32,34,36];
    $color = $numero === 0 ? 'verde' : (in_array($numero, $rojos) ? 'rojo' : 'negro');

    $ganancia = 0;
    foreach ($selecciones as $tipo) {
        $tipo = trim($tipo);
        if ((string)$numero === $tipo) {
            $ganancia += $apuestaPorCasilla * 36;
        } elseif ($tipo === $color) {
            $ganancia += $apuestaPorCasilla * 2;
        }
    }

    $nuevoSaldo = (float) $user->getSaldo() - $totalApuesta + $ganancia;
    $user->setSaldo((string) $nuevoSaldo);

    $partida = new \App\Entity\Partida();
    $partida->setUser($user);
    $partida->setJuego($em->getRepository(\App\Entity\Juego::class)->findOneBy(['nombre' => 'Ruleta Europea']));
    $partida->setCantidadApostada((string) $totalApuesta);
    $partida->setResultadoObtenido((string) $ganancia);
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

    #[Route('/slots/jugar', name: 'app_slots_jugar', methods: ['POST'])]
public function slotsJugar(Request $request, EntityManagerInterface $em): Response
{
    $user = $this->getUser();
    $apuesta = (float) $request->request->get('apuesta');

    if ($apuesta <= 0 || $apuesta > (float) $user->getSaldo()) {
        return $this->json(['error' => 'Apuesta inválida'], 400);
    }

    $simbolos = ['🍒', '🍋', '🍇', '⭐', '🔔', '💎'];
    $resultado = [
        $simbolos[random_int(0, 5)],
        $simbolos[random_int(0, 5)],
        $simbolos[random_int(0, 5)]
    ];

    $ganancia = 0;
    if ($resultado[0] === $resultado[1] && $resultado[1] === $resultado[2]) {
        $ganancia = $apuesta * 5;
    } elseif ($resultado[0] === $resultado[1] || $resultado[1] === $resultado[2] || $resultado[0] === $resultado[2]) {
        $ganancia = $apuesta * 2;
    }

    $nuevoSaldo = (float) $user->getSaldo() - $apuesta + $ganancia;
    $user->setSaldo((string) $nuevoSaldo);

    $partida = new \App\Entity\Partida();
    $partida->setUser($user);
    $partida->setJuego($em->getRepository(\App\Entity\Juego::class)->findOneBy(['nombre' => 'Slots']));
    $partida->setCantidadApostada((string) $apuesta);
    $partida->setResultadoObtenido((string) $ganancia);
    $partida->setFecha(new \DateTime());
    $em->persist($partida);
    $em->flush();

    return $this->json([
        'resultado' => $resultado,
        'ganancia' => $ganancia,
        'saldo' => $nuevoSaldo,
        'gano' => $ganancia > 0
    ]);
}

#[Route('/juegos/caracruz', name: 'app_caracruz')]
public function caraCruz(): Response
{
    return $this->render('home/caracruz.html.twig');
}

#[Route('/juegos/caracruz/jugar', name: 'app_caracruz_jugar', methods: ['POST'])]
public function caraCruzJugar(Request $request, EntityManagerInterface $em): Response
{
    $user = $this->getUser();
    $apuesta = (float) $request->request->get('apuesta');
    $eleccion = $request->request->get('eleccion');

    if ($apuesta <= 0 || $apuesta > (float) $user->getSaldo()) {
        return $this->json(['error' => 'Apuesta inválida'], 400);
    }

    $resultado = random_int(0, 1) ? 'cara' : 'cruz';
    $ganancia = $eleccion === $resultado ? $apuesta * 2 : 0;
    $nuevoSaldo = (float) $user->getSaldo() - $apuesta + $ganancia;
    $user->setSaldo((string) $nuevoSaldo);

    $partida = new \App\Entity\Partida();
    $partida->setUser($user);
    $partida->setJuego($em->getRepository(\App\Entity\Juego::class)->findOneBy(['nombre' => 'Cara o Cruz']));
    $partida->setCantidadApostada((string) $apuesta);
    $partida->setResultadoObtenido((string) $ganancia);
    $partida->setFecha(new \DateTime());
    $em->persist($partida);
    $em->flush();

    return $this->json([
        'resultado' => $resultado,
        'ganancia' => $ganancia,
        'saldo' => $nuevoSaldo,
        'gano' => $ganancia > 0
    ]);
}

#[Route('/juegos/dados', name: 'app_dados')]
public function dados(): Response
{
    return $this->render('home/dados.html.twig');
}

#[Route('/juegos/dados/jugar', name: 'app_dados_jugar', methods: ['POST'])]
public function dadosJugar(Request $request, EntityManagerInterface $em): Response
{
    $user = $this->getUser();
    $apuesta = (float) $request->request->get('apuesta');
    $eleccion = $request->request->get('eleccion');

    if ($apuesta <= 0 || $apuesta > (float) $user->getSaldo()) {
        return $this->json(['error' => 'Apuesta inválida'], 400);
    }

    $dado1 = random_int(1, 6);
    $dado2 = random_int(1, 6);
    $suma = $dado1 + $dado2;
    $resultado = $suma >= 8 ? 'alta' : 'baja';
    $ganancia = $eleccion === $resultado ? $apuesta * 2 : 0;
    $nuevoSaldo = (float) $user->getSaldo() - $apuesta + $ganancia;
    $user->setSaldo((string) $nuevoSaldo);

    $partida = new \App\Entity\Partida();
    $partida->setUser($user);
    $partida->setJuego($em->getRepository(\App\Entity\Juego::class)->findOneBy(['nombre' => 'Dados']));
    $partida->setCantidadApostada((string) $apuesta);
    $partida->setResultadoObtenido((string) $ganancia);
    $partida->setFecha(new \DateTime());
    $em->persist($partida);
    $em->flush();

    return $this->json([
        'dado1' => $dado1,
        'dado2' => $dado2,
        'suma' => $suma,
        'resultado' => $resultado,
        'ganancia' => $ganancia,
        'saldo' => $nuevoSaldo,
        'gano' => $ganancia > 0
    ]);
}

#[Route('/recompensa', name: 'app_recompensa', methods: ['POST'])]
public function recompensa(EntityManagerInterface $em): Response
{
    $user = $this->getUser();
    $ahora = new \DateTime();

    if ($user->getUltimaRecompensa() !== null) {
        $diff = $ahora->diff($user->getUltimaRecompensa());
        $horas = ($diff->days * 24) + $diff->h;
        if ($horas < 24) {
            return $this->json(['error' => 'Ya reclamaste tu recompensa hoy. Vuelve en ' . (24 - $horas) . ' horas.']);
        }
    }

    $user->setSaldo((string)((float)$user->getSaldo() + 100));
    $user->setUltimaRecompensa($ahora);
    $em->flush();

    return $this->json(['saldo' => $user->getSaldo(), 'success' => true]);
}
#[Route('/ranking', name: 'app_ranking')]
public function ranking(Request $request, EntityManagerInterface $em): Response
{
    $filtroJuego = $request->request->get('juego', '');

    $qb = $em->createQueryBuilder();
    $qb->select('p')
       ->from(\App\Entity\Partida::class, 'p')
       ->join('p.juego', 'j')
       ->where('p.resultado_obtenido > 0')
       ->orderBy('p.resultado_obtenido', 'DESC')
       ->setMaxResults(10);

    if ($filtroJuego) {
        $qb->andWhere('j.nombre = :juego')
           ->setParameter('juego', $filtroJuego);
    }

    $partidas = $qb->getQuery()->getResult();

    return $this->render('home/ranking.html.twig', [
        'partidas' => $partidas,
        'filtroJuego' => $filtroJuego
    ]);
}

#[Route('/terminos', name: 'app_terminos')]
public function terminos(): Response
{
    return $this->render('home/terminos.html.twig');
}
}