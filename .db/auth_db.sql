SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";

CREATE TABLE `prousers` (
  `id` int(11) NOT NULL,
  `fname` varchar(255) NOT NULL,
  `username` varchar(255) NOT NULL,
  `password` varchar(255) NOT NULL,
  `pp` varchar(255) NOT NULL DEFAULT 'default-pp.png',
  created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

ALTER TABLE `prousers`
  ADD PRIMARY KEY (`id`);

ALTER TABLE `prousers`
  MODIFY `id` int(100) NOT NULL AUTO_INCREMENT;
COMMIT;


CREATE TABLE `recusers` (
  `user_id` int(11) NOT NULL,
  `fname` varchar(255) NOT NULL,
  `username` varchar(255) NOT NULL,
  `password` varchar(255) NOT NULL,
  `pp` varchar(255) NOT NULL DEFAULT 'default-pp.png',
  created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

ALTER TABLE `recusers`
  ADD PRIMARY KEY (`user_id`);

ALTER TABLE `recusers`
  MODIFY `user_id` int(100) NOT NULL AUTO_INCREMENT;
COMMIT;


CREATE TABLE `giveAdopt` (
  `pet_id` int(100) NOT NULL AUTO_INCREMENT,
  `id` int(11) NOT NULL,
  `petcatagory` varchar(255) NOT NULL,
  `petage` varchar(255) NOT NULL,
  `des` varchar(255) NOT NULL,
  `cinfo` varchar(255) NOT NULL,
  `up` varchar(255) NOT NULL ,
  `created_at` TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`pet_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

ALTER TABLE `giveAdopt`
MODIFY COLUMN `pet_id` int(100) NOT NULL AUTO_INCREMENT;
COMMIT;


CREATE TABLE `productsell` (
  `product_id` int(100) NOT NULL AUTO_INCREMENT,
  `id` int(11) NOT NULL,
  `productcatagory` varchar(255) NOT NULL,
  `productname` varchar(255) NOT NULL,
  `des` varchar(255) NOT NULL,
  `cinfo` varchar(255) NOT NULL,
  `price` varchar(255) NOT NULL,
  `up` varchar(255) NOT NULL ,
  created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`product_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

ALTER TABLE `productsell`
  MODIFY `product_id` int(100) NOT NULL AUTO_INCREMENT;
COMMIT;


CREATE TABLE `cart`(
  `product_id` int(111)NOT NULL AUTO_INCREMENT,
  `user_id1` int(11) NOT NULL,
  created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`product_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

ALTER TABLE `cart`
   MODIFY `product_id` int(100) NOT NULL AUTO_INCREMENT;
COMMIT;


CREATE TABLE `petcart`(
  `pet_id` int(111)NOT NULL,
  `user_id1` int(11) NOT NULL,
  created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`pet_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

ALTER TABLE `petcart`
   MODIFY `pet_id` int(100) NOT NULL AUTO_INCREMENT;
COMMIT;


CREATE TABLE `reportarec` (
  `id` INT NOT NULL,
  `user_id` INT NOT NULL,
  `reportnor` TINYINT(1),
  `created_at` TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`user_id`,`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

ALTER TABLE `reportarec`
  MODIFY `user_id` INT NOT NULL AUTO_INCREMENT;
COMMIT;


CREATE TABLE `reportApro` (
  `id` INT NOT NULL,
  `user_id` INT NOT NULL,
  `reportnop` TINYINT(1),
  `created_at` TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`, `user_id`) -- Composite primary key
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

ALTER TABLE `reportApro`
  MODIFY `id` INT NOT NULL AUTO_INCREMENT;
COMMIT;
 
<!-- notification  
  ALTER TABLE recusers ADD COLUMN last_notification_check DATETIME DEFAULT NULL;
  ALTER TABLE prousers ADD COLUMN last_notification_check DATETIME DEFAULT NULL;

CREATE TABLE vet_hospitals (
    `hosp_id` INT PRIMARY KEY,
    `division` VARCHAR(100) NOT NULL,
    `hosp_name` VARCHAR(255) NOT NULL,
    `location` VARCHAR(255) NOT NULL
); 

insert into vet_hospitals values (1,'Dhaka','Central Veterinary Hospital','https://maps.app.goo.gl/RKA6J4SETrTyd4TT6');
insert into vet_hospitals values (2,'Dhaka','Pet And Bird Care','https://maps.app.goo.gl/n1vM11x5tRzEWwoy9');
insert into vet_hospitals values (3,'Dhaka','Bala G Pet Clinic','https://maps.app.goo.gl/oqcPUvqfxGrZBRKk8');
insert into vet_hospitals values (4,'Dhaka','Dhaka Pet Clinic','https://maps.app.goo.gl/wxseqPavwXpTr3acA');
insert into vet_hospitals values (5,'Dhaka','Pet Care','https://maps.app.goo.gl/FFWARbUXW4KHGahc6');
insert into vet_hospitals values (6,'Dhaka','MediVet Pets Care','https://maps.app.goo.gl/iNtzDHaEaAfBBovj9');
insert into vet_hospitals values (7,'Dhaka','Pet Care & Vet Point','https://maps.app.goo.gl/FFWARbUXW4KHGahc6');
insert into vet_hospitals values (8,'Dhaka','Mirpur Pet Animal Clinic','https://maps.app.goo.gl/PcFM7nu94WUFt5nR8');
insert into vet_hospitals values (9,'Dhaka','Vet Care For Pet','https://maps.app.goo.gl/7Gj3Wy7t5YgdoRu78');
insert into vet_hospitals values (10,'Dhaka','PAW Life Care Mirpur','https://maps.app.goo.gl/c2jPfeYcBF2NPwSRA');
insert into vet_hospitals values (11,'Dhaka','Vet and Pet Care (VNPC)','https://maps.app.goo.gl/BjBXGc46bDLXsTsH6');
insert into vet_hospitals values (12,'Dhaka','AKS Animal Care Centre','https://maps.app.goo.gl/PScwaEyuYZSgNXyU6');
insert into vet_hospitals values (13,'Dhaka','PAW Life Care Lalmatia','https://maps.app.goo.gl/JGzBbtDN78DAmejY6');
insert into vet_hospitals values (14,'Dhaka','Mr. Vet','https://maps.app.goo.gl/bE8mHbwZTMS1PTib6');
insert into vet_hospitals values (15,'Dhaka','Companion Care & Food Accessories','https://maps.app.goo.gl/yNUbHLfpPuUMAKGz8');

insert into vet_hospitals values (16,'Chittagong','S. A. Quaderi Teaching Veterinary Hospital', 'https://maps.app.goo.gl/G46k1H5bNTRdStai8'); 
insert into vet_hospitals values (17,'Chittagong','District Animal Hospital, Chittagong','https://maps.app.goo.gl/3FwAbGzLhSQrggVS7'); 
insert into vet_hospitals values (18,'Chittagong','Vet Clinic','https://maps.app.goo.gl/XUFwKanGD3eYYgQk7'); 
insert into vet_hospitals values (19,'Chittagong','Entity Veterinary Hospital','https://maps.app.goo.gl/gi7Kq2XkU4gSYzUK9'); 
insert into vet_hospitals values (20,'Chittagong','Birds And Pet Animal Clinic','https://maps.app.goo.gl/4XgStstCFgDAmewKA'); 
insert into vet_hospitals values (21,'Chittagong','Happy Tails Pet Care(হ্যাপী টেইলস পেট কেয়ার)','https://maps.app.goo.gl/cZ84Te7UfyWFZUrCA'); 
insert into vet_hospitals values (22,'Chittagong', 'Chattogram Veterinary Lab','https://maps.app.goo.gl/KFr8fo7NPvEzXAWE8'); 
insert into vet_hospitals values (23,'Chittagong','Pet Clinic (Animals clinic)','https://maps.app.goo.gl/Wzp45sfEt6DdGLa48'); 
insert into vet_hospitals values (24,'Chittagong','Advance Vet Care','https://maps.app.goo.gl/fT42AvoqzYMJxBWG7'); 
insert into vet_hospitals values (25,'Chittagong','VET AID, Oxygen, Chattogram','https://maps.app.goo.gl/HKBcXpBnjBvXM1HG6'); 
insert into vet_hospitals values (26,'Chittagong','Vetrilife Veterinary Hospital and Therapy Center','https://maps.app.goo.gl/sBaAZ3XJNhJxn2MR8'); 
insert into vet_hospitals values (27,'Chittagong','Large Animal Unit, SAQTVH','https://maps.app.goo.gl/PwFDz9d1XZYHU9Q69');
insert into vet_hospitals values (28,'Chittagong','Teaching and Training Veterinary Hospital','https://maps.app.goo.gl/ZCctYWvodwLrmPMi6');
insert into vet_hospitals values (29,'Chittagong','Pet Care CTG Foster Home','https://maps.app.goo.gl/vnCCbr7e3DX4qNDi6');
insert into vet_hospitals values (30,'Chittagong','Chittagong Poly Clinic (Pvt) Ltd Poly Hospital','https://maps.app.goo.gl/VgkceDRJgA8X4tyB6');

insert into vet_hospitals values (31,'Rajshahi','Rajshahi Pet Care','https://maps.app.goo.gl/qez3q5THbU2chRoE6');
insert into vet_hospitals values (32,'Rajshahi','Dr.Shazids Pet Clinic' ,'https://maps.app.goo.gl/j4NYRUU8q6pbb7he6');
insert into vet_hospitals values (33,'Rajshahi','Birds & Pet Animal Clinic','https://maps.app.goo.gl/yVc6dxko7wHvfCjt6');
insert into vet_hospitals values (34,'Rajshahi','Veterinary Teaching Hospital, RU','https://maps.app.goo.gl/hpwgLZxxyjfFonqK6');
insert into vet_hospitals values (35,'Rajshahi','Kitty Cat Rajshahi','https://maps.app.goo.gl/beGenXLjcfjcsArd6');
insert into vet_hospitals values (36,'Rajshahi','Three Star Poultry থ্রি স্টার পোল্ট্রি','https://maps.app.goo.gl/9UUpt9vH5WFqRyMP8');
insert into vet_hospitals values (37,'Rajshahi','Model Veterinary Clinic and Research Center','https://maps.app.goo.gl/RAK8BzVABzvbP7zQ8');
insert into vet_hospitals values (38,'Rajshahi','Raninagar Veterinary Hospital','https://maps.app.goo.gl/5thzcYxwXsFbyhuQ8');
insert into vet_hospitals values (39,'Rajshahi','Khadiza veterinary pharmacy','https://maps.app.goo.gl/ybqWywpR2rg7D3RT8');
insert into vet_hospitals values (40,'Rajshahi','Pet 360°','https://maps.app.goo.gl/f6fpxsBXBdUZTs9T7');
insert into vet_hospitals values (41,'Rajshahi','Vet & Pet Care and Cure Rajshahi','https://maps.app.goo.gl/DBrDPf9LemtyAxfE8');

insert into vet_hospitals values (42,'Rangpur','Vet Care Rangpur','https://maps.app.goo.gl/jd9GnACv7qvVh7727');
insert into vet_hospitals values (43,'Rangpur','Veterinary Health Care Clinic','https://maps.app.goo.gl/N1twkNagwduzP8Qi6');
insert into vet_hospitals values (44,'Rangpur','Jela Veterinary Hospital','https://maps.app.goo.gl/EtP9ZRz3qjbn9cKv7');
insert into vet_hospitals values (45,'Rangpur','Upazila Livestock office and Veterinary Hospital, Rangpur Sadar, Rangpur','https://maps.app.goo.gl/zGoj4W3EjvRcfDEd9');

insert into vet_hospitals values (46,'Barishal','Animal Hospital, Barisal','https://maps.app.goo.gl/gcrjqsYvQyoHDLkn7' );
insert into vet_hospitals values (47,'Barishal','Veterinary Hospital, PSTU, Barishal','https://maps.app.goo.gl/96jdrwfuArYnqTxf6');
insert into vet_hospitals values (48,'Barishal','Barisal Sub-District Livestock Department and Veterinary Hospital','https://maps.app.goo.gl/zisgX57YXuakHnA8A');

insert into vet_hospitals values (49,'Sylhet','Sylhet Pet Care (SPC)','https://maps.app.goo.gl/bWg8ny56jj84HUuZ7');
insert into vet_hospitals values (50,'Sylhet','Pulse Pet & Vet Care','https://maps.app.goo.gl/bj4HbKLuygC8UXnL6' );
insert into vet_hospitals values (51,'Sylhet','Vet Care Center, Sylhet','https://maps.app.goo.gl/e7soHwVwBNuNRzaV8' );
insert into vet_hospitals values (52,'Sylhet','Upozila Prani Sompod Office & Haspatal','https://maps.app.goo.gl/mpRYjXT5aPV86stm6' );
insert into vet_hospitals values (53,'Sylhet','PMAC Veterinary Teaching Hospital','https://maps.app.goo.gl/ZBBvA2iTRnKQ8F6z8' );
insert into vet_hospitals values (54,'Sylhet','Vet Care Plus-Sylhet','https://maps.app.goo.gl/3iu6wEpWmX22JWrRA' );

insert into vet_hospitals values (55,'Khulna','Khulna Vet Care','https://maps.app.goo.gl/ndd4n8fCEoqGz6vK6');
insert into vet_hospitals values (56,'Khulna','Doctors Pet Care & Cure','https://maps.app.goo.gl/Etfv3QYx6jCf2ogY9');
insert into vet_hospitals values (57,'Khulna','Vets Care & Consultancy Pet Clinic','https://maps.app.goo.gl/zzYnK7sFFmPewq6r7');
insert into vet_hospitals values (58,'Khulna','Phultala Upzila Goverment Animal Hospital','https://maps.app.goo.gl/5d5Nn27pFVjgET1cA');
insert into vet_hospitals values (59,'Khulna','Birds & Pet Animal Clinic Khulna','https://maps.app.goo.gl/togNEBNVPFm542GD6');
insert into vet_hospitals values (60,'Khulna','Private Veterinary Association(PVA), Moylapota, Khulna','https://maps.app.goo.gl/KThEEQauxkDuNRCm8');
insert into vet_hospitals values (61,'Khulna','Khulna Pet Clinic','https://maps.app.goo.gl/V5yxgemg7fGcAxft5');
insert into vet_hospitals values (62,'Khulna','Doulatpur Veterinary Hospital','https://maps.app.goo.gl/qLXDEBLSNWZoi6sa9');

insert into vet_hospitals values (63,'Mymensingh','Mymensingh Pet Clinic and Research Center','https://maps.app.goo.gl/QXJoetnKnh6DxvYeA');
insert into vet_hospitals values (64,'Mymensingh','Professors Pet Care','https://maps.app.goo.gl/7CXb3sBMhoTrPPGf7');
insert into vet_hospitals values (65,'Mymensingh','Veterinary Teaching Hospital','https://maps.app.goo.gl/bfFLfoAsFCpoApMN9');
insert into vet_hospitals values (66,'Mymensingh','Veterinary Diagnostic Centre and Specialized Pet Clinic','https://maps.app.goo.gl/GDviC7VSk2i2Q8ke7');
insert into vet_hospitals values (67,'Mymensingh','Vet Doctors Corner, Mymensingh -2200','https://maps.app.goo.gl/wJZJKvi9YBCt4CDTA');
insert into vet_hospitals values (68,'Mymensingh','pazila Vetarinary Hospital & Livestock Services, Mymensingh Sadar','https://maps.app.goo.gl/H7LUsWs9bGraCFii9');
insert into vet_hospitals values (69,'Mymensingh','ভেট ডক্টর্স কর্নার, ময়মনসিংহ','https://maps.app.goo.gl/avPrCiJS46U64A1o6');
insert into vet_hospitals values (70,'Mymensingh','গফরগাঁও সরকারি ভেটেরিনারি হাসপাতাল Gaffargaon govt.vet for animal','https://maps.app.goo.gl/zgvQRnee3zqmtNWG7');
insert into vet_hospitals values (71,'Mymensingh','Fulbaria Veterinary Hospital','https://maps.app.goo.gl/JfySYNnBzj6BLxJ86');


CREATE TABLE pet_shops (
    `shop_id` INT PRIMARY KEY,
    `division` VARCHAR(100) NOT NULL,
    `shop_name` VARCHAR(255) NOT NULL,
    `location` VARCHAR(255) NOT NULL
);

  insert into pet_shops values(1,'Dhaka','Billir Dokan','https://maps.app.goo.gl/CKBuyxj63xWoTngp6');
  insert into pet_shops values(2,'Dhaka','PET Stations BD','https://maps.app.goo.gl/H1M5JqebtHrofu8m8');
  insert into pet_shops values(3,'Dhaka','Pet Butler BD','https://maps.app.goo.gl/GEbJQgXPQB7D4N4X9');
  insert into pet_shops values(4,'Dhaka','Vanity Fur Pet Shop','https://maps.app.goo.gl/JKWRdmTPpiSfu1N49');
  insert into pet_shops values(5,'Dhaka','Decent Pet Shop','https://maps.app.goo.gl/L9Utkax8mzxE5ZcK8');
  insert into pet_shops values(6,'Dhaka','Pet Zone BD','https://maps.app.goo.gl/H2Nz2xRyoXWh6tbK8');
  insert into pet_shops values(7,'Dhaka','Sb Pet Shop','https://maps.app.goo.gl/wEwNoVyuLSeqUsHe9');
  insert into pet_shops values(8,'Dhaka','Pet.com.bd','https://maps.app.goo.gl/D1oL13j7pvzXdx6y5');
  insert into pet_shops values(9,'Dhaka','MEW MEW SHOP BD (ADABOR)','https://maps.app.goo.gl/kxFbSf5dPZU7EY3G8');
  insert into pet_shops values(10,'Dhaka','MIRPUR PET GALLERY','https://maps.app.goo.gl/okWS2nmJq237qzco6');
  insert into pet_shops values(11,'Dhaka','ANGRY BIRDS bd pet shop','https://maps.app.goo.gl/4PUSkBunCZ4cwNCVA');
  insert into pet_shops values(12,'Dhaka','Pet Elements BD','https://maps.app.goo.gl/1QqSx4ujXaFyEjb88');
  insert into pet_shops values(13,'Dhaka','Khilgaon Pet Shop','https://maps.app.goo.gl/mXMEFMbCEQrYoCac7');
  insert into pet_shops values(14,'Dhaka','Pet Essentials','https://maps.app.goo.gl/Hg766EdixbVkoewT6');
  insert into pet_shops values(15,'Dhaka','Pet Bangla','https://maps.app.goo.gl/aH8rx4pT7XBUKfk58');


  insert into pet_shops values(16,'Chittagong','Pet City CTG','https://maps.app.goo.gl/7y3xLAXq8bs55HvK8');
  insert into pet_shops values(17,'Chittagong','Soukhin Birds & Aquarium','https://maps.app.goo.gl/XbNkjkYjr24k3vhw9');
  insert into pet_shops values(18,'Chittagong','Miki Pet Store Chittagong Outlet','https://maps.app.goo.gl/d7pgkM6MLCfwJqEN7');
  insert into pet_shops values(19,'Chittagong','Janani Aquarium','https://maps.app.goo.gl/YpqXWSrCtvppbxseA');
  insert into pet_shops values(20,'Chittagong','J.A.M Pigeon And Pet Shop','https://maps.app.goo.gl/EX5tsb4mCsUnkFEy9');
  insert into pet_shops values(21,'Chittagong','Pet Stories','https://maps.app.goo.gl/85GuS2Z2iCS6FJ6d7');
  insert into pet_shops values(22,'Chittagong','Pokkhi Nibash','https://maps.app.goo.gl/ecmaefejp9wF8Ub59');
  insert into pet_shops values(23,'Chittagong','Animal Planet','https://maps.app.goo.gl/wg63Z1QfXn2pZLxg7');
  insert into pet_shops values(24,'Chittagong','Chittagong Zoo Land','https://maps.app.goo.gl/hTHE3UGNDsXoe4Bz6');
  insert into pet_shops values(25,'Chittagong','Aquarium Fish Center','https://maps.app.goo.gl/LATvHqG2zf6GsRRM8');
  insert into pet_shops values(26,'Chittagong','CTG PET MART','https://maps.app.goo.gl/HuRQMNuY776RT5QD8');
  insert into pet_shops values(27,'Chittagong','THE PET ZOO','https://maps.app.goo.gl/gVGsNFjn67kQ1gNj6');
  insert into pet_shops values(28,'Chittagong','Souravs pet' ,'https://maps.app.goo.gl/dq9uYNcWFYVPsWwT6');
  insert into pet_shops values(29,'Chittagong','Z Aquatics','https://maps.app.goo.gl/twbjyzkLhtZz8SCP7');
  insert into pet_shops values(30,'Chittagong','CTG Pet Shop','https://maps.app.goo.gl/vu7dK7bgZouNhdyE6');

  insert into pet_shops values(31,'Rajshahi','Cats Emporium Of Rajshahi','https://maps.app.goo.gl/ek4tgj5Vjw56NRfaA');
  insert into pet_shops values(32,'Rajshahi','Pet World','https://maps.app.goo.gl/hUh2Z6KAUvR3DCb67');
  insert into pet_shops values(33,'Rajshahi','Ocean Bird Palace','https://maps.app.goo.gl/uW3uBWoDpbWG3i7A6');
  insert into pet_shops values(34,'Rajshahi','Tashfins Pet House' ,'https://maps.app.goo.gl/XPYAgexXNodJFgnJ9');
  insert into pet_shops values(35,'Rajshahi','H T Bird Collection', 'https://maps.app.goo.gl/TWM5pCQPiDbp6HC28');
  insert into pet_shops values(36,'Rajshahi','Adorsho Pet Zone','https://maps.app.goo.gl/J8HtNVCbJQv4Vvhx8');
  insert into pet_shops values(37,'Rajshahi','Rony Birds House','https://maps.app.goo.gl/vezKktqDnJq7KSUQ6');
  insert into pet_shops values(38,'Rajshahi','RG Exotic Pet House','https://maps.app.goo.gl/WrFzMigioQEtCsHn6');
  insert into pet_shops values(39,'Rajshahi','ক্ল্যাসিক এ্যাকুরিয়াম & ফিশ সপ','https://maps.app.goo.gl/L7SVG4qsELSWyBw39');
  insert into pet_shops values(40,'Rajshahi','Noyon Birds Corner','https://maps.app.goo.gl/6Ns8oLbgHX1jz3Zc7');
  insert into pet_shops values(41,'Rajshahi','Blue Ocean Aquarium','https://maps.app.goo.gl/ckbMkVFNH97wNgpD7');
  insert into pet_shops values(42,'Rajshahi','Showkhin Pakhi Ghar','https://maps.app.goo.gl/cUqVmydhbfTyU7ar8');
  insert into pet_shops values(43,'Rajshahi','Aquarium Gallery','https://maps.app.goo.gl/seDkoqsCcet2ZW6t8');
  insert into pet_shops values(44,'Rajshahi','Aqua Wonder Rajshahi','https://maps.app.goo.gl/3H56TZYYJrKButBd8');

  insert into pet_shops values(45,'Rangpur','Rangpur Payra Ghar','https://maps.app.goo.gl/F7hACQsMKZX2chdT9');
  insert into pet_shops values(46,'Rangpur','Discovery','https://maps.app.goo.gl/QGAh4f8Y6zt51wi37');
  insert into pet_shops values(47,'Rangpur','RK Pigeon Loft Rangpur','https://maps.app.goo.gl/t9vWSMCz3hKDyQ4E7');
  insert into pet_shops values(48,'Rangpur','Aquamart','https://maps.app.goo.gl/9DKz8dyL6DpeEQ7WA');
  insert into pet_shops values(49,'Rangpur','Fish Paradise','https://maps.app.goo.gl/mYcirkfrMGd2RMFB9');
  insert into pet_shops values(50,'Rangpur','প্রানিঘর রংপুর','https://maps.app.goo.gl/QbFYUB7sqWuAS3po9');
  insert into pet_shops values(51,'Rangpur','Kichir Michir','https://maps.app.goo.gl/xBoZWEEgBCXxNvRX8');

  insert into pet_shops values(52,'Barishal','Barishal Pet Shop','https://maps.app.goo.gl/MeGiz51eJcMuTk9k8');
  insert into pet_shops values(53,'Barishal','J A Birds House','https://maps.app.goo.gl/i2ymAvC5pA3NtTn79');
  insert into pet_shops values(54,'Barishal','Madina Hobby Park','https://maps.app.goo.gl/dxfPCXT8sE6id8ed7');
  insert into pet_shops values(55,'Barishal','Barishal Birds & Aquirium','https://maps.app.goo.gl/fZG6CK1sxB1XC7vU8');
  insert into pet_shops values(56,'Barishal','Birds point Barishal_পাখি পয়েন্ট বরিশাল','https://maps.app.goo.gl/MKZ52kcTc24azu176');
  insert into pet_shops values(57,'Barishal','School Pond','https://maps.app.goo.gl/mgCa4BP7LwU2LrAd7');
  insert into pet_shops values(58,'Barishal','Sayad feed and store product','https://maps.app.goo.gl/xa99uYfpG6UQfdGp7');
  insert into pet_shops values(59,'Barishal','Quality Feeds Limited','https://maps.app.goo.gl/9fsKUHpCGWJon42t5');
  insert into pet_shops values(60,'Barishal','মেসার্স গাজী পোল্ট্রি ফিড','https://maps.app.goo.gl/yrAHRWWy7A9NhMhV9');
  insert into pet_shops values(61,'Barishal','Aquarium Barishal','https://maps.app.goo.gl/euuUaMcpzhiPZHXZA');

  insert into pet_shops values(62,'Sylhet','Pet food store,Sylhet' ,'https://maps.app.goo.gl/zXSRgFGSR6fNY5iBA');
  insert into pet_shops values(63,'Sylhet','Sylhet Pet Shop','https://maps.app.goo.gl/24SztapHQCCwZCuC6');
  insert into pet_shops values(64,'Sylhet','The Pet Lover','https://maps.app.goo.gl/dbtZ2VuUADKtKyry6');
  insert into pet_shops values(65,'Sylhet','Petstory Sylhet','https://maps.app.goo.gl/RwW8dS5izVUgAV9s6');
  insert into pet_shops values(66,'Sylhet','Sylhet fish and pet food','https://maps.app.goo.gl/SGvy1HkKDqsVBdkq6');
  insert into pet_shops values(67,'Sylhet','Love & Hoby World','https://maps.app.goo.gl/xptS8RBrXGQphnFo8');
  insert into pet_shops values(68,'Sylhet','SKF Pigeon Loft Sylhet','https://maps.app.goo.gl/TAh5RsvFYzB6adyP9');
  insert into pet_shops values(69,'Sylhet','SYLHET PAKHI GHOR & Aquarium','https://maps.app.goo.gl/TkvujQZsyym7J3Mn6');
  insert into pet_shops values(70,'Sylhet','Ronggon Aquarium And Birds House','https://maps.app.goo.gl/NuTMjFKuFiGY73YY9');
  insert into pet_shops values(71,'Sylhet','AL Marjan aquarium','https://maps.app.goo.gl/H6nuEJHwy7W5dWfR6');

  insert into pet_shops values(72,'Khulna','Pet And Fish Shop','https://maps.app.goo.gl/rQF4CZ4gWTLnBNPD7');
  insert into pet_shops values(73,'Khulna','Treatos BD','https://maps.app.goo.gl/6rShxNdgqkZtRYNAA');
  insert into pet_shops values(74,'Khulna','Birds & Pet Animal Clinic Khulna','https://maps.app.goo.gl/EybrTHYb6uZsEKq29');
  insert into pet_shops values(75,'Khulna','Aquarium Gallery','https://maps.app.goo.gl/EoocwL47oEA6QmAK9');
  insert into pet_shops values(76,'Khulna','Greenbird Khulna','https://maps.app.goo.gl/85mYxM2A7uq8kpHJ9');
  insert into pet_shops values(77,'Khulna','Fancy Hobbyist','https://maps.app.goo.gl/CHTrFxqffnC8pb2U8');
  insert into pet_shops values(78,'Khulna','Shekh Enterprise','https://maps.app.goo.gl/e9hBrhp5kBW7zhRV6');
  insert into pet_shops values(79,'Khulna','Purrfect Shop','https://maps.app.goo.gl/tVFxd8BJZk1JnMR46');
  insert into pet_shops values(80,'Khulna','Fish & Hobby','https://maps.app.goo.gl/RxNVchTQ21YzkPS99');
  insert into pet_shops values(81,'Khulna','Motsya Mela','https://maps.app.goo.gl/trTfACs3aiMBGHt1A');
  insert into pet_shops values(82,'Khulna','BIRDS FAIR','https://maps.app.goo.gl/uvBMf3aCzcm4r8dM7');
  insert into pet_shops values(83,'Khulna','Haider Pets & Aquarium','https://maps.app.goo.gl/6UR4b3NrtdzffYm49');
  insert into pet_shops values(84,'Khulna','Saad Bird House','https://maps.app.goo.gl/np9URuZ9g12wffDQ7');
  insert into pet_shops values(85,'Khulna','Munna Bird Corner','https://maps.app.goo.gl/VsPt2MCvX4RDMMdR6');
  insert into pet_shops values(86,'Khulna','Anik Bird House','https://maps.app.goo.gl/v1kJkhQRLp7ZoM7C7');
  insert into pet_shops values(87,'Khulna','Raj Hobby','https://maps.app.goo.gl/PNmEEg96iQhKvEDK8');
  insert into pet_shops values(88,'Khulna','Jeeshan Bird House','https://maps.app.goo.gl/qhVgrF8GEJrYwaHg9');


insert into pet_shops VALUES(89, 'Mymensingh', 'Mymensingh Pet Shop', 'https://maps.app.goo.gl/QQr1Hrb3uwZEitsi6');
insert into pet_shops VALUES(90, 'Mymensingh', 'Xiphophorus mymensingh', 'https://maps.app.goo.gl/bC6A2TBRNk7ULfZ7A');
insert into pet_shops VALUES(91, 'Mymensingh', 'Happy Paws', 'https://maps.app.goo.gl/dTSTY8ccoXcoxCPB8');
insert into pet_shops VALUES(92, 'Mymensingh', 'Somudro Bilash', 'https://maps.app.goo.gl/8LFwTXFyXiy3BbaM8');
insert into pet_shops VALUES(93, 'Mymensingh', 'Khan Aviary - খান এভিয়ারী, আকুয়া ময়মনসিংহ', 'https://maps.app.goo.gl/yTvHSGaYAM3AYqQy8');
insert into pet_shops VALUES(94, 'Mymensingh', 'ময়মনসিংহ বার্ড হাউস', 'https://maps.app.goo.gl/r1g2ZUU4LD6oKnuJ6');
insert into pet_shops VALUES(95, 'Mymensingh', 'Amader Shokh - আমাদের শখ পেট শপ, কাঠগোলা বাজার, গলগন্ডা, ময়মনসিংহ', 'https://maps.app.goo.gl/dVU65tP5K6JtEGGk9');
insert into pet_shops VALUES(96, 'Mymensingh', 'Mermaid Aquarium', 'https://maps.app.goo.gl/FVZivx1A4bDQ7vyt6');
insert into pet_shops VALUES(97, 'Mymensingh', 'সৌখিন এ্যাকুরিয়াম হাউজ (১৩৯)', 'https://maps.app.goo.gl/RJdqAnKrTUiB76Wj9');
