 /* Pawprint: klft2 */
 /* part 1 */
 INSERT INTO City (ID, Name, CountryCode, District,  Population) VALUES(4081,'Beijing','CHN','Beijing',100);
 /* part 2 */
 
INSERT INTO Country /*Query 2*/
VALUES('LKX','CountryL','Asia','RegionL','10000',NULL,'10000',NULL,NULL,NULL,'LocalNameL','GovernmentFormL',NULL,NULL,'L'),
('XKL','CountryX','Asia','RegionX','10000',NULL,'10000',NULL,NULL,NULL,'LocalNameX','GovernmentFormX',NULL,NULL,'X'),
('KLX','CountryK','Asia','RegionK','10000',NULL,'10000',NULL,NULL,NULL,'LocalNameK','GovernmentFormK',NULL,NULL,'K');
 /* part 3 */
 
 INSERT INTO City VALUES('100','try','CHN','try','10000') ON DUPLICATE KEY UPDATE Name='Try',CountryCode='CHN',District='Try',Population=201;
 

 /* part 4 */
 UPDATE City SET Population = (Population*0.97) WHERE Name LIKE 'D%';
 
 
 /* part 5 */
 UPDATE Country SET Population = (Population*0.9), GovernmentForm = 'Republic' WHERE IndepYear > 1920;
 
 /* part 6 */
ALTER TABLE City ADD FavoriteFood varchar(20) NOT NULL DEFAULT 'cake';
 
 /* part 7 */
 ALTER TABLE City DROP COLUMN FavoriteFood;
 
 
 /* part 8 */
 DELETE FROM CountryLanguage WHERE IsOfficial = 'F';
 /* part 9 */
 TRUNCATE TABLE City;