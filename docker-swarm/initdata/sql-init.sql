
CREATE DATABASE IF NOT EXISTS `keycloak` CHARACTER SET utf8 COLLATE utf8_unicode_ci;
CREATE USER 'kc-user'@'%' IDENTIFIED BY 'db-password';
GRANT ALL PRIVILEGES ON keycloak.* TO 'kc-user'@'%';

CREATE DATABASE IF NOT EXISTS `cms` CHARACTER SET utf8 COLLATE utf8_unicode_ci;
CREATE USER 'cms-user'@'%' IDENTIFIED BY 'db-password';
GRANT ALL PRIVILEGES ON cms.* TO 'cms-user'@'%';

CREATE DATABASE IF NOT EXISTS `termservice` CHARACTER SET utf8 COLLATE utf8_unicode_ci;
CREATE USER 'term-user'@'%' IDENTIFIED BY 'db-password';
GRANT ALL PRIVILEGES ON termservice.* TO 'term-user'@'%';

CREATE DATABASE IF NOT EXISTS `discussionservice` CHARACTER SET utf8 COLLATE utf8_unicode_ci;
CREATE USER 'discuss-user'@'%' IDENTIFIED BY 'db-password';
GRANT ALL PRIVILEGES ON discussionservice.* TO 'discuss-user'@'%';

Use `cms`;
DROP TABLE IF EXISTS `articles`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `articles` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `Title` varchar(255) DEFAULT NULL,
  `Content` longtext,
  `Published_date` date DEFAULT NULL,
  `Summary` longtext,
  `published_at` datetime DEFAULT NULL,
  `created_by` int(11) DEFAULT NULL,
  `updated_by` int(11) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `articles`
--

