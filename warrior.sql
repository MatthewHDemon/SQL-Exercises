 CREATE TABLE Stage (
            id_stage INT AUTO_INCREMENT PRIMARY KEY,
            name_stage VARCHAR(40) UNIQUE NOT NULL,
            id_level
        );


        CREATE TABLE Level (
            id_level INT AUTO_INCREMENT PRIMARY KEY,
            stage VARCHAR(40) UNIQUE NOT NULL,
            enemies_belonging 
        );


        CREATE TABLE Enemy (
            id_enemy INT AUTO_INCREMENT PRIMARY KEY,
            enemy VARCHAR(20) UNIQUE NOT NULL,
            strength DECIMAL UNSIGNED NOT NULL,
            agility DECIMAL UNSIGNED NOT NULL,
            magic DECIMAL UNSIGNED NOT NULL,
            vitality DECIMAL UNSIGNED NOT NULL,
            inventory
        ); 





        CREATE TABLE weapon (
            weapon_id INT PRIMARY KEY,
            weapon_name VARCHAR(40) UNIQUE NOT NULL,
            weapon_damage FLOAT UNSIGNED NOT NULL
        );

        INSERT INTO weapon(
        weapon_id, weapon_name, weapon_damage)
         VALUE
        (101, 'Cuchillo', 1.5),
        (102,'Molotov', 3.5),
        (103,'Hachas', 5.5),
        (104,'Baston magico', 7.5),
        (105,'Metralladora', 9.5);


        CREATE TABLE hability (
            hability_id INT PRIMARY KEY,
            hability_name VARCHAR(50) UNIQUE NOT NULL,
            hability_damage FLOAT UNSIGNED NOT NULL
        );

        INSERT INTO hability(
        hability_id, hability_name, hability_damage)
         VALUE
        (201, '¡Aleteo feroz!', 2.5),
        (202,'¡Martillazo!', 4.5),
        (203,'¡Llvuia de cuchillos!', 6.5),
        (204,'¡Meteoros!', 8.5),
        (205,'¡Fusión nuclear!', 9.9);


         

         INSERT INTO lifeEnchancer(
        lifeEnchancer_id, lifeEnchancer_name, effectiveness)
         VALUE
        (301, 'Potencializador de vida 25%', 2.5),
        (302, 'Potencializador de vida 50%', 5.0),
        (303, 'Potencializador de vida 75%', 7.5),
        (304, 'Potencializador de vida 100%', 10.0);

        CREATE TABLE inventory(
            inventory_id INT PRIMARY KEY,
            FOREIGN KEY (weapon_id) references weapon(weapon_id),
            weapon_id INT NOT NULL,
            FOREIGN KEY (hability_id) references hability(hability_id),
            hability_id INT NOT NULL,
            FOREIGN KEY (lifeEnchancer_id) references lifeEnchancer(lifeEnchancer_id),
            lifeEnchancer_id INT NOT NULL
            );

        INSERT INTO inventory(
        inventory_id, weapon_id, hability_id, lifeEnchancer_id)
         VALUE
        (401, 103, 202, 303),
        (402, 104, 204, 301),
        (403, 102, 201, 304),
        (404, 103, 203, 302),
        (405, 101, 205, 301),
        (406, 105, 205, 303),
        (407, 102, 201, 302),
        (408, 104, 202, 301),
        (409, 101, 203, 301),
        (410, 103, 201, 304);

        CREATE TABLE warrior(
            warrior_id INT PRIMARY KEY,
            warrior_strenght FLOAT UNSIGNED NOT NULL,
            warrior_agility FLOAT UNSIGNED NOT NULL,
            warrior_magic FLOAT UNSIGNED NOT NULL,
            warrior_life FLOAT UNSIGNED NOT NULL,
            FOREIGN KEY(inventory_id) references inventory(inventory_id),
            inventory_id INT NOT NULL,
            FOREIGN KEY(stage_id) references stage(stage_id),
            stage_id INT NOT NULL
        );

        INSERT INTO warrior(
         warrior_id, warrior_strenght, warrior_agility, warrior_magic, warrior_life, inventory_id, stage_id)
        VALUE
        (1001, 6.5, 6.5, 7.0, 7.0, 410, 159),
        (1002, 5.0, 5.0, 5.5, 5.5, 408, 156),
        (1003, 2.5, 2.5, 3.0, 3.0, 403, 152),
        (1004, 2.0, 2.0, 2.5, 2.5, 402, 151),
        (1005, 6.0, 6.0, 6.5, 6.5, 410, 158),
        (1006, 5.5, 5.5, 6.0, 6.0, 409, 157),
        (1007, 1.5, 1.5, 2.0, 2.0, 401, 150),
        (1008, 4.5, 4.5, 5.0, 5.0, 407, 155),
        (1009, 3.0, 3.0, 3.5, 3.5, 405, 153),
        (1010, 4.0, 4.0, 4.5, 4.5, 406, 154);


        mysql> CREATE TABLE level_stage(
    ->             FOREIGN KEY (level_id) references level(level_id),
    ->             level_id INT UNIQUE NOT NULL,
    ->             FOREIGN KEY (stage_id) references stage(stage_id),
    ->             stage_id INT UNIQUE NOT NULL
    ->         );
Query OK, 0 rows affected (0,02 sec)

mysql> INSERT INTO level_stage(
    ->             stage_id, level_id
    ->         )
    ->         VALUE
    ->         (150, 503),
    ->         (151, 502),
    ->         (152, 501),
    ->         (153, 501),
    ->         (154, 502),
    ->         (155, 503),
    ->         (156, 501),
    ->         (157, 503),
    ->         (158, 503),
    ->         (159, 502);
