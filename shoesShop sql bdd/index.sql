CREATE DATABASE shoesShop;

USE shoesShop

CREATE USER 'utilisateur'@'localhost' IDENTIFIED BY 'passe';

SELECT User, Host FROM mysql.user;

CREATE TABLE `client` (
  `id_client` int(9) NOT NULL AUTO_INCREMENT,
  `nom` varchar(50) NOT NULL,
  `email` varchar(75) NOT NULL,
 `adresse` varchar(75) NOT NULL,
  PRIMARY KEY (`id_Client`)
) ENGINE=Innodb DEFAULT CHARSET=utf8;


CREATE TABLE `commande` (
  `id_commande` int(9) NOT NULL AUTO_INCREMENT,
  `date` varchar(10) NOT NULL,
  `id_client` int(9) NOT NULL,
  PRIMARY KEY (`id_commande`),
  INDEX par_ind (`id_client`),
    FOREIGN KEY (`id_client`)
        REFERENCES clients(`id_client`)
        ON DELETE CASCADE
) ENGINE=Innodb DEFAULT CHARSET=utf8;


CREATE TABLE `marque` (
  `id_marque` int(9) NOT NULL AUTO_INCREMENT,
  `nom` varchar(25) NOT NULL,
  `logo` varchar(10) NOT NULL,
  PRIMARY KEY (`id_marque`)
) ENGINE=Innodb DEFAULT CHARSET=utf8;


CREATE TABLE `chaussures` (
  `id_chaussure` int(9) NOT NULL AUTO_INCREMENT,
  `id_marque` int(9) NOT NULL,
  `taille` int(2) NOT NULL,
  `couleur` varchar(20) NOT NULL,
  `prix` float NOT NULL,
  `nom_chaussure` varchar(25) NOT NULL,
  PRIMARY KEY (`id_chaussure`),  
  INDEX par_ind (`id_marque`),
    FOREIGN KEY (`id_marque`)
        REFERENCES marques(`id_marque`)
        ON DELETE CASCADE
) ENGINE=Innodb DEFAULT CHARSET=utf8;


CREATE TABLE `liste_des_produits` (
  `id_commande` int(9) NOT NULL AUTO_INCREMENT,
  `id_chaussure` int(9) NOT NULL,
  `quantite` int(3) NOT NULL,
  PRIMARY KEY (`id_commande`),
  INDEX par_ind (`id_chaussure`),
    FOREIGN KEY (`id_chaussure`)
        REFERENCES chaussures(`id_chaussure`)
        ON DELETE CASCADE
  
) ENGINE=Innodb DEFAULT CHARSET=utf8;


INSERT INTO `marque` (`id_marque`, `nom`, `logo`) VALUES
(1, 'Nike', 'LogoNike'),
(2, 'Adidas', 'LogoAdidas'),
(3, 'Vans', 'LogoVans');


INSERT INTO `chaussures` (`id_chaussure`, `id_marque`, `taille`, `couleur`, `prix`, `nom_chaussure`) VALUES
(1, 3, 39, 'blanche', 65000, 'Nike'),
(2, 1, 40, 'bleu', 35000, 'Adidas'),
(3, 2, 42, 'violet', 50000, 'Vans');


-- Liste des marques qui existent dans la table marque 
SELECT * FROM marque;

-- Supprimer la chaussure de marque Nike 
DELETE FROM chaussures WHERE id_chaussure = 1;  

-- Mise à jour de la couleur de la chaussure de la marque Adidas
UPDATE chaussures SET couleur = 'verte' WHERE id_chaussure = 2;