LOCK TABLES `articles` WRITE;
/*!40000 ALTER TABLE `articles` DISABLE KEYS */;
INSERT INTO `articles` VALUES (1,'EuroTermBank Federated Network has been launched','<p><span style=\"color:rgb(0,15,54);\">FedTerm Network is revolutionizing terminology management throughout the EU member states and beyond by ensuring correct, consistent and current terminology data. Now each member state, organization and institution can effortlessly manage their terminology and easily share it across Europe.</span></p>','2021-05-25','Now each member state, organization and institution can effortlessly manage their terminology and easily share it across Europe.','2021-05-25 17:49:49',1,1,'2021-05-25 14:49:44','2021-05-27 04:44:21'),(2,'EuroTermBank Resources','<p><span style=\"background-color:rgb(255,255,255);color:rgb(0,15,54);\">The EuroTermBank is a largest centralized online terminology bank for Languages of the European Union and Icelandic, interlinked to other terminology banks and resources. You can browse through public collections, import and export collections and much more at </span><a href=\"https://www.eurotermbank.com/\"><span style=\"background-color:rgb(255,255,255);color:rgb(5,99,193);\"><u>eurotermbank.com</u></span></a></p>','2021-05-25','The EuroTermBank is a largest centralized online terminology bank for Languages','2021-05-25 17:59:06',1,1,'2021-05-25 14:58:37','2021-05-27 04:45:35'),(3,'Save the date: Terminology Summer School, 1-4 July 2021','<p><span style=\"color:rgb(0,15,54);\">Sign up for The International Terminology Summer School (TSS) and join terminology, language and information professionals from all over the world in a free four-day online event!&nbsp; The course will be taught by some of the most renowned and prominent terminology experts in the world<strong>. </strong>More information: www.termnet.eu</span></p>','2021-05-25','Sign up for The International Terminology Summer School (TSS)','2021-05-25 18:00:34',1,1,'2021-05-25 15:00:00','2021-05-27 04:46:23');
/*!40000 ALTER TABLE `articles` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `audience`
--

DROP TABLE IF EXISTS `audience`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `audience` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `key` varchar(255) DEFAULT NULL,
  `created_by` int(11) DEFAULT NULL,
  `updated_by` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `audience_key_unique` (`key`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `audience`
--

LOCK TABLES `audience` WRITE;
/*!40000 ALTER TABLE `audience` DISABLE KEYS */;
/*!40000 ALTER TABLE `audience` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `brand_settings`
--

DROP TABLE IF EXISTS `brand_settings`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `brand_settings` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `empty_search_text` longtext,
  `empty_collections_text` longtext,
  `anonymous_search_text` longtext,
  `created_by` int(11) DEFAULT NULL,
  `updated_by` int(11) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `brand_settings`
--

LOCK TABLES `brand_settings` WRITE;
/*!40000 ALTER TABLE `brand_settings` DISABLE KEYS */;
/*!40000 ALTER TABLE `brand_settings` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `components_basic_links`
--

DROP TABLE IF EXISTS `components_basic_links`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `components_basic_links` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `Text` varchar(255) DEFAULT NULL,
  `Target` varchar(255) DEFAULT NULL,
  `AppendArrow` tinyint(1) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `components_basic_links`
--

LOCK TABLES `components_basic_links` WRITE;
/*!40000 ALTER TABLE `components_basic_links` DISABLE KEYS */;
/*!40000 ALTER TABLE `components_basic_links` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `components_landing_sections`
--

DROP TABLE IF EXISTS `components_landing_sections`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `components_landing_sections` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `HtmlBlock` longtext,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `components_landing_sections`
--

LOCK TABLES `components_landing_sections` WRITE;
/*!40000 ALTER TABLE `components_landing_sections` DISABLE KEYS */;
INSERT INTO `components_landing_sections` VALUES (2,'<p><span style=\"background-color:yellow;\">[this is example terms of use, please replace it with your own]</span></p><p><span style=\"color:#616E7C;\">EuroTermBank Federated node Terms of Use</span></p><p><span style=\"color:#616E7C;\">These Terms of Use (hereinafter “Terms”) apply to the use of EuroTermBank Federated node services, provided by Tilde and Federated eTranslation Termbank Network (No.2019-EU-IA-0049) consortium and as defined below. Please read these Terms carefully before using the services. The user (hereinafter “User”) accepts and agrees that the use of the services is governed by these Terms and that it is bound by these Terms.</span></p><p><span style=\"color:#616E7C;\"><strong>1. Definitions</strong></span></p><p><span style=\"color:#616E7C;\">1.1 The following words and phrases shall have the meanings and definitions set forth below:</span></p><p><span style=\"color:#616E7C;\">(a) “Database” means a collection of Terminology, systematically selected, processed, maintained, and updated by EuroTermBank Federated node.</span></p><p><span style=\"color:#616E7C;\">(b) “Terminology” means all data consisting of a source side of a single or multi-word term, and the matching target side, which has the same meaning as the source side in a different language and associated metadata, indicating the language pair and other pertinent information about this source/target pairs.</span></p><p><span style=\"color:#616E7C;\">(c) “Derivative Work” means a work based upon one or more pre-existing works, such as Terminology, in which a work may be recast, transformed, or adapted. A work consisting of editorial revisions, annotations, elaborations or other modifications, which as a whole represent an original work of authorship, is a derivative work. Non-material modifications to a pre-existing work do not constitute a derivative work.</span></p><p><span style=\"color:#616E7C;\">(d) “EuroTermBank Federated node” means the services that process the user’s texts, Terminology and all related information.</span></p><p><span style=\"color:#616E7C;\"><strong>2. Right to use EuroTermBank Federated node services and Database</strong></span></p><p><span style=\"color:#616E7C;\">2.1 User is granted a personal, non-transferable, non-exclusive right to use EuroTermBank Federated node services and Database in accordance with these Terms.</span></p><p><span style=\"color:#616E7C;\">2.2 The right to access and use the services and data is limited to the remote access and/or use of the services and data by means of electronic access via the Internet.</span></p><p><span style=\"color:#616E7C;\">2.3 Access to the services and data includes the following limitative rights:</span></p><ul><li><span style=\"color:#616E7C;\">the right to use the source and the target side of Terminology into a commercial product, provided that User may not resell Terminology as if it is its own new product;</span></li><li><span style=\"color:#616E7C;\">the right to make Derivative Works;</span></li><li><span style=\"color:#616E7C;\">the right to use or resell such Derivative Works commercially;</span></li></ul><p><span style=\"color:#616E7C;\">2.4 Except as expressly stipulated in these Terms or except as expressly allowed by mandatory law, User may not – nor permit any third party to – (a) copy, make available, sublicense, or otherwise commercialise EuroTermBank Federated node; (b) modify, translate, or otherwise create Derivative Work of EuroTermBank Federated node; (c) disassemble, decompile, or reverse engineer the object code or source code of EuroTermBank Federated node without written approval from Tilde.&nbsp;</span></p><p><span style=\"color:#616E7C;\">2.4 Tilde may take technical measures to protect EuroTermBank Federated node services. User may not remove or circumvent such technical measures.</span></p><p><span style=\"color:#616E7C;\">2.5 Tilde reserves the right to audit – or to have a third party audit – whether User complies with the granted rights regarding the use of EuroTermBank Federated node services and/or Terminology.</span></p><p><span style=\"color:#616E7C;\">2.6 User is responsible for meeting the technical and functional requirements (provided by Tilde to User) in order to be able to access and use EuroTermBank Federated node services and/or Terminology. The use of the services and/or data is for the User’s own account and risk. The use of electronic communication facilities in order to gain access to the services and/or data is also for the User’s own account and risk. Tilde will in no event be liable for any damage, loss or costs, including loss of Terminology, or any inability of the User to use the services as a result of a shortcoming, defect or other malfunction of the aforesaid electronic communication facilities. Furthermore, the risk of loss or theft of or damage to Terminology will at all times be borne by the User.</span></p><p><span style=\"color:#616E7C;\"><strong>3. USER’s obligations</strong></span></p><p><span style=\"color:#616E7C;\">3.1 User warrants it will correctly and properly use EuroTermBank Federated node services and/or Terminology, which includes but is not limited to compliance with the terms of these Terms. User may in any case not use the services and/or data for any acts and/or conduct contrary to the law, public order, public decency or these Terms. Furthermore, User’s acts and/or conduct must be in accordance with what may in all respects be expected of a responsible and diligent User.</span></p><p><span style=\"color:#616E7C;\"><strong>4. Intellectual property rights</strong></span></p><p><span style=\"color:#616E7C;\">4.1 All ownership rights and all copyrights, sui generis database rights and patent rights in respect of EuroTermBank Federated node services exclusively vest in Tilde.</span></p><p><span style=\"color:#616E7C;\">4.2 The intellectual property rights to Terminology including any trademark rights vest with User or any other third party provider of reference documents and files that are used for the extraction of Terminology. User indicates upon submitting Terminology, reference documents and files whether User owns the intellectual property rights to Terminology, acts on behalf of the owner of the intellectual property rights, or submits Terminology or reference documents and files that are free of intellectual property rights and are as such Fair-to-Share. User does not grant Tilde, without the prior written consent from the trademark owner, the right to use any such trademarks.</span></p><p><span style=\"color:#616E7C;\"><strong>5. Representations and Warranties of User</strong></span></p><p><span style=\"color:#616E7C;\">5.1 User hereby represents and warrants that to the best of its knowledge i) in the fulfilment of its obligations under these Terms, User will not share Terminology, reference documents, or files which are violating, infringing, or misappropriating any intellectual property rights, proprietary information or any (trade) secrets of any third party and ii) has the right to grant to Tilde the licenses contemplated in these Terms. If User is not the owner of the intellectual property rights, User will provide the name and contact details of the owner of the intellectual property rights, or User will explicitly state that Terminology, reference documents or files are free from intellectual property rights.</span></p><p><span style=\"color:#616E7C;\">5.2 User hereby further warrants that to the best of its knowledge Terminology, reference documents or files submissions do not contain any viruses, worms, spyware, or other components or instructions that are malicious, deceptive or designed to harm or limit the functionality of a computer. User warrants that procedures have been put in place that reduce the risk of contamination of Database with aforesaid shortcoming.</span></p><p><span style=\"color:#616E7C;\">5.3 User makes no representation or warranty of any nature as to the correctness of Terminology, reference documents or files that he submits.</span></p><p><span style=\"color:#616E7C;\"><strong>6. Functioning of EuroTermBank Federated node services</strong></span></p><p><span style=\"color:#616E7C;\">6.1 EuroTermBank Federated node services are provided “as is” without warranty of any kind, express or implied, including but not limited to warranties of merchantability, fitness for a particular purpose and non-infringement. In no event shall Tilde or the owners of Terminology vis-à-vis the User be liable for any claim, damages or other liability, whether in an action of contract, tort or otherwise, arising from, out, or in connection with the use of the services and data.</span></p><p><span style=\"color:#616E7C;\">6.2 Tilde shall not be liable for any damage, loss, demand, liability, claim, cost or expense (including litigation costs and attorney\'s fees) of whatever kind, caused by or resulting from the use of the services and data.</span></p><p><span style=\"color:#616E7C;\"><strong>7. Miscellaneous</strong></span></p><p><span style=\"color:#616E7C;\">7.1 Tilde may (i) suspend access to and/or the use of the services, or (ii) terminate the granted rights to User, with immediate effect upon written notice if User breaches the terms of these Terms and/or otherwise acts unlawful against Tilde (including but not limited to infringing Tilde’s rights in EuroTermBank Federated node). If the rights granted to User under these Terms terminate, User shall immediately cease using EuroTermBank Federated node and destroy any and all entry codes and/or passwords.</span></p><p><span style=\"color:#616E7C;\">7.2 All matters arising out of or relating to these Terms shall be irrevocably submitted to the exclusive jurisdiction of the courts of the Republic of Latvia.</span></p><p><span style=\"color:#616E7C;\">7.3 Tilde may amend these Terms. Any such amendments will be reported to User on beforehand. Any continued use of EuroTermBank Federated node by User will subsequently constitute acceptance of the Terms (as amended).</span></p><p><span style=\"color:#616E7C;\">7.4 In the event that one or more provisions of these Terms should be determined by an arbitral tribunal or court having competent jurisdiction to be null and void or non-binding, the other provisions of these Terms will continue to be effective. In such case, the parties are obliged to replace the non-binding provisions with other provisions that are binding, in such a way that the intended economic result of the new provisions differs as little as possible from the intended economic result of the original provisions, taking into account the object and the purpose of these Terms. If a part or parts of Terms rendered void, invalid or unenforceable substantially impair the value of the whole Terms to any Party, such party may cancel and terminate Terms by giving written notice to the other party.</span></p><p><span style=\"color:#616E7C;\">7.5 Any term or condition of a purchase order, invoice or other communication between the Parties, which in any way differ from or add to the terms and conditions of these Terms, will not become binding upon the Parties unless made the subject of an amendment to these Terms. Either Party\'s failure to object to any term or condition contained in any purchase order, invoice or other communication between the Parties shall not be deemed a waiver of the provisions hereof.</span></p><p><span style=\"color:#616E7C;\">If you have any questions about anything you have read, feel free to contact us by email at [</span><span style=\"background-color:yellow;color:#616E7C;\">e-mail</span><span style=\"color:#616E7C;\">]</span></p>'),(6,'<p><span style=\"background-color:yellow;\">[this is example privacy policy, please replace it with your own]</span></p><p><span style=\"color:#616E7C;\">We are committed to protecting your privacy and personal data. Therefore, we use your personal data strictly within the legal limits of the applicable data protection laws. With this privacy policy, we inform you of the personal data we collect when you use our website or services.</span></p><p><span style=\"color:#616E7C;\">The EuroTermBank Federated node service collects and uses your personal data exclusively within the framework of the provisions of the General Data Protection Regulation. In the following, we inform you about the type, scope, and purposes of the collection and use of personal data.</span></p><p><span style=\"color:#616E7C;\">1. Definitions</span></p><p><span style=\"color:#616E7C;\">1.1 The following words and phrases shall have the meanings and definitions set forth below:</span></p><p><span style=\"color:#616E7C;\">(a) “Terminology” means all data consisting of a source side of a single or multi-word term, and the matching target side, which has the same meaning as the source side in a different language and associated metadata, indicating the language pair and other pertinent information about this source/target pairs.</span></p><p><span style=\"color:#616E7C;\">(d) “EuroTermBank Federated node” means the services that process the user’s texts, Terminology and all related information.&nbsp;</span></p><p><span style=\"color:#616E7C;\"><strong>1. Data controller</strong></span></p><p><span style=\"color:#616E7C;\">The data controller responsible for data processing within the meaning of the General Data Protection Regulation, other data protection laws in force in the Member States of the European Union, and other provisions of a data protection nature is:</span></p><p><span style=\"color:#616E7C;\">[</span><span style=\"background-color:yellow;color:#616E7C;\">institution name and address</span><span style=\"color:#616E7C;\">]</span></p><p><span style=\"color:#616E7C;\">Please feel free to address any questions or concerns regarding data protection or privacy to&nbsp;[</span><span style=\"background-color:yellow;color:#616E7C;\">e-mail</span><span style=\"color:#616E7C;\">]&nbsp;</span></p><p><span style=\"color:#616E7C;\"><strong>2. Scope of data protection</strong></span></p><p><span style=\"color:#616E7C;\">Data protection concerns personal data as defined in the General Data Protection Regulation, i.e. all information relating to an identified or identifiable natural person. Identifiable is any natural person who can be identified directly or indirectly, in particular by assignment to an identifier such as a name, an identification number, location data, an online identifier, or one or more special characteristics. Usage data is data required to use our website; this data includes the start, end, and extent of the user’s website use.</span></p><p><span style=\"color:#616E7C;\"><strong>3. Automatic data collection via website access</strong></span></p><p><span style=\"color:#616E7C;\">When you access our website: [</span><span style=\"background-color:yellow;color:#616E7C;\">EuroTermBank Federated node URL</span><span style=\"color:#616E7C;\">],&nbsp;your device automatically transmits certain data for technical reasons. The following data is stored separately from any other data you may transmit to us:</span></p><ul><li><span style=\"color:#616E7C;\">Date and time of access</span></li><li><span style=\"color:#616E7C;\">Browser type and version</span></li><li><span style=\"color:#616E7C;\">Operating system</span></li><li><span style=\"color:#616E7C;\">URL of the website visited prior to ours</span></li><li><span style=\"color:#616E7C;\">Amount of data sent</span></li><li><span style=\"color:#616E7C;\">Requesting domain</span></li><li><span style=\"color:#616E7C;\">Notification of successful data retrieval</span></li><li><span style=\"color:#616E7C;\">Search term when using a web browser</span></li><li><span style=\"color:#616E7C;\">Shortened/anonymized IP</span></li><li><span style=\"color:#616E7C;\">Full IP address (for a maximum of 14 days)</span></li></ul><p><span style=\"color:#616E7C;\">This data is stored for purely technical reasons and is never associated with any particular individual. The data about website access is used for error analysis, ensuring the security of the systems and to improve our translation service. For legitimate reasons, the full IP address is used to achieve the stated purposes for a very short period of a maximum of 14 days.</span><a href=\"#_msocom_1\"><span style=\"color:black;\">[AV1]</span></a><span style=\"color:black;\">&nbsp;</span></p><p><span style=\"color:#616E7C;\"><strong>4. Texts&nbsp;</strong></span></p><p><span style=\"color:#616E7C;\">When using the EuroTermBank Federated node service, the texts (Terminology) you submit are stored, and are used only insofar as it is necessary to create Collections or perform Search.</span></p><p><span style=\"color:#616E7C;\">Please note that you may not use our service for any texts containing personal data of any kind.</span></p><p><span style=\"color:#616E7C;\"><strong>5. Registration</strong></span></p><p><span style=\"color:#616E7C;\">You may register with the EuroTermBank Federated node. The following personal data will be stored for login purposes:</span></p><ul><li><span style=\"color:#616E7C;\">Email address</span></li><li><span style=\"color:#616E7C;\">Password</span></li><li><span style=\"color:#616E7C;\">IP address</span></li></ul><p><span style=\"color:#616E7C;\"><strong>6. Cookies</strong></span></p><p><span style=\"color:#616E7C;\">This webpage, like many others, uses cookies to personalize content and ads, provide social media features and analyse our data traffic.</span></p><p><span style=\"color:#616E7C;\">By continuing to use our website, you accept our cookies.</span></p><p><span style=\"color:#616E7C;\">What is a cookie:</span></p><p><span style=\"color:#616E7C;\">A cookie is a small text file sent to your computer or mobile device when you visit a website that is saved by that website on your computer or mobile device when you open the website. On each subsequent visit, cookies are sent back to the original webpage or any other webpage that recognizes this cookie. Cookies function as a memory of a specific webpage enabling the webpage to remember your computer in following visits including that the cookies can remember your settings or improve your user experience.</span></p><p><span style=\"color:#616E7C;\">How we use cookies:</span></p><p><span style=\"color:#616E7C;\">There are multiple types of cookies (persistent and session). They differ by their usage goals and storage period. Over time, the cookies may get updated and customized to improve the service quality level.</span></p><p><span style=\"color:#616E7C;\">In general, cookies are used for:</span></p><ul><li><span style=\"color:#616E7C;\">Provision of services – cookies provide basic functions such as page navigation.</span></li><li><span style=\"color:#616E7C;\">User settings – cookies enable a website to remember the information that changes the way the website works or looks, for example, the recommended language or your location region.</span></li><li><span style=\"color:#616E7C;\">Usage statistics and analysis – by collecting and anonymously reviewing the information, cookies help owners of websites to understand how users interact with their websites.</span></li><li><span style=\"color:#616E7C;\">Marketing – cookies are used to track visitors to websites. The goal is to show relevant ads that are of interest to an individual user.</span></li></ul><p><span style=\"color:#616E7C;\">We do not use cookies to collect personal information about users. However, some processed information can be considered personal data.</span></p><p><span style=\"color:#616E7C;\">We may share the information about how you use our site with our media, social, advertising and analysis partners.</span></p><p><span style=\"color:#616E7C;\">If you would like to limit cookies or block them on our website, you may do so by editing the settings of your web browser. However, then you will need to customize settings every time you visit the website, and there is a probability that some services and features might not work.</span></p><p><span style=\"color:#616E7C;\"><strong>7. Data security</strong></span></p><p><span style=\"color:#616E7C;\">Your visits to our website are protected by state-of-the-art encryption technology. The level of protection always depends on which encryption your Internet browser supports. You can tell whether an individual page of our website is encrypted by the key or closed lock symbol in the status bar of your browser. We also use appropriate technical and organizational security measures to protect your data against accidental or intentional manipulation, partial or complete loss, destruction, or against unauthorized access by third parties. Our security measures are continuously improved in line with technological developments.</span></p><p><span style=\"color:#616E7C;\"><strong>8. Your rights</strong></span></p><p><span style=\"color:#616E7C;\">You have the following rights under European Union law. If you wish to exercise any of the rights below, simply write to us at the above address.</span></p><ul><li><span style=\"color:#616E7C;\">Right to confirmation and right to information - we will be happy to confirm whether we process your personal data, what data it is and for what purpose it is processed.</span></li><li><span style=\"color:#616E7C;\">Right to rectification - if the data we store is incorrect, we will of course be happy to correct it.</span></li><li><span style=\"color:#616E7C;\">Right of erasure - if you want your personal data to be deleted, we will, as far as legally possible, comply with your request. If data must be kept for legal reasons, it will be blocked. The data is then no longer available for further use.</span></li><li><span style=\"color:#616E7C;\">Right to restriction of processing - should you wish to restrict use, we will, as far as legally possible, comply with your request.</span></li><li><span style=\"color:#616E7C;\">Right of revocation - if you wish to revoke any consents already given, we will pursue your request accordingly.</span></li><li><span style=\"color:#616E7C;\">Right to object - if your personal data are processed on the basis of legitimate interests pursuant to point (f) of Article 6(1) of the GDPR, you have the right to object to the processing of your personal data pursuant to Article 21 of the GDPR if there are reasons for doing so that result from your particular situation or are against direct marketing. In the latter case, you have a general right to object, which we will accept without a particular situation being stated. If you would like to exercise your right of revocation or objection, simply send an e-mail to&nbsp;[</span><span style=\"background-color:yellow;color:#616E7C;\">e-mail</span><span style=\"color:#616E7C;\">].</span></li></ul><p><span style=\"color:#616E7C;\">You also have the right to lodge a complaint to a supervisory authority about the processing of your personal data.</span></p><p><span style=\"color:#616E7C;\"><strong>10. Changes to this privacy policy</strong></span></p><p><span style=\"color:#616E7C;\">We reserve the right to modify this privacy policy.</span></p><p><span style=\"color:#616E7C;\">Last updated: [</span><span style=\"background-color:yellow;color:#616E7C;\">date</span><span style=\"color:#616E7C;\">]</span></p>'),(13,'<h1><span style=\"background-color:rgb(255,255,255);color:rgb(0,0,0);\"><strong>Customize your terminology toolkit</strong></span></h1><p><span style=\"background-color:rgb(255,255,255);color:rgb(0,0,0);\">One size does not fill all so we give you the flexibility to customize your terminology toolkit for your unique needs. You can insert custom HTML in your pages, customize term synchronization and tailor your toolkit to suit your individual needs. For more information contact our support team.&nbsp;&nbsp;</span></p><figure class=\"image image-style-align-left image_resized\" style=\"width:50%;\"><img src=\"/uploads/3_illustrations_842e5c0d2d.svg\"></figure>'),(14,'<h2><span class=\"text-small\" style=\"color:rgb(0,0,0);\"><strong>Reliable terminology ensured by Federated Network</strong></span><span style=\"color:rgb(0,0,0);\">&nbsp;</span></h2><p><span style=\"color:rgb(0,0,0);\">EuroTermBank is the central federated node, which accumulates all the individual, local and national nodes in one place providing current, correct, consistent terminological data. Organizations, institutions, SMEs and even individuals can create their own local federated nodes and link them to the central EuroTermBank, which in turn is linked to ELRC-SHARE. The individual nodes regularly synchronise terminology changes with the central TermBank. This way, terminology data can be effortlessly created, shared, managed and synchronized so everyone is always up to date and on the same page.</span></p><p><span style=\"color:rgb(0,0,0);\">&nbsp;</span></p><h2><span style=\"color:rgb(0,0,0);\"><strong>Terminology synchronization with the largest database</strong>&nbsp;</span></h2><p><a href=\"https://www.eurotermbank.com/\"><span style=\"color:rgb(5,99,193);\"><u>EuroTermBank</u></span></a><span style=\"color:rgb(0,0,0);\"> is the largest centralized online terminology database for European Union and Icelandic languages containing more than 1,500,000 terms. The EuroTermBank is interlinked with other national and EU terminology banks, thus it consolidates European terminology in one place, and enables easy terminology access and exchange for everyone.&nbsp;&nbsp;</span></p><p><span style=\"color:rgb(0,0,0);\">&nbsp;</span></p><p><span style=\"color:rgb(0,0,0);\">EuroTermBank Federated Network is one of a kind terminology network created by terminology experts from different European organizations. It has been development and maintained by language technology company </span><a href=\"https://www.tilde.com/\"><span style=\"color:rgb(5,99,193);\"><u>Tilde.</u></span></a><span style=\"color:rgb(0,0,0);\">&nbsp;&nbsp;</span></p><p><span style=\"color:rgb(0,0,0);\">&nbsp;</span></p><h2><span style=\"color:rgb(0,0,0);\"><strong>Project Partners</strong>&nbsp;</span></h2><p>&nbsp;</p><div class=\"raw-html-embed\"><div class=\"row no-gutters pt-5\" style=\"background-color: #fff;\"><a class=\"col-md-4 col-lg-2 mb-5 d-flex align-items-center justify-content-center right-border\" href=\"https://www.sis.se/\" target=\"_blank\" rel=\"noreferrer\"><img alt=\"institut@3x.png\" data-entity-type=\"file\" data-entity-uuid=\"f9b141e7-eee3-47bb-b387-80798017552f\" src=\"https://es-cms.eurotermbank.com//sites/default/files/inline-images/SIS_0.png\" width=\"120\"> </a> <a class=\"col-md-4 col-lg-2 mb-5 d-flex align-items-center justify-content-center right-border\" href=\"https://www.sprakochfolkminnen.se/\" target=\"_blank\" rel=\"noreferrer\"> <img alt=\"isof.png\" data-entity-type=\"\" data-entity-uuid=\"\" src=\"https://es-cms.eurotermbank.com//sites/default/files/inline-images/isof.png\" width=\"120\"> </a> <a class=\"col-md-4 col-lg-2 mb-5 d-flex align-items-center justify-content-center right-border\" href=\"http://www.lki.lt/\" target=\"_blank\" rel=\"noreferrer\"> <img alt=\"lietuvas.png\" data-entity-type=\"\" data-entity-uuid=\"\" src=\"https://es-cms.eurotermbank.com//sites/default/files/inline-images/lietuvas.png\" width=\"120\"> </a> <a class=\"col-md-4 col-lg-2 mb-5 d-flex align-items-center justify-content-center right-border\" href=\"http://www.tilde.com\" target=\"_blank\" rel=\"noreferrer\"> <img alt=\"tilde-logo.png\" data-entity-type=\"\" data-entity-uuid=\"\" src=\"https://es-cms.eurotermbank.com//sites/default/files/inline-images/tilde-logo.png\" width=\"80\"> </a> <a class=\"col-md-4 col-lg-2 mb-5 d-flex align-items-center justify-content-center right-border\" href=\"https://www.ku.dk/\" target=\"_blank\" rel=\"noreferrer\"> <img alt=\"ucph@2x.png\" data-entity-type=\"\" data-entity-uuid=\"\" src=\"https://es-cms.eurotermbank.com//sites/default/files/inline-images/ucph%402x.png\" width=\"120\"> </a> <a class=\"col-md-4 col-lg-2 mb-5 d-flex align-items-center justify-content-center\" href=\"https://www.termnet.org/\" target=\"_blank\" rel=\"noreferrer\"> <img alt=\"term-net-2.png\" data-entity-type=\"\" data-entity-uuid=\"\" src=\"https://es-cms.eurotermbank.com//sites/default/files/inline-images/term-net-2.png\" width=\"120\"> </a> <a class=\"col-md-6 col-lg-3 mb-1 d-flex align-items-center justify-content-center right-border\" href=\"https://www.eki.ee/\" target=\"_blank\" rel=\"noreferrer\"> <img alt=\"iel.png\" data-entity-type=\"\" data-entity-uuid=\"\" src=\"https://es-cms.eurotermbank.com//sites/default/files/inline-images/iel.png\" width=\"256\"> </a> <a class=\"col-md-6 col-lg-3 mb-2 d-flex align-items-center justify-content-center right-border\" href=\"https://www.ijs.si/\" target=\"_blank\" rel=\"noreferrer\"> <img alt=\"ijs.png\" data-entity-type=\"\" data-entity-uuid=\"\" src=\"https://es-cms.eurotermbank.com//sites/default/files/inline-images/ijs.png\" width=\"256\"> </a> <a class=\"col-md-6 col-lg-3 mb-5 d-flex align-items-center justify-content-center right-border\" href=\"http://www.arnastofnun.is/\" target=\"_blank\" rel=\"noreferrer\"> <img alt=\"institut.png\" data-entity-type=\"\" data-entity-uuid=\"\" src=\"https://es-cms.eurotermbank.com//sites/default/files/inline-images/institut.png\" width=\"192\"> </a> <a class=\"col-md-6 col-lg-3  mb-5 d-flex align-items-center justify-content-center\" href=\"https://www.kis.gov.lv/\" target=\"_blank\" rel=\"noreferrer\"> <img alt=\"KISC\" data-entity-type=\"\" data-entity-uuid=\"\" height=\"114\" src=\"https://es-cms.eurotermbank.com//sites/default/files/inline-images/KISC_logo.png\" width=\"138\"> </a></div></div><p>&nbsp;</p><figure class=\"image image-style-align-left image_resized\" style=\"width:50%;\"><img src=\"/uploads/CEF_logo_clear_bd0e3e4cb1.png\"></figure><p>Project eTranslation TermBank is co-financed<br>by the European Union\'s Connecting Europe Facility</p>');
/*!40000 ALTER TABLE `components_landing_sections` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `components_list_icon_lists`
--

DROP TABLE IF EXISTS `components_list_icon_lists`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `components_list_icon_lists` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `components_list_icon_lists`
--

LOCK TABLES `components_list_icon_lists` WRITE;
/*!40000 ALTER TABLE `components_list_icon_lists` DISABLE KEYS */;
INSERT INTO `components_list_icon_lists` VALUES (1);
/*!40000 ALTER TABLE `components_list_icon_lists` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `components_list_list_item_with_icons`
--

DROP TABLE IF EXISTS `components_list_list_item_with_icons`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `components_list_list_item_with_icons` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `Title` varchar(255) DEFAULT NULL,
  `Description` longtext,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=17 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `components_list_list_item_with_icons`
--

LOCK TABLES `components_list_list_item_with_icons` WRITE;
/*!40000 ALTER TABLE `components_list_list_item_with_icons` DISABLE KEYS */;
/*!40000 ALTER TABLE `components_list_list_item_with_icons` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `components_list_logo_list_items`
--

DROP TABLE IF EXISTS `components_list_logo_list_items`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `components_list_logo_list_items` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `Link` varchar(255) DEFAULT NULL,
  `Title` varchar(255) DEFAULT NULL,
  `Description` longtext,
  `Follow_up_link_text` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `components_list_logo_list_items`
--

LOCK TABLES `components_list_logo_list_items` WRITE;
/*!40000 ALTER TABLE `components_list_logo_list_items` DISABLE KEYS */;
/*!40000 ALTER TABLE `components_list_logo_list_items` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `components_list_logo_lists`
--

DROP TABLE IF EXISTS `components_list_logo_lists`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `components_list_logo_lists` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `components_list_logo_lists`
--

LOCK TABLES `components_list_logo_lists` WRITE;
/*!40000 ALTER TABLE `components_list_logo_lists` DISABLE KEYS */;
/*!40000 ALTER TABLE `components_list_logo_lists` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `components_list_logo_lists_components`
--

DROP TABLE IF EXISTS `components_list_logo_lists_components`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `components_list_logo_lists_components` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `field` varchar(255) NOT NULL,
  `order` int(10) unsigned NOT NULL,
  `component_type` varchar(255) NOT NULL,
  `component_id` int(11) NOT NULL,
  `components_list_logo_list_id` int(10) unsigned NOT NULL,
  PRIMARY KEY (`id`),
  KEY `components_list_logo_list_id_fk` (`components_list_logo_list_id`),
  CONSTRAINT `components_list_logo_list_id_fk` FOREIGN KEY (`components_list_logo_list_id`) REFERENCES `components_list_logo_lists` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `components_list_logo_lists_components`
--

LOCK TABLES `components_list_logo_lists_components` WRITE;
/*!40000 ALTER TABLE `components_list_logo_lists_components` DISABLE KEYS */;
/*!40000 ALTER TABLE `components_list_logo_lists_components` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `components_list_pricing_lists`
--

DROP TABLE IF EXISTS `components_list_pricing_lists`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `components_list_pricing_lists` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `price` varchar(255) DEFAULT NULL,
  `currency` varchar(255) DEFAULT NULL,
  `unit` varchar(255) DEFAULT NULL,
  `description` varchar(255) DEFAULT NULL,
  `Starting_from` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `components_list_pricing_lists`
--

LOCK TABLES `components_list_pricing_lists` WRITE;
/*!40000 ALTER TABLE `components_list_pricing_lists` DISABLE KEYS */;
/*!40000 ALTER TABLE `components_list_pricing_lists` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `components_list_pricing_lists_components`
--

DROP TABLE IF EXISTS `components_list_pricing_lists_components`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `components_list_pricing_lists_components` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `field` varchar(255) NOT NULL,
  `order` int(10) unsigned NOT NULL,
  `component_type` varchar(255) NOT NULL,
  `component_id` int(11) NOT NULL,
  `components_list_pricing_list_id` int(10) unsigned NOT NULL,
  PRIMARY KEY (`id`),
  KEY `components_list_pricing_list_id_fk` (`components_list_pricing_list_id`),
  CONSTRAINT `components_list_pricing_list_id_fk` FOREIGN KEY (`components_list_pricing_list_id`) REFERENCES `components_list_pricing_lists` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `components_list_pricing_lists_components`
--

LOCK TABLES `components_list_pricing_lists_components` WRITE;
/*!40000 ALTER TABLE `components_list_pricing_lists_components` DISABLE KEYS */;
/*!40000 ALTER TABLE `components_list_pricing_lists_components` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `components_menu_dropdowns`
--

DROP TABLE IF EXISTS `components_menu_dropdowns`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `components_menu_dropdowns` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `Label` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `components_menu_dropdowns`
--

LOCK TABLES `components_menu_dropdowns` WRITE;
/*!40000 ALTER TABLE `components_menu_dropdowns` DISABLE KEYS */;
/*!40000 ALTER TABLE `components_menu_dropdowns` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `components_menu_dropdowns__menu_dropdowns`
--

DROP TABLE IF EXISTS `components_menu_dropdowns__menu_dropdowns`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `components_menu_dropdowns__menu_dropdowns` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `components_menu_dropdown_id` int(11) DEFAULT NULL,
  `menu-dropdown_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `components_menu_dropdowns__menu_dropdowns`
--

LOCK TABLES `components_menu_dropdowns__menu_dropdowns` WRITE;
/*!40000 ALTER TABLE `components_menu_dropdowns__menu_dropdowns` DISABLE KEYS */;
/*!40000 ALTER TABLE `components_menu_dropdowns__menu_dropdowns` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `components_menu_links`
--

DROP TABLE IF EXISTS `components_menu_links`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `components_menu_links` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `Label` varchar(255) DEFAULT NULL,
  `url` varchar(255) DEFAULT NULL,
  `Type` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `components_menu_links`
--

LOCK TABLES `components_menu_links` WRITE;
/*!40000 ALTER TABLE `components_menu_links` DISABLE KEYS */;
INSERT INTO `components_menu_links` VALUES (1,'My collections','/collections','angular'),(2,'Subscription','/get-subscription','angular'),(3,'Search','/search','angular'),(5,'SDL Trados','/pages/7','angular'),(6,'Tilde MT','/pages/8','angular');
/*!40000 ALTER TABLE `components_menu_links` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `components_meta_languages`
--

DROP TABLE IF EXISTS `components_meta_languages`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `components_meta_languages` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `Language` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `components_meta_languages`
--

LOCK TABLES `components_meta_languages` WRITE;
/*!40000 ALTER TABLE `components_meta_languages` DISABLE KEYS */;
INSERT INTO `components_meta_languages` VALUES (2,'EN'),(5,'EN');
/*!40000 ALTER TABLE `components_meta_languages` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `components_sections_body_html_fragments`
--

DROP TABLE IF EXISTS `components_sections_body_html_fragments`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `components_sections_body_html_fragments` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `Html` longtext,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `components_sections_body_html_fragments`
--

LOCK TABLES `components_sections_body_html_fragments` WRITE;
/*!40000 ALTER TABLE `components_sections_body_html_fragments` DISABLE KEYS */;
/*!40000 ALTER TABLE `components_sections_body_html_fragments` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `components_sections_button_lists`
--

DROP TABLE IF EXISTS `components_sections_button_lists`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `components_sections_button_lists` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `Title` varchar(255) DEFAULT NULL,
  `Button_one_title` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `components_sections_button_lists`
--

LOCK TABLES `components_sections_button_lists` WRITE;
/*!40000 ALTER TABLE `components_sections_button_lists` DISABLE KEYS */;
/*!40000 ALTER TABLE `components_sections_button_lists` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `components_sections_contacts`
--

DROP TABLE IF EXISTS `components_sections_contacts`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `components_sections_contacts` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `Body_1` longtext,
  `Body_2` longtext,
  `Background` varchar(255) DEFAULT NULL,
  `Email_placeholder` varchar(255) DEFAULT NULL,
  `Button_text` varchar(255) DEFAULT NULL,
  `Show_contact_form` tinyint(1) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `components_sections_contacts`
--

LOCK TABLES `components_sections_contacts` WRITE;
/*!40000 ALTER TABLE `components_sections_contacts` DISABLE KEYS */;
/*!40000 ALTER TABLE `components_sections_contacts` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `components_sections_feature_lists`
--

DROP TABLE IF EXISTS `components_sections_feature_lists`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `components_sections_feature_lists` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `Title` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `components_sections_feature_lists`
--

LOCK TABLES `components_sections_feature_lists` WRITE;
/*!40000 ALTER TABLE `components_sections_feature_lists` DISABLE KEYS */;
/*!40000 ALTER TABLE `components_sections_feature_lists` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `components_sections_feature_lists_components`
--

DROP TABLE IF EXISTS `components_sections_feature_lists_components`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `components_sections_feature_lists_components` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `field` varchar(255) NOT NULL,
  `order` int(10) unsigned NOT NULL,
  `component_type` varchar(255) NOT NULL,
  `component_id` int(11) NOT NULL,
  `components_sections_feature_list_id` int(10) unsigned NOT NULL,
  PRIMARY KEY (`id`),
  KEY `components_sections_feature_list_id_fk` (`components_sections_feature_list_id`),
  CONSTRAINT `components_sections_feature_list_id_fk` FOREIGN KEY (`components_sections_feature_list_id`) REFERENCES `components_sections_feature_lists` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `components_sections_feature_lists_components`
--

LOCK TABLES `components_sections_feature_lists_components` WRITE;
/*!40000 ALTER TABLE `components_sections_feature_lists_components` DISABLE KEYS */;
/*!40000 ALTER TABLE `components_sections_feature_lists_components` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `components_sections_heroes`
--

DROP TABLE IF EXISTS `components_sections_heroes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `components_sections_heroes` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `Title` varchar(255) DEFAULT NULL,
  `Description` longtext,
  `Search` tinyint(1) DEFAULT NULL,
  `Email_label` varchar(255) DEFAULT NULL,
  `Button_text` varchar(255) DEFAULT NULL,
  `Show_search_widget` tinyint(1) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `components_sections_heroes`
--

LOCK TABLES `components_sections_heroes` WRITE;
/*!40000 ALTER TABLE `components_sections_heroes` DISABLE KEYS */;
INSERT INTO `components_sections_heroes` VALUES (2,'Managing terminology the right way','No more private, offline terminology data sheets that everyone gets lost in. Cloud-based terminology toolkit allows you to search, manage and share your terms with your team and partners all over the world. Locally deployed individual nodes are linked to central EuroTermBank so you can always stay synchronized with the largest terminology network in Europe.\n\n ',NULL,'Your email address','Start here',1);
/*!40000 ALTER TABLE `components_sections_heroes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `components_sections_integrations`
--

DROP TABLE IF EXISTS `components_sections_integrations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `components_sections_integrations` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `Title` varchar(255) DEFAULT NULL,
  `Description` longtext,
  `LinkTitle` varchar(255) DEFAULT NULL,
  `LinkAddress` varchar(255) DEFAULT NULL,
  `Category` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `components_sections_integrations`
--

LOCK TABLES `components_sections_integrations` WRITE;
/*!40000 ALTER TABLE `components_sections_integrations` DISABLE KEYS */;
/*!40000 ALTER TABLE `components_sections_integrations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `components_sections_integrations_components`
--

DROP TABLE IF EXISTS `components_sections_integrations_components`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `components_sections_integrations_components` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `field` varchar(255) NOT NULL,
  `order` int(10) unsigned NOT NULL,
  `component_type` varchar(255) NOT NULL,
  `component_id` int(11) NOT NULL,
  `components_sections_integration_id` int(10) unsigned NOT NULL,
  PRIMARY KEY (`id`),
  KEY `components_sections_integration_id_fk` (`components_sections_integration_id`),
  CONSTRAINT `components_sections_integration_id_fk` FOREIGN KEY (`components_sections_integration_id`) REFERENCES `components_sections_integrations` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `components_sections_integrations_components`
--

LOCK TABLES `components_sections_integrations_components` WRITE;
/*!40000 ALTER TABLE `components_sections_integrations_components` DISABLE KEYS */;
/*!40000 ALTER TABLE `components_sections_integrations_components` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `components_sections_news`
--

DROP TABLE IF EXISTS `components_sections_news`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `components_sections_news` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `components_sections_news`
--

LOCK TABLES `components_sections_news` WRITE;
/*!40000 ALTER TABLE `components_sections_news` DISABLE KEYS */;
/*!40000 ALTER TABLE `components_sections_news` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `components_sections_news__articles`
--

DROP TABLE IF EXISTS `components_sections_news__articles`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `components_sections_news__articles` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `components_sections_new_id` int(11) DEFAULT NULL,
  `article_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `components_sections_news__articles`
--

LOCK TABLES `components_sections_news__articles` WRITE;
/*!40000 ALTER TABLE `components_sections_news__articles` DISABLE KEYS */;
/*!40000 ALTER TABLE `components_sections_news__articles` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `components_sections_picture_and_texts`
--

DROP TABLE IF EXISTS `components_sections_picture_and_texts`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `components_sections_picture_and_texts` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `Body` longtext,
  `Image_title` varchar(255) DEFAULT NULL,
  `Image_left_side` tinyint(1) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `components_sections_picture_and_texts`
--

LOCK TABLES `components_sections_picture_and_texts` WRITE;
/*!40000 ALTER TABLE `components_sections_picture_and_texts` DISABLE KEYS */;
/*!40000 ALTER TABLE `components_sections_picture_and_texts` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `components_sections_sdl_downloads`
--

DROP TABLE IF EXISTS `components_sections_sdl_downloads`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `components_sections_sdl_downloads` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `Body` longtext,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `components_sections_sdl_downloads`
--

LOCK TABLES `components_sections_sdl_downloads` WRITE;
/*!40000 ALTER TABLE `components_sections_sdl_downloads` DISABLE KEYS */;
/*!40000 ALTER TABLE `components_sections_sdl_downloads` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `components_sections_showcases`
--

DROP TABLE IF EXISTS `components_sections_showcases`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `components_sections_showcases` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `Title` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `components_sections_showcases`
--

LOCK TABLES `components_sections_showcases` WRITE;
/*!40000 ALTER TABLE `components_sections_showcases` DISABLE KEYS */;
/*!40000 ALTER TABLE `components_sections_showcases` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `components_sections_showcases__showcases`
--

DROP TABLE IF EXISTS `components_sections_showcases__showcases`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `components_sections_showcases__showcases` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `components_sections_showcase_id` int(11) DEFAULT NULL,
  `showcase_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `components_sections_showcases__showcases`
--

LOCK TABLES `components_sections_showcases__showcases` WRITE;
/*!40000 ALTER TABLE `components_sections_showcases__showcases` DISABLE KEYS */;
/*!40000 ALTER TABLE `components_sections_showcases__showcases` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `components_sections_two_column_with_pictures`
--

DROP TABLE IF EXISTS `components_sections_two_column_with_pictures`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `components_sections_two_column_with_pictures` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `Title` varchar(255) DEFAULT NULL,
  `Description` longtext,
  `Grey` tinyint(1) DEFAULT NULL,
  `Left` tinyint(1) DEFAULT NULL,
  `Category` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `components_sections_two_column_with_pictures`
--

LOCK TABLES `components_sections_two_column_with_pictures` WRITE;
/*!40000 ALTER TABLE `components_sections_two_column_with_pictures` DISABLE KEYS */;
/*!40000 ALTER TABLE `components_sections_two_column_with_pictures` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `components_sections_two_column_with_pictures_components`
--

DROP TABLE IF EXISTS `components_sections_two_column_with_pictures_components`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `components_sections_two_column_with_pictures_components` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `field` varchar(255) NOT NULL,
  `order` int(10) unsigned NOT NULL,
  `component_type` varchar(255) NOT NULL,
  `component_id` int(11) NOT NULL,
  `components_sections_two_column_with_picture_id` int(10) unsigned NOT NULL,
  PRIMARY KEY (`id`),
  KEY `components_sections_two_column_with_picture_id_fk` (`components_sections_two_column_with_picture_id`),
  CONSTRAINT `components_sections_two_column_with_picture_id_fk` FOREIGN KEY (`components_sections_two_column_with_picture_id`) REFERENCES `components_sections_two_column_with_pictures` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `components_sections_two_column_with_pictures_components`
--

LOCK TABLES `components_sections_two_column_with_pictures_components` WRITE;
/*!40000 ALTER TABLE `components_sections_two_column_with_pictures_components` DISABLE KEYS */;
/*!40000 ALTER TABLE `components_sections_two_column_with_pictures_components` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `components_sections_two_columns`
--

DROP TABLE IF EXISTS `components_sections_two_columns`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `components_sections_two_columns` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `iframe` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `components_sections_two_columns`
--

LOCK TABLES `components_sections_two_columns` WRITE;
/*!40000 ALTER TABLE `components_sections_two_columns` DISABLE KEYS */;
/*!40000 ALTER TABLE `components_sections_two_columns` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `components_sections_two_columns_components`
--

DROP TABLE IF EXISTS `components_sections_two_columns_components`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `components_sections_two_columns_components` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `field` varchar(255) NOT NULL,
  `order` int(10) unsigned NOT NULL,
  `component_type` varchar(255) NOT NULL,
  `component_id` int(11) NOT NULL,
  `components_sections_two_column_id` int(10) unsigned NOT NULL,
  PRIMARY KEY (`id`),
  KEY `components_sections_two_column_id_fk` (`components_sections_two_column_id`),
  CONSTRAINT `components_sections_two_column_id_fk` FOREIGN KEY (`components_sections_two_column_id`) REFERENCES `components_sections_two_columns` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `components_sections_two_columns_components`
--

LOCK TABLES `components_sections_two_columns_components` WRITE;
/*!40000 ALTER TABLE `components_sections_two_columns_components` DISABLE KEYS */;
/*!40000 ALTER TABLE `components_sections_two_columns_components` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `core_store`
--

DROP TABLE IF EXISTS `core_store`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `core_store` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `key` varchar(255) DEFAULT NULL,
  `value` longtext,
  `type` varchar(255) DEFAULT NULL,
  `environment` varchar(255) DEFAULT NULL,
  `tag` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=152 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `core_store`
--

LOCK TABLES `core_store` WRITE;
/*!40000 ALTER TABLE `core_store` DISABLE KEYS */;
INSERT INTO `core_store` VALUES (1,'db_model_core_store','{\"key\":{\"type\":\"string\"},\"value\":{\"type\":\"text\"},\"type\":{\"type\":\"string\"},\"environment\":{\"type\":\"string\"},\"tag\":{\"type\":\"string\"}}','object',NULL,NULL),(2,'db_model_components_landing_sections','{\"HtmlBlock\":{\"type\":\"richtext\",\"default\":\"<section></section>\",\"required\":true}}','object',NULL,NULL),(3,'db_model_landing_pages','{\"Language\":{\"type\":\"component\",\"repeatable\":false,\"component\":\"meta.language\"},\"Slug\":{\"type\":\"string\"},\"Body\":{\"type\":\"dynamiczone\",\"components\":[\"sections.body-html-fragment\",\"sections.section\",\"sections.two-column-with-picture\",\"sections.hero\",\"sections.contact\",\"sections.feature-list\",\"sections.integrations\",\"sections.showcase\"]},\"created_by\":{\"model\":\"user\",\"plugin\":\"admin\"},\"updated_by\":{\"model\":\"user\",\"plugin\":\"admin\"},\"created_at\":{\"type\":\"currentTimestamp\"},\"updated_at\":{\"type\":\"currentTimestamp\"}}','object',NULL,NULL),(4,'db_model_tytyties','{\"rrr\":{\"type\":\"richtext\"},\"created_by\":{\"model\":\"user\",\"plugin\":\"admin\"},\"updated_by\":{\"model\":\"user\",\"plugin\":\"admin\"},\"created_at\":{\"type\":\"currentTimestamp\"},\"updated_at\":{\"type\":\"currentTimestamp\"}}','object',NULL,NULL),(5,'db_model_strapi_permission','{\"action\":{\"type\":\"string\",\"minLength\":1,\"configurable\":false,\"required\":true},\"subject\":{\"type\":\"string\",\"minLength\":1,\"configurable\":false,\"required\":false},\"fields\":{\"type\":\"json\",\"configurable\":false,\"required\":false,\"default\":[]},\"conditions\":{\"type\":\"json\",\"configurable\":false,\"required\":false,\"default\":[]},\"role\":{\"configurable\":false,\"model\":\"role\",\"plugin\":\"admin\"},\"created_at\":{\"type\":\"currentTimestamp\"},\"updated_at\":{\"type\":\"currentTimestamp\"}}','object',NULL,NULL),(6,'db_model_strapi_webhooks','{\"name\":{\"type\":\"string\"},\"url\":{\"type\":\"text\"},\"headers\":{\"type\":\"json\"},\"events\":{\"type\":\"json\"},\"enabled\":{\"type\":\"boolean\"}}','object',NULL,NULL),(7,'db_model_upload_file','{\"name\":{\"type\":\"string\",\"configurable\":false,\"required\":true},\"alternativeText\":{\"type\":\"string\",\"configurable\":false},\"caption\":{\"type\":\"string\",\"configurable\":false},\"width\":{\"type\":\"integer\",\"configurable\":false},\"height\":{\"type\":\"integer\",\"configurable\":false},\"formats\":{\"type\":\"json\",\"configurable\":false},\"hash\":{\"type\":\"string\",\"configurable\":false,\"required\":true},\"ext\":{\"type\":\"string\",\"configurable\":false},\"mime\":{\"type\":\"string\",\"configurable\":false,\"required\":true},\"size\":{\"type\":\"decimal\",\"configurable\":false,\"required\":true},\"url\":{\"type\":\"string\",\"configurable\":false,\"required\":true},\"previewUrl\":{\"type\":\"string\",\"configurable\":false},\"provider\":{\"type\":\"string\",\"configurable\":false,\"required\":true},\"provider_metadata\":{\"type\":\"json\",\"configurable\":false},\"related\":{\"collection\":\"*\",\"filter\":\"field\",\"configurable\":false},\"created_by\":{\"model\":\"user\",\"plugin\":\"admin\"},\"updated_by\":{\"model\":\"user\",\"plugin\":\"admin\"},\"created_at\":{\"type\":\"currentTimestamp\"},\"updated_at\":{\"type\":\"currentTimestamp\"}}','object',NULL,NULL),(8,'db_model_components_sections_body_html_fragments','{}','object',NULL,NULL),(9,'db_model_users-permissions_permission','{\"type\":{\"type\":\"string\",\"required\":true,\"configurable\":false},\"controller\":{\"type\":\"string\",\"required\":true,\"configurable\":false},\"action\":{\"type\":\"string\",\"required\":true,\"configurable\":false},\"enabled\":{\"type\":\"boolean\",\"required\":true,\"configurable\":false},\"policy\":{\"type\":\"string\",\"configurable\":false},\"role\":{\"model\":\"role\",\"via\":\"permissions\",\"plugin\":\"users-permissions\",\"configurable\":false},\"created_by\":{\"model\":\"user\",\"plugin\":\"admin\"},\"updated_by\":{\"model\":\"user\",\"plugin\":\"admin\"}}','object',NULL,NULL),(10,'db_model_users-permissions_user','{\"username\":{\"type\":\"string\",\"minLength\":3,\"unique\":true,\"configurable\":false,\"required\":true},\"email\":{\"type\":\"email\",\"minLength\":6,\"configurable\":false,\"required\":true},\"provider\":{\"type\":\"string\",\"configurable\":false},\"password\":{\"type\":\"password\",\"minLength\":6,\"configurable\":false,\"private\":true},\"resetPasswordToken\":{\"type\":\"string\",\"configurable\":false,\"private\":true},\"confirmed\":{\"type\":\"boolean\",\"default\":false,\"configurable\":false},\"blocked\":{\"type\":\"boolean\",\"default\":false,\"configurable\":false},\"role\":{\"model\":\"role\",\"via\":\"users\",\"plugin\":\"users-permissions\",\"configurable\":false},\"created_by\":{\"model\":\"user\",\"plugin\":\"admin\"},\"updated_by\":{\"model\":\"user\",\"plugin\":\"admin\"},\"created_at\":{\"type\":\"currentTimestamp\"},\"updated_at\":{\"type\":\"currentTimestamp\"}}','object',NULL,NULL),(11,'db_model_upload_file_morph','{\"upload_file_id\":{\"type\":\"integer\"},\"related_id\":{\"type\":\"integer\"},\"related_type\":{\"type\":\"text\"},\"field\":{\"type\":\"text\"},\"order\":{\"type\":\"integer\"}}','object',NULL,NULL),(12,'db_model_strapi_administrator','{\"firstname\":{\"type\":\"string\",\"unique\":false,\"minLength\":1,\"configurable\":false,\"required\":false},\"lastname\":{\"type\":\"string\",\"unique\":false,\"minLength\":1,\"configurable\":false,\"required\":false},\"username\":{\"type\":\"string\",\"unique\":false,\"configurable\":false,\"required\":false},\"email\":{\"type\":\"email\",\"minLength\":6,\"configurable\":false,\"required\":true,\"unique\":true,\"private\":true},\"password\":{\"type\":\"password\",\"minLength\":6,\"configurable\":false,\"required\":false,\"private\":true},\"resetPasswordToken\":{\"type\":\"string\",\"configurable\":false,\"private\":true},\"registrationToken\":{\"type\":\"string\",\"configurable\":false,\"private\":true},\"isActive\":{\"type\":\"boolean\",\"default\":false,\"configurable\":false,\"private\":true},\"roles\":{\"collection\":\"role\",\"collectionName\":\"strapi_users_roles\",\"via\":\"users\",\"dominant\":true,\"plugin\":\"admin\",\"configurable\":false,\"private\":true,\"attribute\":\"role\",\"column\":\"id\",\"isVirtual\":true},\"blocked\":{\"type\":\"boolean\",\"default\":false,\"configurable\":false,\"private\":true}}','object',NULL,NULL),(13,'db_model_users-permissions_role','{\"name\":{\"type\":\"string\",\"minLength\":3,\"required\":true,\"configurable\":false},\"description\":{\"type\":\"string\",\"configurable\":false},\"type\":{\"type\":\"string\",\"unique\":true,\"configurable\":false},\"permissions\":{\"collection\":\"permission\",\"via\":\"role\",\"plugin\":\"users-permissions\",\"configurable\":false,\"isVirtual\":true},\"users\":{\"collection\":\"user\",\"via\":\"role\",\"configurable\":false,\"plugin\":\"users-permissions\",\"isVirtual\":true},\"created_by\":{\"model\":\"user\",\"plugin\":\"admin\"},\"updated_by\":{\"model\":\"user\",\"plugin\":\"admin\"}}','object',NULL,NULL),(14,'db_model_strapi_role','{\"name\":{\"type\":\"string\",\"minLength\":1,\"unique\":true,\"configurable\":false,\"required\":true},\"code\":{\"type\":\"string\",\"minLength\":1,\"unique\":true,\"configurable\":false,\"required\":true},\"description\":{\"type\":\"string\",\"configurable\":false},\"users\":{\"configurable\":false,\"collection\":\"user\",\"via\":\"roles\",\"plugin\":\"admin\",\"attribute\":\"user\",\"column\":\"id\",\"isVirtual\":true},\"permissions\":{\"configurable\":false,\"plugin\":\"admin\",\"collection\":\"permission\",\"via\":\"role\",\"isVirtual\":true},\"created_at\":{\"type\":\"currentTimestamp\"},\"updated_at\":{\"type\":\"currentTimestamp\"}}','object',NULL,NULL),(15,'db_model_strapi_users_roles','{\"user_id\":{\"type\":\"integer\"},\"role_id\":{\"type\":\"integer\"}}','object',NULL,NULL),(16,'plugin_upload_settings','{\"sizeOptimization\":true,\"responsiveDimensions\":true}','object','production',''),(17,'plugin_users-permissions_grant','{\"email\":{\"enabled\":true,\"icon\":\"envelope\"},\"discord\":{\"enabled\":false,\"icon\":\"discord\",\"key\":\"\",\"secret\":\"\",\"callback\":\"/auth/discord/callback\",\"scope\":[\"identify\",\"email\"]},\"facebook\":{\"enabled\":false,\"icon\":\"facebook-square\",\"key\":\"\",\"secret\":\"\",\"callback\":\"/auth/facebook/callback\",\"scope\":[\"email\"]},\"google\":{\"enabled\":false,\"icon\":\"google\",\"key\":\"\",\"secret\":\"\",\"callback\":\"/auth/google/callback\",\"scope\":[\"email\"]},\"github\":{\"enabled\":false,\"icon\":\"github\",\"key\":\"\",\"secret\":\"\",\"callback\":\"/auth/github/callback\",\"scope\":[\"user\",\"user:email\"]},\"microsoft\":{\"enabled\":false,\"icon\":\"windows\",\"key\":\"\",\"secret\":\"\",\"callback\":\"/auth/microsoft/callback\",\"scope\":[\"user.read\"]},\"twitter\":{\"enabled\":false,\"icon\":\"twitter\",\"key\":\"\",\"secret\":\"\",\"callback\":\"/auth/twitter/callback\"},\"instagram\":{\"enabled\":false,\"icon\":\"instagram\",\"key\":\"\",\"secret\":\"\",\"callback\":\"/auth/instagram/callback\",\"scope\":[\"user_profile\"]},\"vk\":{\"enabled\":false,\"icon\":\"vk\",\"key\":\"\",\"secret\":\"\",\"callback\":\"/auth/vk/callback\",\"scope\":[\"email\"]},\"twitch\":{\"enabled\":false,\"icon\":\"twitch\",\"key\":\"\",\"secret\":\"\",\"callback\":\"/auth/twitch/callback\",\"scope\":[\"user:read:email\"]},\"linkedin\":{\"enabled\":false,\"icon\":\"linkedin\",\"key\":\"\",\"secret\":\"\",\"callback\":\"/auth/linkedin/callback\",\"scope\":[\"r_liteprofile\",\"r_emailaddress\"]},\"cognito\":{\"enabled\":false,\"icon\":\"aws\",\"key\":\"\",\"secret\":\"\",\"subdomain\":\"my.subdomain.com\",\"callback\":\"/auth/cognito/callback\",\"scope\":[\"email\",\"openid\",\"profile\"]},\"reddit\":{\"enabled\":false,\"icon\":\"reddit\",\"key\":\"\",\"secret\":\"\",\"state\":true,\"callback\":\"/auth/reddit/callback\",\"scope\":[\"identity\"]},\"auth0\":{\"enabled\":false,\"icon\":\"\",\"key\":\"\",\"secret\":\"\",\"subdomain\":\"my-tenant.eu\",\"callback\":\"/auth/auth0/callback\",\"scope\":[\"openid\",\"email\",\"profile\"]},\"cas\":{\"enabled\":false,\"icon\":\"book\",\"key\":\"\",\"secret\":\"\",\"callback\":\"/auth/cas/callback\",\"scope\":[\"openid email\"],\"subdomain\":\"my.subdomain.com/cas\"}}','object','',''),(19,'plugin_content_manager_configuration_content_types::application::landing-page.landing-page','{\"uid\":\"application::landing-page.landing-page\",\"settings\":{\"bulkable\":true,\"filterable\":true,\"searchable\":true,\"pageSize\":10,\"mainField\":\"Slug\",\"defaultSortBy\":\"Slug\",\"defaultSortOrder\":\"ASC\"},\"metadatas\":{\"id\":{\"edit\":{},\"list\":{\"label\":\"Id\",\"searchable\":true,\"sortable\":true}},\"Slug\":{\"edit\":{\"label\":\"Slug\",\"description\":\"\",\"placeholder\":\"\",\"visible\":true,\"editable\":true},\"list\":{\"label\":\"Slug\",\"searchable\":true,\"sortable\":true}},\"Body\":{\"edit\":{\"label\":\"Body\",\"description\":\"\",\"placeholder\":\"\",\"visible\":true,\"editable\":true},\"list\":{\"label\":\"Body\",\"searchable\":false,\"sortable\":false}},\"News\":{\"edit\":{\"label\":\"News\",\"description\":\"\",\"placeholder\":\"\",\"visible\":true,\"editable\":true},\"list\":{\"label\":\"News\",\"searchable\":true,\"sortable\":true}},\"created_at\":{\"edit\":{\"label\":\"Created_at\",\"description\":\"\",\"placeholder\":\"\",\"visible\":false,\"editable\":true},\"list\":{\"label\":\"Created_at\",\"searchable\":true,\"sortable\":true}},\"updated_at\":{\"edit\":{\"label\":\"Updated_at\",\"description\":\"\",\"placeholder\":\"\",\"visible\":false,\"editable\":true},\"list\":{\"label\":\"Updated_at\",\"searchable\":true,\"sortable\":true}}},\"layouts\":{\"list\":[\"id\",\"Slug\",\"News\"],\"edit\":[[{\"name\":\"Slug\",\"size\":6}],[{\"name\":\"Body\",\"size\":12}],[{\"name\":\"News\",\"size\":4}]],\"editRelations\":[]}}','object','',''),(20,'plugin_content_manager_configuration_content_types::strapi::permission','{\"uid\":\"strapi::permission\",\"settings\":{\"bulkable\":true,\"filterable\":true,\"searchable\":true,\"pageSize\":10,\"mainField\":\"action\",\"defaultSortBy\":\"action\",\"defaultSortOrder\":\"ASC\"},\"metadatas\":{\"id\":{\"edit\":{},\"list\":{\"label\":\"Id\",\"searchable\":true,\"sortable\":true}},\"action\":{\"edit\":{\"label\":\"Action\",\"description\":\"\",\"placeholder\":\"\",\"visible\":true,\"editable\":true},\"list\":{\"label\":\"Action\",\"searchable\":true,\"sortable\":true}},\"subject\":{\"edit\":{\"label\":\"Subject\",\"description\":\"\",\"placeholder\":\"\",\"visible\":true,\"editable\":true},\"list\":{\"label\":\"Subject\",\"searchable\":true,\"sortable\":true}},\"properties\":{\"edit\":{\"label\":\"Properties\",\"description\":\"\",\"placeholder\":\"\",\"visible\":true,\"editable\":true},\"list\":{\"label\":\"Properties\",\"searchable\":false,\"sortable\":false}},\"conditions\":{\"edit\":{\"label\":\"Conditions\",\"description\":\"\",\"placeholder\":\"\",\"visible\":true,\"editable\":true},\"list\":{\"label\":\"Conditions\",\"searchable\":false,\"sortable\":false}},\"role\":{\"edit\":{\"label\":\"Role\",\"description\":\"\",\"placeholder\":\"\",\"visible\":true,\"editable\":true,\"mainField\":\"name\"},\"list\":{\"label\":\"Role\",\"searchable\":false,\"sortable\":false}},\"created_at\":{\"edit\":{\"label\":\"Created_at\",\"description\":\"\",\"placeholder\":\"\",\"visible\":false,\"editable\":true},\"list\":{\"label\":\"Created_at\",\"searchable\":true,\"sortable\":true}},\"updated_at\":{\"edit\":{\"label\":\"Updated_at\",\"description\":\"\",\"placeholder\":\"\",\"visible\":false,\"editable\":true},\"list\":{\"label\":\"Updated_at\",\"searchable\":true,\"sortable\":true}}},\"layouts\":{\"list\":[\"id\",\"action\",\"subject\",\"created_at\"],\"edit\":[[{\"name\":\"action\",\"size\":6},{\"name\":\"subject\",\"size\":6}],[{\"name\":\"conditions\",\"size\":12}],[{\"name\":\"properties\",\"size\":12}]],\"editRelations\":[\"role\"]}}','object','',''),(21,'plugin_content_manager_configuration_content_types::strapi::user','{\"uid\":\"strapi::user\",\"settings\":{\"bulkable\":true,\"filterable\":true,\"searchable\":true,\"pageSize\":10,\"mainField\":\"firstname\",\"defaultSortBy\":\"firstname\",\"defaultSortOrder\":\"ASC\"},\"metadatas\":{\"id\":{\"edit\":{},\"list\":{\"label\":\"Id\",\"searchable\":true,\"sortable\":true}},\"firstname\":{\"edit\":{\"label\":\"Firstname\",\"description\":\"\",\"placeholder\":\"\",\"visible\":true,\"editable\":true},\"list\":{\"label\":\"Firstname\",\"searchable\":true,\"sortable\":true}},\"lastname\":{\"edit\":{\"label\":\"Lastname\",\"description\":\"\",\"placeholder\":\"\",\"visible\":true,\"editable\":true},\"list\":{\"label\":\"Lastname\",\"searchable\":true,\"sortable\":true}},\"username\":{\"edit\":{\"label\":\"Username\",\"description\":\"\",\"placeholder\":\"\",\"visible\":true,\"editable\":true},\"list\":{\"label\":\"Username\",\"searchable\":true,\"sortable\":true}},\"email\":{\"edit\":{\"label\":\"Email\",\"description\":\"\",\"placeholder\":\"\",\"visible\":true,\"editable\":true},\"list\":{\"label\":\"Email\",\"searchable\":true,\"sortable\":true}},\"password\":{\"edit\":{\"label\":\"Password\",\"description\":\"\",\"placeholder\":\"\",\"visible\":true,\"editable\":true},\"list\":{\"label\":\"Password\",\"searchable\":true,\"sortable\":true}},\"resetPasswordToken\":{\"edit\":{\"label\":\"ResetPasswordToken\",\"description\":\"\",\"placeholder\":\"\",\"visible\":true,\"editable\":true},\"list\":{\"label\":\"ResetPasswordToken\",\"searchable\":true,\"sortable\":true}},\"registrationToken\":{\"edit\":{\"label\":\"RegistrationToken\",\"description\":\"\",\"placeholder\":\"\",\"visible\":true,\"editable\":true},\"list\":{\"label\":\"RegistrationToken\",\"searchable\":true,\"sortable\":true}},\"isActive\":{\"edit\":{\"label\":\"IsActive\",\"description\":\"\",\"placeholder\":\"\",\"visible\":true,\"editable\":true},\"list\":{\"label\":\"IsActive\",\"searchable\":true,\"sortable\":true}},\"roles\":{\"edit\":{\"label\":\"Roles\",\"description\":\"\",\"placeholder\":\"\",\"visible\":true,\"editable\":true,\"mainField\":\"name\"},\"list\":{\"label\":\"Roles\",\"searchable\":false,\"sortable\":false}},\"blocked\":{\"edit\":{\"label\":\"Blocked\",\"description\":\"\",\"placeholder\":\"\",\"visible\":true,\"editable\":true},\"list\":{\"label\":\"Blocked\",\"searchable\":true,\"sortable\":true}},\"preferedLanguage\":{\"edit\":{\"label\":\"PreferedLanguage\",\"description\":\"\",\"placeholder\":\"\",\"visible\":true,\"editable\":true},\"list\":{\"label\":\"PreferedLanguage\",\"searchable\":true,\"sortable\":true}}},\"layouts\":{\"list\":[\"id\",\"firstname\",\"lastname\",\"username\"],\"edit\":[[{\"name\":\"firstname\",\"size\":6},{\"name\":\"lastname\",\"size\":6}],[{\"name\":\"username\",\"size\":6},{\"name\":\"email\",\"size\":6}],[{\"name\":\"password\",\"size\":6},{\"name\":\"resetPasswordToken\",\"size\":6}],[{\"name\":\"registrationToken\",\"size\":6},{\"name\":\"isActive\",\"size\":4}],[{\"name\":\"blocked\",\"size\":4},{\"name\":\"preferedLanguage\",\"size\":6}]],\"editRelations\":[\"roles\"]}}','object','',''),(22,'plugin_content_manager_configuration_content_types::strapi::role','{\"uid\":\"strapi::role\",\"settings\":{\"bulkable\":true,\"filterable\":true,\"searchable\":true,\"pageSize\":10,\"mainField\":\"name\",\"defaultSortBy\":\"name\",\"defaultSortOrder\":\"ASC\"},\"metadatas\":{\"id\":{\"edit\":{},\"list\":{\"label\":\"Id\",\"searchable\":true,\"sortable\":true}},\"name\":{\"edit\":{\"label\":\"Name\",\"description\":\"\",\"placeholder\":\"\",\"visible\":true,\"editable\":true},\"list\":{\"label\":\"Name\",\"searchable\":true,\"sortable\":true}},\"code\":{\"edit\":{\"label\":\"Code\",\"description\":\"\",\"placeholder\":\"\",\"visible\":true,\"editable\":true},\"list\":{\"label\":\"Code\",\"searchable\":true,\"sortable\":true}},\"description\":{\"edit\":{\"label\":\"Description\",\"description\":\"\",\"placeholder\":\"\",\"visible\":true,\"editable\":true},\"list\":{\"label\":\"Description\",\"searchable\":true,\"sortable\":true}},\"users\":{\"edit\":{\"label\":\"Users\",\"description\":\"\",\"placeholder\":\"\",\"visible\":true,\"editable\":true,\"mainField\":\"firstname\"},\"list\":{\"label\":\"Users\",\"searchable\":false,\"sortable\":false}},\"permissions\":{\"edit\":{\"label\":\"Permissions\",\"description\":\"\",\"placeholder\":\"\",\"visible\":true,\"editable\":true,\"mainField\":\"action\"},\"list\":{\"label\":\"Permissions\",\"searchable\":false,\"sortable\":false}},\"created_at\":{\"edit\":{\"label\":\"Created_at\",\"description\":\"\",\"placeholder\":\"\",\"visible\":false,\"editable\":true},\"list\":{\"label\":\"Created_at\",\"searchable\":true,\"sortable\":true}},\"updated_at\":{\"edit\":{\"label\":\"Updated_at\",\"description\":\"\",\"placeholder\":\"\",\"visible\":false,\"editable\":true},\"list\":{\"label\":\"Updated_at\",\"searchable\":true,\"sortable\":true}}},\"layouts\":{\"list\":[\"id\",\"name\",\"code\",\"description\"],\"editRelations\":[\"users\",\"permissions\"],\"edit\":[[{\"name\":\"name\",\"size\":6},{\"name\":\"code\",\"size\":6}],[{\"name\":\"description\",\"size\":6}]]}}','object','',''),(23,'plugin_content_manager_configuration_content_types::plugins::upload.file','{\"uid\":\"plugins::upload.file\",\"settings\":{\"bulkable\":true,\"filterable\":true,\"searchable\":true,\"pageSize\":10,\"mainField\":\"name\",\"defaultSortBy\":\"name\",\"defaultSortOrder\":\"ASC\"},\"metadatas\":{\"id\":{\"edit\":{},\"list\":{\"label\":\"Id\",\"searchable\":true,\"sortable\":true}},\"name\":{\"edit\":{\"label\":\"Name\",\"description\":\"\",\"placeholder\":\"\",\"visible\":true,\"editable\":true},\"list\":{\"label\":\"Name\",\"searchable\":true,\"sortable\":true}},\"alternativeText\":{\"edit\":{\"label\":\"AlternativeText\",\"description\":\"\",\"placeholder\":\"\",\"visible\":true,\"editable\":true},\"list\":{\"label\":\"AlternativeText\",\"searchable\":true,\"sortable\":true}},\"caption\":{\"edit\":{\"label\":\"Caption\",\"description\":\"\",\"placeholder\":\"\",\"visible\":true,\"editable\":true},\"list\":{\"label\":\"Caption\",\"searchable\":true,\"sortable\":true}},\"width\":{\"edit\":{\"label\":\"Width\",\"description\":\"\",\"placeholder\":\"\",\"visible\":true,\"editable\":true},\"list\":{\"label\":\"Width\",\"searchable\":true,\"sortable\":true}},\"height\":{\"edit\":{\"label\":\"Height\",\"description\":\"\",\"placeholder\":\"\",\"visible\":true,\"editable\":true},\"list\":{\"label\":\"Height\",\"searchable\":true,\"sortable\":true}},\"formats\":{\"edit\":{\"label\":\"Formats\",\"description\":\"\",\"placeholder\":\"\",\"visible\":true,\"editable\":true},\"list\":{\"label\":\"Formats\",\"searchable\":false,\"sortable\":false}},\"hash\":{\"edit\":{\"label\":\"Hash\",\"description\":\"\",\"placeholder\":\"\",\"visible\":true,\"editable\":true},\"list\":{\"label\":\"Hash\",\"searchable\":true,\"sortable\":true}},\"ext\":{\"edit\":{\"label\":\"Ext\",\"description\":\"\",\"placeholder\":\"\",\"visible\":true,\"editable\":true},\"list\":{\"label\":\"Ext\",\"searchable\":true,\"sortable\":true}},\"mime\":{\"edit\":{\"label\":\"Mime\",\"description\":\"\",\"placeholder\":\"\",\"visible\":true,\"editable\":true},\"list\":{\"label\":\"Mime\",\"searchable\":true,\"sortable\":true}},\"size\":{\"edit\":{\"label\":\"Size\",\"description\":\"\",\"placeholder\":\"\",\"visible\":true,\"editable\":true},\"list\":{\"label\":\"Size\",\"searchable\":true,\"sortable\":true}},\"url\":{\"edit\":{\"label\":\"Url\",\"description\":\"\",\"placeholder\":\"\",\"visible\":true,\"editable\":true},\"list\":{\"label\":\"Url\",\"searchable\":true,\"sortable\":true}},\"previewUrl\":{\"edit\":{\"label\":\"PreviewUrl\",\"description\":\"\",\"placeholder\":\"\",\"visible\":true,\"editable\":true},\"list\":{\"label\":\"PreviewUrl\",\"searchable\":true,\"sortable\":true}},\"provider\":{\"edit\":{\"label\":\"Provider\",\"description\":\"\",\"placeholder\":\"\",\"visible\":true,\"editable\":true},\"list\":{\"label\":\"Provider\",\"searchable\":true,\"sortable\":true}},\"provider_metadata\":{\"edit\":{\"label\":\"Provider_metadata\",\"description\":\"\",\"placeholder\":\"\",\"visible\":true,\"editable\":true},\"list\":{\"label\":\"Provider_metadata\",\"searchable\":false,\"sortable\":false}},\"related\":{\"edit\":{\"label\":\"Related\",\"description\":\"\",\"placeholder\":\"\",\"visible\":true,\"editable\":true,\"mainField\":\"id\"},\"list\":{\"label\":\"Related\",\"searchable\":false,\"sortable\":false}},\"created_at\":{\"edit\":{\"label\":\"Created_at\",\"description\":\"\",\"placeholder\":\"\",\"visible\":false,\"editable\":true},\"list\":{\"label\":\"Created_at\",\"searchable\":true,\"sortable\":true}},\"updated_at\":{\"edit\":{\"label\":\"Updated_at\",\"description\":\"\",\"placeholder\":\"\",\"visible\":false,\"editable\":true},\"list\":{\"label\":\"Updated_at\",\"searchable\":true,\"sortable\":true}}},\"layouts\":{\"list\":[\"id\",\"name\",\"alternativeText\",\"caption\"],\"editRelations\":[\"related\"],\"edit\":[[{\"name\":\"name\",\"size\":6},{\"name\":\"alternativeText\",\"size\":6}],[{\"name\":\"caption\",\"size\":6},{\"name\":\"width\",\"size\":4}],[{\"name\":\"height\",\"size\":4}],[{\"name\":\"formats\",\"size\":12}],[{\"name\":\"hash\",\"size\":6},{\"name\":\"ext\",\"size\":6}],[{\"name\":\"mime\",\"size\":6},{\"name\":\"size\",\"size\":4}],[{\"name\":\"url\",\"size\":6},{\"name\":\"previewUrl\",\"size\":6}],[{\"name\":\"provider\",\"size\":6}],[{\"name\":\"provider_metadata\",\"size\":12}]]}}','object','',''),(24,'plugin_content_manager_configuration_content_types::plugins::users-permissions.permission','{\"uid\":\"plugins::users-permissions.permission\",\"settings\":{\"bulkable\":true,\"filterable\":true,\"searchable\":true,\"pageSize\":10,\"mainField\":\"type\",\"defaultSortBy\":\"type\",\"defaultSortOrder\":\"ASC\"},\"metadatas\":{\"id\":{\"edit\":{},\"list\":{\"label\":\"Id\",\"searchable\":true,\"sortable\":true}},\"type\":{\"edit\":{\"label\":\"Type\",\"description\":\"\",\"placeholder\":\"\",\"visible\":true,\"editable\":true},\"list\":{\"label\":\"Type\",\"searchable\":true,\"sortable\":true}},\"controller\":{\"edit\":{\"label\":\"Controller\",\"description\":\"\",\"placeholder\":\"\",\"visible\":true,\"editable\":true},\"list\":{\"label\":\"Controller\",\"searchable\":true,\"sortable\":true}},\"action\":{\"edit\":{\"label\":\"Action\",\"description\":\"\",\"placeholder\":\"\",\"visible\":true,\"editable\":true},\"list\":{\"label\":\"Action\",\"searchable\":true,\"sortable\":true}},\"enabled\":{\"edit\":{\"label\":\"Enabled\",\"description\":\"\",\"placeholder\":\"\",\"visible\":true,\"editable\":true},\"list\":{\"label\":\"Enabled\",\"searchable\":true,\"sortable\":true}},\"policy\":{\"edit\":{\"label\":\"Policy\",\"description\":\"\",\"placeholder\":\"\",\"visible\":true,\"editable\":true},\"list\":{\"label\":\"Policy\",\"searchable\":true,\"sortable\":true}},\"role\":{\"edit\":{\"label\":\"Role\",\"description\":\"\",\"placeholder\":\"\",\"visible\":true,\"editable\":true,\"mainField\":\"name\"},\"list\":{\"label\":\"Role\",\"searchable\":false,\"sortable\":false}}},\"layouts\":{\"list\":[\"id\",\"type\",\"controller\",\"action\"],\"editRelations\":[\"role\"],\"edit\":[[{\"name\":\"type\",\"size\":6},{\"name\":\"controller\",\"size\":6}],[{\"name\":\"action\",\"size\":6},{\"name\":\"enabled\",\"size\":4}],[{\"name\":\"policy\",\"size\":6}]]}}','object','',''),(25,'plugin_content_manager_configuration_content_types::plugins::users-permissions.role','{\"uid\":\"plugins::users-permissions.role\",\"settings\":{\"bulkable\":true,\"filterable\":true,\"searchable\":true,\"pageSize\":10,\"mainField\":\"name\",\"defaultSortBy\":\"name\",\"defaultSortOrder\":\"ASC\"},\"metadatas\":{\"id\":{\"edit\":{},\"list\":{\"label\":\"Id\",\"searchable\":true,\"sortable\":true}},\"name\":{\"edit\":{\"label\":\"Name\",\"description\":\"\",\"placeholder\":\"\",\"visible\":true,\"editable\":true},\"list\":{\"label\":\"Name\",\"searchable\":true,\"sortable\":true}},\"description\":{\"edit\":{\"label\":\"Description\",\"description\":\"\",\"placeholder\":\"\",\"visible\":true,\"editable\":true},\"list\":{\"label\":\"Description\",\"searchable\":true,\"sortable\":true}},\"type\":{\"edit\":{\"label\":\"Type\",\"description\":\"\",\"placeholder\":\"\",\"visible\":true,\"editable\":true},\"list\":{\"label\":\"Type\",\"searchable\":true,\"sortable\":true}},\"permissions\":{\"edit\":{\"label\":\"Permissions\",\"description\":\"\",\"placeholder\":\"\",\"visible\":true,\"editable\":true,\"mainField\":\"type\"},\"list\":{\"label\":\"Permissions\",\"searchable\":false,\"sortable\":false}},\"users\":{\"edit\":{\"label\":\"Users\",\"description\":\"\",\"placeholder\":\"\",\"visible\":true,\"editable\":true,\"mainField\":\"username\"},\"list\":{\"label\":\"Users\",\"searchable\":false,\"sortable\":false}}},\"layouts\":{\"list\":[\"id\",\"name\",\"description\",\"type\"],\"editRelations\":[\"permissions\",\"users\"],\"edit\":[[{\"name\":\"name\",\"size\":6},{\"name\":\"description\",\"size\":6}],[{\"name\":\"type\",\"size\":6}]]}}','object','',''),(26,'plugin_content_manager_configuration_content_types::plugins::users-permissions.user','{\"uid\":\"plugins::users-permissions.user\",\"settings\":{\"bulkable\":true,\"filterable\":true,\"searchable\":true,\"pageSize\":10,\"mainField\":\"username\",\"defaultSortBy\":\"username\",\"defaultSortOrder\":\"ASC\"},\"metadatas\":{\"id\":{\"edit\":{},\"list\":{\"label\":\"Id\",\"searchable\":true,\"sortable\":true}},\"username\":{\"edit\":{\"label\":\"Username\",\"description\":\"\",\"placeholder\":\"\",\"visible\":true,\"editable\":true},\"list\":{\"label\":\"Username\",\"searchable\":true,\"sortable\":true}},\"email\":{\"edit\":{\"label\":\"Email\",\"description\":\"\",\"placeholder\":\"\",\"visible\":true,\"editable\":true},\"list\":{\"label\":\"Email\",\"searchable\":true,\"sortable\":true}},\"provider\":{\"edit\":{\"label\":\"Provider\",\"description\":\"\",\"placeholder\":\"\",\"visible\":false,\"editable\":true},\"list\":{\"label\":\"Provider\",\"searchable\":true,\"sortable\":true}},\"password\":{\"edit\":{\"label\":\"Password\",\"description\":\"\",\"placeholder\":\"\",\"visible\":true,\"editable\":true},\"list\":{\"label\":\"Password\",\"searchable\":true,\"sortable\":true}},\"resetPasswordToken\":{\"edit\":{\"label\":\"ResetPasswordToken\",\"description\":\"\",\"placeholder\":\"\",\"visible\":false,\"editable\":true},\"list\":{\"label\":\"ResetPasswordToken\",\"searchable\":true,\"sortable\":true}},\"confirmationToken\":{\"edit\":{\"label\":\"ConfirmationToken\",\"description\":\"\",\"placeholder\":\"\",\"visible\":false,\"editable\":true},\"list\":{\"label\":\"ConfirmationToken\",\"searchable\":true,\"sortable\":true}},\"confirmed\":{\"edit\":{\"label\":\"Confirmed\",\"description\":\"\",\"placeholder\":\"\",\"visible\":true,\"editable\":true},\"list\":{\"label\":\"Confirmed\",\"searchable\":true,\"sortable\":true}},\"blocked\":{\"edit\":{\"label\":\"Blocked\",\"description\":\"\",\"placeholder\":\"\",\"visible\":true,\"editable\":true},\"list\":{\"label\":\"Blocked\",\"searchable\":true,\"sortable\":true}},\"role\":{\"edit\":{\"label\":\"Role\",\"description\":\"\",\"placeholder\":\"\",\"visible\":true,\"editable\":true,\"mainField\":\"name\"},\"list\":{\"label\":\"Role\",\"searchable\":false,\"sortable\":false}},\"created_at\":{\"edit\":{\"label\":\"Created_at\",\"description\":\"\",\"placeholder\":\"\",\"visible\":false,\"editable\":true},\"list\":{\"label\":\"Created_at\",\"searchable\":true,\"sortable\":true}},\"updated_at\":{\"edit\":{\"label\":\"Updated_at\",\"description\":\"\",\"placeholder\":\"\",\"visible\":false,\"editable\":true},\"list\":{\"label\":\"Updated_at\",\"searchable\":true,\"sortable\":true}}},\"layouts\":{\"list\":[\"id\",\"username\",\"email\",\"confirmed\"],\"edit\":[[{\"name\":\"username\",\"size\":6},{\"name\":\"email\",\"size\":6}],[{\"name\":\"password\",\"size\":6},{\"name\":\"confirmed\",\"size\":4}],[{\"name\":\"blocked\",\"size\":4}]],\"editRelations\":[\"role\"]}}','object','',''),(27,'plugin_users-permissions_email','{\"reset_password\":{\"display\":\"Email.template.reset_password\",\"icon\":\"sync\",\"options\":{\"from\":{\"name\":\"Administration Panel\",\"email\":\"no-reply@strapi.io\"},\"response_email\":\"\",\"object\":\"Reset password\",\"message\":\"<p>We heard that you lost your password. Sorry about that!</p>\\n\\n<p>But don’t worry! You can use the following link to reset your password:</p>\\n<p><%= URL %>?code=<%= TOKEN %></p>\\n\\n<p>Thanks.</p>\"}},\"email_confirmation\":{\"display\":\"Email.template.email_confirmation\",\"icon\":\"check-square\",\"options\":{\"from\":{\"name\":\"Administration Panel\",\"email\":\"no-reply@strapi.io\"},\"response_email\":\"\",\"object\":\"Account confirmation\",\"message\":\"<p>Thank you for registering!</p>\\n\\n<p>You have to confirm your email address. Please click on the link below.</p>\\n\\n<p><%= URL %>?confirmation=<%= CODE %></p>\\n\\n<p>Thanks.</p>\"}}}','object','',''),(29,'plugin_content_manager_configuration_components::sections.section','{\"uid\":\"sections.section\",\"isComponent\":true,\"settings\":{\"bulkable\":true,\"filterable\":true,\"searchable\":true,\"pageSize\":10,\"mainField\":\"id\",\"defaultSortBy\":\"id\",\"defaultSortOrder\":\"ASC\"},\"metadatas\":{\"id\":{\"edit\":{},\"list\":{\"label\":\"Id\",\"searchable\":false,\"sortable\":false}},\"HtmlBlock\":{\"edit\":{\"label\":\"HtmlBlock\",\"description\":\"\",\"placeholder\":\"\",\"visible\":true,\"editable\":true},\"list\":{\"label\":\"HtmlBlock\",\"searchable\":false,\"sortable\":false}}},\"layouts\":{\"list\":[\"id\"],\"edit\":[[{\"name\":\"HtmlBlock\",\"size\":12}]],\"editRelations\":[]}}','object','',''),(30,'plugin_users-permissions_advanced','{\"unique_email\":true,\"allow_register\":true,\"email_confirmation\":true,\"email_reset_password\":null,\"email_confirmation_redirection\":null,\"default_role\":\"authenticated\"}','object','',''),(31,'db_model_components_list_icon_lists','{}','object',NULL,NULL),(32,'db_model_components_list_logo_list_items','{\"Logo\":{\"model\":\"file\",\"via\":\"related\",\"allowedTypes\":[\"images\",\"files\",\"videos\"],\"plugin\":\"upload\",\"required\":false},\"Link\":{\"type\":\"string\"}}','object',NULL,NULL),(33,'db_model_components_meta_languages','{\"Language\":{\"type\":\"enumeration\",\"enum\":[\"EN\",\"LV\",\"DE\"],\"default\":\"EN\"}}','object',NULL,NULL),(34,'db_model_components_sections_feature_lists','{\"Title\":{\"type\":\"string\"},\"List\":{\"type\":\"component\",\"repeatable\":true,\"component\":\"list.list-item-with-icon\"}}','object',NULL,NULL),(35,'db_model_components_sections_showcases','{\"Title\":{\"type\":\"string\"},\"showcases\":{\"collection\":\"showcase\",\"attribute\":\"showcase\",\"column\":\"id\",\"isVirtual\":true}}','object',NULL,NULL),(36,'db_model_components_sections_contacts','{\"Body_1\":{\"type\":\"richtext\"},\"Body_2\":{\"type\":\"richtext\"},\"Background\":{\"type\":\"string\"},\"Email_placeholder\":{\"type\":\"string\"},\"Button_text\":{\"type\":\"string\"},\"Show_contact_form\":{\"type\":\"boolean\"}}','object',NULL,NULL),(37,'db_model_top_menus','{\"Language\":{\"type\":\"component\",\"repeatable\":false,\"component\":\"meta.language\"},\"created_by\":{\"model\":\"user\",\"plugin\":\"admin\"},\"updated_by\":{\"model\":\"user\",\"plugin\":\"admin\"},\"created_at\":{\"type\":\"currentTimestamp\"},\"updated_at\":{\"type\":\"currentTimestamp\"}}','object',NULL,NULL),(38,'db_model_components_sections_two_column_with_pictures','{\"Title\":{\"type\":\"string\"},\"Description\":{\"type\":\"text\"},\"Grey\":{\"type\":\"boolean\"},\"Left\":{\"type\":\"boolean\"},\"Image\":{\"model\":\"file\",\"via\":\"related\",\"allowedTypes\":[\"images\",\"files\",\"videos\"],\"plugin\":\"upload\",\"required\":false},\"List\":{\"type\":\"component\",\"repeatable\":true,\"component\":\"list.list-item-with-icon\"},\"Link\":{\"type\":\"component\",\"repeatable\":false,\"component\":\"basic.link\"}}','object',NULL,NULL),(39,'db_model_components_sections_integrations','{\"Title\":{\"type\":\"string\"},\"Description\":{\"type\":\"text\"},\"Logos\":{\"type\":\"component\",\"repeatable\":true,\"component\":\"list.logo-list-item\"},\"Link\":{\"type\":\"component\",\"repeatable\":false,\"component\":\"basic.link\"}}','object',NULL,NULL),(40,'db_model_components_sections_heroes','{\"Title\":{\"type\":\"string\"},\"Description\":{\"type\":\"text\"},\"Image\":{\"model\":\"file\",\"via\":\"related\",\"allowedTypes\":[\"images\",\"files\",\"videos\"],\"plugin\":\"upload\",\"required\":false},\"Email_label\":{\"type\":\"string\"},\"Button_text\":{\"type\":\"string\"},\"Show_search_widget\":{\"type\":\"boolean\",\"default\":true}}','object',NULL,NULL),(41,'db_model_showcases','{\"Title\":{\"type\":\"string\"},\"Description\":{\"type\":\"text\"},\"Image\":{\"model\":\"file\",\"via\":\"related\",\"allowedTypes\":[\"images\",\"files\",\"videos\"],\"plugin\":\"upload\",\"required\":false},\"Content\":{\"type\":\"richtext\"},\"created_by\":{\"model\":\"user\",\"plugin\":\"admin\"},\"updated_by\":{\"model\":\"user\",\"plugin\":\"admin\"},\"created_at\":{\"type\":\"currentTimestamp\"},\"updated_at\":{\"type\":\"currentTimestamp\"}}','object',NULL,NULL),(42,'db_model_components_sections_showcases__showcases','{\"components_sections_showcase_id\":{\"type\":\"integer\"},\"showcase_id\":{\"type\":\"integer\"}}','object',NULL,NULL),(50,'plugin_content_manager_configuration_components::sections.hero','{\"uid\":\"sections.hero\",\"isComponent\":true,\"settings\":{\"bulkable\":true,\"filterable\":true,\"searchable\":true,\"pageSize\":10,\"mainField\":\"Title\",\"defaultSortBy\":\"Title\",\"defaultSortOrder\":\"ASC\"},\"metadatas\":{\"id\":{\"edit\":{},\"list\":{\"label\":\"Id\",\"searchable\":false,\"sortable\":false}},\"Title\":{\"edit\":{\"label\":\"Title\",\"description\":\"\",\"placeholder\":\"\",\"visible\":true,\"editable\":true},\"list\":{\"label\":\"Title\",\"searchable\":true,\"sortable\":true}},\"Description\":{\"edit\":{\"label\":\"Description\",\"description\":\"\",\"placeholder\":\"\",\"visible\":true,\"editable\":true},\"list\":{\"label\":\"Description\",\"searchable\":true,\"sortable\":true}},\"Image\":{\"edit\":{\"label\":\"Image\",\"description\":\"\",\"placeholder\":\"\",\"visible\":true,\"editable\":true},\"list\":{\"label\":\"Image\",\"searchable\":false,\"sortable\":false}},\"Show_search_widget\":{\"edit\":{\"label\":\"Show_search_widget\",\"description\":\"\",\"placeholder\":\"\",\"visible\":true,\"editable\":true},\"list\":{\"label\":\"Show_search_widget\",\"searchable\":true,\"sortable\":true}}},\"layouts\":{\"list\":[\"id\",\"Title\",\"Description\",\"Image\"],\"edit\":[[{\"name\":\"Title\",\"size\":6},{\"name\":\"Description\",\"size\":6}],[{\"name\":\"Image\",\"size\":6}],[{\"name\":\"Show_search_widget\",\"size\":4}]],\"editRelations\":[]}}','object','',''),(54,'db_model_components_list_list_item_with_icons','{\"Title\":{\"type\":\"string\"},\"Description\":{\"type\":\"text\"},\"Icon\":{\"model\":\"file\",\"via\":\"related\",\"allowedTypes\":[\"images\",\"files\",\"videos\"],\"plugin\":\"upload\",\"required\":false}}','object',NULL,NULL),(56,'db_model_components_basic_links','{\"Text\":{\"type\":\"string\"},\"Target\":{\"type\":\"string\"},\"AppendArrow\":{\"type\":\"boolean\"}}','object',NULL,NULL),(58,'db_model_components_list_pricing_lists','{\"features\":{\"type\":\"component\",\"repeatable\":true,\"component\":\"list.list-item-with-icon\"},\"price\":{\"type\":\"string\"},\"currency\":{\"type\":\"string\"},\"unit\":{\"type\":\"string\"},\"description\":{\"type\":\"string\"}}','object',NULL,NULL),(59,'db_model_components_sections_two_columns','{\"iframe\":{\"type\":\"string\"},\"Pricing\":{\"type\":\"component\",\"repeatable\":false,\"component\":\"list.pricing-list\"}}','object',NULL,NULL),(60,'db_model_terms_and_conditions','{\"Title\":{\"type\":\"string\"},\"Language\":{\"type\":\"component\",\"repeatable\":false,\"component\":\"meta.language\"},\"Body\":{\"type\":\"dynamiczone\",\"components\":[\"sections.section\"]},\"created_by\":{\"model\":\"user\",\"plugin\":\"admin\"},\"updated_by\":{\"model\":\"user\",\"plugin\":\"admin\"},\"created_at\":{\"type\":\"currentTimestamp\"},\"updated_at\":{\"type\":\"currentTimestamp\"}}','object',NULL,NULL),(61,'db_model_pages','{\"Title\":{\"type\":\"string\"},\"Language\":{\"type\":\"component\",\"repeatable\":false,\"component\":\"meta.language\"},\"Body\":{\"type\":\"dynamiczone\",\"components\":[\"sections.section\",\"sections.two-columns\",\"sections.picture-and-text\"]},\"Show_title\":{\"type\":\"boolean\"},\"created_by\":{\"model\":\"user\",\"plugin\":\"admin\"},\"updated_by\":{\"model\":\"user\",\"plugin\":\"admin\"},\"created_at\":{\"type\":\"currentTimestamp\"},\"updated_at\":{\"type\":\"currentTimestamp\"}}','object',NULL,NULL),(62,'plugin_content_manager_configuration_content_types::application::page.page','{\"uid\":\"application::page.page\",\"settings\":{\"bulkable\":true,\"filterable\":true,\"searchable\":true,\"pageSize\":10,\"mainField\":\"Title\",\"defaultSortBy\":\"Title\",\"defaultSortOrder\":\"ASC\"},\"metadatas\":{\"id\":{\"edit\":{},\"list\":{\"label\":\"Id\",\"searchable\":true,\"sortable\":true}},\"Title\":{\"edit\":{\"label\":\"Title\",\"description\":\"\",\"placeholder\":\"\",\"visible\":true,\"editable\":true},\"list\":{\"label\":\"Title\",\"searchable\":true,\"sortable\":true}},\"Body\":{\"edit\":{\"label\":\"Body\",\"description\":\"\",\"placeholder\":\"\",\"visible\":true,\"editable\":true},\"list\":{\"label\":\"Body\",\"searchable\":false,\"sortable\":false}},\"Show_title\":{\"edit\":{\"label\":\"Show_title\",\"description\":\"\",\"placeholder\":\"\",\"visible\":true,\"editable\":true},\"list\":{\"label\":\"Show_title\",\"searchable\":true,\"sortable\":true}},\"White_background\":{\"edit\":{\"label\":\"White_background\",\"description\":\"\",\"placeholder\":\"\",\"visible\":true,\"editable\":true},\"list\":{\"label\":\"White_background\",\"searchable\":true,\"sortable\":true}},\"Slug\":{\"edit\":{\"label\":\"Slug\",\"description\":\"\",\"placeholder\":\"\",\"visible\":true,\"editable\":true},\"list\":{\"label\":\"Slug\",\"searchable\":true,\"sortable\":true}},\"navigation\":{\"edit\":{\"label\":\"Navigation\",\"description\":\"\",\"placeholder\":\"\",\"visible\":true,\"editable\":true,\"mainField\":\"uiRouterKey\"},\"list\":{\"label\":\"Navigation\",\"searchable\":false,\"sortable\":false}},\"created_at\":{\"edit\":{\"label\":\"Created_at\",\"description\":\"\",\"placeholder\":\"\",\"visible\":false,\"editable\":true},\"list\":{\"label\":\"Created_at\",\"searchable\":true,\"sortable\":true}},\"updated_at\":{\"edit\":{\"label\":\"Updated_at\",\"description\":\"\",\"placeholder\":\"\",\"visible\":false,\"editable\":true},\"list\":{\"label\":\"Updated_at\",\"searchable\":true,\"sortable\":true}}},\"layouts\":{\"list\":[\"id\",\"Title\",\"created_at\",\"updated_at\"],\"edit\":[[{\"name\":\"Title\",\"size\":6}],[{\"name\":\"Show_title\",\"size\":4},{\"name\":\"White_background\",\"size\":4}],[{\"name\":\"Body\",\"size\":12}],[{\"name\":\"Slug\",\"size\":6}]],\"editRelations\":[\"navigation\"]}}','object','',''),(66,'db_model_trial_requests','{\"Name\":{\"type\":\"string\"},\"Email\":{\"type\":\"email\"},\"Message\":{\"type\":\"text\"},\"created_by\":{\"model\":\"user\",\"plugin\":\"admin\"},\"updated_by\":{\"model\":\"user\",\"plugin\":\"admin\"},\"created_at\":{\"type\":\"currentTimestamp\"},\"updated_at\":{\"type\":\"currentTimestamp\"}}','object',NULL,NULL),(68,'db_model_components_menu_dropdowns','{\"Label\":{\"type\":\"string\"},\"menu_dropdowns\":{\"collection\":\"menu-dropdown\",\"attribute\":\"menu-dropdown\",\"column\":\"id\",\"isVirtual\":true}}','object',NULL,NULL),(69,'db_model_components_menu_links','{\"Label\":{\"type\":\"string\"},\"url\":{\"type\":\"string\"},\"Type\":{\"type\":\"enumeration\",\"enum\":[\"cms\",\"angular\",\"external\"],\"default\":\"cms\"}}','object',NULL,NULL),(70,'db_model_menu_dropdowns','{\"Label\":{\"type\":\"string\"},\"Link\":{\"type\":\"component\",\"repeatable\":true,\"component\":\"menu.link\"},\"created_by\":{\"model\":\"user\",\"plugin\":\"admin\"},\"updated_by\":{\"model\":\"user\",\"plugin\":\"admin\"},\"created_at\":{\"type\":\"currentTimestamp\"},\"updated_at\":{\"type\":\"currentTimestamp\"}}','object',NULL,NULL),(71,'db_model_menus','{\"Body\":{\"type\":\"dynamiczone\",\"components\":[\"menu.link\",\"menu.dropdown\"]},\"created_by\":{\"model\":\"user\",\"plugin\":\"admin\"},\"updated_by\":{\"model\":\"user\",\"plugin\":\"admin\"},\"created_at\":{\"type\":\"currentTimestamp\"},\"updated_at\":{\"type\":\"currentTimestamp\"}}','object',NULL,NULL),(72,'db_model_components_menu_dropdowns__menu_dropdowns','{\"components_menu_dropdown_id\":{\"type\":\"integer\"},\"menu-dropdown_id\":{\"type\":\"integer\"}}','object',NULL,NULL),(77,'db_model_components_sections_picture_and_texts','{\"Image\":{\"model\":\"file\",\"via\":\"related\",\"allowedTypes\":[\"images\",\"files\",\"videos\"],\"plugin\":\"upload\",\"required\":false},\"Body\":{\"type\":\"richtext\"},\"Image_title\":{\"type\":\"string\"},\"Image_left_side\":{\"type\":\"boolean\"}}','object',NULL,NULL),(79,'model_def_strapi::core-store','{\"uid\":\"strapi::core-store\",\"collectionName\":\"core_store\",\"info\":{\"name\":\"core_store\",\"description\":\"\"},\"options\":{\"timestamps\":false},\"pluginOptions\":{\"content-manager\":{\"visible\":false},\"content-type-builder\":{\"visible\":false}},\"attributes\":{\"key\":{\"type\":\"string\"},\"value\":{\"type\":\"text\"},\"type\":{\"type\":\"string\"},\"environment\":{\"type\":\"string\"},\"tag\":{\"type\":\"string\"}}}','object',NULL,NULL),(80,'model_def_basic.link','{\"uid\":\"basic.link\",\"collectionName\":\"components_basic_links\",\"info\":{\"name\":\"Link\",\"icon\":\"link\"},\"options\":{\"timestamps\":false},\"attributes\":{\"Text\":{\"type\":\"string\"},\"Target\":{\"type\":\"string\"},\"AppendArrow\":{\"type\":\"boolean\"}}}','object',NULL,NULL),(81,'model_def_list.list-item-with-icon','{\"uid\":\"list.list-item-with-icon\",\"collectionName\":\"components_list_list_item_with_icons\",\"info\":{\"name\":\"List item with icon\",\"icon\":\"align-center\"},\"options\":{\"timestamps\":false},\"attributes\":{\"Title\":{\"type\":\"string\"},\"Description\":{\"type\":\"text\"},\"Icon\":{\"model\":\"file\",\"via\":\"related\",\"allowedTypes\":[\"images\",\"files\",\"videos\"],\"plugin\":\"upload\",\"required\":false}}}','object',NULL,NULL),(82,'model_def_list.logo-list-item','{\"uid\":\"list.logo-list-item\",\"collectionName\":\"components_list_logo_list_items\",\"info\":{\"name\":\"Logo list item\",\"icon\":\"crown\",\"description\":\"\"},\"options\":{\"timestamps\":false},\"attributes\":{\"Logo\":{\"model\":\"file\",\"via\":\"related\",\"allowedTypes\":[\"images\",\"files\",\"videos\"],\"plugin\":\"upload\",\"required\":false},\"Link\":{\"type\":\"string\"},\"Title\":{\"type\":\"string\"},\"Description\":{\"type\":\"text\"},\"Follow_up_link_text\":{\"type\":\"string\"}}}','object',NULL,NULL),(83,'model_def_list.pricing-list','{\"uid\":\"list.pricing-list\",\"collectionName\":\"components_list_pricing_lists\",\"info\":{\"name\":\"Pricing-list\",\"icon\":\"list-ul\",\"description\":\"\"},\"options\":{\"timestamps\":false},\"attributes\":{\"features\":{\"type\":\"component\",\"repeatable\":true,\"component\":\"list.list-item-with-icon\"},\"price\":{\"type\":\"string\"},\"currency\":{\"type\":\"string\"},\"unit\":{\"type\":\"string\"},\"description\":{\"type\":\"string\"},\"Starting_from\":{\"type\":\"string\"}}}','object',NULL,NULL),(84,'model_def_menu.dropdown','{\"uid\":\"menu.dropdown\",\"collectionName\":\"components_menu_dropdowns\",\"info\":{\"name\":\"Dropdown\",\"icon\":\"angle-down\"},\"options\":{\"timestamps\":false},\"attributes\":{\"Label\":{\"type\":\"string\"}}}','object',NULL,NULL),(85,'model_def_menu.link','{\"uid\":\"menu.link\",\"collectionName\":\"components_menu_links\",\"info\":{\"name\":\"Link\",\"icon\":\"unlink\"},\"options\":{\"timestamps\":false},\"attributes\":{\"Label\":{\"type\":\"string\"},\"url\":{\"type\":\"string\"},\"Type\":{\"type\":\"enumeration\",\"enum\":[\"cms\",\"angular\",\"external\"],\"default\":\"cms\"}}}','object',NULL,NULL),(86,'model_def_meta.language','{\"uid\":\"meta.language\",\"collectionName\":\"components_meta_languages\",\"info\":{\"name\":\"Language\",\"icon\":\"globe\"},\"options\":{\"timestamps\":false},\"attributes\":{\"Language\":{\"type\":\"enumeration\",\"enum\":[\"EN\",\"LV\",\"DE\"],\"default\":\"EN\"}}}','object',NULL,NULL),(87,'model_def_sections.body-html-fragment','{\"uid\":\"sections.body-html-fragment\",\"collectionName\":\"components_sections_body_html_fragments\",\"info\":{\"name\":\"Body HTML Fragment\",\"icon\":\"stream\"},\"options\":{\"timestamps\":false},\"attributes\":{}}','object',NULL,NULL),(88,'model_def_sections.contact','{\"uid\":\"sections.contact\",\"collectionName\":\"components_sections_contacts\",\"info\":{\"name\":\"Contact\",\"icon\":\"mail-bulk\"},\"options\":{\"timestamps\":false},\"attributes\":{\"Body_1\":{\"type\":\"richtext\"},\"Body_2\":{\"type\":\"richtext\"},\"Background\":{\"type\":\"string\"},\"Email_placeholder\":{\"type\":\"string\"},\"Button_text\":{\"type\":\"string\"},\"Show_contact_form\":{\"type\":\"boolean\"}}}','object',NULL,NULL),(89,'model_def_sections.feature-list','{\"uid\":\"sections.feature-list\",\"collectionName\":\"components_sections_feature_lists\",\"info\":{\"name\":\"Feature list\",\"icon\":\"align-justify\"},\"options\":{\"timestamps\":false},\"attributes\":{\"Title\":{\"type\":\"string\"},\"List\":{\"type\":\"component\",\"repeatable\":true,\"component\":\"list.list-item-with-icon\"}}}','object',NULL,NULL),(90,'model_def_sections.hero','{\"uid\":\"sections.hero\",\"collectionName\":\"components_sections_heroes\",\"info\":{\"name\":\"Hero\",\"icon\":\"flushed\",\"description\":\"\"},\"options\":{\"timestamps\":false},\"attributes\":{\"Title\":{\"type\":\"string\"},\"Description\":{\"type\":\"text\"},\"Image\":{\"model\":\"file\",\"via\":\"related\",\"allowedTypes\":[\"images\",\"files\",\"videos\"],\"plugin\":\"upload\",\"required\":false,\"pluginOptions\":{}},\"Show_search_widget\":{\"type\":\"boolean\",\"default\":true}}}','object',NULL,NULL),(91,'model_def_sections.integrations','{\"uid\":\"sections.integrations\",\"collectionName\":\"components_sections_integrations\",\"info\":{\"name\":\"Integrations\",\"icon\":\"american-sign-language-interpreting\",\"description\":\"\"},\"options\":{\"timestamps\":false},\"attributes\":{\"Title\":{\"type\":\"string\"},\"Description\":{\"type\":\"text\"},\"Logos\":{\"type\":\"component\",\"repeatable\":true,\"component\":\"list.logo-list-item\"},\"Link\":{\"type\":\"component\",\"repeatable\":false,\"component\":\"basic.link\"},\"Category\":{\"type\":\"string\"}}}','object',NULL,NULL),(92,'model_def_sections.picture-and-text','{\"uid\":\"sections.picture-and-text\",\"collectionName\":\"components_sections_picture_and_texts\",\"info\":{\"name\":\"Picture and text\",\"icon\":\"image\"},\"options\":{\"timestamps\":false},\"attributes\":{\"Image\":{\"model\":\"file\",\"via\":\"related\",\"allowedTypes\":[\"images\",\"files\",\"videos\"],\"plugin\":\"upload\",\"required\":false},\"Body\":{\"type\":\"richtext\"},\"Image_title\":{\"type\":\"string\"},\"Image_left_side\":{\"type\":\"boolean\"}}}','object',NULL,NULL),(93,'model_def_sections.section','{\"uid\":\"sections.section\",\"collectionName\":\"components_landing_sections\",\"info\":{\"name\":\"Section\",\"icon\":\"align-left\"},\"options\":{\"timestamps\":false},\"attributes\":{\"HtmlBlock\":{\"type\":\"richtext\",\"default\":\"<section></section>\",\"required\":true}}}','object',NULL,NULL),(94,'model_def_sections.showcase','{\"uid\":\"sections.showcase\",\"collectionName\":\"components_sections_showcases\",\"info\":{\"name\":\"Showcase\",\"icon\":\"tv\"},\"options\":{\"timestamps\":false},\"attributes\":{\"Title\":{\"type\":\"string\"}}}','object',NULL,NULL),(95,'model_def_sections.two-column-with-picture','{\"uid\":\"sections.two-column-with-picture\",\"collectionName\":\"components_sections_two_column_with_pictures\",\"info\":{\"name\":\"Feature list with picture\",\"icon\":\"columns\",\"description\":\"\"},\"options\":{\"timestamps\":false},\"attributes\":{\"Title\":{\"type\":\"string\"},\"Description\":{\"type\":\"text\"},\"Grey\":{\"type\":\"boolean\"},\"Left\":{\"type\":\"boolean\"},\"Image\":{\"model\":\"file\",\"via\":\"related\",\"allowedTypes\":[\"images\",\"files\",\"videos\"],\"plugin\":\"upload\",\"required\":false},\"List\":{\"type\":\"component\",\"repeatable\":true,\"component\":\"list.list-item-with-icon\"},\"Link\":{\"type\":\"component\",\"repeatable\":false,\"component\":\"basic.link\"},\"Category\":{\"type\":\"string\"}}}','object',NULL,NULL),(96,'model_def_sections.two-columns','{\"uid\":\"sections.two-columns\",\"collectionName\":\"components_sections_two_columns\",\"info\":{\"name\":\"two-columns\",\"icon\":\"pause\"},\"options\":{\"timestamps\":false},\"attributes\":{\"iframe\":{\"type\":\"string\"},\"Pricing\":{\"type\":\"component\",\"repeatable\":false,\"component\":\"list.pricing-list\"}}}','object',NULL,NULL),(97,'model_def_application::landing-page.landing-page','{\"uid\":\"application::landing-page.landing-page\",\"collectionName\":\"landing_pages\",\"kind\":\"collectionType\",\"info\":{\"name\":\"Landing page\",\"description\":\"\"},\"options\":{\"increments\":true,\"timestamps\":[\"created_at\",\"updated_at\"],\"draftAndPublish\":false},\"attributes\":{\"Slug\":{\"type\":\"string\"},\"Body\":{\"type\":\"dynamiczone\",\"components\":[\"sections.section\",\"sections.hero\",\"sections.news\"]},\"News\":{\"type\":\"boolean\",\"default\":true},\"created_by\":{\"model\":\"user\",\"plugin\":\"admin\",\"configurable\":false,\"writable\":false,\"visible\":false,\"private\":true},\"updated_by\":{\"model\":\"user\",\"plugin\":\"admin\",\"configurable\":false,\"writable\":false,\"visible\":false,\"private\":true}}}','object',NULL,NULL),(98,'model_def_application::menu-dropdown.menu-dropdown','{\"uid\":\"application::menu-dropdown.menu-dropdown\",\"collectionName\":\"menu_dropdowns\",\"kind\":\"collectionType\",\"info\":{\"name\":\"Menu dropdown\"},\"options\":{\"increments\":true,\"timestamps\":[\"created_at\",\"updated_at\"]},\"attributes\":{\"Label\":{\"type\":\"string\"},\"Link\":{\"type\":\"component\",\"repeatable\":true,\"component\":\"menu.link\"},\"created_by\":{\"model\":\"user\",\"plugin\":\"admin\",\"configurable\":false,\"writable\":false,\"private\":true},\"updated_by\":{\"model\":\"user\",\"plugin\":\"admin\",\"configurable\":false,\"writable\":false,\"private\":true}}}','object',NULL,NULL),(99,'model_def_application::menu.menu','{\"uid\":\"application::menu.menu\",\"collectionName\":\"menus\",\"kind\":\"singleType\",\"info\":{\"name\":\"Menu\"},\"options\":{\"increments\":true,\"timestamps\":[\"created_at\",\"updated_at\"]},\"attributes\":{\"Body\":{\"type\":\"dynamiczone\",\"components\":[\"menu.link\",\"menu.dropdown\"]},\"created_by\":{\"model\":\"user\",\"plugin\":\"admin\",\"configurable\":false,\"writable\":false,\"private\":true},\"updated_by\":{\"model\":\"user\",\"plugin\":\"admin\",\"configurable\":false,\"writable\":false,\"private\":true}}}','object',NULL,NULL),(100,'model_def_application::page.page','{\"uid\":\"application::page.page\",\"collectionName\":\"pages\",\"kind\":\"collectionType\",\"info\":{\"name\":\"Page\",\"description\":\"\"},\"options\":{\"increments\":true,\"timestamps\":[\"created_at\",\"updated_at\"],\"draftAndPublish\":false},\"attributes\":{\"Title\":{\"type\":\"string\"},\"Body\":{\"type\":\"dynamiczone\",\"components\":[\"sections.section\"]},\"Show_title\":{\"type\":\"boolean\"},\"White_background\":{\"type\":\"boolean\",\"default\":true},\"Slug\":{\"type\":\"uid\",\"targetField\":\"Title\"},\"navigation\":{\"model\":\"navigationitem\",\"plugin\":\"navigation\",\"via\":\"related\",\"configurable\":false,\"hidden\":true},\"created_by\":{\"model\":\"user\",\"plugin\":\"admin\",\"configurable\":false,\"writable\":false,\"visible\":false,\"private\":true},\"updated_by\":{\"model\":\"user\",\"plugin\":\"admin\",\"configurable\":false,\"writable\":false,\"visible\":false,\"private\":true}}}','object',NULL,NULL),(101,'model_def_application::showcase.showcase','{\"uid\":\"application::showcase.showcase\",\"collectionName\":\"showcases\",\"kind\":\"collectionType\",\"info\":{\"name\":\"Showcase\"},\"options\":{\"increments\":true,\"timestamps\":[\"created_at\",\"updated_at\"]},\"attributes\":{\"Title\":{\"type\":\"string\"},\"Description\":{\"type\":\"text\"},\"Image\":{\"model\":\"file\",\"via\":\"related\",\"allowedTypes\":[\"images\",\"files\",\"videos\"],\"plugin\":\"upload\",\"required\":false},\"Content\":{\"type\":\"richtext\"},\"created_by\":{\"model\":\"user\",\"plugin\":\"admin\",\"configurable\":false,\"writable\":false,\"visible\":false,\"private\":true},\"updated_by\":{\"model\":\"user\",\"plugin\":\"admin\",\"configurable\":false,\"writable\":false,\"visible\":false,\"private\":true}}}','object',NULL,NULL),(102,'model_def_application::trial-request.trial-request','{\"uid\":\"application::trial-request.trial-request\",\"collectionName\":\"trial_requests\",\"kind\":\"collectionType\",\"info\":{\"name\":\"Trial request\"},\"options\":{\"increments\":true,\"timestamps\":[\"created_at\",\"updated_at\"]},\"attributes\":{\"Name\":{\"type\":\"string\"},\"Email\":{\"type\":\"email\"},\"Message\":{\"type\":\"text\"},\"created_by\":{\"model\":\"user\",\"plugin\":\"admin\",\"configurable\":false,\"writable\":false,\"visible\":false,\"private\":true},\"updated_by\":{\"model\":\"user\",\"plugin\":\"admin\",\"configurable\":false,\"writable\":false,\"visible\":false,\"private\":true}}}','object',NULL,NULL),(103,'model_def_application::tytyty.tytyty','{\"uid\":\"application::tytyty.tytyty\",\"collectionName\":\"tytyties\",\"kind\":\"collectionType\",\"info\":{\"name\":\"tytyty\"},\"options\":{\"increments\":true,\"timestamps\":[\"created_at\",\"updated_at\"]},\"attributes\":{\"rrr\":{\"type\":\"richtext\"},\"created_by\":{\"model\":\"user\",\"plugin\":\"admin\",\"configurable\":false,\"writable\":false,\"private\":true},\"updated_by\":{\"model\":\"user\",\"plugin\":\"admin\",\"configurable\":false,\"writable\":false,\"private\":true}}}','object',NULL,NULL),(104,'model_def_strapi::webhooks','{\"uid\":\"strapi::webhooks\",\"collectionName\":\"strapi_webhooks\",\"info\":{\"name\":\"Strapi webhooks\",\"description\":\"\"},\"options\":{\"timestamps\":false},\"pluginOptions\":{\"content-manager\":{\"visible\":false},\"content-type-builder\":{\"visible\":false}},\"attributes\":{\"name\":{\"type\":\"string\"},\"url\":{\"type\":\"text\"},\"headers\":{\"type\":\"json\"},\"events\":{\"type\":\"json\"},\"enabled\":{\"type\":\"boolean\"}}}','object',NULL,NULL),(105,'model_def_strapi::permission','{\"uid\":\"strapi::permission\",\"collectionName\":\"strapi_permission\",\"kind\":\"collectionType\",\"info\":{\"name\":\"Permission\",\"description\":\"\"},\"options\":{\"timestamps\":[\"created_at\",\"updated_at\"]},\"pluginOptions\":{\"content-manager\":{\"visible\":false},\"content-type-builder\":{\"visible\":false}},\"attributes\":{\"action\":{\"type\":\"string\",\"minLength\":1,\"configurable\":false,\"required\":true},\"subject\":{\"type\":\"string\",\"minLength\":1,\"configurable\":false,\"required\":false},\"properties\":{\"type\":\"json\",\"configurable\":false,\"required\":false,\"default\":{}},\"conditions\":{\"type\":\"json\",\"configurable\":false,\"required\":false,\"default\":[]},\"role\":{\"configurable\":false,\"model\":\"role\",\"plugin\":\"admin\"}}}','object',NULL,NULL),(106,'model_def_strapi::role','{\"uid\":\"strapi::role\",\"collectionName\":\"strapi_role\",\"kind\":\"collectionType\",\"info\":{\"name\":\"Role\",\"description\":\"\"},\"options\":{\"timestamps\":[\"created_at\",\"updated_at\"]},\"pluginOptions\":{\"content-manager\":{\"visible\":false},\"content-type-builder\":{\"visible\":false}},\"attributes\":{\"name\":{\"type\":\"string\",\"minLength\":1,\"unique\":true,\"configurable\":false,\"required\":true},\"code\":{\"type\":\"string\",\"minLength\":1,\"unique\":true,\"configurable\":false,\"required\":true},\"description\":{\"type\":\"string\",\"configurable\":false},\"users\":{\"configurable\":false,\"collection\":\"user\",\"via\":\"roles\",\"plugin\":\"admin\",\"attribute\":\"user\",\"column\":\"id\",\"isVirtual\":true},\"permissions\":{\"configurable\":false,\"plugin\":\"admin\",\"collection\":\"permission\",\"via\":\"role\",\"isVirtual\":true}}}','object',NULL,NULL),(107,'model_def_strapi::user','{\"uid\":\"strapi::user\",\"collectionName\":\"strapi_administrator\",\"kind\":\"collectionType\",\"info\":{\"name\":\"User\",\"description\":\"\"},\"options\":{\"timestamps\":false},\"pluginOptions\":{\"content-manager\":{\"visible\":false},\"content-type-builder\":{\"visible\":false}},\"attributes\":{\"firstname\":{\"type\":\"string\",\"unique\":false,\"minLength\":1,\"configurable\":false,\"required\":false},\"lastname\":{\"type\":\"string\",\"unique\":false,\"minLength\":1,\"configurable\":false,\"required\":false},\"username\":{\"type\":\"string\",\"unique\":false,\"configurable\":false,\"required\":false},\"email\":{\"type\":\"email\",\"minLength\":6,\"configurable\":false,\"required\":true,\"unique\":true,\"private\":true},\"password\":{\"type\":\"password\",\"minLength\":6,\"configurable\":false,\"required\":false,\"private\":true},\"resetPasswordToken\":{\"type\":\"string\",\"configurable\":false,\"private\":true},\"registrationToken\":{\"type\":\"string\",\"configurable\":false,\"private\":true},\"isActive\":{\"type\":\"boolean\",\"default\":false,\"configurable\":false,\"private\":true},\"roles\":{\"collection\":\"role\",\"collectionName\":\"strapi_users_roles\",\"via\":\"users\",\"dominant\":true,\"plugin\":\"admin\",\"configurable\":false,\"private\":true,\"attribute\":\"role\",\"column\":\"id\",\"isVirtual\":true},\"blocked\":{\"type\":\"boolean\",\"default\":false,\"configurable\":false,\"private\":true},\"preferedLanguage\":{\"type\":\"string\",\"configurable\":false,\"required\":false}}}','object',NULL,NULL),(108,'model_def_plugins::upload.file','{\"uid\":\"plugins::upload.file\",\"collectionName\":\"upload_file\",\"kind\":\"collectionType\",\"info\":{\"name\":\"file\",\"description\":\"\"},\"options\":{\"timestamps\":[\"created_at\",\"updated_at\"]},\"pluginOptions\":{\"content-manager\":{\"visible\":false},\"content-type-builder\":{\"visible\":false}},\"attributes\":{\"name\":{\"type\":\"string\",\"configurable\":false,\"required\":true},\"alternativeText\":{\"type\":\"string\",\"configurable\":false},\"caption\":{\"type\":\"string\",\"configurable\":false},\"width\":{\"type\":\"integer\",\"configurable\":false},\"height\":{\"type\":\"integer\",\"configurable\":false},\"formats\":{\"type\":\"json\",\"configurable\":false},\"hash\":{\"type\":\"string\",\"configurable\":false,\"required\":true},\"ext\":{\"type\":\"string\",\"configurable\":false},\"mime\":{\"type\":\"string\",\"configurable\":false,\"required\":true},\"size\":{\"type\":\"decimal\",\"configurable\":false,\"required\":true},\"url\":{\"type\":\"string\",\"configurable\":false,\"required\":true},\"previewUrl\":{\"type\":\"string\",\"configurable\":false},\"provider\":{\"type\":\"string\",\"configurable\":false,\"required\":true},\"provider_metadata\":{\"type\":\"json\",\"configurable\":false},\"related\":{\"collection\":\"*\",\"filter\":\"field\",\"configurable\":false},\"created_by\":{\"model\":\"user\",\"plugin\":\"admin\",\"configurable\":false,\"writable\":false,\"visible\":false,\"private\":true},\"updated_by\":{\"model\":\"user\",\"plugin\":\"admin\",\"configurable\":false,\"writable\":false,\"visible\":false,\"private\":true}}}','object',NULL,NULL),(109,'model_def_plugins::users-permissions.permission','{\"uid\":\"plugins::users-permissions.permission\",\"collectionName\":\"users-permissions_permission\",\"kind\":\"collectionType\",\"info\":{\"name\":\"permission\",\"description\":\"\"},\"options\":{\"timestamps\":false},\"pluginOptions\":{\"content-manager\":{\"visible\":false}},\"attributes\":{\"type\":{\"type\":\"string\",\"required\":true,\"configurable\":false},\"controller\":{\"type\":\"string\",\"required\":true,\"configurable\":false},\"action\":{\"type\":\"string\",\"required\":true,\"configurable\":false},\"enabled\":{\"type\":\"boolean\",\"required\":true,\"configurable\":false},\"policy\":{\"type\":\"string\",\"configurable\":false},\"role\":{\"model\":\"role\",\"via\":\"permissions\",\"plugin\":\"users-permissions\",\"configurable\":false},\"created_by\":{\"model\":\"user\",\"plugin\":\"admin\",\"configurable\":false,\"writable\":false,\"visible\":false,\"private\":true},\"updated_by\":{\"model\":\"user\",\"plugin\":\"admin\",\"configurable\":false,\"writable\":false,\"visible\":false,\"private\":true}}}','object',NULL,NULL),(110,'model_def_plugins::users-permissions.role','{\"uid\":\"plugins::users-permissions.role\",\"collectionName\":\"users-permissions_role\",\"kind\":\"collectionType\",\"info\":{\"name\":\"role\",\"description\":\"\"},\"options\":{\"timestamps\":false},\"pluginOptions\":{\"content-manager\":{\"visible\":false}},\"attributes\":{\"name\":{\"type\":\"string\",\"minLength\":3,\"required\":true,\"configurable\":false},\"description\":{\"type\":\"string\",\"configurable\":false},\"type\":{\"type\":\"string\",\"unique\":true,\"configurable\":false},\"permissions\":{\"collection\":\"permission\",\"via\":\"role\",\"plugin\":\"users-permissions\",\"configurable\":false,\"isVirtual\":true},\"users\":{\"collection\":\"user\",\"via\":\"role\",\"configurable\":false,\"plugin\":\"users-permissions\",\"isVirtual\":true},\"created_by\":{\"model\":\"user\",\"plugin\":\"admin\",\"configurable\":false,\"writable\":false,\"visible\":false,\"private\":true},\"updated_by\":{\"model\":\"user\",\"plugin\":\"admin\",\"configurable\":false,\"writable\":false,\"visible\":false,\"private\":true}}}','object',NULL,NULL),(111,'model_def_plugins::users-permissions.user','{\"uid\":\"plugins::users-permissions.user\",\"collectionName\":\"users-permissions_user\",\"kind\":\"collectionType\",\"info\":{\"name\":\"user\",\"description\":\"\"},\"options\":{\"draftAndPublish\":false,\"timestamps\":[\"created_at\",\"updated_at\"]},\"attributes\":{\"username\":{\"type\":\"string\",\"minLength\":3,\"unique\":true,\"configurable\":false,\"required\":true},\"email\":{\"type\":\"email\",\"minLength\":6,\"configurable\":false,\"required\":true},\"provider\":{\"type\":\"string\",\"configurable\":false},\"password\":{\"type\":\"password\",\"minLength\":6,\"configurable\":false,\"private\":true},\"resetPasswordToken\":{\"type\":\"string\",\"configurable\":false,\"private\":true},\"confirmationToken\":{\"type\":\"string\",\"configurable\":false,\"private\":true},\"confirmed\":{\"type\":\"boolean\",\"default\":false,\"configurable\":false},\"blocked\":{\"type\":\"boolean\",\"default\":false,\"configurable\":false},\"role\":{\"model\":\"role\",\"via\":\"users\",\"plugin\":\"users-permissions\",\"configurable\":false},\"created_by\":{\"model\":\"user\",\"plugin\":\"admin\",\"configurable\":false,\"writable\":false,\"visible\":false,\"private\":true},\"updated_by\":{\"model\":\"user\",\"plugin\":\"admin\",\"configurable\":false,\"writable\":false,\"visible\":false,\"private\":true}}}','object',NULL,NULL),(112,'model_def_plugins::navigation.audience','{\"uid\":\"plugins::navigation.audience\",\"collectionName\":\"audience\",\"kind\":\"collectionType\",\"info\":{\"name\":\"audience\",\"description\":\"\"},\"options\":{\"increments\":true,\"comment\":\"Audience\",\"timestamps\":false},\"attributes\":{\"name\":{\"type\":\"string\",\"required\":true},\"key\":{\"type\":\"uid\",\"targetField\":\"name\"},\"created_by\":{\"model\":\"user\",\"plugin\":\"admin\",\"configurable\":false,\"writable\":false,\"visible\":false,\"private\":true},\"updated_by\":{\"model\":\"user\",\"plugin\":\"admin\",\"configurable\":false,\"writable\":false,\"visible\":false,\"private\":true}}}','object',NULL,NULL),(113,'model_def_plugins::navigation.navigation','{\"uid\":\"plugins::navigation.navigation\",\"collectionName\":\"navigations\",\"kind\":\"collectionType\",\"info\":{\"name\":\"navigation\",\"description\":\"Navigation container\"},\"options\":{\"increments\":true,\"comment\":\"\",\"timestamps\":false},\"pluginOptions\":{\"content-manager\":{\"visible\":false},\"content-type-builder\":{\"visible\":false}},\"attributes\":{\"name\":{\"type\":\"text\",\"configurable\":false,\"required\":true},\"slug\":{\"type\":\"uid\",\"target\":\"name\",\"configurable\":false,\"required\":true},\"visible\":{\"type\":\"boolean\",\"default\":false,\"configurable\":false},\"items\":{\"collection\":\"navigationitem\",\"plugin\":\"navigation\",\"via\":\"master\",\"configurable\":false,\"isVirtual\":true},\"created_by\":{\"model\":\"user\",\"plugin\":\"admin\",\"configurable\":false,\"writable\":false,\"visible\":false,\"private\":true},\"updated_by\":{\"model\":\"user\",\"plugin\":\"admin\",\"configurable\":false,\"writable\":false,\"visible\":false,\"private\":true}}}','object',NULL,NULL),(114,'model_def_plugins::navigation.navigationitem','{\"uid\":\"plugins::navigation.navigationitem\",\"collectionName\":\"navigations_items\",\"kind\":\"collectionType\",\"info\":{\"name\":\"navigationItem\",\"description\":\"\"},\"options\":{\"increments\":true,\"timestamps\":[\"created_at\",\"updated_at\"],\"comment\":\"Navigation Item\"},\"pluginOptions\":{\"content-manager\":{\"visible\":false},\"content-type-builder\":{\"visible\":false}},\"attributes\":{\"title\":{\"type\":\"text\",\"configurable\":false,\"required\":true},\"type\":{\"type\":\"enumeration\",\"enum\":[\"INTERNAL\",\"EXTERNAL\"],\"default\":\"INTERNAL\",\"configurable\":false},\"path\":{\"type\":\"text\",\"targetField\":\"title\",\"configurable\":false},\"externalPath\":{\"type\":\"text\",\"configurable\":false},\"uiRouterKey\":{\"type\":\"string\",\"configurable\":false},\"menuAttached\":{\"type\":\"boolean\",\"default\":false,\"configurable\":false},\"order\":{\"type\":\"integer\",\"default\":0,\"configurable\":false},\"related\":{\"collection\":\"*\",\"filter\":\"field\",\"configurable\":false},\"parent\":{\"columnName\":\"parent\",\"model\":\"navigationItem\",\"plugin\":\"navigation\",\"configurable\":false,\"default\":null},\"master\":{\"columnName\":\"master\",\"model\":\"navigation\",\"plugin\":\"navigation\",\"configurable\":false},\"audience\":{\"collection\":\"audience\",\"plugin\":\"navigation\",\"attribute\":\"audience\",\"column\":\"id\",\"isVirtual\":true},\"created_by\":{\"model\":\"user\",\"plugin\":\"admin\",\"configurable\":false,\"writable\":false,\"visible\":false,\"private\":true},\"updated_by\":{\"model\":\"user\",\"plugin\":\"admin\",\"configurable\":false,\"writable\":false,\"visible\":false,\"private\":true}}}','object',NULL,NULL),(115,'plugin_content_manager_configuration_content_types::plugins::navigation.audience','{\"uid\":\"plugins::navigation.audience\",\"settings\":{\"bulkable\":true,\"filterable\":true,\"searchable\":true,\"pageSize\":10,\"mainField\":\"name\",\"defaultSortBy\":\"name\",\"defaultSortOrder\":\"ASC\"},\"metadatas\":{\"id\":{\"edit\":{},\"list\":{\"label\":\"Id\",\"searchable\":true,\"sortable\":true}},\"name\":{\"edit\":{\"label\":\"Name\",\"description\":\"\",\"placeholder\":\"\",\"visible\":true,\"editable\":true},\"list\":{\"label\":\"Name\",\"searchable\":true,\"sortable\":true}},\"key\":{\"edit\":{\"label\":\"Key\",\"description\":\"\",\"placeholder\":\"\",\"visible\":true,\"editable\":true},\"list\":{\"label\":\"Key\",\"searchable\":true,\"sortable\":true}}},\"layouts\":{\"list\":[\"id\",\"name\",\"key\"],\"editRelations\":[],\"edit\":[[{\"name\":\"name\",\"size\":6},{\"name\":\"key\",\"size\":6}]]}}','object','',''),(116,'plugin_content_manager_configuration_content_types::plugins::navigation.navigation','{\"uid\":\"plugins::navigation.navigation\",\"settings\":{\"bulkable\":true,\"filterable\":true,\"searchable\":true,\"pageSize\":10,\"mainField\":\"id\",\"defaultSortBy\":\"id\",\"defaultSortOrder\":\"ASC\"},\"metadatas\":{\"id\":{\"edit\":{},\"list\":{\"label\":\"Id\",\"searchable\":true,\"sortable\":true}},\"name\":{\"edit\":{\"label\":\"Name\",\"description\":\"\",\"placeholder\":\"\",\"visible\":true,\"editable\":true},\"list\":{\"label\":\"Name\",\"searchable\":true,\"sortable\":true}},\"slug\":{\"edit\":{\"label\":\"Slug\",\"description\":\"\",\"placeholder\":\"\",\"visible\":true,\"editable\":true},\"list\":{\"label\":\"Slug\",\"searchable\":true,\"sortable\":true}},\"visible\":{\"edit\":{\"label\":\"Visible\",\"description\":\"\",\"placeholder\":\"\",\"visible\":true,\"editable\":true},\"list\":{\"label\":\"Visible\",\"searchable\":true,\"sortable\":true}},\"items\":{\"edit\":{\"label\":\"Items\",\"description\":\"\",\"placeholder\":\"\",\"visible\":true,\"editable\":true,\"mainField\":\"uiRouterKey\"},\"list\":{\"label\":\"Items\",\"searchable\":false,\"sortable\":false}}},\"layouts\":{\"list\":[\"id\",\"name\",\"slug\",\"visible\"],\"editRelations\":[\"items\"],\"edit\":[[{\"name\":\"name\",\"size\":6},{\"name\":\"slug\",\"size\":6}],[{\"name\":\"visible\",\"size\":4}]]}}','object','',''),(117,'plugin_content_manager_configuration_content_types::plugins::navigation.navigationitem','{\"uid\":\"plugins::navigation.navigationitem\",\"settings\":{\"bulkable\":true,\"filterable\":true,\"searchable\":true,\"pageSize\":10,\"mainField\":\"uiRouterKey\",\"defaultSortBy\":\"uiRouterKey\",\"defaultSortOrder\":\"ASC\"},\"metadatas\":{\"id\":{\"edit\":{},\"list\":{\"label\":\"Id\",\"searchable\":true,\"sortable\":true}},\"title\":{\"edit\":{\"label\":\"Title\",\"description\":\"\",\"placeholder\":\"\",\"visible\":true,\"editable\":true},\"list\":{\"label\":\"Title\",\"searchable\":true,\"sortable\":true}},\"type\":{\"edit\":{\"label\":\"Type\",\"description\":\"\",\"placeholder\":\"\",\"visible\":true,\"editable\":true},\"list\":{\"label\":\"Type\",\"searchable\":true,\"sortable\":true}},\"path\":{\"edit\":{\"label\":\"Path\",\"description\":\"\",\"placeholder\":\"\",\"visible\":true,\"editable\":true},\"list\":{\"label\":\"Path\",\"searchable\":true,\"sortable\":true}},\"externalPath\":{\"edit\":{\"label\":\"ExternalPath\",\"description\":\"\",\"placeholder\":\"\",\"visible\":true,\"editable\":true},\"list\":{\"label\":\"ExternalPath\",\"searchable\":true,\"sortable\":true}},\"uiRouterKey\":{\"edit\":{\"label\":\"UiRouterKey\",\"description\":\"\",\"placeholder\":\"\",\"visible\":true,\"editable\":true},\"list\":{\"label\":\"UiRouterKey\",\"searchable\":true,\"sortable\":true}},\"menuAttached\":{\"edit\":{\"label\":\"MenuAttached\",\"description\":\"\",\"placeholder\":\"\",\"visible\":true,\"editable\":true},\"list\":{\"label\":\"MenuAttached\",\"searchable\":true,\"sortable\":true}},\"order\":{\"edit\":{\"label\":\"Order\",\"description\":\"\",\"placeholder\":\"\",\"visible\":true,\"editable\":true},\"list\":{\"label\":\"Order\",\"searchable\":true,\"sortable\":true}},\"related\":{\"edit\":{\"label\":\"Related\",\"description\":\"\",\"placeholder\":\"\",\"visible\":true,\"editable\":true,\"mainField\":\"id\"},\"list\":{\"label\":\"Related\",\"searchable\":false,\"sortable\":false}},\"parent\":{\"edit\":{\"label\":\"Parent\",\"description\":\"\",\"placeholder\":\"\",\"visible\":true,\"editable\":true,\"mainField\":\"uiRouterKey\"},\"list\":{\"label\":\"Parent\",\"searchable\":false,\"sortable\":false}},\"master\":{\"edit\":{\"label\":\"Master\",\"description\":\"\",\"placeholder\":\"\",\"visible\":true,\"editable\":true,\"mainField\":\"id\"},\"list\":{\"label\":\"Master\",\"searchable\":false,\"sortable\":false}},\"audience\":{\"edit\":{\"label\":\"Audience\",\"description\":\"\",\"placeholder\":\"\",\"visible\":true,\"editable\":true,\"mainField\":\"name\"},\"list\":{\"label\":\"Audience\",\"searchable\":false,\"sortable\":false}},\"created_at\":{\"edit\":{\"label\":\"Created_at\",\"description\":\"\",\"placeholder\":\"\",\"visible\":false,\"editable\":true},\"list\":{\"label\":\"Created_at\",\"searchable\":true,\"sortable\":true}},\"updated_at\":{\"edit\":{\"label\":\"Updated_at\",\"description\":\"\",\"placeholder\":\"\",\"visible\":false,\"editable\":true},\"list\":{\"label\":\"Updated_at\",\"searchable\":true,\"sortable\":true}}},\"layouts\":{\"list\":[\"id\",\"title\",\"type\",\"path\"],\"editRelations\":[\"related\",\"parent\",\"master\",\"audience\"],\"edit\":[[{\"name\":\"title\",\"size\":6},{\"name\":\"type\",\"size\":6}],[{\"name\":\"path\",\"size\":6},{\"name\":\"externalPath\",\"size\":6}],[{\"name\":\"uiRouterKey\",\"size\":6},{\"name\":\"menuAttached\",\"size\":4}],[{\"name\":\"order\",\"size\":4}]]}}','object','',''),(118,'model_def_list.logo-list','{\"uid\":\"list.logo-list\",\"collectionName\":\"components_list_logo_lists\",\"info\":{\"name\":\"Logo list\",\"icon\":\"th-list\"},\"options\":{\"timestamps\":false},\"attributes\":{\"Logo\":{\"type\":\"component\",\"repeatable\":true,\"component\":\"list.logo-list-item\"}}}','object',NULL,NULL),(120,'model_def_application::brand-settings.brand-settings','{\"uid\":\"application::brand-settings.brand-settings\",\"collectionName\":\"brand_settings\",\"kind\":\"singleType\",\"info\":{\"name\":\"Brand settings\",\"description\":\"\"},\"options\":{\"increments\":true,\"timestamps\":[\"created_at\",\"updated_at\"],\"draftAndPublish\":false},\"attributes\":{\"empty_search_text\":{\"type\":\"richtext\"},\"empty_search_image\":{\"model\":\"file\",\"via\":\"related\",\"allowedTypes\":[\"images\",\"files\",\"videos\"],\"plugin\":\"upload\",\"required\":false},\"empty_collections_text\":{\"type\":\"richtext\"},\"empty_collections_image\":{\"model\":\"file\",\"via\":\"related\",\"allowedTypes\":[\"images\",\"files\",\"videos\"],\"plugin\":\"upload\",\"required\":false},\"anonymous_search_text\":{\"type\":\"richtext\"},\"anonymous_search_image\":{\"model\":\"file\",\"via\":\"related\",\"allowedTypes\":[\"images\",\"files\",\"videos\"],\"plugin\":\"upload\",\"required\":false},\"created_by\":{\"model\":\"user\",\"plugin\":\"admin\",\"configurable\":false,\"writable\":false,\"visible\":false,\"private\":true},\"updated_by\":{\"model\":\"user\",\"plugin\":\"admin\",\"configurable\":false,\"writable\":false,\"visible\":false,\"private\":true}}}','object',NULL,NULL),(122,'model_def_sections.button-list','{\"uid\":\"sections.button-list\",\"collectionName\":\"components_sections_button_lists\",\"info\":{\"name\":\"Button list\",\"icon\":\"list\"},\"options\":{\"timestamps\":false},\"attributes\":{\"Title\":{\"type\":\"string\"},\"Button_one_title\":{\"type\":\"string\"}}}','object',NULL,NULL),(123,'model_def_sections.news','{\"uid\":\"sections.news\",\"collectionName\":\"components_sections_news\",\"info\":{\"name\":\"News\",\"icon\":\"newspaper\"},\"options\":{\"timestamps\":false},\"attributes\":{\"articles\":{\"collection\":\"article\",\"attribute\":\"article\",\"column\":\"id\",\"isVirtual\":true}}}','object',NULL,NULL),(124,'model_def_sections.sdl-download','{\"uid\":\"sections.sdl-download\",\"collectionName\":\"components_sections_sdl_downloads\",\"info\":{\"name\":\"SDL download\",\"icon\":\"download\"},\"options\":{\"timestamps\":false},\"attributes\":{\"Body\":{\"type\":\"richtext\"}}}','object',NULL,NULL),(125,'model_def_application::article.article','{\"uid\":\"application::article.article\",\"collectionName\":\"articles\",\"kind\":\"collectionType\",\"info\":{\"name\":\"Article\",\"description\":\"\"},\"options\":{\"increments\":true,\"timestamps\":[\"created_at\",\"updated_at\"],\"draftAndPublish\":true},\"attributes\":{\"Title\":{\"type\":\"string\"},\"Content\":{\"type\":\"richtext\"},\"Image\":{\"model\":\"file\",\"via\":\"related\",\"allowedTypes\":[\"images\",\"files\",\"videos\"],\"plugin\":\"upload\",\"required\":false},\"Published_date\":{\"type\":\"date\"},\"Summary\":{\"type\":\"text\"},\"published_at\":{\"type\":\"datetime\",\"configurable\":false,\"writable\":true,\"visible\":false},\"created_by\":{\"model\":\"user\",\"plugin\":\"admin\",\"configurable\":false,\"writable\":false,\"visible\":false,\"private\":true},\"updated_by\":{\"model\":\"user\",\"plugin\":\"admin\",\"configurable\":false,\"writable\":false,\"visible\":false,\"private\":true}}}','object',NULL,NULL),(126,'plugin_content_manager_configuration_content_types::application::article.article','{\"uid\":\"application::article.article\",\"settings\":{\"bulkable\":true,\"filterable\":true,\"searchable\":true,\"pageSize\":10,\"mainField\":\"Title\",\"defaultSortBy\":\"Title\",\"defaultSortOrder\":\"ASC\"},\"metadatas\":{\"id\":{\"edit\":{},\"list\":{\"label\":\"Id\",\"searchable\":true,\"sortable\":true}},\"Title\":{\"edit\":{\"label\":\"Title\",\"description\":\"\",\"placeholder\":\"\",\"visible\":true,\"editable\":true},\"list\":{\"label\":\"Title\",\"searchable\":true,\"sortable\":true}},\"Content\":{\"edit\":{\"label\":\"Content\",\"description\":\"\",\"placeholder\":\"\",\"visible\":true,\"editable\":true},\"list\":{\"label\":\"Content\",\"searchable\":false,\"sortable\":false}},\"Image\":{\"edit\":{\"label\":\"Image\",\"description\":\"\",\"placeholder\":\"\",\"visible\":true,\"editable\":true},\"list\":{\"label\":\"Image\",\"searchable\":false,\"sortable\":false}},\"Published_date\":{\"edit\":{\"label\":\"Published_date\",\"description\":\"\",\"placeholder\":\"\",\"visible\":true,\"editable\":true},\"list\":{\"label\":\"Published_date\",\"searchable\":true,\"sortable\":true}},\"Summary\":{\"edit\":{\"label\":\"Summary\",\"description\":\"\",\"placeholder\":\"\",\"visible\":true,\"editable\":true},\"list\":{\"label\":\"Summary\",\"searchable\":true,\"sortable\":true}},\"created_at\":{\"edit\":{\"label\":\"Created_at\",\"description\":\"\",\"placeholder\":\"\",\"visible\":false,\"editable\":true},\"list\":{\"label\":\"Created_at\",\"searchable\":true,\"sortable\":true}},\"updated_at\":{\"edit\":{\"label\":\"Updated_at\",\"description\":\"\",\"placeholder\":\"\",\"visible\":false,\"editable\":true},\"list\":{\"label\":\"Updated_at\",\"searchable\":true,\"sortable\":true}}},\"layouts\":{\"list\":[\"id\",\"Title\",\"Image\",\"Published_date\"],\"edit\":[[{\"name\":\"Title\",\"size\":6}],[{\"name\":\"Content\",\"size\":12}],[{\"name\":\"Image\",\"size\":6},{\"name\":\"Published_date\",\"size\":4}],[{\"name\":\"Summary\",\"size\":6}]],\"editRelations\":[]}}','object','',''),(129,'plugin_content_manager_configuration_components::sections.news','{\"uid\":\"sections.news\",\"isComponent\":true,\"settings\":{\"bulkable\":true,\"filterable\":true,\"searchable\":true,\"pageSize\":10,\"mainField\":\"id\",\"defaultSortBy\":\"id\",\"defaultSortOrder\":\"ASC\"},\"metadatas\":{\"id\":{\"edit\":{},\"list\":{\"label\":\"Id\",\"searchable\":false,\"sortable\":false}},\"articles\":{\"edit\":{\"label\":\"Articles\",\"description\":\"\",\"placeholder\":\"\",\"visible\":true,\"editable\":true,\"mainField\":\"Title\"},\"list\":{\"label\":\"Articles\",\"searchable\":false,\"sortable\":false}}},\"layouts\":{\"list\":[\"id\"],\"edit\":[[{\"name\":\"articles\",\"size\":6}]],\"editRelations\":[]}}','object','',''),(130,'core_admin_auth','{\"providers\":{\"autoRegister\":false,\"defaultRole\":null}}','object','',''),(131,'plugin_upload_settings','{\"sizeOptimization\":true,\"responsiveDimensions\":true}','object','development','');
/*!40000 ALTER TABLE `core_store` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `landing_pages`
--

DROP TABLE IF EXISTS `landing_pages`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `landing_pages` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `Slug` varchar(255) DEFAULT NULL,
  `Title` varchar(255) DEFAULT NULL,
  `created_by` int(11) DEFAULT NULL,
  `updated_by` int(11) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `News` tinyint(1) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `landing_pages`
--

LOCK TABLES `landing_pages` WRITE;
/*!40000 ALTER TABLE `landing_pages` DISABLE KEYS */;
INSERT INTO `landing_pages` VALUES (1,'home','This has not been easyer',NULL,4,'2020-12-01 08:44:11','2021-06-09 04:42:57',1);
/*!40000 ALTER TABLE `landing_pages` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `landing_pages_components`
--

DROP TABLE IF EXISTS `landing_pages_components`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `landing_pages_components` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `field` varchar(255) NOT NULL,
  `order` int(10) unsigned NOT NULL,
  `component_type` varchar(255) NOT NULL,
  `component_id` int(11) NOT NULL,
  `landing_page_id` int(10) unsigned NOT NULL,
  PRIMARY KEY (`id`),
  KEY `landing_page_id_fk` (`landing_page_id`),
  CONSTRAINT `landing_page_id_fk` FOREIGN KEY (`landing_page_id`) REFERENCES `landing_pages` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `landing_pages_components`
--

LOCK TABLES `landing_pages_components` WRITE;
/*!40000 ALTER TABLE `landing_pages_components` DISABLE KEYS */;
INSERT INTO `landing_pages_components` VALUES (4,'Language',1,'components_meta_languages',2,1),(5,'Body',1,'components_sections_heroes',2,1),(15,'Body',2,'components_landing_sections',13,1);
/*!40000 ALTER TABLE `landing_pages_components` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `menu_dropdowns`
--

DROP TABLE IF EXISTS `menu_dropdowns`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `menu_dropdowns` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `Label` varchar(255) DEFAULT NULL,
  `created_by` int(11) DEFAULT NULL,
  `updated_by` int(11) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `menu_dropdowns`
--

LOCK TABLES `menu_dropdowns` WRITE;
/*!40000 ALTER TABLE `menu_dropdowns` DISABLE KEYS */;
INSERT INTO `menu_dropdowns` VALUES (1,'Integrations',1,1,'2021-03-01 20:25:15','2021-03-01 20:25:15');
/*!40000 ALTER TABLE `menu_dropdowns` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `menu_dropdowns_components`
--

DROP TABLE IF EXISTS `menu_dropdowns_components`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `menu_dropdowns_components` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `field` varchar(255) NOT NULL,
  `order` int(10) unsigned NOT NULL,
  `component_type` varchar(255) NOT NULL,
  `component_id` int(11) NOT NULL,
  `menu_dropdown_id` int(10) unsigned NOT NULL,
  PRIMARY KEY (`id`),
  KEY `menu_dropdown_id_fk` (`menu_dropdown_id`),
  CONSTRAINT `menu_dropdown_id_fk` FOREIGN KEY (`menu_dropdown_id`) REFERENCES `menu_dropdowns` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `menu_dropdowns_components`
--

LOCK TABLES `menu_dropdowns_components` WRITE;
/*!40000 ALTER TABLE `menu_dropdowns_components` DISABLE KEYS */;
INSERT INTO `menu_dropdowns_components` VALUES (1,'Link',1,'components_menu_links',5,1),(2,'Link',2,'components_menu_links',6,1);
/*!40000 ALTER TABLE `menu_dropdowns_components` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `menus`
--

DROP TABLE IF EXISTS `menus`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `menus` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `created_by` int(11) DEFAULT NULL,
  `updated_by` int(11) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `menus`
--

LOCK TABLES `menus` WRITE;
/*!40000 ALTER TABLE `menus` DISABLE KEYS */;
INSERT INTO `menus` VALUES (1,1,1,'2021-02-23 07:13:35','2021-03-03 14:09:58');
/*!40000 ALTER TABLE `menus` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `menus_components`
--

DROP TABLE IF EXISTS `menus_components`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `menus_components` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `field` varchar(255) NOT NULL,
  `order` int(10) unsigned NOT NULL,
  `component_type` varchar(255) NOT NULL,
  `component_id` int(11) NOT NULL,
  `menu_id` int(10) unsigned NOT NULL,
  PRIMARY KEY (`id`),
  KEY `menu_id_fk` (`menu_id`),
  CONSTRAINT `menu_id_fk` FOREIGN KEY (`menu_id`) REFERENCES `menus` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `menus_components`
--

LOCK TABLES `menus_components` WRITE;
/*!40000 ALTER TABLE `menus_components` DISABLE KEYS */;
INSERT INTO `menus_components` VALUES (1,'Body',1,'components_menu_links',1,1),(2,'Body',2,'components_menu_links',2,1),(3,'Body',3,'components_menu_links',3,1);
/*!40000 ALTER TABLE `menus_components` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `navigations`
--

DROP TABLE IF EXISTS `navigations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `navigations` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` longtext NOT NULL,
  `slug` varchar(255) NOT NULL,
  `visible` tinyint(1) DEFAULT NULL,
  `created_by` int(11) DEFAULT NULL,
  `updated_by` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `navigations_slug_unique` (`slug`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `navigations`
--

LOCK TABLES `navigations` WRITE;
/*!40000 ALTER TABLE `navigations` DISABLE KEYS */;
INSERT INTO `navigations` VALUES (1,'Main navigation','main-navigation',1,NULL,1);
/*!40000 ALTER TABLE `navigations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `navigations_items`
--

DROP TABLE IF EXISTS `navigations_items`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `navigations_items` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `title` longtext NOT NULL,
  `type` varchar(255) DEFAULT NULL,
  `path` longtext,
  `externalPath` longtext,
  `uiRouterKey` varchar(255) DEFAULT NULL,
  `menuAttached` tinyint(1) DEFAULT NULL,
  `order` int(11) DEFAULT NULL,
  `parent` int(11) DEFAULT NULL,
  `master` int(11) DEFAULT NULL,
  `created_by` int(11) DEFAULT NULL,
  `updated_by` int(11) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `navigations_items`
--

LOCK TABLES `navigations_items` WRITE;
/*!40000 ALTER TABLE `navigations_items` DISABLE KEYS */;
INSERT INTO `navigations_items` VALUES (1,'Search','INTERNAL','/search',NULL,'search',0,1,NULL,1,1,1,'2021-03-04 11:00:18','2021-06-04 09:11:12'),(2,'Collections','INTERNAL','/collections',NULL,'collections',0,2,NULL,1,1,1,'2021-03-04 11:01:03','2021-06-04 09:11:12'),(3,'Contact us','EXTERNAL','','mailto:term@tilde.com',NULL,0,3,NULL,1,1,1,'2021-03-04 11:01:41','2021-05-26 14:14:28'),(8,'Eurotermbank','INTERNAL','/eurotermbank',NULL,'eurotermbank',0,4,NULL,1,NULL,NULL,'2021-06-04 09:11:12','2021-06-04 09:11:12');
/*!40000 ALTER TABLE `navigations_items` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `navigations_items__audience`
--

DROP TABLE IF EXISTS `navigations_items__audience`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `navigations_items__audience` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `navigations_item_id` int(11) DEFAULT NULL,
  `audience_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `navigations_items__audience`
--

LOCK TABLES `navigations_items__audience` WRITE;
/*!40000 ALTER TABLE `navigations_items__audience` DISABLE KEYS */;
/*!40000 ALTER TABLE `navigations_items__audience` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `navigations_items_morph`
--

DROP TABLE IF EXISTS `navigations_items_morph`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `navigations_items_morph` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `navigations_items_id` int(11) DEFAULT NULL,
  `related_id` int(11) DEFAULT NULL,
  `related_type` longtext,
  `field` longtext,
  `order` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `navigations_items_morph`
--

LOCK TABLES `navigations_items_morph` WRITE;
/*!40000 ALTER TABLE `navigations_items_morph` DISABLE KEYS */;
INSERT INTO `navigations_items_morph` VALUES (11,2,12,'pages','navigation',1),(19,8,7,'pages','navigation',1),(20,1,2,'pages','navigation',1);
/*!40000 ALTER TABLE `navigations_items_morph` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pages`
--

DROP TABLE IF EXISTS `pages`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `pages` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `Title` varchar(255) DEFAULT NULL,
  `created_by` int(11) DEFAULT NULL,
  `updated_by` int(11) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `Show_title` tinyint(1) DEFAULT NULL,
  `White_background` tinyint(1) DEFAULT NULL,
  `Slug` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `pages_slug_unique` (`Slug`)
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pages`
--

LOCK TABLES `pages` WRITE;
/*!40000 ALTER TABLE `pages` DISABLE KEYS */;
INSERT INTO `pages` VALUES (2,'[Terms of use]',1,5,'2021-02-12 06:18:39','2021-06-11 11:36:04',1,0,'terms-of-use'),(7,'[Privacy policy]',1,5,'2021-02-25 05:21:40','2021-06-11 11:28:01',1,NULL,'privacy-policy'),(12,'Eurotermbank',1,1,'2021-05-26 14:46:06','2021-06-10 05:23:42',1,0,'eurotermbank');
/*!40000 ALTER TABLE `pages` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pages_components`
--

DROP TABLE IF EXISTS `pages_components`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `pages_components` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `field` varchar(255) NOT NULL,
  `order` int(10) unsigned NOT NULL,
  `component_type` varchar(255) NOT NULL,
  `component_id` int(11) NOT NULL,
  `page_id` int(10) unsigned NOT NULL,
  PRIMARY KEY (`id`),
  KEY `page_id_fk` (`page_id`),
  CONSTRAINT `page_id_fk` FOREIGN KEY (`page_id`) REFERENCES `pages` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=19 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pages_components`
--

LOCK TABLES `pages_components` WRITE;
/*!40000 ALTER TABLE `pages_components` DISABLE KEYS */;
INSERT INTO `pages_components` VALUES (3,'Language',1,'components_meta_languages',5,2),(4,'Body',1,'components_landing_sections',2,2),(10,'Body',1,'components_landing_sections',6,7),(18,'Body',1,'components_landing_sections',14,12);
/*!40000 ALTER TABLE `pages_components` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `showcases`
--

DROP TABLE IF EXISTS `showcases`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `showcases` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `Title` varchar(255) DEFAULT NULL,
  `Description` longtext,
  `Content` longtext,
  `created_by` int(11) DEFAULT NULL,
  `updated_by` int(11) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `showcases`
--

LOCK TABLES `showcases` WRITE;
/*!40000 ALTER TABLE `showcases` DISABLE KEYS */;
/*!40000 ALTER TABLE `showcases` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `strapi_administrator`
--

DROP TABLE IF EXISTS `strapi_administrator`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `strapi_administrator` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `firstname` varchar(255) DEFAULT NULL,
  `lastname` varchar(255) DEFAULT NULL,
  `username` varchar(255) DEFAULT NULL,
  `email` varchar(255) NOT NULL,
  `password` varchar(255) DEFAULT NULL,
  `resetPasswordToken` varchar(255) DEFAULT NULL,
  `registrationToken` varchar(255) DEFAULT NULL,
  `isActive` tinyint(1) DEFAULT NULL,
  `blocked` tinyint(1) DEFAULT NULL,
  `preferedLanguage` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `strapi_administrator_email_unique` (`email`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `strapi_administrator`
--

LOCK TABLES `strapi_administrator` WRITE;
/*!40000 ALTER TABLE `strapi_administrator` DISABLE KEYS */;
INSERT INTO `strapi_administrator` VALUES (5,'Unsecure','Account',NULL,'unsecure@login.com','$2a$10$fG3xJCWza8DEnzti4D8lgOroealLx/ke6C1yf4X.1/e7BywqM0q9.',NULL,NULL,1,NULL,NULL);
/*!40000 ALTER TABLE `strapi_administrator` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `strapi_permission`
--

DROP TABLE IF EXISTS `strapi_permission`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `strapi_permission` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `action` varchar(255) NOT NULL,
  `subject` varchar(255) DEFAULT NULL,
  `fields` longtext,
  `conditions` longtext,
  `role` int(11) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `properties` longtext,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=266 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `strapi_permission`
--

LOCK TABLES `strapi_permission` WRITE;
/*!40000 ALTER TABLE `strapi_permission` DISABLE KEYS */;
INSERT INTO `strapi_permission` VALUES (9,'plugins::upload.read',NULL,NULL,'[]',2,'2020-10-15 06:46:45','2021-06-03 06:15:49','{\"fields\":null}'),(10,'plugins::upload.assets.create',NULL,NULL,'[]',2,'2020-10-15 06:46:45','2021-06-03 06:15:49','{\"fields\":null}'),(11,'plugins::upload.assets.update',NULL,NULL,'[]',2,'2020-10-15 06:46:45','2021-06-03 06:15:49','{\"fields\":null}'),(12,'plugins::upload.assets.download',NULL,NULL,'[]',2,'2020-10-15 06:46:45','2021-06-03 06:15:49','{\"fields\":null}'),(13,'plugins::upload.assets.copy-link',NULL,NULL,'[]',2,'2020-10-15 06:46:45','2021-06-03 06:15:49','{\"fields\":null}'),(14,'plugins::content-manager.explorer.create','application::landing-page.landing-page','[\"Language\",\"Slug\"]','[\"admin::is-creator\"]',3,'2020-10-15 06:46:45','2021-06-04 09:44:58','{\"fields\":[\"Slug\"]}'),(15,'plugins::content-manager.explorer.update','application::landing-page.landing-page','[\"Language\",\"Slug\"]','[\"admin::is-creator\"]',3,'2020-10-15 06:46:45','2021-06-04 09:44:58','{\"fields\":[\"Slug\"]}'),(16,'plugins::upload.assets.create',NULL,NULL,'[]',3,'2020-10-15 06:46:45','2021-06-03 06:15:49','{\"fields\":null}'),(20,'plugins::upload.read',NULL,NULL,'[\"admin::is-creator\"]',3,'2020-10-15 06:46:45','2021-06-03 06:15:49','{\"fields\":null}'),(21,'plugins::content-manager.explorer.delete','application::landing-page.landing-page',NULL,'[\"admin::is-creator\"]',3,'2020-10-15 06:46:45','2021-06-03 06:15:49','{\"fields\":null}'),(22,'plugins::content-manager.explorer.read','application::landing-page.landing-page','[\"Language\",\"Slug\"]','[\"admin::is-creator\"]',3,'2020-10-15 06:46:45','2021-06-04 09:44:58','{\"fields\":[\"Slug\"]}'),(24,'plugins::upload.assets.update',NULL,NULL,'[\"admin::is-creator\"]',3,'2020-10-15 06:46:45','2021-06-03 06:15:49','{\"fields\":null}'),(25,'plugins::upload.assets.download',NULL,NULL,'[]',3,'2020-10-15 06:46:45','2021-06-03 06:15:49','{\"fields\":null}'),(26,'plugins::upload.assets.copy-link',NULL,NULL,'[]',3,'2020-10-15 06:46:45','2021-06-03 06:15:49','{\"fields\":null}'),(109,'plugins::content-manager.explorer.create','plugins::navigation.audience','[\"name\",\"key\"]','[]',1,'2021-03-04 10:35:54','2021-06-03 06:15:49','{\"fields\":[\"name\",\"key\"]}'),(111,'plugins::content-manager.explorer.read','plugins::navigation.audience','[\"name\",\"key\"]','[]',1,'2021-03-04 10:35:54','2021-06-03 06:15:49','{\"fields\":[\"name\",\"key\"]}'),(114,'plugins::content-manager.explorer.update','plugins::navigation.audience','[\"name\",\"key\"]','[]',1,'2021-03-04 10:35:54','2021-06-03 06:15:49','{\"fields\":[\"name\",\"key\"]}'),(122,'plugins::content-manager.explorer.create','application::landing-page.landing-page','[\"Body\",\"Language.Language\",\"Slug\"]','[]',2,'2021-03-04 10:53:29','2021-06-04 09:44:58','{\"fields\":[\"Slug\",\"Body\"]}'),(123,'plugins::content-manager.explorer.read','application::landing-page.landing-page','[\"Body\",\"Language.Language\",\"Slug\"]','[]',2,'2021-03-04 10:53:29','2021-06-04 09:44:58','{\"fields\":[\"Slug\",\"Body\"]}'),(124,'plugins::content-manager.explorer.delete','application::landing-page.landing-page',NULL,'[]',2,'2021-03-04 10:53:29','2021-06-03 06:15:49','{\"fields\":null}'),(125,'plugins::content-manager.explorer.update','application::landing-page.landing-page','[\"Body\",\"Language.Language\",\"Slug\"]','[]',2,'2021-03-04 10:53:29','2021-06-04 09:44:58','{\"fields\":[\"Slug\",\"Body\"]}'),(126,'plugins::content-manager.explorer.delete','application::page.page',NULL,'[]',2,'2021-03-04 10:53:43','2021-06-03 06:15:49','{\"fields\":null}'),(127,'plugins::content-manager.explorer.create','application::page.page','[\"Body\",\"Language.Language\",\"Show_title\",\"Title\"]','[]',2,'2021-03-04 10:53:43','2021-06-04 09:44:58','{\"fields\":[\"Title\",\"Body\",\"Show_title\"]}'),(128,'plugins::content-manager.explorer.update','application::page.page','[\"Body\",\"Language.Language\",\"Show_title\",\"Title\"]','[]',2,'2021-03-04 10:53:43','2021-06-04 09:44:58','{\"fields\":[\"Title\",\"Body\",\"Show_title\"]}'),(129,'plugins::content-manager.explorer.read','application::page.page','[\"Body\",\"Language.Language\",\"Show_title\",\"Title\"]','[]',2,'2021-03-04 10:53:43','2021-06-04 09:44:58','{\"fields\":[\"Title\",\"Body\",\"Show_title\"]}'),(141,'plugins::content-manager.explorer.create','application::article.article','[\"Title\",\"Content\",\"Image\",\"Published_date\",\"Summary\"]','[]',1,'2021-05-25 14:40:34','2021-06-03 06:15:49','{\"fields\":[\"Title\",\"Content\",\"Image\",\"Published_date\",\"Summary\"]}'),(143,'plugins::content-manager.explorer.update','application::article.article','[\"Title\",\"Content\",\"Image\",\"Published_date\",\"Summary\"]','[]',1,'2021-05-25 14:40:34','2021-06-03 06:15:49','{\"fields\":[\"Title\",\"Content\",\"Image\",\"Published_date\",\"Summary\"]}'),(144,'plugins::content-manager.explorer.read','application::article.article','[\"Title\",\"Content\",\"Image\",\"Published_date\",\"Summary\"]','[]',1,'2021-05-25 14:40:34','2021-06-03 06:15:49','{\"fields\":[\"Title\",\"Content\",\"Image\",\"Published_date\",\"Summary\"]}'),(150,'plugins::content-manager.explorer.read','plugins::users-permissions.user',NULL,'[]',1,'2021-06-03 06:15:53','2021-06-03 06:15:53','{\"fields\":[\"username\",\"email\",\"provider\",\"password\",\"resetPasswordToken\",\"confirmationToken\",\"confirmed\",\"blocked\",\"role\"]}'),(152,'plugins::content-manager.explorer.create','plugins::users-permissions.user',NULL,'[]',1,'2021-06-03 06:15:53','2021-06-03 06:15:53','{\"fields\":[\"username\",\"email\",\"provider\",\"password\",\"resetPasswordToken\",\"confirmationToken\",\"confirmed\",\"blocked\",\"role\"]}'),(154,'plugins::content-manager.explorer.update','plugins::users-permissions.user',NULL,'[]',1,'2021-06-03 06:15:53','2021-06-03 06:15:53','{\"fields\":[\"username\",\"email\",\"provider\",\"password\",\"resetPasswordToken\",\"confirmationToken\",\"confirmed\",\"blocked\",\"role\"]}'),(161,'plugins::upload.read',NULL,NULL,'[]',1,'2021-06-03 06:15:53','2021-06-03 06:15:53','{}'),(165,'plugins::upload.assets.update',NULL,NULL,'[]',1,'2021-06-03 06:15:53','2021-06-03 06:15:53','{}'),(166,'plugins::email.settings.read',NULL,NULL,'[]',1,'2021-06-03 06:15:53','2021-06-03 06:15:53','{}'),(167,'plugins::content-type-builder.read',NULL,NULL,'[]',1,'2021-06-03 06:15:53','2021-06-03 06:15:53','{}'),(168,'plugins::upload.assets.create',NULL,NULL,'[]',1,'2021-06-03 06:15:53','2021-06-03 06:15:53','{}'),(169,'plugins::upload.assets.download',NULL,NULL,'[]',1,'2021-06-03 06:15:53','2021-06-03 06:15:53','{}'),(170,'plugins::upload.assets.copy-link',NULL,NULL,'[]',1,'2021-06-03 06:15:53','2021-06-03 06:15:53','{}'),(171,'plugins::upload.settings.read',NULL,NULL,'[]',1,'2021-06-03 06:15:53','2021-06-03 06:15:53','{}'),(172,'plugins::users-permissions.roles.create',NULL,NULL,'[]',1,'2021-06-03 06:15:53','2021-06-03 06:15:53','{}'),(173,'plugins::content-manager.collection-types.configure-view',NULL,NULL,'[]',1,'2021-06-03 06:15:53','2021-06-03 06:15:53','{}'),(174,'plugins::content-manager.components.configure-layout',NULL,NULL,'[]',1,'2021-06-03 06:15:53','2021-06-03 06:15:53','{}'),(175,'plugins::content-manager.single-types.configure-view',NULL,NULL,'[]',1,'2021-06-03 06:15:53','2021-06-03 06:15:53','{}'),(176,'plugins::navigation.read',NULL,NULL,'[]',1,'2021-06-03 06:15:53','2021-06-03 06:15:53','{}'),(177,'plugins::navigation.update',NULL,NULL,'[]',1,'2021-06-03 06:15:53','2021-06-03 06:15:53','{}'),(178,'plugins::users-permissions.roles.update',NULL,NULL,'[]',1,'2021-06-03 06:15:53','2021-06-03 06:15:53','{}'),(179,'plugins::users-permissions.roles.read',NULL,NULL,'[]',1,'2021-06-03 06:15:53','2021-06-03 06:15:53','{}'),(180,'plugins::users-permissions.roles.delete',NULL,NULL,'[]',1,'2021-06-03 06:15:53','2021-06-03 06:15:53','{}'),(181,'plugins::users-permissions.providers.read',NULL,NULL,'[]',1,'2021-06-03 06:15:53','2021-06-03 06:15:53','{}'),(182,'plugins::users-permissions.providers.update',NULL,NULL,'[]',1,'2021-06-03 06:15:53','2021-06-03 06:15:53','{}'),(183,'plugins::users-permissions.email-templates.update',NULL,NULL,'[]',1,'2021-06-03 06:15:53','2021-06-03 06:15:53','{}'),(184,'plugins::users-permissions.email-templates.read',NULL,NULL,'[]',1,'2021-06-03 06:15:53','2021-06-03 06:15:53','{}'),(185,'plugins::users-permissions.advanced-settings.read',NULL,NULL,'[]',1,'2021-06-03 06:15:53','2021-06-03 06:15:53','{}'),(186,'admin::marketplace.read',NULL,NULL,'[]',1,'2021-06-03 06:15:53','2021-06-03 06:15:53','{}'),(187,'plugins::users-permissions.advanced-settings.update',NULL,NULL,'[]',1,'2021-06-03 06:15:53','2021-06-03 06:15:53','{}'),(188,'admin::marketplace.plugins.install',NULL,NULL,'[]',1,'2021-06-03 06:15:53','2021-06-03 06:15:53','{}'),(189,'admin::marketplace.plugins.uninstall',NULL,NULL,'[]',1,'2021-06-03 06:15:53','2021-06-03 06:15:53','{}'),(190,'admin::webhooks.read',NULL,NULL,'[]',1,'2021-06-03 06:15:53','2021-06-03 06:15:53','{}'),(191,'admin::webhooks.create',NULL,NULL,'[]',1,'2021-06-03 06:15:53','2021-06-03 06:15:53','{}'),(192,'admin::webhooks.update',NULL,NULL,'[]',1,'2021-06-03 06:15:53','2021-06-03 06:15:53','{}'),(193,'admin::users.create',NULL,NULL,'[]',1,'2021-06-03 06:15:53','2021-06-03 06:15:53','{}'),(194,'admin::webhooks.delete',NULL,NULL,'[]',1,'2021-06-03 06:15:53','2021-06-03 06:15:53','{}'),(195,'admin::users.read',NULL,NULL,'[]',1,'2021-06-03 06:15:53','2021-06-03 06:15:53','{}'),(196,'admin::users.update',NULL,NULL,'[]',1,'2021-06-03 06:15:53','2021-06-03 06:15:53','{}'),(197,'admin::users.delete',NULL,NULL,'[]',1,'2021-06-03 06:15:53','2021-06-03 06:15:53','{}'),(198,'admin::roles.create',NULL,NULL,'[]',1,'2021-06-03 06:15:53','2021-06-03 06:15:53','{}'),(199,'admin::roles.read',NULL,NULL,'[]',1,'2021-06-03 06:15:53','2021-06-03 06:15:53','{}'),(200,'admin::roles.update',NULL,NULL,'[]',1,'2021-06-03 06:15:53','2021-06-03 06:15:53','{}'),(201,'admin::roles.delete',NULL,NULL,'[]',1,'2021-06-03 06:15:53','2021-06-03 06:15:53','{}'),(254,'plugins::content-manager.explorer.create','application::landing-page.landing-page',NULL,'[]',1,'2021-06-11 11:39:16','2021-06-11 11:39:16','{\"fields\":[\"Slug\",\"Body\",\"News\"]}'),(255,'plugins::content-manager.explorer.create','application::page.page',NULL,'[]',1,'2021-06-11 11:39:16','2021-06-11 11:39:16','{\"fields\":[\"Title\",\"Body\",\"Show_title\",\"White_background\",\"Slug\",\"navigation\"]}'),(256,'plugins::content-manager.explorer.read','application::landing-page.landing-page',NULL,'[]',1,'2021-06-11 11:39:16','2021-06-11 11:39:16','{\"fields\":[\"Slug\",\"Body\",\"News\"]}'),(257,'plugins::content-manager.explorer.read','application::page.page',NULL,'[]',1,'2021-06-11 11:39:16','2021-06-11 11:39:16','{\"fields\":[\"Title\",\"Body\",\"Show_title\",\"White_background\",\"Slug\",\"navigation\"]}'),(258,'plugins::content-manager.explorer.update','application::landing-page.landing-page',NULL,'[]',1,'2021-06-11 11:39:16','2021-06-11 11:39:16','{\"fields\":[\"Slug\",\"Body\",\"News\"]}'),(259,'plugins::content-manager.explorer.update','application::page.page',NULL,'[]',1,'2021-06-11 11:39:16','2021-06-11 11:39:16','{\"fields\":[\"Title\",\"Body\",\"Show_title\",\"White_background\",\"Slug\",\"navigation\"]}'),(260,'plugins::content-manager.explorer.delete','application::article.article',NULL,'[]',1,'2021-06-11 11:39:16','2021-06-11 11:39:16','{}'),(261,'plugins::content-manager.explorer.delete','application::landing-page.landing-page',NULL,'[]',1,'2021-06-11 11:39:16','2021-06-11 11:39:16','{}'),(262,'plugins::content-manager.explorer.delete','application::page.page',NULL,'[]',1,'2021-06-11 11:39:16','2021-06-11 11:39:16','{}'),(263,'plugins::content-manager.explorer.delete','plugins::navigation.audience',NULL,'[]',1,'2021-06-11 11:39:16','2021-06-11 11:39:16','{}'),(264,'plugins::content-manager.explorer.delete','plugins::users-permissions.user',NULL,'[]',1,'2021-06-11 11:39:16','2021-06-11 11:39:16','{}'),(265,'plugins::content-manager.explorer.publish','application::article.article',NULL,'[]',1,'2021-06-11 11:39:16','2021-06-11 11:39:16','{}');
/*!40000 ALTER TABLE `strapi_permission` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `strapi_role`
--

DROP TABLE IF EXISTS `strapi_role`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `strapi_role` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `code` varchar(255) NOT NULL,
  `description` varchar(255) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `strapi_role_name_unique` (`name`),
  UNIQUE KEY `strapi_role_code_unique` (`code`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `strapi_role`
--

LOCK TABLES `strapi_role` WRITE;
/*!40000 ALTER TABLE `strapi_role` DISABLE KEYS */;
INSERT INTO `strapi_role` VALUES (1,'Super Admin','strapi-super-admin','Super Admins can access and manage all features and settings.','2020-10-15 06:46:45','2020-10-15 06:46:45'),(2,'Editor','strapi-editor','Editors can manage and publish contents including those of other users.','2020-10-15 06:46:45','2020-10-15 06:46:45'),(3,'Author','strapi-author','Authors can manage and publish the content they created.','2020-10-15 06:46:45','2020-10-15 06:46:45');
/*!40000 ALTER TABLE `strapi_role` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `strapi_users_roles`
--

DROP TABLE IF EXISTS `strapi_users_roles`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `strapi_users_roles` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `user_id` int(11) DEFAULT NULL,
  `role_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `strapi_users_roles`
--

LOCK TABLES `strapi_users_roles` WRITE;
/*!40000 ALTER TABLE `strapi_users_roles` DISABLE KEYS */;
INSERT INTO `strapi_users_roles` VALUES (7,5,1);
/*!40000 ALTER TABLE `strapi_users_roles` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `strapi_webhooks`
--

DROP TABLE IF EXISTS `strapi_webhooks`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `strapi_webhooks` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) DEFAULT NULL,
  `url` longtext,
  `headers` longtext,
  `events` longtext,
  `enabled` tinyint(1) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `strapi_webhooks`
--

LOCK TABLES `strapi_webhooks` WRITE;
/*!40000 ALTER TABLE `strapi_webhooks` DISABLE KEYS */;
/*!40000 ALTER TABLE `strapi_webhooks` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `terms_and_conditions`
--

DROP TABLE IF EXISTS `terms_and_conditions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `terms_and_conditions` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `Title` varchar(255) DEFAULT NULL,
  `created_by` int(11) DEFAULT NULL,
  `updated_by` int(11) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `terms_and_conditions`
--

LOCK TABLES `terms_and_conditions` WRITE;
/*!40000 ALTER TABLE `terms_and_conditions` DISABLE KEYS */;
/*!40000 ALTER TABLE `terms_and_conditions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `terms_and_conditions_components`
--

DROP TABLE IF EXISTS `terms_and_conditions_components`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `terms_and_conditions_components` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `field` varchar(255) NOT NULL,
  `order` int(10) unsigned NOT NULL,
  `component_type` varchar(255) NOT NULL,
  `component_id` int(11) NOT NULL,
  `terms_and_condition_id` int(10) unsigned NOT NULL,
  PRIMARY KEY (`id`),
  KEY `terms_and_condition_id_fk` (`terms_and_condition_id`),
  CONSTRAINT `terms_and_condition_id_fk` FOREIGN KEY (`terms_and_condition_id`) REFERENCES `terms_and_conditions` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `terms_and_conditions_components`
--

LOCK TABLES `terms_and_conditions_components` WRITE;
/*!40000 ALTER TABLE `terms_and_conditions_components` DISABLE KEYS */;
/*!40000 ALTER TABLE `terms_and_conditions_components` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `top_menus`
--

DROP TABLE IF EXISTS `top_menus`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `top_menus` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `created_by` int(11) DEFAULT NULL,
  `updated_by` int(11) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `top_menus`
--

LOCK TABLES `top_menus` WRITE;
/*!40000 ALTER TABLE `top_menus` DISABLE KEYS */;
/*!40000 ALTER TABLE `top_menus` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `top_menus_components`
--

DROP TABLE IF EXISTS `top_menus_components`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `top_menus_components` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `field` varchar(255) NOT NULL,
  `order` int(10) unsigned NOT NULL,
  `component_type` varchar(255) NOT NULL,
  `component_id` int(11) NOT NULL,
  `top_menu_id` int(10) unsigned NOT NULL,
  PRIMARY KEY (`id`),
  KEY `top_menu_id_fk` (`top_menu_id`),
  CONSTRAINT `top_menu_id_fk` FOREIGN KEY (`top_menu_id`) REFERENCES `top_menus` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `top_menus_components`
--

LOCK TABLES `top_menus_components` WRITE;
/*!40000 ALTER TABLE `top_menus_components` DISABLE KEYS */;
/*!40000 ALTER TABLE `top_menus_components` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `trial_requests`
--

DROP TABLE IF EXISTS `trial_requests`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `trial_requests` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `Name` varchar(255) DEFAULT NULL,
  `Email` varchar(255) DEFAULT NULL,
  `Message` longtext,
  `created_by` int(11) DEFAULT NULL,
  `updated_by` int(11) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=118 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `trial_requests`
--

DROP TABLE IF EXISTS `tytyties`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tytyties` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `rrr` longtext,
  `created_by` int(11) DEFAULT NULL,
  `updated_by` int(11) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tytyties`
--

LOCK TABLES `tytyties` WRITE;
/*!40000 ALTER TABLE `tytyties` DISABLE KEYS */;
/*!40000 ALTER TABLE `tytyties` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `upload_file`
--

DROP TABLE IF EXISTS `upload_file`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `upload_file` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `alternativeText` varchar(255) DEFAULT NULL,
  `caption` varchar(255) DEFAULT NULL,
  `width` int(11) DEFAULT NULL,
  `height` int(11) DEFAULT NULL,
  `formats` longtext,
  `hash` varchar(255) NOT NULL,
  `ext` varchar(255) DEFAULT NULL,
  `mime` varchar(255) NOT NULL,
  `size` decimal(10,2) NOT NULL,
  `url` varchar(255) NOT NULL,
  `previewUrl` varchar(255) DEFAULT NULL,
  `provider` varchar(255) NOT NULL,
  `provider_metadata` longtext,
  `created_by` int(11) DEFAULT NULL,
  `updated_by` int(11) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=58 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `upload_file`
--

LOCK TABLES `upload_file` WRITE;
/*!40000 ALTER TABLE `upload_file` DISABLE KEYS */;
INSERT INTO `upload_file` VALUES (52,'1_illustrations.svg','','',2000,785,NULL,'1_illustrations_61cb520099','.svg','image/svg+xml',243.52,'/uploads/1_illustrations_61cb520099.svg',NULL,'local',NULL,1,1,'2021-05-26 15:01:12','2021-05-26 15:01:12'),(53,'3_illustrations.svg','','',2478,1649,NULL,'3_illustrations_842e5c0d2d','.svg','image/svg+xml',908.11,'/uploads/3_illustrations_842e5c0d2d.svg',NULL,'local',NULL,1,1,'2021-05-26 15:10:53','2021-05-26 15:10:53'),(54,'TTS summer school.png','','',227,222,'{\"thumbnail\":{\"name\":\"thumbnail_TTS summer school.png\",\"hash\":\"thumbnail_TTS_summer_school_bd42e1526b\",\"ext\":\".png\",\"mime\":\"image/png\",\"width\":160,\"height\":156,\"size\":25.79,\"path\":null,\"url\":\"/uploads/thumbnail_TTS_summer_school_bd42e1526b.png\"}}','TTS_summer_school_bd42e1526b','.png','image/png',14.59,'/uploads/TTS_summer_school_bd42e1526b.png',NULL,'local',NULL,1,1,'2021-05-27 04:42:51','2021-05-27 04:42:51'),(55,'Picture 1.png','','',1020,993,'{\"thumbnail\":{\"name\":\"thumbnail_Picture 1.png\",\"hash\":\"thumbnail_Picture_1_5b9cc28df1\",\"ext\":\".png\",\"mime\":\"image/png\",\"width\":160,\"height\":156,\"size\":26.09,\"path\":null,\"url\":\"/uploads/thumbnail_Picture_1_5b9cc28df1.png\"},\"large\":{\"name\":\"large_Picture 1.png\",\"hash\":\"large_Picture_1_5b9cc28df1\",\"ext\":\".png\",\"mime\":\"image/png\",\"width\":1000,\"height\":974,\"size\":387.27,\"path\":null,\"url\":\"/uploads/large_Picture_1_5b9cc28df1.png\"},\"medium\":{\"name\":\"medium_Picture 1.png\",\"hash\":\"medium_Picture_1_5b9cc28df1\",\"ext\":\".png\",\"mime\":\"image/png\",\"width\":750,\"height\":730,\"size\":263.03,\"path\":null,\"url\":\"/uploads/medium_Picture_1_5b9cc28df1.png\"},\"small\":{\"name\":\"small_Picture 1.png\",\"hash\":\"small_Picture_1_5b9cc28df1\",\"ext\":\".png\",\"mime\":\"image/png\",\"width\":500,\"height\":487,\"size\":146.2,\"path\":null,\"url\":\"/uploads/small_Picture_1_5b9cc28df1.png\"}}','Picture_1_5b9cc28df1','.png','image/png',142.20,'/uploads/Picture_1_5b9cc28df1.png',NULL,'local',NULL,1,1,'2021-05-27 04:42:52','2021-05-27 04:42:52'),(56,'EuroTermBank website.png','','',1274,878,'{\"thumbnail\":{\"name\":\"thumbnail_EuroTermBank website.png\",\"hash\":\"thumbnail_Euro_Term_Bank_website_754ef7a5a5\",\"ext\":\".png\",\"mime\":\"image/png\",\"width\":226,\"height\":156,\"size\":31.6,\"path\":null,\"url\":\"/uploads/thumbnail_Euro_Term_Bank_website_754ef7a5a5.png\"},\"large\":{\"name\":\"large_EuroTermBank website.png\",\"hash\":\"large_Euro_Term_Bank_website_754ef7a5a5\",\"ext\":\".png\",\"mime\":\"image/png\",\"width\":1000,\"height\":689,\"size\":280.48,\"path\":null,\"url\":\"/uploads/large_Euro_Term_Bank_website_754ef7a5a5.png\"},\"medium\":{\"name\":\"medium_EuroTermBank website.png\",\"hash\":\"medium_Euro_Term_Bank_website_754ef7a5a5\",\"ext\":\".png\",\"mime\":\"image/png\",\"width\":750,\"height\":517,\"size\":178.83,\"path\":null,\"url\":\"/uploads/medium_Euro_Term_Bank_website_754ef7a5a5.png\"},\"small\":{\"name\":\"small_EuroTermBank website.png\",\"hash\":\"small_Euro_Term_Bank_website_754ef7a5a5\",\"ext\":\".png\",\"mime\":\"image/png\",\"width\":500,\"height\":345,\"size\":97.78,\"path\":null,\"url\":\"/uploads/small_Euro_Term_Bank_website_754ef7a5a5.png\"}}','Euro_Term_Bank_website_754ef7a5a5','.png','image/png',259.85,'/uploads/Euro_Term_Bank_website_754ef7a5a5.png',NULL,'local',NULL,1,1,'2021-05-27 04:42:52','2021-05-27 04:42:52'),(57,'CEF_logo_clear.png','','',1067,149,'{\"thumbnail\":{\"name\":\"thumbnail_CEF_logo_clear.png\",\"hash\":\"thumbnail_CEF_logo_clear_bd0e3e4cb1\",\"ext\":\".png\",\"mime\":\"image/png\",\"width\":245,\"height\":34,\"size\":12.79,\"path\":null,\"url\":\"/uploads/thumbnail_CEF_logo_clear_bd0e3e4cb1.png\"},\"large\":{\"name\":\"large_CEF_logo_clear.png\",\"hash\":\"large_CEF_logo_clear_bd0e3e4cb1\",\"ext\":\".png\",\"mime\":\"image/png\",\"width\":1000,\"height\":140,\"size\":76.76,\"path\":null,\"url\":\"/uploads/large_CEF_logo_clear_bd0e3e4cb1.png\"},\"medium\":{\"name\":\"medium_CEF_logo_clear.png\",\"hash\":\"medium_CEF_logo_clear_bd0e3e4cb1\",\"ext\":\".png\",\"mime\":\"image/png\",\"width\":750,\"height\":105,\"size\":55.07,\"path\":null,\"url\":\"/uploads/medium_CEF_logo_clear_bd0e3e4cb1.png\"},\"small\":{\"name\":\"small_CEF_logo_clear.png\",\"hash\":\"small_CEF_logo_clear_bd0e3e4cb1\",\"ext\":\".png\",\"mime\":\"image/png\",\"width\":500,\"height\":70,\"size\":33.66,\"path\":null,\"url\":\"/uploads/small_CEF_logo_clear_bd0e3e4cb1.png\"}}','CEF_logo_clear_bd0e3e4cb1','.png','image/png',11.69,'/uploads/CEF_logo_clear_bd0e3e4cb1.png',NULL,'local',NULL,1,1,'2021-05-27 06:04:38','2021-05-27 06:04:38');
/*!40000 ALTER TABLE `upload_file` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `upload_file_morph`
--

DROP TABLE IF EXISTS `upload_file_morph`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `upload_file_morph` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `upload_file_id` int(11) DEFAULT NULL,
  `related_id` int(11) DEFAULT NULL,
  `related_type` longtext,
  `field` longtext,
  `order` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=303 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `upload_file_morph`
--

LOCK TABLES `upload_file_morph` WRITE;
/*!40000 ALTER TABLE `upload_file_morph` DISABLE KEYS */;
INSERT INTO `upload_file_morph` VALUES (292,55,1,'articles','Image',1),(293,56,2,'articles','Image',1),(294,54,3,'articles','Image',1),(301,52,2,'components_sections_heroes','Image',1);
/*!40000 ALTER TABLE `upload_file_morph` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `users-permissions_permission`
--

DROP TABLE IF EXISTS `users-permissions_permission`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `users-permissions_permission` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `type` varchar(255) NOT NULL,
  `controller` varchar(255) NOT NULL,
  `action` varchar(255) NOT NULL,
  `enabled` tinyint(1) NOT NULL,
  `policy` varchar(255) DEFAULT NULL,
  `role` int(11) DEFAULT NULL,
  `created_by` int(11) DEFAULT NULL,
  `updated_by` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=351 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users-permissions_permission`
--

LOCK TABLES `users-permissions_permission` WRITE;
/*!40000 ALTER TABLE `users-permissions_permission` DISABLE KEYS */;
INSERT INTO `users-permissions_permission` VALUES (1,'application','landing-page','count',0,'',1,NULL,NULL),(2,'application','landing-page','count',1,'',2,NULL,NULL),(3,'application','landing-page','create',0,'',1,NULL,NULL),(4,'application','landing-page','create',0,'',2,NULL,NULL),(5,'application','landing-page','delete',0,'',1,NULL,NULL),(6,'application','landing-page','delete',0,'',2,NULL,NULL),(7,'application','landing-page','find',0,'',1,NULL,NULL),(8,'application','landing-page','find',1,'',2,NULL,NULL),(9,'application','landing-page','findone',0,'',1,NULL,NULL),(10,'application','landing-page','findone',1,'',2,NULL,NULL),(11,'application','landing-page','update',0,'',1,NULL,NULL),(12,'application','landing-page','update',0,'',2,NULL,NULL),(57,'content-type-builder','builder','getreservednames',0,'',1,NULL,NULL),(58,'content-type-builder','builder','getreservednames',0,'',2,NULL,NULL),(59,'content-type-builder','componentcategories','deletecategory',0,'',1,NULL,NULL),(60,'content-type-builder','componentcategories','deletecategory',0,'',2,NULL,NULL),(61,'content-type-builder','componentcategories','editcategory',0,'',1,NULL,NULL),(62,'content-type-builder','componentcategories','editcategory',0,'',2,NULL,NULL),(63,'content-type-builder','components','createcomponent',0,'',1,NULL,NULL),(64,'content-type-builder','components','createcomponent',0,'',2,NULL,NULL),(65,'content-type-builder','components','deletecomponent',0,'',1,NULL,NULL),(66,'content-type-builder','components','deletecomponent',0,'',2,NULL,NULL),(67,'content-type-builder','components','getcomponent',0,'',1,NULL,NULL),(68,'content-type-builder','components','getcomponent',0,'',2,NULL,NULL),(69,'content-type-builder','components','getcomponents',0,'',1,NULL,NULL),(70,'content-type-builder','components','getcomponents',0,'',2,NULL,NULL),(71,'content-type-builder','components','updatecomponent',0,'',2,NULL,NULL),(72,'content-type-builder','components','updatecomponent',0,'',1,NULL,NULL),(73,'content-type-builder','connections','getconnections',0,'',1,NULL,NULL),(74,'content-type-builder','connections','getconnections',0,'',2,NULL,NULL),(75,'content-type-builder','contenttypes','createcontenttype',0,'',1,NULL,NULL),(76,'content-type-builder','contenttypes','deletecontenttype',0,'',1,NULL,NULL),(77,'content-type-builder','contenttypes','createcontenttype',0,'',2,NULL,NULL),(78,'content-type-builder','contenttypes','deletecontenttype',0,'',2,NULL,NULL),(79,'content-type-builder','contenttypes','getcontenttype',0,'',1,NULL,NULL),(80,'content-type-builder','contenttypes','getcontenttype',0,'',2,NULL,NULL),(81,'content-type-builder','contenttypes','getcontenttypes',0,'',1,NULL,NULL),(82,'content-type-builder','contenttypes','getcontenttypes',0,'',2,NULL,NULL),(83,'content-type-builder','contenttypes','updatecontenttype',0,'',1,NULL,NULL),(84,'content-type-builder','contenttypes','updatecontenttype',0,'',2,NULL,NULL),(85,'email','email','send',0,'',1,NULL,NULL),(88,'email','email','send',0,'',2,NULL,NULL),(93,'upload','upload','count',0,'',1,NULL,NULL),(94,'upload','upload','count',0,'',2,NULL,NULL),(95,'upload','upload','destroy',0,'',2,NULL,NULL),(96,'upload','upload','destroy',0,'',1,NULL,NULL),(97,'upload','upload','find',0,'',1,NULL,NULL),(98,'upload','upload','find',0,'',2,NULL,NULL),(99,'upload','upload','findone',0,'',1,NULL,NULL),(100,'upload','upload','findone',0,'',2,NULL,NULL),(101,'upload','upload','getsettings',0,'',1,NULL,NULL),(102,'upload','upload','getsettings',0,'',2,NULL,NULL),(103,'upload','upload','search',0,'',1,NULL,NULL),(104,'upload','upload','search',0,'',2,NULL,NULL),(105,'upload','upload','updatesettings',0,'',1,NULL,NULL),(106,'upload','upload','updatesettings',0,'',2,NULL,NULL),(107,'upload','upload','upload',0,'',1,NULL,NULL),(108,'upload','upload','upload',0,'',2,NULL,NULL),(109,'users-permissions','auth','callback',0,'',1,NULL,NULL),(110,'users-permissions','auth','callback',1,'',2,NULL,NULL),(111,'users-permissions','auth','connect',1,'',1,NULL,NULL),(112,'users-permissions','auth','connect',1,'',2,NULL,NULL),(113,'users-permissions','auth','emailconfirmation',0,'',1,NULL,NULL),(114,'users-permissions','auth','forgotpassword',0,'',1,NULL,NULL),(115,'users-permissions','auth','emailconfirmation',1,'',2,NULL,NULL),(116,'users-permissions','auth','forgotpassword',1,'',2,NULL,NULL),(117,'users-permissions','auth','register',0,'',1,NULL,NULL),(118,'users-permissions','auth','register',1,'',2,NULL,NULL),(119,'users-permissions','auth','resetpassword',0,'',1,NULL,NULL),(120,'users-permissions','auth','resetpassword',1,'',2,NULL,NULL),(121,'users-permissions','auth','sendemailconfirmation',0,'',1,NULL,NULL),(122,'users-permissions','auth','sendemailconfirmation',0,'',2,NULL,NULL),(123,'users-permissions','user','count',0,'',1,NULL,NULL),(124,'users-permissions','user','count',0,'',2,NULL,NULL),(125,'users-permissions','user','create',0,'',1,NULL,NULL),(126,'users-permissions','user','create',0,'',2,NULL,NULL),(127,'users-permissions','user','destroy',0,'',1,NULL,NULL),(128,'users-permissions','user','destroyall',0,'',1,NULL,NULL),(129,'users-permissions','user','destroy',0,'',2,NULL,NULL),(130,'users-permissions','user','destroyall',0,'',2,NULL,NULL),(131,'users-permissions','user','find',0,'',1,NULL,NULL),(132,'users-permissions','user','find',0,'',2,NULL,NULL),(133,'users-permissions','user','findone',0,'',1,NULL,NULL),(134,'users-permissions','user','findone',0,'',2,NULL,NULL),(135,'users-permissions','user','me',1,'',1,NULL,NULL),(136,'users-permissions','user','me',1,'',2,NULL,NULL),(137,'users-permissions','user','update',0,'',1,NULL,NULL),(138,'users-permissions','user','update',0,'',2,NULL,NULL),(139,'users-permissions','userspermissions','createrole',0,'',1,NULL,NULL),(140,'users-permissions','userspermissions','createrole',0,'',2,NULL,NULL),(141,'users-permissions','userspermissions','deleterole',0,'',1,NULL,NULL),(142,'users-permissions','userspermissions','deleterole',0,'',2,NULL,NULL),(143,'users-permissions','userspermissions','getadvancedsettings',0,'',1,NULL,NULL),(144,'users-permissions','userspermissions','getadvancedsettings',0,'',2,NULL,NULL),(145,'users-permissions','userspermissions','getemailtemplate',0,'',1,NULL,NULL),(146,'users-permissions','userspermissions','getemailtemplate',0,'',2,NULL,NULL),(147,'users-permissions','userspermissions','getpermissions',0,'',1,NULL,NULL),(148,'users-permissions','userspermissions','getpermissions',0,'',2,NULL,NULL),(149,'users-permissions','userspermissions','getpolicies',0,'',1,NULL,NULL),(150,'users-permissions','userspermissions','getpolicies',0,'',2,NULL,NULL),(151,'users-permissions','userspermissions','getproviders',0,'',1,NULL,NULL),(152,'users-permissions','userspermissions','getproviders',0,'',2,NULL,NULL),(153,'users-permissions','userspermissions','getrole',0,'',1,NULL,NULL),(154,'users-permissions','userspermissions','getrole',0,'',2,NULL,NULL),(155,'users-permissions','userspermissions','getroles',0,'',2,NULL,NULL),(156,'users-permissions','userspermissions','getroutes',0,'',1,NULL,NULL),(157,'users-permissions','userspermissions','getroles',0,'',1,NULL,NULL),(158,'users-permissions','userspermissions','getroutes',0,'',2,NULL,NULL),(159,'users-permissions','userspermissions','index',0,'',1,NULL,NULL),(160,'users-permissions','userspermissions','index',0,'',2,NULL,NULL),(161,'users-permissions','userspermissions','searchusers',0,'',1,NULL,NULL),(162,'users-permissions','userspermissions','searchusers',0,'',2,NULL,NULL),(163,'users-permissions','userspermissions','updateadvancedsettings',0,'',1,NULL,NULL),(164,'users-permissions','userspermissions','updateadvancedsettings',0,'',2,NULL,NULL),(165,'users-permissions','userspermissions','updateemailtemplate',0,'',1,NULL,NULL),(166,'users-permissions','userspermissions','updateemailtemplate',0,'',2,NULL,NULL),(167,'users-permissions','userspermissions','updateproviders',0,'',1,NULL,NULL),(168,'users-permissions','userspermissions','updateproviders',0,'',2,NULL,NULL),(169,'users-permissions','userspermissions','updaterole',0,'',1,NULL,NULL),(170,'users-permissions','userspermissions','updaterole',0,'',2,NULL,NULL),(197,'application','page','count',0,'',1,NULL,NULL),(198,'application','page','create',0,'',2,NULL,NULL),(199,'application','page','count',1,'',2,NULL,NULL),(200,'application','page','create',0,'',1,NULL,NULL),(201,'application','page','delete',0,'',1,NULL,NULL),(202,'application','page','find',1,'',2,NULL,NULL),(203,'application','page','find',0,'',1,NULL,NULL),(204,'application','page','delete',0,'',2,NULL,NULL),(205,'application','page','findone',0,'',1,NULL,NULL),(206,'application','page','findone',1,'',2,NULL,NULL),(207,'application','page','update',0,'',1,NULL,NULL),(208,'application','page','update',0,'',2,NULL,NULL),(249,'navigation','navigation','config',0,'',1,NULL,NULL),(250,'navigation','navigation','config',0,'',2,NULL,NULL),(251,'navigation','navigation','get',0,'',1,NULL,NULL),(252,'navigation','navigation','get',1,'',2,NULL,NULL),(253,'navigation','navigation','getbyid',1,'',2,NULL,NULL),(254,'navigation','navigation','getbyid',0,'',1,NULL,NULL),(255,'navigation','navigation','post',0,'',2,NULL,NULL),(256,'navigation','navigation','getservice',0,'',2,NULL,NULL),(257,'navigation','navigation','getservice',0,'',1,NULL,NULL),(258,'navigation','navigation','post',0,'',1,NULL,NULL),(259,'navigation','navigation','put',0,'',1,NULL,NULL),(260,'navigation','navigation','put',0,'',2,NULL,NULL),(261,'navigation','navigation','render',0,'',1,NULL,NULL),(262,'navigation','navigation','render',0,'',2,NULL,NULL),(269,'application','article','count',0,'',1,NULL,NULL),(270,'application','article','count',1,'',2,NULL,NULL),(271,'application','article','create',0,'',1,NULL,NULL),(272,'application','article','delete',0,'',1,NULL,NULL),(273,'application','article','create',0,'',2,NULL,NULL),(274,'application','article','delete',0,'',2,NULL,NULL),(275,'application','article','find',0,'',1,NULL,NULL),(276,'application','article','find',1,'',2,NULL,NULL),(277,'application','article','findone',0,'',1,NULL,NULL),(278,'application','article','findone',1,'',2,NULL,NULL),(279,'application','article','update',0,'',1,NULL,NULL),(280,'application','article','update',0,'',2,NULL,NULL),(281,'content-manager','collection-types','bulkdelete',0,'',1,NULL,NULL),(282,'content-manager','collection-types','delete',0,'',1,NULL,NULL),(283,'content-manager','collection-types','create',0,'',1,NULL,NULL),(284,'content-manager','collection-types','create',0,'',2,NULL,NULL),(285,'content-manager','collection-types','bulkdelete',0,'',2,NULL,NULL),(286,'content-manager','collection-types','find',0,'',1,NULL,NULL),(287,'content-manager','collection-types','find',0,'',2,NULL,NULL),(288,'content-manager','collection-types','delete',0,'',2,NULL,NULL),(289,'content-manager','collection-types','findone',0,'',1,NULL,NULL),(290,'content-manager','collection-types','findone',0,'',2,NULL,NULL),(291,'content-manager','collection-types','previewmanyrelations',0,'',1,NULL,NULL),(292,'content-manager','collection-types','publish',0,'',1,NULL,NULL),(293,'content-manager','collection-types','previewmanyrelations',0,'',2,NULL,NULL),(294,'content-manager','collection-types','unpublish',0,'',1,NULL,NULL),(295,'content-manager','collection-types','publish',0,'',2,NULL,NULL),(296,'content-manager','collection-types','update',0,'',1,NULL,NULL),(297,'content-manager','collection-types','unpublish',0,'',2,NULL,NULL),(298,'content-manager','collection-types','update',0,'',2,NULL,NULL),(299,'content-manager','components','findcomponentconfiguration',0,'',1,NULL,NULL),(300,'content-manager','components','findcomponentconfiguration',0,'',2,NULL,NULL),(301,'content-manager','components','findcomponents',0,'',1,NULL,NULL),(302,'content-manager','components','updatecomponentconfiguration',0,'',1,NULL,NULL),(303,'content-manager','components','findcomponents',0,'',2,NULL,NULL),(304,'content-manager','components','updatecomponentconfiguration',0,'',2,NULL,NULL),(305,'content-manager','content-types','findcontenttypeconfiguration',0,'',1,NULL,NULL),(306,'content-manager','content-types','findcontenttypes',0,'',1,NULL,NULL),(307,'content-manager','content-types','findcontenttypeconfiguration',0,'',2,NULL,NULL),(308,'content-manager','content-types','findcontenttypes',0,'',2,NULL,NULL),(309,'content-manager','content-types','findcontenttypessettings',0,'',2,NULL,NULL),(310,'content-manager','content-types','findcontenttypessettings',0,'',1,NULL,NULL),(311,'content-manager','content-types','updatecontenttypeconfiguration',0,'',2,NULL,NULL),(312,'content-manager','content-types','updatecontenttypeconfiguration',0,'',1,NULL,NULL),(313,'content-manager','relations','find',0,'',1,NULL,NULL),(314,'content-manager','relations','find',0,'',2,NULL,NULL),(315,'content-manager','single-types','createorupdate',0,'',1,NULL,NULL),(316,'content-manager','single-types','createorupdate',0,'',2,NULL,NULL),(317,'content-manager','single-types','delete',0,'',1,NULL,NULL),(318,'content-manager','single-types','delete',0,'',2,NULL,NULL),(319,'content-manager','single-types','find',0,'',2,NULL,NULL),(320,'content-manager','single-types','find',0,'',1,NULL,NULL),(321,'content-manager','single-types','publish',0,'',1,NULL,NULL),(322,'content-manager','single-types','unpublish',0,'',1,NULL,NULL),(323,'content-manager','single-types','publish',0,'',2,NULL,NULL),(324,'content-manager','single-types','unpublish',0,'',2,NULL,NULL),(325,'content-manager','uid','checkuidavailability',0,'',1,NULL,NULL),(326,'content-manager','uid','checkuidavailability',0,'',2,NULL,NULL),(327,'content-manager','uid','generateuid',0,'',1,NULL,NULL),(328,'content-manager','uid','generateuid',0,'',2,NULL,NULL),(329,'email','email','getsettings',0,'',1,NULL,NULL),(330,'email','email','getsettings',0,'',2,NULL,NULL),(331,'email','email','test',0,'',1,NULL,NULL),(332,'email','email','test',0,'',2,NULL,NULL);
/*!40000 ALTER TABLE `users-permissions_permission` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `users-permissions_role`
--

DROP TABLE IF EXISTS `users-permissions_role`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `users-permissions_role` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `description` varchar(255) DEFAULT NULL,
  `type` varchar(255) DEFAULT NULL,
  `created_by` int(11) DEFAULT NULL,
  `updated_by` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `users-permissions_role_type_unique` (`type`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users-permissions_role`
--

LOCK TABLES `users-permissions_role` WRITE;
/*!40000 ALTER TABLE `users-permissions_role` DISABLE KEYS */;
INSERT INTO `users-permissions_role` VALUES (1,'Authenticated','Default role given to authenticated user.','authenticated',NULL,NULL),(2,'Public','Default role given to unauthenticated user.','public',NULL,NULL);
/*!40000 ALTER TABLE `users-permissions_role` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `users-permissions_user`
--

DROP TABLE IF EXISTS `users-permissions_user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `users-permissions_user` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `username` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `provider` varchar(255) DEFAULT NULL,
  `password` varchar(255) DEFAULT NULL,
  `resetPasswordToken` varchar(255) DEFAULT NULL,
  `confirmed` tinyint(1) DEFAULT NULL,
  `blocked` tinyint(1) DEFAULT NULL,
  `role` int(11) DEFAULT NULL,
  `created_by` int(11) DEFAULT NULL,
  `updated_by` int(11) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `confirmationToken` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `users-permissions_user_username_unique` (`username`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;



