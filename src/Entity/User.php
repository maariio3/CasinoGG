<?php

namespace App\Entity;

use App\Repository\UserRepository;
use Doctrine\ORM\Mapping as ORM;
use Symfony\Bridge\Doctrine\Validator\Constraints\UniqueEntity;
use Symfony\Component\Security\Core\User\PasswordAuthenticatedUserInterface;
use Symfony\Component\Security\Core\User\UserInterface;

#[ORM\Entity(repositoryClass: UserRepository::class)]
#[ORM\Table(name: '`user`')]
#[UniqueEntity(fields: ['email'], message: 'Ya existe una cuenta con este email')]
class User implements UserInterface, PasswordAuthenticatedUserInterface
{
    #[ORM\Id]
    #[ORM\GeneratedValue]
    #[ORM\Column]
    private ?int $id = null;

    #[ORM\Column(length: 180, unique: true)]
    private ?string $email = null;

    #[ORM\Column]
    private array $roles = [];

    #[ORM\Column]
    private ?string $password = null;

    #[ORM\Column(length: 20)]
    private ?string $estado_verificacion = 'pendiente';

    #[ORM\Column]
    private ?bool $newsletter = false;

    #[ORM\Column(type: 'decimal', precision: 10, scale: 2)]
    private ?string $saldo = '0.00';

    #[ORM\Column(length: 64, nullable: true)]
    private ?string $verificationToken = null;

    #[ORM\Column(length: 100, nullable: true)]
private ?string $nombre = null;

    #[ORM\Column(length: 255, nullable: true)]
private ?string $foto_perfil = null;

#[ORM\Column(nullable: true)]
private ?\DateTime $ultima_recompensa = null;


    public function getId(): ?int { return $this->id; }
    public function getEmail(): ?string { return $this->email; }
    public function setEmail(string $email): static { $this->email = $email; return $this; }
    public function getUserIdentifier(): string { return (string) $this->email; }
    public function getRoles(): array { $roles = $this->roles; $roles[] = 'ROLE_USER'; return array_unique($roles); }
    public function setRoles(array $roles): static { $this->roles = $roles; return $this; }
    public function getPassword(): ?string { return $this->password; }
    public function setPassword(string $password): static { $this->password = $password; return $this; }
    public function eraseCredentials(): void {}
    public function getEstadoVerificacion(): ?string { return $this->estado_verificacion; }
    public function setEstadoVerificacion(string $v): static { $this->estado_verificacion = $v; return $this; }
    public function isNewsletter(): ?bool { return $this->newsletter; }
    public function setNewsletter(bool $n): static { $this->newsletter = $n; return $this; }
    public function getSaldo(): ?string { return $this->saldo; }
    public function setSaldo(string $s): static { $this->saldo = $s; return $this; }
    public function getVerificationToken(): ?string { return $this->verificationToken; }
    public function setVerificationToken(?string $t): static { $this->verificationToken = $t; return $this; }
    public function getNombre(): ?string { return $this->nombre; }
    public function setNombre(?string $n): static { $this->nombre = $n; return $this; }
    public function getFotoPerfil(): ?string { return $this->foto_perfil; }
    public function setFotoPerfil(?string $f): static { $this->foto_perfil = $f; return $this; }
    public function getUltimaRecompensa(): ?\DateTime { return $this->ultima_recompensa; }
    public function setUltimaRecompensa(?\DateTime $d): static { $this->ultima_recompensa = $d; return $this; }
}