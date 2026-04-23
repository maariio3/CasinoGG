<?php

declare(strict_types=1);

namespace DoctrineMigrations;

use Doctrine\DBAL\Schema\Schema;
use Doctrine\Migrations\AbstractMigration;

/**
 * Auto-generated Migration: Please modify to your needs!
 */
final class Version20260420102706 extends AbstractMigration
{
    public function getDescription(): string
    {
        return '';
    }

    public function up(Schema $schema): void
    {
        // this up() migration is auto-generated, please modify it to your needs
        $this->addSql('CREATE TABLE juego (id INT AUTO_INCREMENT NOT NULL, nombre VARCHAR(100) NOT NULL, tipo VARCHAR(50) NOT NULL, activo TINYINT NOT NULL, PRIMARY KEY (id)) DEFAULT CHARACTER SET utf8mb4');
        $this->addSql('CREATE TABLE partida (id INT AUTO_INCREMENT NOT NULL, cantidad_apostada NUMERIC(10, 2) NOT NULL, resultado_obtenido NUMERIC(10, 2) NOT NULL, fecha DATETIME NOT NULL, user_id INT NOT NULL, juego_id INT NOT NULL, INDEX IDX_A9C1580CA76ED395 (user_id), INDEX IDX_A9C1580C13375255 (juego_id), PRIMARY KEY (id)) DEFAULT CHARACTER SET utf8mb4');
        $this->addSql('CREATE TABLE transaccion (id INT AUTO_INCREMENT NOT NULL, tipo VARCHAR(50) NOT NULL, cantidad NUMERIC(10, 2) NOT NULL, fecha DATETIME NOT NULL, descripcion VARCHAR(255) DEFAULT NULL, user_id INT NOT NULL, INDEX IDX_BFF96AF7A76ED395 (user_id), PRIMARY KEY (id)) DEFAULT CHARACTER SET utf8mb4');
        $this->addSql('CREATE TABLE user (id INT AUTO_INCREMENT NOT NULL, email VARCHAR(180) NOT NULL, password VARCHAR(255) NOT NULL, roles JSON NOT NULL, estado_verificacion VARCHAR(20) NOT NULL, newsletter TINYINT NOT NULL, saldo NUMERIC(10, 2) NOT NULL, PRIMARY KEY (id)) DEFAULT CHARACTER SET utf8mb4');
        $this->addSql('CREATE TABLE messenger_messages (id BIGINT AUTO_INCREMENT NOT NULL, body LONGTEXT NOT NULL, headers LONGTEXT NOT NULL, queue_name VARCHAR(190) NOT NULL, created_at DATETIME NOT NULL, available_at DATETIME NOT NULL, delivered_at DATETIME DEFAULT NULL, INDEX IDX_75EA56E0FB7336F0E3BD61CE16BA31DBBF396750 (queue_name, available_at, delivered_at, id), PRIMARY KEY (id)) DEFAULT CHARACTER SET utf8mb4');
        $this->addSql('ALTER TABLE partida ADD CONSTRAINT FK_A9C1580CA76ED395 FOREIGN KEY (user_id) REFERENCES user (id)');
        $this->addSql('ALTER TABLE partida ADD CONSTRAINT FK_A9C1580C13375255 FOREIGN KEY (juego_id) REFERENCES juego (id)');
        $this->addSql('ALTER TABLE transaccion ADD CONSTRAINT FK_BFF96AF7A76ED395 FOREIGN KEY (user_id) REFERENCES user (id)');
    }

    public function down(Schema $schema): void
    {
        // this down() migration is auto-generated, please modify it to your needs
        $this->addSql('ALTER TABLE partida DROP FOREIGN KEY FK_A9C1580CA76ED395');
        $this->addSql('ALTER TABLE partida DROP FOREIGN KEY FK_A9C1580C13375255');
        $this->addSql('ALTER TABLE transaccion DROP FOREIGN KEY FK_BFF96AF7A76ED395');
        $this->addSql('DROP TABLE juego');
        $this->addSql('DROP TABLE partida');
        $this->addSql('DROP TABLE transaccion');
        $this->addSql('DROP TABLE user');
        $this->addSql('DROP TABLE messenger_messages');
    }
}
