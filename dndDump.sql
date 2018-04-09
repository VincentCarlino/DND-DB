CREATE DATABASE  IF NOT EXISTS `dnd` /*!40100 DEFAULT CHARACTER SET utf8 */;
USE `dnd`;
-- MySQL dump 10.13  Distrib 5.7.17, for Win64 (x86_64)
--
-- Host: localhost    Database: dnd
-- ------------------------------------------------------
-- Server version	5.7.21-log

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `class`
--

DROP TABLE IF EXISTS `class`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `class` (
  `class_name` varchar(50) NOT NULL,
  `class_desc` varchar(8000) DEFAULT NULL,
  `user_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`class_name`),
  KEY `fk_user` (`user_id`),
  CONSTRAINT `class_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`user_id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `class`
--

LOCK TABLES `class` WRITE;
/*!40000 ALTER TABLE `class` DISABLE KEYS */;
INSERT INTO `class` VALUES ('Barbarian','A fierce warrior of primitive background who can enter a battle rage',1),('Bard','An inspiring magician whose power echoes the music of creation',1),('Paladin','A holy warrior bound to a sacred oath',1),('Rogue','A scoundrel who uses stealth and trickery to overcome obstacles and enemies',1),('Sorcerer','A spellcaster who draws on inherent magic from a gift or bloodline',1);
/*!40000 ALTER TABLE `class` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `class_level`
--

DROP TABLE IF EXISTS `class_level`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `class_level` (
  `class_name` varchar(50) NOT NULL,
  `class_level` int(11) NOT NULL,
  `class_abilities` varchar(8000) DEFAULT NULL,
  PRIMARY KEY (`class_name`,`class_level`),
  CONSTRAINT `class_name_fk` FOREIGN KEY (`class_name`) REFERENCES `class` (`class_name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `class_level`
--

LOCK TABLES `class_level` WRITE;
/*!40000 ALTER TABLE `class_level` DISABLE KEYS */;
INSERT INTO `class_level` VALUES ('Barbarian',1,'Rage, Unarmored Defense'),('Barbarian',2,'Reckless Attack, Danger Sense'),('Barbarian',3,'Primal Path'),('Barbarian',4,'Ability Score Improvement'),('Barbarian',5,'Extra Attack, Fast Movement'),('Barbarian',6,'Path feature'),('Barbarian',7,'Feral Instinct'),('Barbarian',8,'Ability Score Improvement'),('Barbarian',9,'Brutal Critical (1 die)'),('Barbarian',10,'Path feature'),('Barbarian',11,'Relentless Rage'),('Barbarian',12,'Ability Score Improvement'),('Barbarian',13,'Brutal Critical (2 dice)'),('Barbarian',14,'Path feature'),('Barbarian',15,'Persistent Rage'),('Barbarian',16,'Ability Score Improvement'),('Barbarian',17,'Brutal Critical (3 dice)'),('Barbarian',18,'Indomitable Might'),('Barbarian',19,'Ability Score Improvement'),('Barbarian',20,'Primal Champion'),('Bard',1,'Spellcasting, Bardic Inspiration (d6)'),('Bard',2,'Jack of All Trades, Song of Rest (d6)'),('Bard',3,'Bard College, Expertise'),('Bard',4,'Ability Score Improvement'),('Bard',5,'Bardic Inspiration (d8), Font of Inspiration'),('Bard',6,'Countercharm, Bard College feature'),('Bard',7,''),('Bard',8,'Ability Score Improvement'),('Bard',9,'Song of Rest (d8)'),('Bard',10,'Bardic Inspiration (d10), Expertise, Magical Secrets'),('Bard',11,''),('Bard',12,'Ability Score Improvement'),('Bard',13,'Song of Rest (d10)'),('Bard',14,'Magical Secrets, Bard College feature'),('Bard',15,'Bardic Inspiration (d12)'),('Bard',16,'Ability Score Improvement'),('Bard',17,'Song of Rest (d12)'),('Bard',18,'Magical Secrets, Bard College feature'),('Bard',19,'Ability Score Improvement'),('Bard',20,'Superior Inspiration'),('Paladin',1,'Divine Sense, Lay on Hands'),('Paladin',2,'Fighting Style, Spellcasting, Divine Smite'),('Paladin',3,'Divine Health, Sacred Oath'),('Paladin',4,'Ability Score Improvement'),('Paladin',5,'Extra Attack'),('Paladin',6,'Aura of Protection'),('Paladin',7,'Sacred Oath feature'),('Paladin',8,'Ability Score Improvement'),('Paladin',9,''),('Paladin',10,'Aura of Courage'),('Paladin',11,'Improved Divine Smite'),('Paladin',12,'Ability Score Improvement'),('Paladin',13,''),('Paladin',14,'Cleansing Touch'),('Paladin',15,'Sacred Oath feature'),('Paladin',16,'Ability Score Improvement'),('Paladin',17,''),('Paladin',18,'Aura improvements'),('Paladin',19,'Ability Score Improvement'),('Paladin',20,'Sacred Oath feature'),('Rogue',1,'Expertise, Sneak Attack, Theives\' Cant'),('Rogue',2,'Cunning Action'),('Rogue',3,'Roguish Archetype'),('Rogue',4,'Ability Score Improvement'),('Rogue',5,'Uncanny Dodge'),('Rogue',6,'Expertise'),('Rogue',7,'Evasion'),('Rogue',8,'Ability Score Improvement'),('Rogue',9,'Roguish Archetype feature'),('Rogue',10,'Ability Score Improvement'),('Rogue',11,'Reliable Talent'),('Rogue',12,'Ability Score Improvement'),('Rogue',13,'Roguish Archetype feature'),('Rogue',14,'Blindsense'),('Rogue',15,'Slippery Mind'),('Rogue',16,'Ability Score Improvement'),('Rogue',17,'Roguish Archetype feature'),('Rogue',18,'Elusive'),('Rogue',19,'Ability Score Improvement'),('Rogue',20,'Stroke of Luck'),('Sorcerer',2,'Font of Magic'),('Sorcerer',3,'Metamagic'),('Sorcerer',4,'Ability Score Improvement'),('Sorcerer',5,''),('Sorcerer',6,'Sorcerous Origin feature'),('Sorcerer',7,''),('Sorcerer',8,'Ability Score Improvement'),('Sorcerer',9,''),('Sorcerer',10,'Metamagic'),('Sorcerer',11,''),('Sorcerer',12,'Ability Score Improvement'),('Sorcerer',13,''),('Sorcerer',14,'Sorcerous Origin feature'),('Sorcerer',15,''),('Sorcerer',16,'Ability Score Improvement'),('Sorcerer',17,'Metamagic'),('Sorcerer',18,'Sorcerous Origin feature'),('Sorcerer',19,'Ability Score Improvement'),('Sorcerer',20,'Sorcerous Restoration');
/*!40000 ALTER TABLE `class_level` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `player_character`
--

DROP TABLE IF EXISTS `player_character`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `player_character` (
  `character_id` int(11) NOT NULL AUTO_INCREMENT,
  `character_name` varchar(50) DEFAULT NULL,
  `character_age` int(11) DEFAULT NULL,
  `strength` int(11) DEFAULT NULL,
  `dexterity` int(11) DEFAULT NULL,
  `constitution` int(11) DEFAULT NULL,
  `wisdom` int(11) DEFAULT NULL,
  `intelligence` int(11) DEFAULT NULL,
  `charisma` int(11) DEFAULT NULL,
  `character_race` varchar(50) DEFAULT NULL,
  `user_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`character_id`),
  KEY `character_race_fk` (`character_race`),
  KEY `fk_user` (`user_id`),
  CONSTRAINT `character_race_fk` FOREIGN KEY (`character_race`) REFERENCES `race` (`race_name`),
  CONSTRAINT `player_character_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`user_id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `player_character`
--

LOCK TABLES `player_character` WRITE;
/*!40000 ALTER TABLE `player_character` DISABLE KEYS */;
INSERT INTO `player_character` VALUES (1,'Toto Baggins',23,14,16,18,13,12,16,'Gnome',1),(2,'Thikskul Pitback',23,20,24,12,11,17,16,'Dwarf',2),(3,'Agnes Shepard',47,16,11,21,14,15,8,'Human',2),(4,'Patrick Shepar',20,20,20,20,20,20,20,'Human',3);
/*!40000 ALTER TABLE `player_character` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `race`
--

DROP TABLE IF EXISTS `race`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `race` (
  `race_name` varchar(50) NOT NULL,
  `race_desc` varchar(8000) DEFAULT NULL,
  `race_abilities` varchar(8000) DEFAULT NULL,
  `user_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`race_name`),
  KEY `fk_user` (`user_id`),
  CONSTRAINT `race_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`user_id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `race`
--

LOCK TABLES `race` WRITE;
/*!40000 ALTER TABLE `race` DISABLE KEYS */;
INSERT INTO `race` VALUES ('Dragonborn','Born of dragons, as their name proclaims, the dragonborn walk proudly through a world that greets them with fearful incomprehension. Shaped by draconic gods or the dragons themselves, dragonborn originally hatched from dragon eggs as a unique race, combining the best attributes of dragons and humanoids. Som e dragonborn are faithful servants to true dragons, others form the ranks of soldiers in great wars, and still others find themselves adrift, with no clear calling in life.\n','Your Strength score increases by 2, and your Charisma increases by 1.  You have draconic ancestry which grants you a breath weapon based on your color.  Colors include Black, Blue, Brass, Bronze, Copper, Gold, Green, Red, Silver, White.  You have resistance to the damage type associated with your draconic ancestry.  You can speak, read, and write Common and Draconic.  ',1),('Dwarf','Bold and hardy, dwarves are known as skilled warriors, miners, and workers of stone and metal. Though they stand well under 5 feet tall, dwarves are so broad and compact that they can weigh as much as a human standing nearly two feet taller. ','Your Constitution score increases by 2. You have superior vision in dark and dim conditions.  You have advantage on saving throws against poison and resistance against poison damage.  You gain proficiency with the artisan’s tools of your choice: smith’s tools, brewer’s supplies, or mason’s tools.  You can speak, read, and write Common and Dwarvish.',1),('Elf','Elves are a magical people of otherworldly grace, living in the world but not entirely part of it. They live in places of ethereal beauty, in the midst of ancient forests or in silvery spires glittering with faerie light, where soft music drifts through the air and gentle fragrances waft on the breeze. Elves love nature and magic, art and artistry, music and poetry, and the good things of the world.','Your Dexterity score increases by 2.  You have superior vision in dark and dim conditions.  You have proficiency in the Perception skill.  Magic can\'t put you to sleep.  Elves don’t need to sleep. Instead, they meditate deeply, remaining semiconscious, for 4 hours a day.  You can speak, read, and write Common and Elvish.',1),('Gnome','A constant hum of busy activity pervades the warrens and neighborhoods where gnomes form their close- knit communities. Louder sounds punctuate the hum: a crunch of grinding gears here, a minor explosion there, a yelp of surprise or triumph, and especially bursts of laughter. Gnomes take delight in life, enjoying every moment of invention, exploration, investigation, creation, and play.','Your Intelligence score increases by 2.  You have superior vision in dark and dim conditions.  You have advantage on all Intelligence, Wisdom, and Charisma saving throws.  You can speak, read, and write Common and Gnomish.  ',1),('Human','In the reckonings of most worlds, humans are the youngest of the common races, late to arrive on the world scene and short-lived in comparison to dwarves, elves, and dragons. Perhaps it is because of their shorter lives that they strive to achieve as much as they can in the years they are given. Or maybe they feel they have something to prove to the elder races, and that’s why they build their mighty empires on the foundation of conquest and trade. Whatever drives them, humans are the innovators, the achievers, and the pioneers of the worlds.','Your ability scores each increase by 1. You can speak, read, and write Common and one extra language of your choice.  ',1),('Tiefling','To be greeted with stares and whispers, to suffer violence and insult on the street, to see mistrust and fear in every eye: this is the lot of the tiefling. And to twist the knife, tieflings know that this is because a pact struck generations ago infused the essence of Asmodeus—overlord of the Nine Hells—into their bloodline. Their appearance and their nature are not their fault but the result of an ancient sin, for which they and their children and their children’s children will always be held accountable.','Your Intelligence score increases by 1, and your Charisma score increases by 2.  Thanks to your infernal heritage, you have superior vision in dark and dim conditions. You have resistance to fire damage.  You know the thaumaturgy cantrip. Once you reach 3rd level, you can cast the hellish rebuke spell once per day as a 2nd-level spell. Once you reach 5th level, you can also cast the darkness spell once per day. Charisma is your spellcasting ability for these spells.  You can speak, read, and write Common and Infernal.',1);
/*!40000 ALTER TABLE `race` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `specializes`
--

DROP TABLE IF EXISTS `specializes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `specializes` (
  `character_id` int(11) NOT NULL,
  `class_name` varchar(50) NOT NULL,
  `class_level` int(11) DEFAULT NULL,
  PRIMARY KEY (`character_id`,`class_name`),
  KEY `class_type_fk` (`class_name`),
  CONSTRAINT `character_id_fk` FOREIGN KEY (`character_id`) REFERENCES `player_character` (`character_id`),
  CONSTRAINT `class_type_fk` FOREIGN KEY (`class_name`) REFERENCES `class` (`class_name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `specializes`
--

LOCK TABLES `specializes` WRITE;
/*!40000 ALTER TABLE `specializes` DISABLE KEYS */;
/*!40000 ALTER TABLE `specializes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `users`
--

DROP TABLE IF EXISTS `users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `users` (
  `user_id` int(11) NOT NULL AUTO_INCREMENT,
  `username` varchar(50) DEFAULT NULL,
  `email` varchar(255) DEFAULT NULL,
  `password` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`user_id`)
) ENGINE=InnoDB AUTO_INCREMENT=25 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users`
--

LOCK TABLES `users` WRITE;
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
INSERT INTO `users` VALUES (1,'admin','admin','admin'),(2,'Vincent','Carlino.v@husky.neu.edu','password'),(3,'RobB0SS','painting4squares@yahoo.com','password'),(16,'a','b','c'),(17,'b','cv','root'),(18,'user','mailmailmail','password'),(19,'userisname','myemail','password'),(20,'thisusername','useremail@gmail.com','password'),(21,'anothersignup','emailforsignup','pASSASDA'),(22,'darklord97','evil@gmail.com','ilovemymmom'),(23,'pugmom68','chuckles@pug.cute','goodboy'),(24,'myman','my@man.net','MAN');
/*!40000 ALTER TABLE `users` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2018-04-09 13:43:58
