<?php

namespace App\Entity;

use App\Repository\PartidaRepository;
use Doctrine\DBAL\Types\Types;
use Doctrine\ORM\Mapping as ORM;

#[ORM\Entity(repositoryClass: PartidaRepository::class)]
class Partida
{
    #[ORM\Id]
    #[ORM\GeneratedValue]
    #[ORM\Column]
    private ?int $id = null;

    #[ORM\Column(type: Types::DECIMAL, precision: 10, scale: 2)]
    private ?string $cantidad_apostada = null;

    #[ORM\Column(type: Types::DECIMAL, precision: 10, scale: 2)]
    private ?string $resultado_obtenido = null;

    #[ORM\Column]
    private ?\DateTime $fecha = null;

    #[ORM\ManyToOne]
    #[ORM\JoinColumn(nullable: false)]
    private ?User $user = null;

    #[ORM\ManyToOne]
    #[ORM\JoinColumn(nullable: false)]
    private ?Juego $juego = null;

    public function getId(): ?int
    {
        return $this->id;
    }

    public function getCantidadApostada(): ?string
    {
        return $this->cantidad_apostada;
    }

    public function setCantidadApostada(string $cantidad_apostada): static
    {
        $this->cantidad_apostada = $cantidad_apostada;

        return $this;
    }

    public function getResultadoObtenido(): ?string
    {
        return $this->resultado_obtenido;
    }

    public function setResultadoObtenido(string $resultado_obtenido): static
    {
        $this->resultado_obtenido = $resultado_obtenido;

        return $this;
    }

    public function getFecha(): ?\DateTime
    {
        return $this->fecha;
    }

    public function setFecha(\DateTime $fecha): static
    {
        $this->fecha = $fecha;

        return $this;
    }

    public function getUser(): ?User
    {
        return $this->user;
    }

    public function setUser(?User $user): static
    {
        $this->user = $user;

        return $this;
    }

    public function getJuego(): ?Juego
    {
        return $this->juego;
    }

    public function setJuego(?Juego $juego): static
    {
        $this->juego = $juego;

        return $this;
    }
}
