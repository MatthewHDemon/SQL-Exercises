    /* TABLAS INDEPENDIENTES */ /* TABLAS INDEPENDIENTES */ /* TABLAS INDEPENDIENTES */ /* TABLAS INDEPENDIENTES */

    /* TABLA DE ARMAS DE LA  GUERRERA*/
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

    /* TABLA DE HABILIDADES DE LA GUERRERA */
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

     /* TABLA DE POTENCIALIZADORES DE VIDA DE LA GUERRERA */
    CREATE TABLE lifeEnchancer (
                lifeEnchancer_id INT PRIMARY KEY,
                lifeEnchancer_name VARCHAR(50) UNIQUE NOT NULL,
                effectiveness FLOAT UNSIGNED NOT NULL);

    INSERT INTO lifeEnchancer(
            lifeEnchancer_id, lifeEnchancer_name, effectiveness)
            VALUE
            (301, 'Potencializador de vida 25%', 2.5),
            (302, 'Potencializador de vida 50%', 5.0),
            (303, 'Potencializador de vida 75%', 7.5),
            (304, 'Potencializador de vida 100%', 10.0);


    /* TABLA DE ARMAS DE LOS ENEMIGOS */
    CREATE TABLE enemy_weapon(
                enemy_weapon_id INT PRIMARY KEY,
                enemy_weapon_name VARCHAR (50),
                enemy_weapon_damage FLOAT);

            INSERT INTO enemy_weapon (
                enemy_weapon_id, enemy_weapon_name, enemy_weapon_damage
            )
            VALUE
            (601, 'Cuchillo', 1.0),
            (602, 'Molotov', 2.0),
            (603, 'Pistola', 3.0),
            (604, 'Escopeta', 4.0),
            (605, 'Lanza', 5.0),
            (606, 'Arco', 6.0),
            (607, 'Serpiente', 7.0),
            (608, 'Katana', 8.0),
            (609, 'Metralladora', 9.0),
            (610, 'Lanza cohetes', 10.0);

    /* TABLA DE HABLIDADES DE LOS ENEMIGOS */
    CREATE TABLE enemy_hability (
                enemy_hability_id INT PRIMARY KEY,
                enemy_hability_name VARCHAR(50),
                enemy_hability_damage FLOAT);

            INSERT INTO enemy_hability (
                enemy_hability_id, enemy_hability_name, enemy_hability_damage
            )
            VALUE
            (701, 'Rafaga de cuchillos autodirigidos', 1.5),
            (702, 'Molotov de fosoforo blanco', 2.0),
            (703, 'Cadena de tiro', 2.5),
            (704, 'Escopetazo a quema ropa', 4.0),
            (705, 'Jabalina', 4.5),
            (706, 'Flecha magica relentizadora', 6.0),
            (707, 'Veneno de serpiente', 7.0),
            (708, 'Descuatizador', 8.0),
            (709, 'Fuerza aerea magica', 9.0),
            (710, 'Caido desde el cielo', 10.0);

    /* TABLA DE POTENCIALIZADORES DE VIDA DE LOS ENEMIGOS */
    CREATE TABLE enemy_lifeEnchancer (
                enemy_lifeEnchancer_id INT PRIMARY KEY,
                enemy_lifeEnchancer_name VARCHAR(50),
                enemy_lifeEnchancer_effectiveness FLOAT);

            INSERT INTO enemy_lifeEnchancer (
                enemy_lifeEnchancer_id, enemy_lifeEnchancer_name, enemy_lifeEnchancer_effectiveness
            )
            VALUE
            (801, 'NULL', 0),
            (802, 'Potencializador de vida 25%', 2.5),
            (803, 'Potencializador de vida 50%', 5.0),
            (804, 'Potencializador de vida 75%', 7.5),
            (805, 'Potencializador de vida 100%', 10.0);

    /* TABLA DE NIVELES DE LOS ESCENARIOS */
    CREATE TABLE level(
                level_id INT PRIMARY KEY, 
                level_number VARCHAR(50) UNIQUE NOT NULL
            ); 

            INSERT INTO level (
                level_id, level_number
            )
            VALUE
            (501, 'Nivel 1'),
            (502, 'Nivel 2'),
            (503, 'Nivel 3');

    /* TABLAS DEPENDIENTES */ /* TABLAS DEPENDIENTES */ /* TABLAS DEPENDIENTES */ /* TABLAS DEPENDIENTES */

    /* INVENTARIO DE LA GUERRERRA */
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


    /* INVENTARIO DE LOS ENEMIGOS */
            CREATE TABLE inventory_enemy(
                        inventory_enemy_id INT PRIMARY KEY,
                        FOREIGN KEY (enemy_weapon_id) references enemy_weapon(enemy_weapon_id),
                        enemy_weapon_id INT NOT NULL,
                        FOREIGN KEY (enemy_hability_id) references enemy_hability(enemy_hability_id),
                        enemy_hability_id INT NOT NULL,
                        FOREIGN KEY (enemy_lifeEnchancer_id) references enemy_lifeEnchancer(enemy_lifeEnchancer_id),
                        enemy_lifeEnchancer_id INT NULL
                        );

        INSERT INTO inventory_enemy(
            inventory_enemy_id, enemy_weapon_id, enemy_hability_id, enemy_lifeEnchancer_id 
        )
        VALUE
        (901, 601, 701, 801),
        (902, 602, 702, 801),
        (903, 603, 703, 802),
        (904, 604, 704, 802),
        (905, 605, 705, 803),
        (906, 606, 706, 803),
        (907, 607, 707, 804),
        (908, 608, 708, 804),
        (909, 609, 709, 805),
        (910, 610, 710, 805);

    /* ENEMIGOS DEL JUEGO */
        CREATE TABLE enemy(
            enemy_id INT PRIMARY KEY,
            enemy_name VARCHAR(50),
            enemy_strength FLOAT UNSIGNED NOT NULL,
            enemy_agility FLOAT UNSIGNED NOT NULL,
            enemy_magic FLOAT UNSIGNED NOT NULL,
            enemy_life FLOAT UNSIGNED NOT NULL,
            inventory_enemy_id INT UNIQUE NOT NULL,
            FOREIGN KEY (inventory_enemy_id) references inventory_enemy(inventory_enemy_id));

        INSERT INTO enemy(
            enemy_id, enemy_name, enemy_strength, enemy_agility, enemy_magic, enemy_life, inventory_enemy_id
        )
        VALUE
        (011, 'Zotito Alado', 1.0, 1.5, 1.5, 1.5, 901),
        (012, 'Zotito Saltarín', 2.0, 2.5, 2.5, 2.5, 902),
        (013,  'Zotito Volátil', 3.0, 3.5, 3.5, 3.5, 903),
        (014,  'Grimario Novato', 4.0, 4.5, 4.5, 4.5, 904),
        (015,  'Grimario Maestro', 5.0, 5.5, 5.5, 5.5, 905),
        (016,  'Grimario Pesadilla', 6.0, 6.5, 6.5, 6.5, 906),
        (017,  'Acechador Palido', 7.0, 7.5, 7.5, 7.5, 907),
        (018,  'Vasija Pura', 8.0, 8.5, 8.5, 8.5, 908),
        (019,  'Ídologo del Vacío', 9.0, 9.5, 9.5, 9.5, 909),
        (020,  'Rey Pesadilla', 10.0, 10.0, 10.0, 10.0, 910);

    /* ESCENARIOS QUE RECORRERA LA GUERRERA */
       CREATE TABLE stage(
            stage_id INT PRIMARY KEY,
            stage_name VARCHAR(50),
            FOREIGN KEY (enemy_id) references enemy(enemy_id),
            enemy_id INT UNIQUE NOT NULL);
        
        INSERT INTO stage(
            stage_id, stage_name, enemy_id
            )
            VALUE
            (150, 'Bosque olvidado', 011),
            (151, 'Montaña del ciervo', 012),
            (152, 'Ruinas de ultratumba', 013),
            (153, 'Cueva perdida', 014),
            (154, 'Pueblo abandonado', 015),
            (155, 'Pantano tenebroso', 016),
            (156, 'Oceano', 017),
            (157, 'Volcan azulado', 018),
            (158, 'Dirigible magico', 019),
            (159, 'Castillo supremo', 020);

    /* TABLA INTERMEDIA ENTRE LA TABLA DE ESCENARIOS Y LA TABLA DE NIVELES */
       CREATE TABLE level_stage(
            FOREIGN KEY (level_id) references level(level_id),
            level_id INT NOT NULL,
            FOREIGN KEY (stage_id) references stage(stage_id),
            stage_id INT NOT NULL
        );

            INSERT INTO level_stage(
                stage_id, level_id
            )
            VALUE
            (150, 503),
            (151, 502),
            (152, 501),
            (153, 501),
            (154, 502),
            (155, 503),
            (156, 501),
            (157, 503),
            (158, 503),
            (159, 502);

    /* GUERRERA*/
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

    /* USUARIO */
    CREATE TABLE user(
            id INT AUTO_INCREMENT PRIMARY KEY,
            username VARCHAR(20) UNIQUE NOT NULL,
            email VARCHAR (50) UNIQUE NOT NULL,
            keyWord VARCHAR (40) UNIQUE NOT NULL,
            FOREIGN KEY (warrior_id) references warrior(warrior_id),
            warrior_id INT UNIQUE NOT NULL
            );

    INSERT INTO user(
        username, email, keyWord, warrior_id)
         VALUE
        ('MatthewHDemon', 'danielmateopatarroyomolina@gmail.com', 'Espectro patronoum', 1001),
        ('Lizzie.Yuki', 'lizzette.sevillano.c@gmail.com', 'Lizzie_tomuch', 1002),
        ('ourainbows', 'casasjuanfelipe@gmail.com', 'Casitapro', 1003),
        ('jennyta', 'hinata.05@gmail.com', '38951Naruto', 1004),
        ('Miguel_Lopez', 'miguel.m.lopez@gmail.com', 'JurassicParkWorld', 1005),
        ('ValeZi', 'valeriaziegler21c@gmail.com', 'Bebe80059', 1006),
        ('MidatiTT', 'midati3312@gmail.com', 'Line_prince811', 1007),
        ('Vahnk', 'Lauravalentina200102@gmail.com', 'SakuraCardVale561', 1008),
        ('Hect_Dani', 'hectordaniel.gf18@gmail.com', 'DrawingAwesone117', 1009),
        ('Pinzas_day', 'pinzondiazdaniel@gmail.com', 'Berserk8/53', 1010);

        





