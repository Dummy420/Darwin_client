-- phpMyAdmin SQL Dump
-- version 4.8.5
-- https://www.phpmyadmin.net/
--
-- Hôte : 127.0.0.1:3306
-- Généré le :  lun. 23 mars 2020 à 15:13
-- Version du serveur :  5.7.26
-- Version de PHP :  7.3.5

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de données :  `darwin`
--

-- --------------------------------------------------------

--
-- Structure de la table `abonne`
--

DROP TABLE IF EXISTS `abonne`;
CREATE TABLE IF NOT EXISTS `abonne` (
  `CODE_USER` int(11) NOT NULL,
  `CODE_USER_1` int(11) NOT NULL,
  `DATE_ABONNE` datetime DEFAULT NULL,
  PRIMARY KEY (`CODE_USER`,`CODE_USER_1`),
  KEY `I_FK_ABONNE_USER` (`CODE_USER`),
  KEY `I_FK_ABONNE_USER1` (`CODE_USER_1`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Structure de la table `conversation`
--

DROP TABLE IF EXISTS `conversation`;
CREATE TABLE IF NOT EXISTS `conversation` (
  `CODE_CONV` int(11) NOT NULL,
  `NOM` char(32) DEFAULT NULL,
  `DATE_CREATION` char(32) NOT NULL,
  PRIMARY KEY (`CODE_CONV`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Structure de la table `message`
--

DROP TABLE IF EXISTS `message`;
CREATE TABLE IF NOT EXISTS `message` (
  `CODE_MESSAGE` int(11) NOT NULL,
  `CODE_USER` int(11) NOT NULL,
  `TYPE` char(32) DEFAULT NULL,
  `CONTENU` char(32) NOT NULL,
  `DATE_MESSAGE` datetime NOT NULL,
  PRIMARY KEY (`CODE_MESSAGE`),
  KEY `I_FK_MESSAGE_USER` (`CODE_USER`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Structure de la table `participe`
--

DROP TABLE IF EXISTS `participe`;
CREATE TABLE IF NOT EXISTS `participe` (
  `CODE_USER` int(11) NOT NULL,
  `CODE_CONV` int(11) NOT NULL,
  PRIMARY KEY (`CODE_USER`,`CODE_CONV`),
  KEY `I_FK_PARTICIPE_USER` (`CODE_USER`),
  KEY `I_FK_PARTICIPE_CONVERSATION` (`CODE_CONV`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Structure de la table `post`
--

DROP TABLE IF EXISTS `post`;
CREATE TABLE IF NOT EXISTS `post` (
  `CODE_USER` int(11) NOT NULL,
  `CODE_POST` int(11) NOT NULL,
  `TITRE` char(32) DEFAULT NULL,
  `CONTENU` char(32) DEFAULT NULL,
  `DATE_POSTE` datetime NOT NULL,
  PRIMARY KEY (`CODE_USER`,`CODE_POST`),
  KEY `I_FK_POST_USER` (`CODE_USER`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Structure de la table `reçois`
--

DROP TABLE IF EXISTS `reçois`;
CREATE TABLE IF NOT EXISTS `reçois` (
  `CODE_MESSAGE` int(11) NOT NULL,
  `CODE_USER` int(11) NOT NULL,
  PRIMARY KEY (`CODE_MESSAGE`,`CODE_USER`),
  KEY `I_FK_REÇOIS_MESSAGE` (`CODE_MESSAGE`),
  KEY `I_FK_REÇOIS_USER` (`CODE_USER`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Structure de la table `user`
--

DROP TABLE IF EXISTS `user`;
CREATE TABLE IF NOT EXISTS `user` (
  `CODE_USER` int(11) NOT NULL,
  `PSEUDO` char(32) NOT NULL,
  `MAIL` char(32) NOT NULL,
  `MOTPASSE` char(32) NOT NULL,
  `BIO` char(32) DEFAULT NULL,
  `PHOTO` char(32) DEFAULT NULL,
  `COULEUR` char(32) DEFAULT NULL,
  `DATE_CREATION` datetime NOT NULL,
  PRIMARY KEY (`CODE_USER`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
