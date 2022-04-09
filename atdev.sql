-- phpMyAdmin SQL Dump
-- version 5.1.1
-- https://www.phpmyadmin.net/
--
-- Hôte : 127.0.0.1:3306
-- Généré le : lun. 28 mars 2022 à 16:48
-- Version du serveur : 5.7.36
-- Version de PHP : 7.4.26

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de données : `atdev`
--

-- --------------------------------------------------------

--
-- Structure de la table `admin`
--

DROP TABLE IF EXISTS `admin`;
CREATE TABLE IF NOT EXISTS `admin` (
  `id_admin` int(11) NOT NULL AUTO_INCREMENT,
  `nom_admin` varchar(255) COLLATE utf8_bin NOT NULL,
  `prenom_admin` varchar(255) COLLATE utf8_bin NOT NULL,
  `tel_admin` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `email_admin` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `psseudo_admin` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  PRIMARY KEY (`id_admin`)
) ENGINE=MyISAM AUTO_INCREMENT=22 DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

--
-- Déchargement des données de la table `admin`
--

INSERT INTO `admin` (`id_admin`, `nom_admin`, `prenom_admin`, `tel_admin`, `email_admin`, `psseudo_admin`) VALUES
(1, 'bsd', 'ayoub', '0652086766', 'bsd-ayoub@gmail.com', ''),
(2, 'lambaraa', 'abdellah', '0652086766', 'abdellah-lamb@gmail.com', '');

-- --------------------------------------------------------

--
-- Structure de la table `client`
--

DROP TABLE IF EXISTS `client`;
CREATE TABLE IF NOT EXISTS `client` (
  `id_client` int(11) NOT NULL AUTO_INCREMENT,
  `nom_client` varchar(255) COLLATE utf8_bin NOT NULL,
  `prenom_client` varchar(255) COLLATE utf8_bin NOT NULL,
  `dateNaissance` date DEFAULT NULL,
  `tel_client` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `profession` varchar(255) COLLATE utf8_bin NOT NULL,
  `psseudo_client` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `id_admin` int(11) NOT NULL,
  PRIMARY KEY (`id_client`),
  KEY `id_admin` (`id_admin`)
) ENGINE=MyISAM AUTO_INCREMENT=22 DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

--
-- Déchargement des données de la table `client`
--

INSERT INTO `client` (`id_client`, `nom_client`, `prenom_client`, `dateNaissance`, `tel_client`, `profession`, `psseudo_client`, `id_admin`) VALUES
(1, 'bsd', 'ayoub', '2000-04-12', '0681530508', 'ingenieur', '0000000001', 1),
(2, 'lambaraa', 'abdellah', '2000-04-12', '0652086766', 'pecheur', '0000000002', 1);

-- --------------------------------------------------------

--
-- Structure de la table `creneau`
--

DROP TABLE IF EXISTS `creneau`;
CREATE TABLE IF NOT EXISTS `creneau` (
  `id_creneau` int(11) NOT NULL AUTO_INCREMENT,
  `date_c` varchar(255) COLLATE utf8_bin NOT NULL,
  PRIMARY KEY (`id_creneau`)
) ENGINE=MyISAM AUTO_INCREMENT=22 DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

--
-- Déchargement des données de la table `creneau`
--

INSERT INTO `creneau` (`id_creneau`, `date_c`) VALUES
(1, 'de 10 h à 10:30h'),
(2, 'de 10 h à 10:30h'),
(3, ' de 14 h à 14:30h'),
(4, ' de 15 h à 15:30h'),
(5, ' de 16 h à 16:30h');

-- --------------------------------------------------------

--
-- Structure de la table `rdv`
--

DROP TABLE IF EXISTS `rdv`;
CREATE TABLE IF NOT EXISTS `rdv` (
  `id_r` int(11) NOT NULL AUTO_INCREMENT,
  `date_r` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `sujet` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `id_creneau` int(11) NOT NULL,
  `id_client` int(11) NOT NULL,
  PRIMARY KEY (`id_r`),
  KEY `id_creneau` (`id_creneau`),
  KEY `id_client` (`id_client`)
) ENGINE=MyISAM AUTO_INCREMENT=26 DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

--
-- Déchargement des données de la table `rdv`
--

INSERT INTO `rdv` (`id_r`, `date_r`, `sujet`, `id_creneau`, `id_client`) VALUES
(24, '2022-03-28 16:35:25', 'AZAZAZAAAZ', 1, 1),
(25, '2022-03-28 16:35:25', 'ASASAAS', 2, 2);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
