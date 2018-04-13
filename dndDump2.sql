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
  `user_id` int(11) NOT NULL,
  PRIMARY KEY (`class_name`,`user_id`),
  KEY `fk_user` (`user_id`),
  CONSTRAINT `class_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`user_id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `class`
--

LOCK TABLES `class` WRITE;
/*!40000 ALTER TABLE `class` DISABLE KEYS */;
INSERT INTO `class` VALUES ('','',1),('Barbarian','A fierce warrior of primitive background who can enter a battle rage',1),('Bard','An inspiring magician whose power echoes the music of creation',1),('Paladin','A holy warrior bound to a sacred oath',1),('Rogue','A scoundrel who uses stealth and trickery to overcome obstacles and enemies',1),('Sorcerer','A spellcaster who draws on inherent magic from a gift or bloodline',1);
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
  `user_id` int(11) NOT NULL,
  PRIMARY KEY (`class_name`,`class_level`,`user_id`),
  KEY `user_id_fk_idx` (`user_id`),
  CONSTRAINT `class_name_fk` FOREIGN KEY (`class_name`) REFERENCES `class` (`class_name`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `user_id_fk` FOREIGN KEY (`user_id`) REFERENCES `users` (`user_id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `class_level`
--

LOCK TABLES `class_level` WRITE;
/*!40000 ALTER TABLE `class_level` DISABLE KEYS */;
INSERT INTO `class_level` VALUES ('',1,'',1),('',2,'',1),('',3,'',1),('',4,'',1),('',5,'',1),('',6,'',1),('',7,'',1),('',8,'',1),('',9,'',1),('',10,'',1),('',11,'',1),('',12,'',1),('',13,'',1),('',14,'',1),('',15,'',1),('',16,'',1),('',17,'',1),('',18,'',1),('',19,'',1),('',20,'',1),('Barbarian',1,'Rage, Unarmored Defense',1),('Barbarian',2,'Reckless Attack, Danger Sense',1),('Barbarian',3,'Primal Path',1),('Barbarian',4,'Ability Score Improvement',1),('Barbarian',5,'Extra Attack, Fast Movement',1),('Barbarian',6,'Path feature',1),('Barbarian',7,'Feral Instinct',1),('Barbarian',8,'Ability Score Improvement',1),('Barbarian',9,'Brutal Critical (1 die)',1),('Barbarian',10,'Path feature',1),('Barbarian',11,'Relentless Rage',1),('Barbarian',12,'Ability Score Improvement',1),('Barbarian',13,'Brutal Critical (2 dice)',1),('Barbarian',14,'Path feature',1),('Barbarian',15,'Persistent Rage',1),('Barbarian',16,'Ability Score Improvement',1),('Barbarian',17,'Brutal Critical (3 dice)',1),('Barbarian',18,'Indomitable Might',1),('Barbarian',19,'Ability Score Improvement',1),('Barbarian',20,'Primal Champion',1),('Bard',1,'Spellcasting, Bardic Inspiration (d6)',1),('Bard',2,'Jack of All Trades, Song of Rest (d6)',1),('Bard',3,'Bard College, Expertise',1),('Bard',4,'Ability Score Improvement',1),('Bard',5,'Bardic Inspiration (d8), Font of Inspiration',1),('Bard',6,'Countercharm, Bard College feature',1),('Bard',7,'',1),('Bard',8,'Ability Score Improvement',1),('Bard',9,'Song of Rest (d8)',1),('Bard',10,'Bardic Inspiration (d10), Expertise, Magical Secrets',1),('Bard',11,'',1),('Bard',12,'Ability Score Improvement',1),('Bard',13,'Song of Rest (d10)',1),('Bard',14,'Magical Secrets, Bard College feature',1),('Bard',15,'Bardic Inspiration (d12)',1),('Bard',16,'Ability Score Improvement',1),('Bard',17,'Song of Rest (d12)',1),('Bard',18,'Magical Secrets, Bard College feature',1),('Bard',19,'Ability Score Improvement',1),('Bard',20,'Superior Inspiration',1),('Paladin',1,'Divine Sense, Lay on Hands',1),('Paladin',2,'Fighting Style, Spellcasting, Divine Smite',1),('Paladin',3,'Divine Health, Sacred Oath',1),('Paladin',4,'Ability Score Improvement',1),('Paladin',5,'Extra Attack',1),('Paladin',6,'Aura of Protection',1),('Paladin',7,'Sacred Oath feature',1),('Paladin',8,'Ability Score Improvement',1),('Paladin',9,'',1),('Paladin',10,'Aura of Courage',1),('Paladin',11,'Improved Divine Smite',1),('Paladin',12,'Ability Score Improvement',1),('Paladin',13,'',1),('Paladin',14,'Cleansing Touch',1),('Paladin',15,'Sacred Oath feature',1),('Paladin',16,'Ability Score Improvement',1),('Paladin',17,'',1),('Paladin',18,'Aura improvements',1),('Paladin',19,'Ability Score Improvement',1),('Paladin',20,'Sacred Oath feature',1),('Rogue',1,'Expertise, Sneak Attack, Theives\' Cant',1),('Rogue',2,'Cunning Action',1),('Rogue',3,'Roguish Archetype',1),('Rogue',4,'Ability Score Improvement',1),('Rogue',5,'Uncanny Dodge',1),('Rogue',6,'Expertise',1),('Rogue',7,'Evasion',1),('Rogue',8,'Ability Score Improvement',1),('Rogue',9,'Roguish Archetype feature',1),('Rogue',10,'Ability Score Improvement',1),('Rogue',11,'Reliable Talent',1),('Rogue',12,'Ability Score Improvement',1),('Rogue',13,'Roguish Archetype feature',1),('Rogue',14,'Blindsense',1),('Rogue',15,'Slippery Mind',1),('Rogue',16,'Ability Score Improvement',1),('Rogue',17,'Roguish Archetype feature',1),('Rogue',18,'Elusive',1),('Rogue',19,'Ability Score Improvement',1),('Rogue',20,'Stroke of Luck',1),('Sorcerer',1,'',1),('Sorcerer',2,'Font of Magic',1),('Sorcerer',3,'Metamagic',1),('Sorcerer',4,'Ability Score Improvement',1),('Sorcerer',5,'',1),('Sorcerer',6,'Sorcerous Origin feature',1),('Sorcerer',7,'',1),('Sorcerer',8,'Ability Score Improvement',1),('Sorcerer',9,'',1),('Sorcerer',10,'Metamagic',1),('Sorcerer',11,'',1),('Sorcerer',12,'Ability Score Improvement',1),('Sorcerer',13,'',1),('Sorcerer',14,'Sorcerous Origin feature',1),('Sorcerer',15,'',1),('Sorcerer',16,'Ability Score Improvement',1),('Sorcerer',17,'Metamagic',1),('Sorcerer',18,'Sorcerous Origin feature',1),('Sorcerer',19,'Ability Score Improvement',1),('Sorcerer',20,'Sorcerous Restoration',1);
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
  `class_name` varchar(50) DEFAULT NULL,
  `character_level` int(11) DEFAULT NULL,
  PRIMARY KEY (`character_id`),
  KEY `character_race_fk` (`character_race`),
  KEY `fk_user` (`user_id`),
  KEY `characater_class_fk_idx` (`class_name`),
  CONSTRAINT `characater_class_fk` FOREIGN KEY (`class_name`) REFERENCES `class` (`class_name`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `character_race_fk` FOREIGN KEY (`character_race`) REFERENCES `race` (`race_name`),
  CONSTRAINT `player_character_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`user_id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `player_character`
--

LOCK TABLES `player_character` WRITE;
/*!40000 ALTER TABLE `player_character` DISABLE KEYS */;
INSERT INTO `player_character` VALUES (1,'Toto Baggins',23,14,16,18,13,12,16,'Gnome',1,'Bard',8),(2,'Thikskul Pitback',23,20,24,12,11,17,16,'Dwarf',2,'Barbarian',1),(3,'Agnes Shepard',47,16,11,21,14,15,8,'Human',2,'Sorcerer',1),(4,'Patrick Shepar',20,20,20,20,20,20,20,'Human',3,'Rogue',1),(5,'Ya Boi',69,10,10,10,10,10,10,'Human',1,'Rogue',3);
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
  `user_id` int(11) NOT NULL,
  PRIMARY KEY (`race_name`,`user_id`),
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
) ENGINE=InnoDB AUTO_INCREMENT=30 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users`
--

LOCK TABLES `users` WRITE;
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
INSERT INTO `users` VALUES (1,'admin','admin','admin'),(2,'Vincent','Carlino.v@husky.neu.edu','password'),(3,'RobB0SS','painting4squares@yahoo.com','password'),(28,'user1','user1@gmail.com','password'),(29,'user','user@email.com','password');
/*!40000 ALTER TABLE `users` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping events for database 'dnd'
--

--
-- Dumping routines for database 'dnd'
--
/*!50003 DROP PROCEDURE IF EXISTS `addCharacter` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `addCharacter`(
	IN p_character_name VARCHAR(50),
    IN p_character_age INT,
    IN p_str INT,
    IN p_dex INT,
    IN p_con INT,
    IN p_wis INT,
    IN p_int INT,
    IN p_cha INT,
    IN p_race VARCHAR(50),
    IN p_user_id INT,
    IN p_class VARCHAR(50),
    IN p_level INT
)
BEGIN
	INSERT INTO player_character
    (character_name, character_age, strength, dexterity, constitution, wisdom, intelligence, charisma, character_race, user_id, class_name, character_level)
    VALUES
    (p_character_name, p_character_age, p_str, p_dex, p_con, p_wis, p_int, p_cha, p_race, p_user_id, p_class, p_level);
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `addClass` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `addClass`(
	IN p_name VARCHAR(50),
    IN p_desc VARCHAR(8000),
    IN p_user_id INT,
    IN p_1st VARCHAR(8000),
    IN p_2nd VARCHAR(8000),
    IN p_3rd VARCHAR(8000),
    IN p_4th VARCHAR(8000),
    IN p_5th VARCHAR(8000),
    IN p_6th VARCHAR(8000),
    IN p_7th VARCHAR(8000),
    IN p_8th VARCHAR(8000),
    IN p_9th VARCHAR(8000),
    IN p_10th VARCHAR(8000),
    IN p_11th VARCHAR(8000),
    IN p_12th VARCHAR(8000),
    IN p_13th VARCHAR(8000),
    IN p_14th VARCHAR(8000),
    IN p_15th VARCHAR(8000),
    IN p_16th VARCHAR(8000),
    IN p_17th VARCHAR(8000),
    IN p_18th VARCHAR(8000),
    IN p_19th VARCHAR(8000),
    IN p_20th VARCHAR(8000)
)
BEGIN
	INSERT INTO class
    (class_name, class_desc, user_id)
    VALUES
    (p_name, p_desc, p_user_id);
    INSERT INTO class_level
    (class_name, class_level, class_abilities, user_id)
    VALUES
    (p_name, 1, p_1st, p_user_id), 
    (p_name, 2, p_2nd, p_user_id),
    (p_name, 3, p_3rd, p_user_id),
    (p_name, 4, p_4th, p_user_id),
    (p_name, 5, p_5th, p_user_id),
    (p_name, 6, p_6th, p_user_id),
    (p_name, 7, p_7th, p_user_id),
    (p_name, 8, p_8th, p_user_id),
    (p_name, 9, p_9th, p_user_id),
    (p_name, 10, p_10th, p_user_id),
    (p_name, 11, p_11th, p_user_id),
    (p_name, 12, p_12th, p_user_id),
    (p_name, 13, p_13th, p_user_id),
    (p_name, 14, p_14th, p_user_id),
    (p_name, 15, p_15th, p_user_id),
    (p_name, 16, p_16th, p_user_id),
    (p_name, 17, p_17th, p_user_id),
    (p_name, 18, p_18th, p_user_id),
    (p_name, 19, p_19th, p_user_id),
    (p_name, 20, p_20th, p_user_id);

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `addRace` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `addRace`(
	IN p_name VARCHAR(50),
    IN p_desc VARCHAR(8000),
    IN p_abilities VARCHAR(8000),
    IN p_user_id INT
)
BEGIN
	INSERT INTO race
    (race_name, race_desc, race_abilities, user_id)
    VALUES
    (p_name, p_desc, p_abilities, p_user_id);
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `createUser` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `createUser`(
    IN p_username VARCHAR(20),
    IN p_email VARCHAR(20),
    IN p_password VARCHAR(20)
)
BEGIN
    if ( select exists (select 1 from users where users.username = p_username) ) THEN
     
        select 'Username Exists !!';
     
    ELSE
     
        insert into users
        (
            username,
            email,
            password
        )
        values
        (
            p_username,
            p_email,
            p_password
        );
     
    END IF;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `deleteCharacter` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `deleteCharacter`(
	IN p_char_id INT
)
BEGIN
	DELETE FROM player_character
    WHERE character_id = p_char_id;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `getCharacters` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `getCharacters`(
	IN p_user_id INT
)
BEGIN
	SELECT * FROM player_character WHERE user_id = p_user_id;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `getClassAbilities` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `getClassAbilities`(
    IN p_user_id INT,
    IN p_class_name VARCHAR(50),
    IN p_level INT
)
BEGIN
    if ( select exists (select 1 from class_level where user_id = p_user_id AND class_name = p_class_name)) THEN
     
        select class_abilities FROM class_level WHERE user_id = p_user_id AND class_name = p_class_name AND class_level = p_level;
    ELSE
		SELECT class_abilities FROM class_level WHERE user_id = 1 AND class_name = p_class_name AND class_level = p_level;
    END IF;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `getClasses` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `getClasses`(
	IN p_user_id INT
)
BEGIN
	SELECT * FROM class WHERE user_id = p_user_id OR user_id = 1;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `getRaceAbilities` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `getRaceAbilities`(
    IN p_user_id INT,
    IN p_race_name VARCHAR(50)
)
BEGIN
    IF (SELECT EXISTS (SELECT 1 FROM race WHERE user_id = p_user_id AND race_name = p_race_name)) THEN
		SELECT race_abilities FROM race WHERE user_id = p_user_id AND race_name = p_race_name;
	ELSE
		SELECT race_abilities FROM race WHERE user_id = 1 AND race_name = p_race_name;
	END IF;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `getRaces` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `getRaces`(
	IN p_user_id INT
)
BEGIN
	SELECT * FROM race WHERE user_id = p_user_id OR user_id = 1;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `levelDown` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `levelDown`(
	IN p_char_id INT
)
BEGIN
	UPDATE player_character
    SET character_level = (character_level - 1)
    WHERE character_id = p_char_id AND character_level > 1;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `levelUp` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `levelUp`(
	IN p_char_id INT
)
BEGIN
	UPDATE player_character
    SET character_level = (character_level + 1)
    WHERE character_id = p_char_id AND character_level < 20;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `validateLogin` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `validateLogin`(
    IN p_username VARCHAR(20)
)
BEGIN
    SELECT * FROM users WHERE username = p_username;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2018-04-13  1:20:17
