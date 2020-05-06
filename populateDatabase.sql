LOCK TABLES `mydb`.`Restaurant` WRITE;
ALTER TABLE `mydb`.`Restaurant` DISABLE KEYS;
INSERT INTO `mydb`.`Restaurant` VALUES (1, '123 street', 'Meatballs', 'www.meatballs.com', '3334423', 'm-f 9-9', 'hotdog, cheeseburger'),(2, '321 St', 'Pizzas', 'www.Pizzas.com', '3353483', 'm-f 12-12', 'pizza'),(3, 'Peach street', 'Subs N More', 'www.sandwiches.com', '9862468', 'Mondays close, T-S 12-9', 'ham and cheese'),(4, 'Main Blvd', 'SushiRolls', 'www.sushi.com', '6583197', 'T-Sat 12-7pm', 'sushi');
ALTER TABLE `restaurant` ENABLE KEYS;
UNLOCK TABLES;

LOCK TABLES mydb.locations WRITE;
ALTER TABLE mydb.locations DISABLE KEYS;
INSERT INTO mydb.locations VALUES (1, 'Park', '123 Part Street', 562.089, 5965.565, 'The pole in the park.'),(2,'Library', '321 Library Street', 62.056, 1645.895, 'Front of library'),(3,'Quad', 'Main Ave', 756.6, 9863.685, 'The grass quad.');
ALTER TABLE mydb.locations ENABLE KEYS;
UNLOCK TABLES;

LOCK TABLES `mydb`.`persons` WRITE;
ALTER TABLE `mydb`.`persons` DISABLE KEYS;
INSERT INTO `mydb`.`persons` VALUES (1, 'Bob', 'bob@uncc.edu', 5719832), (2, 'Joe', 'joe@uncc.edu', 5711234), (3, 'Alice', 'alice@uncc.edu', 5712312), (4, 'John', 'john@uncc.edu', 5748898);
ALTER TABLE `persons` ENABLE KEYS;
UNLOCK TABLES;

LOCK TABLES `mydb`.`driver` WRITE;
ALTER TABLE `mydb`.`driver` DISABLE KEYS;
INSERT INTO `mydb`.`driver` VALUES (1, 0239, STR_TO_DATE('07-25-2012','%m-%d-%Y'), 4, 'dgl0123', 'Nissan', 'Altima', 1, 1), (2, 1289, STR_TO_DATE('08-23-2019','%m-%d-%Y'), 4, 'dgl1223', 'Nissan', 'Rogue', 2, 2);
ALTER TABLE `driver` ENABLE KEYS;
UNLOCK TABLES;

LOCK TABLES `mydb`.`order` WRITE;
ALTER TABLE `mydb`.`order` DISABLE KEYS;
INSERT INTO `mydb`.`order` VALUES (1, 2.20, 2.99, 1, 1, 1, 1), (2, 18.30, 2.99, 3, 2, 1, 1);
ALTER TABLE `order` ENABLE KEYS;
UNLOCK TABLES;

LOCK TABLES `mydb`.`Faculty` WRITE;
ALTER TABLE `mydb`.`Faculty` DISABLE KEYS;
INSERT INTO `mydb`.`Faculty` VALUES ('Librarian', 'masters' , 'engineering', 1), ('Security', 'undergraduate' , 'campus security', 2);
ALTER TABLE `mydb`.`Faculty` ENABLE KEYS;
UNLOCK TABLES;

LOCK TABLES `mydb`.`Student` WRITE;
ALTER TABLE `mydb`.`Student` DISABLE KEYS;
INSERT INTO `mydb`.`Student` VALUES (2020, 'Computer Science', 3),(2021, 'Science', 4);
ALTER TABLE `mydb`.`Student` ENABLE KEYS;
UNLOCK TABLES;

LOCK TABLES `mydb`.`staff` WRITE;
ALTER TABLE `mydb`.`staff` DISABLE KEYS;
INSERT INTO `mydb`.`staff` VALUES (12.4, 1.1, 1, 111),(24.5, 8.2, 2, 222);
ALTER TABLE `mydb`.`staff` ENABLE KEYS;
UNLOCK TABLES;