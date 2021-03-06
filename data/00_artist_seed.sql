# ************************************************************
# sequel pro sql dump
# Version 4096
#
# http://www.sequelpro.com/
# http://code.google.com/p/sequel-pro/
#
# Host: localhost (MySQL 5.6.10)
# Database: lotusod
# Generation Time: 2013-11-09 10:00:10 +0000
# ************************************************************


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;


# Dump of table Artists
# ------------------------------------------------------------

LOCK TABLES `Artists` WRITE;
/*!40000 ALTER TABLE `Artists` DISABLE KEYS */;

INSERT INTO `Artists` (`name`, `archive_collection`, `slug`, `id`, `createdAt`, `updatedAt`)
VALUES
  ('Grateful Dead','GratefulDead','grateful-dead',1,'2013-11-09 01:51:24','2013-11-09 01:51:24'),
  ('Marco Benevento','MarcoBenevento','marco',2,'2013-11-09 01:50:18','2013-11-09 01:50:18'),
  ('Garage A Trois','GarageATrois','garage-a-trois',3,'2013-11-09 01:51:24','2013-11-09 01:51:24'),
  ('G-Nome Project','G-NomeProject','g-nome',4,'2013-11-09 01:51:24','2013-11-09 01:51:24'),
  ('Furthur','Furthur','furthur',5,'2013-11-09 01:51:24','2013-11-09 01:51:24'),
  ('Everyone Orchestra','EveryoneOrchestra','everyone-orchestra',6,'2013-11-09 01:51:24','2013-11-09 01:51:24'),
  ('Dispatch','Dispatch','dispatch',7,'2013-11-09 01:51:24','2013-11-09 01:51:24'),
  ('Disco Biscuits','DiscoBiscuits','disco-biscuits',8,'2013-11-09 01:51:24','2013-11-09 01:51:24'),
  ('Dark Star Orchestra','DarkStarOrchestra','dark-star',9,'2013-11-09 01:51:24','2013-11-09 01:51:24'),
  ('Bob Weir','BobWeir','weir',10,'2013-11-09 01:51:24','2013-11-09 01:51:24'),
  ('Bernie Worrell Orchestra','BernieWorrellOrchestra','bernie-worrell',11,'2013-11-09 01:51:24','2013-11-09 01:51:24'),
  ('Benevento Russo Duo','BeneventoRusso','duo',12,'2013-11-09 01:51:24','2013-11-09 01:51:24'),
  ('Ben Kweller','BenKweller','ben-kweller',13,'2013-11-09 01:51:24','2013-11-09 01:51:24'),
  ('Bela Fleck and the Flecktones','BelaFleckandtheFlecktones','bela-fleck',14,'2013-11-09 01:51:24','2013-11-09 01:51:24'),
  ('Aqueous','Aqueous','aqueous',15,'2013-11-09 01:51:24','2013-11-09 01:51:24'),
  ('Aquarium Rescue Unit','AquariumRescueUnit','aru',16,'2013-11-09 01:51:24','2013-11-09 01:51:24'),
  ('Animal Collective','AnimalCollective','animal-collective',17,'2013-11-09 01:51:24','2013-11-09 01:51:24'),
  ('Umphrey\'s McGee','UmphreysMcGee','umphreys',18,'2013-11-09 01:51:24','2013-11-09 01:51:24'),
  ('Max Creek','MaxCreek','max-creek',19,'2013-11-09 01:51:24','2013-11-09 01:51:24'),
  ('Matisyahu','Matisyahu','matisyahu',20,'2013-11-09 01:51:24','2013-11-09 01:51:24'),
  ('Lotus','Lotus','lotus',21,'2013-11-09 01:51:24','2013-11-09 01:51:24'),
  ('John Popper','JohnPopper','john-popper',22,'2013-11-09 01:51:24','2013-11-09 01:51:24'),
  ('Guster','Guster','guster',23,'2013-11-09 01:51:24','2013-11-09 01:51:24'),
  ('Greensky Bluegrass','GreenskyBluegrass','greensky-bluegrass',24,'2013-11-09 01:51:24','2013-11-09 01:51:24'),
  ('God Street Wine','GodStreetWine','god-street-wine',25,'2013-11-09 01:51:24','2013-11-09 01:51:24'),
  ('G. Love and Special Sauce','G.LoveandSpecialSauce','g-love',26,'2013-11-09 01:51:24','2013-11-09 01:51:24'),
  ('Grace Potter','GracePotterandtheNocturnals','grace-potter',27,'2013-11-09 01:51:24','2013-11-09 01:51:24'),
  ('Fugazi','Fugazi','fugazi',28,'2013-11-09 01:51:24','2013-11-09 01:51:24'),
  ('Railroad Earth','RailroadEarth','railroad-earth',30,'2013-11-09 01:51:24','2013-11-09 01:51:24'),
  ('Yonder Mountain String Band','YonderMountainStringBand','yonder',31,'2013-11-09 01:51:24','2013-11-09 01:51:24'),
  ('Ween','Ween','ween',32,'2013-11-09 01:51:24','2013-11-09 01:51:24'),
  ('The New Deal','TheNewDeal','the-new-deal',33,'2013-11-09 01:51:24','2013-11-09 01:51:24'),
  ('The Heavy Pets','HeavyPets','the-heavy-pets',34,'2013-11-09 01:51:24','2013-11-09 01:51:24'),
  ('String Cheese Incident','StringCheeseIncident','sci',35,'2013-11-09 01:51:24','2013-11-09 01:51:24'),
  ('Steve Kimock Band','SteveKimockBand','steve-kimock-band',36,'2013-11-09 01:51:24','2013-11-09 01:51:24'),
  ('Steve Kimock','SteveKimock','steve-kimock',37,'2013-11-09 01:51:24','2013-11-09 01:51:24'),
  ('Spoon','Spoon','spoon',38,'2013-11-09 01:51:24','2013-11-09 01:51:24'),
  ('Raq','Raq','raq',39,'2013-11-09 01:51:24','2013-11-09 01:51:24'),
  ('Zero','Zero','zero',40,'2013-11-09 01:51:24','2013-11-09 01:51:24'),
  ('KVHW','KVHW','kvhw',41,'2013-11-09 01:51:24','2013-11-09 01:51:24'),
  ('Infamous Stringdusters','InfamousStringdusters','stringdusters',42,'2013-11-09 01:51:24','2013-11-09 01:51:24'),
  ('The Breakfast','TheBreakfast','the-breakfast',43,'2013-11-09 01:51:24','2013-11-09 01:51:24'),
  ('Dopapod','Dopapod','dopapod',44,'2013-11-09 01:51:24','2013-11-09 01:51:24'),
  ('Phil Lesh and Friends','PhilLeshandFriends','phil-lesh',45,'2013-11-09 01:51:24','2013-11-09 01:51:24'),
  ('moe.','moe','moe',46,'2013-11-09 01:51:24','2013-11-09 01:51:24'),
  ('Ratdog','Ratdog','ratdog',47,'2013-11-09 01:51:24','2013-11-09 01:51:24'),
  ('The Radiators','Radiators','radiators',48,'2013-11-09 01:51:24','2013-11-09 01:51:24'),
  ('Smashing Pumpkins','SmashingPumpkins','smashing-pumpkins',49,'2013-11-09 01:51:24','2013-11-09 01:51:24'),
  ('The Big Wu','TheBigWu','the-big-wu',50,'2013-11-09 01:51:24','2013-11-09 01:51:24'),
  ('Keller Williams','KellerWilliams','keller-williams',51,'2013-11-09 01:51:24','2013-11-09 01:51:24'),
  ('Tedeschi Trucks Band','TedeschiTrucksBand','tedeschi-trucks',52,'2013-11-09 01:51:24','2013-11-09 01:51:24'),
  ('My Morning Jacket','MyMorningJacket','mmj',53,'2013-11-09 01:51:24','2013-11-09 01:51:24'),
  ('Little Feat','LittleFeat','little-feat',54,'2013-11-09 01:51:24','2013-11-09 01:51:24'),
  ('Blues Traveler','BluesTraveler','blues-traveler',55,'2013-11-09 01:51:24','2013-11-09 01:51:24'),
  ('Ryan Adams','RyanAdams','ryan-adams',56,'2013-11-09 01:51:24','2013-11-09 01:51:24'),
  ('Mogwai','Mogwai','mogwai',57,'2013-11-09 01:51:24','2013-11-09 01:51:24'),
  ('The Motet','TheMotet','the-motet',58,'2013-11-09 01:51:24','2013-11-09 01:51:24'),
  ('Club d\'Elf','ClubdElf','club-d-elf',59,'2013-11-09 01:51:24','2013-11-09 01:51:24'),
  ('Elliott Smith','ElliottSmith','elliott-smith',60,'2013-11-09 01:51:24','2013-11-09 01:51:24'),
  ('Drive-By Truckers','Drive-ByTruckers','drive-by-truckers',61,'2013-11-09 01:51:24','2013-11-09 01:51:24'),
  ('Jack Johnson','JackJohnson','jack-johnson',62,'2013-11-09 01:51:24','2013-11-09 01:51:24'),
  ('Jazz Mandolin Project','JazzMandolinProject','jazz-mandolin-project',63,'2013-11-09 01:51:24','2013-11-09 01:51:24'),
  ('Percy Hill','PercyHill','percy-hill',64,'2013-11-09 01:51:24','2013-11-09 01:51:24'),
  ('Matt Pond PA','MattPondPA','matt-pond-pa',65,'2013-11-09 01:51:24','2013-11-09 01:51:24'),
  ('Strangefolk','Strangefolk','strangefolk',66,'2013-11-09 01:51:24','2013-11-09 01:51:24'),
  ('Ted Leo and the Pharmacists','TedLeoandthePharmacists','ted-leo',67,'2013-11-09 01:51:24','2013-11-09 01:51:24'),
  ('Tea Leaf Green','TeaLeafGreen','tea-leaf-green',68,'2013-11-09 01:51:24','2013-11-09 01:51:24'),
  ('Tenacious D','TenaciousD','tenacious-d',69,'2013-11-09 01:51:24','2013-11-09 01:51:24'),
  ('The Decemberists','TheDecemberists', 'the-decemberists',70,'2013-11-09 01:51:24','2013-11-09 01:51:24'),
  ('The War on Drugs','TheWarOnDrugsMusic','war-on-drugs',71,'2013-11-09 01:51:24','2013-11-09 01:51:24'),
  ('The Walkmen','TheWalkmen','the-walkmen',72,'2013-11-09 01:51:24','2013-11-09 01:51:24');


/*!40000 ALTER TABLE `Artists` ENABLE KEYS */;
UNLOCK TABLES;



/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
