CREATE DATABASE  IF NOT EXISTS `dbtsw2` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci */ /*!80016 DEFAULT ENCRYPTION='N' */;
USE `dbtsw2`;
-- MySQL dump 10.13  Distrib 8.0.27, for Win64 (x86_64)
--
-- Host: 127.0.0.1    Database: dbtsw2
-- ------------------------------------------------------
-- Server version	8.0.27

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!50503 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `acquisto`
--

DROP TABLE IF EXISTS `acquisto`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `acquisto` (
  `idOrdine` int NOT NULL,
  `idArticolo` int NOT NULL,
  PRIMARY KEY (`idOrdine`,`idArticolo`),
  KEY `idArticolo_idx` (`idArticolo`),
  CONSTRAINT `idArticolo` FOREIGN KEY (`idArticolo`) REFERENCES `articolo` (`idArticolo`),
  CONSTRAINT `idOrdine` FOREIGN KEY (`idOrdine`) REFERENCES `ordine` (`idOrdine`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `acquisto`
--

LOCK TABLES `acquisto` WRITE;
/*!40000 ALTER TABLE `acquisto` DISABLE KEYS */;
INSERT INTO `acquisto` VALUES (1,1);
/*!40000 ALTER TABLE `acquisto` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `articolo`
--

DROP TABLE IF EXISTS `articolo`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `articolo` (
  `idArticolo` int NOT NULL AUTO_INCREMENT,
  `nome` varchar(100) NOT NULL,
  `prezzo` double NOT NULL,
  `iva` double DEFAULT '22',
  `descrizione` varchar(1200) NOT NULL,
  `quantitaTot` int NOT NULL,
  `disponibilita` varchar(5) NOT NULL,
  `immagine` varchar(300) DEFAULT NULL,
  `genere` varchar(10) DEFAULT NULL,
  `back_image` varchar(300) DEFAULT NULL,
  PRIMARY KEY (`idArticolo`)
) ENGINE=InnoDB AUTO_INCREMENT=60 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `articolo`
--

LOCK TABLES `articolo` WRITE;
/*!40000 ALTER TABLE `articolo` DISABLE KEYS */;
INSERT INTO `articolo` VALUES (1,'Astral Ascent',29.99,22,'Astral Chain e´ un gioco d\'azione sviluppato da PlatinumGames e pubblicato da Nintendo in esclusiva per Nintendo Switch',100,'SI','C:\\Users\\Cosmo\\OneDrive\\Desktop\\Universita\\TSW\\WorkSpaceTSW\\GameOver\\WebContent\\img\\game1.jpg','RPG','C:\\Users\\Cosmo\\OneDrive\\Desktop\\Universita\\TSW\\WorkSpaceTSW\\GameOver\\WebContent\\img\\Background\\back1.jpg'),(2,'Core keeper',15.99,22,'Core Keeper, titolo che ci vede impegnati a sopravvivere sottoterra simile a Terraria e che ha superato i 500.000 download su Steam in appena un paio di settimane dal lancio, ora ha dei server dedicati.',100,'SI','C:\\Users\\Cosmo\\OneDrive\\Desktop\\Universita\\TSW\\WorkSpaceTSW\\GameOver\\WebContent\\img\\game2.jpg','RPG','C:\\Users\\Cosmo\\OneDrive\\Desktop\\Universita\\TSW\\WorkSpaceTSW\\GameOver\\WebContent\\img\\Background\\back2.jpg'),(3,'Eiyuden Chronicle: Rising',10.99,22,'Informazioni sul gioco Eiyuden Chronicle Rising è un RPG d\'azione dove puoi costruire la tua città , ambientato nello stesso mondo di Eiyuden Chronicle. Racconta le storie dei vari personaggi che poi diventeranno tuoi compagni in Eiyuden Chronicle, nel periodo prima della guerra',100,'SI','C:\\Users\\Cosmo\\OneDrive\\Desktop\\Universita\\TSW\\WorkSpaceTSW\\GameOver\\WebContent\\img\\game3.jpg','RPG','C:\\Users\\Cosmo\\OneDrive\\Desktop\\Universita\\TSW\\WorkSpaceTSW\\GameOver\\WebContent\\img\\Background\\back3.jpg'),(4,'Dune: Spice Wars ',19.69,22,'Informazioni sul gioco Un gioco di strategia in tempo reale con elementi 4X ideato dagli sviluppatori del popolare Northgard. Ambientato nel rivoluzionario universo Dune di Frank Herbert, dovrai guidare una fazione e combattere per il controllo e il dominio sull´inospitale pianeta desertico di Arrakis',100,'SI','C:\\Users\\Cosmo\\OneDrive\\Desktop\\Universita\\TSW\\WorkSpaceTSW\\GameOver\\WebContent\\img\\game4.jpg','Avventura','C:\\Users\\Cosmo\\OneDrive\\Desktop\\Universita\\TSW\\WorkSpaceTSW\\GameOver\\WebContent\\img\\Background\\back4.jpg'),(5,'Elden Ring',50,22,'Elden Ring per PC è un gioco di ruolo d\'azione (ARPG) scritto dalle superstar George RR Martin (l\'autore della serie di libri Le Cronache del Ghiaccio e del Fuoco che ha dato origine alla serie televisiva Game of Thrones) e Hidetaka Miyazake (famoso per molti popolari videogiochi: dalla serie Souls, a Bloodborne, a Sekiro).L\'Elden Ring è stato distrutto e i suoi frammenti si sono sparsi per le terre, formando le Grandi Rune. Alcuni di questi frammenti sono caduti nelle mani dei figli della regina Marika l\'Eterna e la promessa di un potere ancora maggiore ha corrotto ciascuno dei sei semidei.',100,'SI','C:\\Users\\Cosmo\\OneDrive\\Desktop\\Universita\\TSW\\WorkSpaceTSW\\GameOver\\WebContent\\img\\game5.jpg','Azione','C:\\Users\\Cosmo\\OneDrive\\Desktop\\Universita\\TSW\\WorkSpaceTSW\\GameOver\\WebContent\\img\\Background\\back5.jpg'),(6,'Farming Simulator 22',30.99,22,'Farming Simulator 22 per PC è, come si può intuire dal nome, un gioco di simulazione agricola in una serie che comprende circa quattordici edizioni, distribuite su PC e dispositivi mobili. Il giocatore è un agricoltore e il tuo obiettivo è quello di far crescere e mantenere la fattoria, per renderla un successo.In modalità carriera, il tuo primo compito è sempre quello di aggiornare l\'attrezzatura obsoleta della fattoria, sostituendola con modelli nuovi e migliori, oltre ad espanderla. Proprio come nella vita reale, trascurare qualsiasi aspetto della tua fattoria influirà sui risultati finali.',100,'SI','C:\\Users\\Cosmo\\OneDrive\\Desktop\\Universita\\TSW\\WorkSpaceTSW\\GameOver\\WebContent\\img\\game6.jpg','RPG','C:\\Users\\Cosmo\\OneDrive\\Desktop\\Universita\\TSW\\WorkSpaceTSW\\GameOver\\WebContent\\img\\Background\\back6.jpg'),(7,'Grand Theft Auto V',19.99,22,'Un giovane truffatore, un rapinatore di banche in pensione e uno spaventoso psicopatico sono costretti da una serie di difficoltÃ  a mettere in atto degli audaci colpi in una citta´  dove non possono fidarsi di nessuno, men che meno l\'uno dell\'altro.',100,'SI','C:\\Users\\Cosmo\\OneDrive\\Desktop\\Universita\\TSW\\WorkSpaceTSW\\GameOver\\WebContent\\img\\game7.jpg','Azione','C:\\Users\\Cosmo\\OneDrive\\Desktop\\Universita\\TSW\\WorkSpaceTSW\\GameOver\\WebContent\\img\\Background\\back7.jpg'),(8,'Star Wars',39,22,'La galassia è tutta tua con LEGO Star Wars: La Saga Degli Skywalker. Vivi i momenti memorabili e l\'azione senza sosta di tutti e nove i film della saga reinterpretati con il caratteristico umorismo LEGO.',100,'SI','C:\\Users\\Cosmo\\OneDrive\\Desktop\\Universita\\TSW\\WorkSpaceTSW\\GameOver\\WebContent\\img\\game8.jpg','Arcade','C:\\Users\\Cosmo\\OneDrive\\Desktop\\Universita\\TSW\\WorkSpaceTSW\\GameOver\\WebContent\\img\\Background\\back8.jpg'),(39,'Horizon Forbidden West ',45.25,22,'Unisciti al viaggio di Aloy verso l\'Ovest Proibito, una frontiera maestosa e pericolosa che nasconde nuove e misteriose minacce. Esplora terre remote, combatti contro macchine ancora più grandi e terrificanti e incontra nuove e stupefacenti tribù al tuo ritorno nel lontano futuro post-apocalittico di Horizon.  La terra sta morendo. Violente tempeste e una piaga inarrestabile funestano quel poco che resta dell\'umanità, mentre nuove e tremende macchine vanno a caccia lungo i confini. La vita sulla Terra sembra destinata a una nuova estinzione e nessuno ne conosce il motivo.',100,'SI','C:\\Users\\Cosmo\\OneDrive\\Desktop\\Universita\\TSW\\WorkSpaceTSW\\GameOver\\WebContent\\img\\game13.jpg','Avventura','C:\\Users\\Cosmo\\OneDrive\\Desktop\\Universita\\TSW\\WorkSpaceTSW\\GameOver\\WebContent\\img\\Background\\back39.jpg'),(40,'The Gunk',24.49,22,'Protagonista di The Gunk è Rani, una delle due grintose esploratrici spaziali che, in cerca di opportunità di guadagno, hanno la fortuna di imbattersi in un pianeta incontaminato e brulicante di vita... nonché di risorse preziose!  Tuttavia, mentre scoprono gli arcani segreti di una civiltà ormai estinta, devono fare i conti con la maledizione del gunk, un parassita tossico, e il tutto mentre vengono risucchiate da una spirale di sfiducia sempre più intensa.  Dovrai servirti del tuo fidato guanto per sbarazzarti della misteriosa sostanza, svelare antichi segreti e salvare il pianeta! Scopri levoluzione del rapporto del duo mentre esplori il pianeta.',100,'SI','C:\\Users\\Cosmo\\OneDrive\\Desktop\\Universita\\TSW\\WorkSpaceTSW\\GameOver\\WebContent\\img\\game10.jpg','RPG','C:\\Users\\Cosmo\\OneDrive\\Desktop\\Universita\\TSW\\WorkSpaceTSW\\GameOver\\WebContent\\img\\Background\\back40.jpg'),(41,'Ghost of Tsushima',75.6,22,'Scopri un\'esperienza più estesa di Ghost of Tsushima in questa Directors Cut, che comprende tutti contenuti aggiuntivi pubblicati finora.  - Scopri le bellezze nascoste di Tsushima in questa avventura d\'azione open-world. - Inaugura un nuovo percorso e intraprendi una guerra non convenzionale per liberare l\'isola. - Sfida gli avversari con la katana, padronegga l\'arco per eliminare le minacce distanti e sviluppa tattiche di furtività per tendere imboscate ai nemici. - Esplora una nuova storia sull\'isola di Iki. ',100,'SI','C:\\Users\\Cosmo\\OneDrive\\Desktop\\Universita\\TSW\\WorkSpaceTSW\\GameOver\\WebContent\\img\\game14.jpg','Azione','C:\\Users\\Cosmo\\OneDrive\\Desktop\\Universita\\TSW\\WorkSpaceTSW\\GameOver\\WebContent\\img\\Background\\back41.jpg'),(45,'Chaos Gate',56.68,22,'Guida l\'arma più grande in possesso del genere umano, i Grey Knights, contro le forze malvagie del Caos in questo frenetico gioco di ruolo strategico a turni. Metti fine a un insidioso complotto per infettare la galassia con il pericoloso morbo chiamato Bloom, in grado di far sprofondare i pianeti nell\'oblio.',100,'SI','C:\\Users\\Cosmo\\OneDrive\\Desktop\\Universita\\TSW\\WorkSpaceTSW\\GameOver\\WebContent\\img\\game12.jpg','RPG','C:\\Users\\Cosmo\\OneDrive\\Desktop\\Universita\\TSW\\WorkSpaceTSW\\GameOver\\WebContent\\img\\Background\\back45.jpg'),(47,'Tiny Tina\'s Wonderlands',45,22,'Vivi un\'avventura epica piena di armi uniche, stravaganti e prodigiose! Tuffati nel vortice di proiettili, lame e magie del caotico mondo fantasy partorito dall\'imprevedibile mente di Tiny Tina.',100,'SI','C:\\Users\\Cosmo\\OneDrive\\Desktop\\Universita\\TSW\\WorkSpaceTSW\\GameOver\\WebContent\\img\\game11.jpg','Arcade','C:\\Users\\Cosmo\\OneDrive\\Desktop\\Universita\\TSW\\WorkSpaceTSW\\GameOver\\WebContent\\img\\Background\\back47.jpg'),(49,'Risk of Rain 2',11.95,22,'Il Portale per il Vuoto si è aperto! Il potere corruttivo contenuto ha avvolto Petrichor V e fatto sprofondare il pianeta nell\'oscurità. Per millenni, le Creature del Vuoto si sono potenziate portando artefatti dal nostro regno al loro. Ora vogliono aggiungere anche te alla loro collezione.',100,'SI','C:\\Users\\Cosmo\\OneDrive\\Desktop\\Universita\\TSW\\WorkSpaceTSW\\GameOver\\WebContent\\img\\game9.jpg','Arcade','C:\\Users\\Cosmo\\OneDrive\\Desktop\\Universita\\TSW\\WorkSpaceTSW\\GameOver\\WebContent\\img\\Background\\back49.jpg'),(53,'Mario Strikers',24.49,22,'Lavoro di squadra, contrasti, oggetti in grado di ribaltare il risultato e spettacolari ipertiri: questi sono gli ingredienti per la vittoria in Mario Strikers: Battle League Football per Nintendo Switch! Tuffati in frenetiche partite in multiplayer locale e fai squadra con altri giocatori online per portare il tuo club al vertice della classifica mondiale!',100,'SI','C:\\Users\\Cosmo\\OneDrive\\Desktop\\Universita\\TSW\\WorkSpaceTSW\\GameOver\\WebContent\\img\\game15.jpg','Arcade','C:\\Users\\Cosmo\\OneDrive\\Desktop\\Universita\\TSW\\WorkSpaceTSW\\GameOver\\WebContent\\img\\Background\\back53.jpg'),(54,'Civilization VI',9.29,22,'Creato dal leggendario Sid Meier, Civilization è un gioco strategico a turni in cui l\'obiettivo è costruire un impero in grado di superare la prova del tempo. Esplora territori sconosciuti, ricerca nuove tecnologie, sconfiggi i tuoi nemici e sfida i più grandi leader della storia per dare vita alla civiltà più grandiosa che il mondo abbia mai conosciuto.  Civilization VI offre nuove modalità di interazione con il mondo: le città ora si espandono fisicamente sulla mappa, mentre le ricerche attive in campo tecnologico e culturale sbloccano nuove potenzialità. Intanto i leader avversari portano avanti i loro programmi, basati sulle caratteristiche dei personaggi storici: il risultato è una corsa per raggiungere una delle cinque diverse condizioni di vittoria del gioco. ',100,'SI','C:\\Users\\Cosmo\\OneDrive\\Desktop\\Universita\\TSW\\WorkSpaceTSW\\GameOver\\WebContent\\img\\game23.jpg','RPG','C:\\Users\\Cosmo\\OneDrive\\Desktop\\Universita\\TSW\\WorkSpaceTSW\\GameOver\\WebContent\\img\\Background\\back54.jpg'),(55,'Sekiro',39.99,22,'Questa Game of the Year Edition ora include contenuti bonus*:  - Riflessione e Sfida di Forza: nuove modalità di sfida contro i boss - Cimeli: lascia messaggi e registrazioni delle tue azioni che altri giocatori possono visualizzare e valutare - Tre skin estetiche sbloccabili  Gioco dell\'anno - The Game Awards 2019 Miglior gioco d\'azione del 2019 - IGN Più di 50 premi e candidature  Intraprendi il cammino verso la vendetta nell\'acclamata avventura di FromSoftware, gli sviluppatori di Bloodborne e della serie Dark Souls.  In Sekiro: Shadows Die Twice vestirai i panni di un \'lupo senza un braccio\', un guerriero sfregiato e caduto in disgrazia, salvato a un passo dalla morte. Il tuo destino è legato a un giovane di nobili origini, discendente di un\'antica stirpe: per proteggerlo affronterai numerosi nemici, tra cui lo spietato clan Ashina. Niente ti fermerà nella pericolosa missione per riscattare il tuo onore e liberare il giovane signore, nemmeno la morte stessa.',100,'SI','C:\\Users\\Cosmo\\OneDrive\\Desktop\\Universita\\TSW\\WorkSpaceTSW\\GameOver\\WebContent\\img\\game17.jpg','Azione','C:\\Users\\Cosmo\\OneDrive\\Desktop\\Universita\\TSW\\WorkSpaceTSW\\GameOver\\WebContent\\img\\Background\\back55.jpg'),(56,'Super Smash Bros',65.99,22,'Super Smash Bros. Ultimate per Nintendo Switch è un gioco di combattimento crossover che presenta una vasta gamma di personaggi di vari altri giochi, grazie alla partnership tra Bandai, Sora e Nintendo. Naturalmente, dato il nome, vi compaiono tutti i personaggi del mondo dei giochi di Mario Bros, con diverse abilità e gradi di personalizzazione. È il quinto gioco di questa serie e offre ben settanta (70!) personaggi giocabili.  Alcuni dei giochi i cui personaggi appaiono in questo gioco comprendono: Animal Crossing, Castlevania, Metroid e alcuni Pokémon selezionati dall\'universo Pokémon.',100,'SI','C:\\Users\\Cosmo\\OneDrive\\Desktop\\Universita\\TSW\\WorkSpaceTSW\\GameOver\\WebContent\\img\\game22.jpg','Arcade','C:\\Users\\Cosmo\\OneDrive\\Desktop\\Universita\\TSW\\WorkSpaceTSW\\GameOver\\WebContent\\img\\Background\\back56.jpg'),(57,'Nintendo Switch Sports',37.99,22,'Divertimento in movimento!  Lotta per la vittoria in Nintendo Switch Sports per Nintendo Switch!  Impugna un controller Joy-Con e competi in varie discipline sportive muovendoti nel mondo reale. Raduna amici e parenti per divertenti sessioni di gioco in locale, con una sola console Nintendo Switch, o vai alla ricerca di nuovi sfidanti con il multiplayer online!  Qui, infatti, potrai accedere ai vari campi da calcio, tennis, badminton e pallavolo, alla pista da bowling e all\'arena dedicata al chanbara.',100,'SI','C:\\Users\\Cosmo\\OneDrive\\Desktop\\Universita\\TSW\\WorkSpaceTSW\\GameOver\\WebContent\\img\\game24.webp','Azione','C:\\Users\\Cosmo\\OneDrive\\Desktop\\Universita\\TSW\\WorkSpaceTSW\\GameOver\\WebContent\\img\\Background\\back57.jpg'),(58,'Pokémon: Arceus',56.2,22,'Cattura, osserva e studia Pokémon selvatici per creare e completare il primo Pokédex della regione di Sinnoh in Leggende Pokémon: Arceus per Nintendo Switch. Leggende Pokémon: Arceus rende omaggio al gameplay dei titoli Pokémon del passato, introducendo al contempo nuove azioni ed elementi da gioco di ruolo.  Ti ritroverai nella regione di Sinnoh, l\'ambientazione di Pokémon Diamante e Pokémon Perla. Ma questa storia si svolge in un passato lontano, prima che esistessero concetti come gli Allenatori di Pokémon o la Lega Pokémon. Tutto intorno a te troverai Pokémon selvatici immersi in ambienti inospitali che rendono Sinnoh molto diversa da quella di Pokémon Diamante e Pokémon Perla.  Per catturare i Pokémon in Leggende Pokémon: Arceus, devi prima osservarli per studiarne il comportamento. Poi, avvicinati di soppiatto, prendi la mira con la tua Poké Ball e lanciala! Puoi anche far lottare i Pokémon della tua squadra con i Pokémon selvatici che vuoi catturare. Lancia la Poké Ball che contiene il tuo alleato Pokémon verso un Pokémon selvatico per dare il via all\'azione, poi controlla il tuo Pokémon scegliendo quali mosse fargli eseguire.',100,'SI','C:\\Users\\Cosmo\\OneDrive\\Desktop\\Universita\\TSW\\WorkSpaceTSW\\GameOver\\WebContent\\img\\game20.jpg','RPG','C:\\Users\\Cosmo\\OneDrive\\Desktop\\Universita\\TSW\\WorkSpaceTSW\\GameOver\\WebContent\\img\\Background\\back58.jpg');
/*!40000 ALTER TABLE `articolo` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `indirizzo_spedizione`
--

DROP TABLE IF EXISTS `indirizzo_spedizione`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `indirizzo_spedizione` (
  `id_indirizzo_spedizione` int NOT NULL,
  `via` varchar(45) DEFAULT NULL,
  `cap` varchar(6) DEFAULT NULL,
  `citta` varchar(45) DEFAULT NULL,
  `ncivico` int DEFAULT NULL,
  `provincia` varchar(2) DEFAULT NULL,
  `id_utente_ref` int DEFAULT NULL,
  PRIMARY KEY (`id_indirizzo_spedizione`),
  KEY `id_utente_idx` (`id_utente_ref`),
  CONSTRAINT `id_utente` FOREIGN KEY (`id_utente_ref`) REFERENCES `utente` (`idUtente`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `indirizzo_spedizione`
--

LOCK TABLES `indirizzo_spedizione` WRITE;
/*!40000 ALTER TABLE `indirizzo_spedizione` DISABLE KEYS */;
/*!40000 ALTER TABLE `indirizzo_spedizione` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `metodopagamento`
--

DROP TABLE IF EXISTS `metodopagamento`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `metodopagamento` (
  `idPagamento` int NOT NULL AUTO_INCREMENT,
  `numeroCarta` varchar(20) NOT NULL,
  `cvv` int NOT NULL,
  `idUtenteRef` int DEFAULT NULL,
  `anno` int DEFAULT NULL,
  `mese` int DEFAULT NULL,
  PRIMARY KEY (`idPagamento`),
  KEY `idUtenteRef_idx` (`idUtenteRef`),
  CONSTRAINT `idUtenteRef` FOREIGN KEY (`idUtenteRef`) REFERENCES `utente` (`idUtente`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `metodopagamento`
--

LOCK TABLES `metodopagamento` WRITE;
/*!40000 ALTER TABLE `metodopagamento` DISABLE KEYS */;
INSERT INTO `metodopagamento` VALUES (1,'1111-2222-3333-4444',123,1,2022,6);
/*!40000 ALTER TABLE `metodopagamento` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ordine`
--

DROP TABLE IF EXISTS `ordine`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `ordine` (
  `idOrdine` int NOT NULL AUTO_INCREMENT,
  `idUtente` int NOT NULL,
  `idPagamento` int NOT NULL,
  `quantitaArticoli` int NOT NULL,
  `importoTotale` double NOT NULL,
  `dataAcquisto` date NOT NULL,
  `dataSpedizione` date NOT NULL,
  `statoOrdine` varchar(100) NOT NULL,
  PRIMARY KEY (`idOrdine`),
  KEY `idPagamento_idx` (`idPagamento`),
  KEY `idUtente_idx` (`idUtente`),
  CONSTRAINT `idPagamento` FOREIGN KEY (`idPagamento`) REFERENCES `metodopagamento` (`idPagamento`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `idUtente` FOREIGN KEY (`idUtente`) REFERENCES `utente` (`idUtente`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ordine`
--

LOCK TABLES `ordine` WRITE;
/*!40000 ALTER TABLE `ordine` DISABLE KEYS */;
INSERT INTO `ordine` VALUES (1,1,1,1,30,'2022-05-07','2022-05-08','ordinato'),(2,2,2,2,50,'2022-05-07','2022-05-09','ordinato');
/*!40000 ALTER TABLE `ordine` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `piattaforma`
--

DROP TABLE IF EXISTS `piattaforma`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `piattaforma` (
  `idPiattaforma` int NOT NULL AUTO_INCREMENT,
  `descrizione` varchar(500) NOT NULL,
  `tipoPiattaforma` varchar(50) NOT NULL,
  `idArticoloRef` int NOT NULL,
  PRIMARY KEY (`idPiattaforma`,`idArticoloRef`),
  KEY `idArticolo_idx` (`idArticoloRef`),
  CONSTRAINT `idArticoloReference` FOREIGN KEY (`idArticoloRef`) REFERENCES `articolo` (`idArticolo`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=45 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `piattaforma`
--

LOCK TABLES `piattaforma` WRITE;
/*!40000 ALTER TABLE `piattaforma` DISABLE KEYS */;
INSERT INTO `piattaforma` VALUES (1,'Nintendo','Nintendo Switch',1),(2,'Steam','Pc',2),(3,'Steam','Pc',3),(4,'Steam','Xbox',4),(5,'Steam','Xbox',7),(6,'Console','Ps5',6),(7,'Steam','Ps5',7),(8,'Steam','Pc',7),(9,'Steam','Xbox',40),(10,'Steam','Ps5',41),(11,'Steam','Pc',47),(12,'Steam','Xbox',47),(13,'Steam','Pc',49),(14,'Steam','Xbox',49),(15,'Steam','Nintendo Switch',3),(16,'Steam','Ps5',4),(17,'Steam','Pc',39),(18,'Steam','Pc',55),(19,'Steam','Xbox',58),(24,'Steam','Ps5',39),(25,'Steam','Pc',40),(26,'Steam','Pc',41),(30,'Steam','Pc',45),(32,'Steam','Nintendo Switch',49),(36,'Steam','Nintendo Switch',53),(37,'Steam','Pc',54),(38,'Steam','Nintendo Switch',54),(39,'Steam','Xbox',55),(40,'Steam','Nintendo Switch',56),(41,'Steam','Pc',56),(42,'Steam','Nintendo Switch',57),(43,'Steam','Nintendo Switch',58);
/*!40000 ALTER TABLE `piattaforma` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `utente`
--

DROP TABLE IF EXISTS `utente`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `utente` (
  `idUtente` int NOT NULL AUTO_INCREMENT,
  `username` varchar(30) DEFAULT NULL,
  `email` varchar(45) DEFAULT NULL,
  `password` varchar(20) DEFAULT NULL,
  `admin` tinyint DEFAULT '0',
  `telefono` varchar(13) DEFAULT NULL,
  `nome` varchar(50) DEFAULT NULL,
  `cognome` varchar(50) DEFAULT NULL,
  `via` varchar(100) DEFAULT NULL,
  `cap` varchar(5) DEFAULT NULL,
  `citta` varchar(50) DEFAULT NULL,
  `ncivico` int DEFAULT NULL,
  `provincia` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`idUtente`)
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `utente`
--

LOCK TABLES `utente` WRITE;
/*!40000 ALTER TABLE `utente` DISABLE KEYS */;
INSERT INTO `utente` VALUES (1,'Araton','Araton@gmail.com','1234',1,'112233','Emanuele','Pisaturo','Vittoria','84098','Pontecagnano Faiano',6,'SA'),(2,'eSetaro1','Setaro@gmail.com','5678',0,'445566','Emanuele','Setaro','Roma','82192','Scafati',10,'SA'),(3,'Thommy1','Thomas@gmail.com','9012',1,'778899','Thomas','De Palma','dei ciliegi','80821','Salerno',1,'SA'),(4,'admin','admin@protonmail.com','admin',1,'473839','admin','root','via','85067','Napoli',8,'NA'),(5,'Test','test@test','tester',0,'21341','tester','test','via test','12839','test',333,'ts'),(13,'tester','test','test',0,'31412','test','test','test','34','test',34,'test');
/*!40000 ALTER TABLE `utente` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2022-07-09 10:30:22
