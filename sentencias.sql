
        CREATE DATABASE <Videojuego>


         
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

        INSERT INTO Weapon (id_weapon, name_weapon, damage) VALUES ('Cuchillo', 0.2);
        INSERT INTO Weapon (id_weapon, name_weapon, damage) VALUES ('Molotovs', 0.4);
        INSERT INTO Weapon (id_weapon, name_weapon, damage) VALUES ('Hachas', 0.6);
        INSERT INTO Weapon (id_weapon, name_weapon, damage) VALUES ('Katana', 0.8);
        INSERT INTO Weapon (id_weapon, name_weapon, damage) VALUES ('Metralladora', 0.1 );
        INSERT INTO Weapon (id_weapon, name_weapon, damage) VALUES ('Cuchillo', 0.1 );
        INSERT INTO Weapon (id_weapon, name_weapon, damage) VALUES ('Cuchillo', 0.1 );
        INSERT INTO Weapon (id_weapon, name_weapon, damage) VALUES ('Cuchillo', 0.1 );
        INSERT INTO Weapon (id_weapon, name_weapon, damage) VALUES ('Cuchillo', 0.1 );
        INSERT INTO Weapon (id_weapon, name_weapon, damage) VALUES ('Cuchillo', 0.1 );
        

        CREATE TABLE user(
            id INT AUTO_INCREMENT PRIMARY KEY,
            username VARCHAR(20) UNIQUE NOT NULL,
            email VARCHAR (50) UNIQUE NOT NULL,
            keyWord VARCHAR (40) UNIQUE NOT NULL,
            FOREIGN KEY (warrior_id) references warrior(warrior_id),
            warrior_id INT UNIQUE NOT NULL
            );


        CREATE TABLE Characters (
            id_character INT AUTO_INCREMENT PRIMARY KEY,
            warrior VARCHAR(20) UNIQUE NOT NULL,
            strength DECIMAL UNSIGNED NOT NULL,
            agility DECIMAL UNSIGNED NOT NULL,
            magic DECIMAL UNSIGNED NOT NULL,
            vitality DECIMAL UNSIGNED NOT NULL
            id_inventary 
        );

        


       

        CREATE TABLE enemy (
            enemy_id INT PRIMARY KEY, 
            enemy_strength FLOAT UNSIGNED NOT NULL,
            enemy_agility FLOAT UNSIGNED NOT NULL,
            enemy_magic FLOAT UNSIGNED NOT NULL,
            enemy_life FLOAT UNSIGNED NOT NULL,
            enemy_inventory  
        ); 

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


        CREATE TABLE warrior(

        )

         
        
        









        /* movie */ /* movie */ /* movie */

        CREATE TABLE movie(
        mov_id INT PRIMARY KEY,
        mov_title VARCHAR(50),
        mov_year INTEGER,
        mov_time INTEGER,
        mov_lang VARCHAR(50),
        mov_dt_rel DATE,
        mov_rel_country VARCHAR(5)
        );

        INSERT INTO movie(
        mov_id,
        mov_title,
        mov_year,
        mov_time,
        mov_lang,
        mov_dt_rel,
        mov_rel_country) 
        VALUE
        (901 , "Vertigo", 1958 , 128 ,"English" , "1958-08-24" , "UK"),                   
        (902 , "The Innocents", 1961 , 100 ,"English" , "1962-02-19" , "SW"),
        (903 , "Lawrence of Arabia", 1962 , 216 ,"English" , "1962-12-11" , "UK"),
        (904 , "The Deer Hunter", 1978 , 183 ,"English" , "1979-03-08" , "UK"),
        (905 , "Amadeus", 1984 , 160 ,"English" , "1985-01-07" , "UK"),
        (906 , "Blade Runner", 1982 , 117 ,"English" , "1982-09-09" , "UK"),
        (907 , "Eyes Wide Shut", 1999 , 159 ,"English" ,null, "UK"),
        (908 , "The Usual Suspects", 1995 , 106 ,"English" , "1995-08-25" , "UK"),
        (909 , "Chinatown", 1974, 130 ,"English" , "1974-08-09" , "UK"),
        (910 , "Boogie Nights", 1997 , 155 ,"English" , "1998-02-16" , "UK"),
        (911 , "Annie Hall", 1977 ,  93 ,"English" , "1977-04-20" , "USA"),
        (912 , "Princess Mononoke", 1997 , 134 ,"Japanese", "2001-10-19" , "UK"),
        (913 , "The Shawshank Redemption", 1994 , 142 ,"English" , "1995-02-17" ,"UK"),
        (914 , "American Beauty", 1999 , 122 ,"English" ,null, "UK"),
        (915 , "Titanic", 1997 , 194 ,"English" , "1998-01-23" , "UK"),
        (916 , "Good Will Hunting", 1997 , 126 ,"English" , "1998-06-03" , "UK"),
        (917 , "Deliverance", 1972 , 109 ,"English" , "1982-10-05" , "UK"),
        (918 , "Trainspotting", 1996 ,  94 ,"English" , "1996-02-23" , "UK"),
        (919 , "The Prestige", 2006 , 130 ,"English" , "2006-11-10" , "UK"),
        (920 , "Donnie Darko", 2001 , 113 ,"English" ,null, "UK"),
        (921 , "Slumdog Millionaire", 2008 , 120 ,"English" , "2009-01-09" , "UK"),
        (922 , "Aliens", 1986 , 137 ,"English" , "1986-08-29" , "UK"),
        (923 , "Beyond the Sea", 2004 , 118 ,"English" , "2004-11-26" , "UK"),
        (924 , "Avatar", 2009 , 162 ,"English" , "2009-12-17" , "UK"),
        (926 , "Seven Samurai", 1954 , 207 ,"Japanese", "1954-04-26" , "JP"),
        (927 , "Spirited Away", 2001 , 125 ,"Japanese", "2003-09-12" , "UK"),
        (928 , "Back to the Future", 1985 , 116 ,"English" , "1985-12-04" , "UK"),
        (925 , "Braveheart", 1995 , 178 ,"English" , "1995-09-08" , "UK");

        mysql> SELECT movie.mov_title, reviewer.rev_name FROM rating JOIN movie ON rating.mov_id=movie.mov_id JOIN reviewer ON rating.rev_id=reviewer.rev_id;



        /* rating */ /* rating */ /* rating */

        CREATE TABLE rating(
            FOREIGN KEY (mov_id) references movie(mov_id),
            FOREIGN KEY (rev_id) references reviewer(rev_id),
            mov_id INT NOT NULL,
            rev_id INT  NOT NULL,
            rev_stars DECIMAL(2.2) UNSIGNED NULL,
            num_o_ratings INT NULL
        );

        INSERT INTO rating (
        mov_id,
        rev_id,
        rev_stars,
        num_o_ratings)
        VALUES
        (901, 9001, 8.40, 263575),
        (902, 9002, 7.90, 20207),
        (903, 9003, 8.30, 202778),
        (906, 9005, 8.20, 484746),
        (924, 9006, 7.30, NULL),
        (908, 9007, 8.60, 779489),
        (909, 9008, NULL , 227235),
        (910, 9009, 3.00, 195961),
        (911, 9010, 8.10, 203875),
        (912, 9011, 8.40, NULL),
        (914, 9013, 7.00, 862618),
        (915, 9001, 7.70, 830095),
        (916, 9014, 4.00, 642132),
        (925, 9015, 7.70, 81328),
        (918, 9016, NULL , 580301),
        (920, 9017, 8.10, 609451),
        (921, 9018, 8.00, 667758),
        (922, 9019, 8.40, 511613),
        (923, 9020, 6.70,  13091);



        /* reviewer */ /* reviewer */ /* reviewer */

        CREATE TABLE reviewer(
            rev_id INT PRIMARY KEY,
            rev_name VARCHAR(30) NULL
        );


        INSERT INTO reviewer (
        rev_id,
         rev_name
         )
         VALUE
        (9001, 'Righty Sock'),
        (9002, 'Jack Malvern'),
        (9003, 'Flagrant Baronessa'),
        (9004, 'Alec Shaw'),
        (9005, NULL),
        (9006, 'Victor Woeltjen'),
        (9007,  'Simon Wright'),
        (9008, 'Neal Wruck'),
        (9009, ' Paul Monks'),
        (9010, 'Mike Salvati'),
        (9011, NULL),
        (9012, 'Wesley S. Walker'),
        (9013, 'Sasha Goldshtein'),
        (9014, 'Josh Cate'),
        (9015, 'Krug Stillo'),
        (9016, 'Scott LeBrun'),
        (9017, 'Hannah Steele'),
        (9018, 'Vincent Cadena'),
        (9019, 'Brandt Sponseller'),
        (9020, 'Richard Adams');





        /* movie cast */  /* movie cast */  /* movie cast */ 

        CREATE TABLE movie_cast(
        mov_dir INT  AUTO_INCREMENT PRIMARY KEY ,
        act_id INT NOT NULL,
        mov_id INT NOT NULL,
        FOREIGN KEY (act_id) references actor(act_id),
        FOREIGN KEY (mov_id) references movie(mov_id),
        rol VARCHAR(50)
        );

        INSERT INTO movie_cast(
        act_id,
        mov_id,
        rol)
        VALUE
        (101, 901, 'John Scottie Ferguson'),
        (102, 902, 'Miss Giddens'),
        (103, 903, 'T.E. Lawrence'),
        (104, 904, 'Michael'),
        (105, 905, 'Antonio Salieri'),
        (106, 906, 'Rick Deckard'),
        (107, 907, 'Alice Harford'),
        (108, 908, 'McManus'),
        (110, 910, 'Eddie Adams'),
        (111, 911, 'Alvy Singer'),
        (112, 912, 'San'),
        (113, 913, 'Andy Dufresne'),
        (114, 914, 'Lester Burnham'),
        (115, 915, 'Rose DeWitt Bukater'),
        (116, 916, 'Sean Maguire'),
        (117, 917, 'Ed'),
        (118, 918, 'Renton'),
        (120, 920, 'Elizabeth Darko'),
        (121, 921, 'Older Jamal'),
        (122, 922, 'Ripley'),
        (114, 923, 'Bobby Darin'),
        (109, 909, 'J.J. Gittes'),
        (119, 919, 'Alfred Borden');



        /* actor */ /* actor */ /* actor */

        CREATE TABLE actor(
        act_id INTEGER PRIMARY KEY,
        act_fname CHAR(20),
        act_lname CHAR(20),
        act_gender CHAR(1)
        );

        INSERT INTO actor(
        act_id,
        act_fname,
        act_lname,
        act_gender
        )
        VALUE 
        (101 , "James", "Stewart","M"),
        (102 , "Deborah", "Kerr","F"),
        (103 , "Peter", "OToole","M"),
        (104 , "Robert", "De Niro","M"),
        (105 , "F. Murray", "Abraham","M"),
        (106 , "Harrison", "Ford","M"),
        (107 , "Nicole", "Kidman","F"),
        (108 , "Stephen", "Baldwin","M"),
        (109 , "Jack", "Nicholson","M"),
        (110 , "Mark", "Wahlberg","M"),
        (111 , "Woody", "Allen","M"),
        (112 , "Claire", "Danes","F"),
        (113 , "Tim", "Robbins","M"),
        (114 , "Kevin", "Spacey","M"),
        (115 , "Kate", "Winslet","F"),
        (116 , "Robin", "Williams","M"),
        (117 , "Jon", "Voight","M"),
        (118 , "Ewan", "McGregor","M"),
        (119 , "Christian", "Bale","M"),
        (120 , "Maggie", "Gyllenhaa","F"),
        (121 , "Dev", "Patel","M"),
        (122 , "Sigourney", "Weaver","F"),
        (123 , "David", "Aston","M"),
        (124 , "Ali", "Astin","F");



        /* director */ /* director */ /* director */

        CREATE TABLE director(
        dir_id INTEGER PRIMARY KEY,
        dir_fname CHAR(20),
        dir_lname CHAR(20)
        );

        INSERT INTO director(
        dir_id,
        dir_fname,
        dir_lname
        )
        VALUE
        (201 , "Alfred", "Hitchcock"),
        (202 , "Jack", "Clayton"),
        (203 , "David", "Lean"),
        (204 , "Michael", "Cimino"),
        (205 , "Milos", "Forman"),
        (206 , "Ridley", "Scott"),
        (207 , "Stanley", "Kubrick"),
        (208 , "Bryan", "Singer"),
        (209 , "Roman", "Polanski"),
        (210 , "Paul", "Thomas Anderson"),
        (211 , "Woody", "Allen"),
        (212 , "Hayao", "Miyazaki"),
        (213 , "Frank", "Darabont"),
        (214 , "Sam", "Mendes"),
        (215 , "James", "Cameron"),
        (216 , "Gus", "Van Sant"),
        (217 , "John", "Boorman"),
        (218 , "Danny", "Boyle"),
        (219 , "Christopher", "Nolan"),
        (220 , "Richard", "Kelly"),
        (221 , "Kevin", "Spacey"),
        (222 , "Andrei", "Tarkovsky"),
        (223 , "Peter", "Jackson");



        /* genres */ /* genres */ /* genres */

        CREATE TABLE genres(
        gen_id INT PRIMARY KEY,
        gen_title VARCHAR(20)
        );

        INSERT INTO genres(
        gen_id,
        gen_title
        )
        VALUE
        (1001, 'Action'),
        (1002, 'Adventure'),
        (1003, 'Animation'),
        (1004,' Biography'),
        (1005, 'Comedy'),
        (1006, 'Crime'),
        (1007, 'Drama'),
        (1008, 'Horror'),
        (1009, 'Music'),
        (1010, 'Mystery'),
        (1011, 'Romance'),
        (1012, 'Thriller'),
        (1013, 'War');


        /* movie_genres */ /* movie_genres */ /* movie_genres */

        CREATE TABLE movie_genres(
        mov_gen INT PRIMARY KEY AUTO_INCREMENT,	
        mov_id INT NOT NULL,
        gen_id INT NOT NULL,
        FOREIGN KEY (mov_id) REFERENCES movie(mov_id),
        FOREIGN KEY (gen_id) REFERENCES genres(gen_id)
        );

         INSERT INTO movie_genres(
        mov_id,
        gen_id
        )
        VALUE
        (922, 1001),
        (917, 1002),
        (903, 1002),
        (912, 1003),
        (911, 1005),
        (908, 1006),
        (913, 1006),
        (926, 1007),
        (928, 1007),
        (918, 1007),
        (921, 1007),
        (902, 1008),
        (923, 1009),
        (907, 1010),
        (927, 1010),
        (901, 1010),
        (914, 1011),
        (906, 1012),
        (904, 1013);


        /* movie_direction */ /* movie_direction */ /* movie_direction */

        CREATE TABLE movie_direction(
        mov_dir INT PRIMARY KEY AUTO_INCREMENT,	
        dir_id INT NOT NULL,
        mov_id INT NOT NULL,
        FOREIGN KEY (dir_id) REFERENCES director(dir_id),
        FOREIGN KEY (mov_id) REFERENCES movie(mov_id)
        );

        INSERT INTO movie_direction(
        dir_id,
        mov_id
        ) 
        VALUE
        (201 ,901),
        (202 ,902),
        (203 ,903),
        (204 ,904),
        (205 ,905),
        (206 ,906),
        (207 ,907),
        (208 ,908),
        (209 ,909),
        (210 ,910),
        (211 ,911),
        (212 ,912),
        (213 ,913),
        (214 ,914),
        (215 ,915),
        (216 ,916),
        (217 ,917),
        (218 ,918),
        (219 ,919),
        (220 ,920),
        (218 ,921),
        (215 ,922),
        (221 ,923);