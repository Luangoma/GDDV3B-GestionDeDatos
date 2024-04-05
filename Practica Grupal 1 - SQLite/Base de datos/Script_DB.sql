-- Table: Lugar
CREATE TABLE Lugar (
    Nombre text NOT NULL PRIMARY KEY,
    NPCs integer NOT NULL,
    Enemigos integer NOT NULL
);

-- Table: Usuario
CREATE TABLE Usuario (
    ID_Usuario integer NOT NULL PRIMARY KEY,
    Nombre text NOT NULL
);

-- Table: Items
CREATE TABLE Items (
    Nombre text NOT NULL PRIMARY KEY,
    Descripcion text NOT NULL
);

-- Table: Enemigo
CREATE TABLE Enemigo (
    Enemigo_ID integer NOT NULL CONSTRAINT Enemigo_pk PRIMARY KEY,
    Nombre text NOT NULL,
    Region text NOT NULL,
    Puntos_ataque integer NOT NULL,
    Puntos_defensa integer NOT NULL,
    Puntos_corazon integer NOT NULL,
    Vuela boolean NOT NULL,
    Tiene_pincho boolean NOT NULL,
    Tiene_caparazon boolean NOT NULL,
    Es_Boss boolean NOT NULL
);

-- Table: Lugar_Enemigo
CREATE TABLE Lugar_Enemigo (
    Nombre_Lugar text NOT NULL,
    Enemigo_ID integer NOT NULL,
    CONSTRAINT Lugar_Enemigo_pk PRIMARY KEY (Nombre_Lugar,Enemigo_ID),
    FOREIGN KEY (Nombre_Lugar) REFERENCES Lugar (Nombre),
    FOREIGN KEY (Enemigo_ID) REFERENCES Enemigo (Enemigo_ID)
);

-- Table: Personaje
CREATE TABLE Personaje (
    Nombre text NOT NULL PRIMARY KEY,
    PC integer NOT NULL,
    PF integer NOT NULL,
    Procedencia text NOT NULL,
    Descripcion text NOT NULL,
    FOREIGN KEY (Procedencia) REFERENCES Lugar (Nombre)
);

-- Table: Jugador
CREATE TABLE Jugador (
    Jugador_ID integer NOT NULL PRIMARY KEY,
    Puntos_corazon integer NOT NULL,
    Puntos_estrella integer NOT NULL,
    Puntos_flor integer NOT NULL,
    Monedas integer NOT NULL,
    Estado integer NOT NULL,
    Personaje text NOT NULL,
    FOREIGN KEY (Personaje) REFERENCES Personaje (Nombre)
);

-- Table: Partida
CREATE TABLE Partida (
    Nombre text NOT NULL PRIMARY KEY,
    Horas_jugadas integer NOT NULL,
    Usuario_ID integer NOT NULL,
    Jugador_ID integer NOT NULL,
    FOREIGN KEY (Usuario_ID) REFERENCES Usuario (ID_Usuario),
    FOREIGN KEY (Jugador_ID) REFERENCES Jugador (Jugador_ID)
);

-- Table: Medalla
CREATE TABLE Medalla (
    Nombre text NOT NULL PRIMARY KEY,
    Coste_PM integer NOT NULL,
    Descripcion text NOT NULL,
    Jugador_ID integer NOT NULL,
    FOREIGN KEY (Jugador_ID) REFERENCES Jugador (Jugador_ID)
);

-- Table: Hab_Estrella
CREATE TABLE Hab_Estrella (
    Nombre text NOT NULL PRIMARY KEY,
    Coste_PE integer NOT NULL,
    Descripcion text NOT NULL,
    Jugador_ID integer NOT NULL,
    FOREIGN KEY (Jugador_ID) REFERENCES Jugador (Jugador_ID)
);

-- Table: Batalla
CREATE TABLE Batalla (
    Enemigo_ID integer NOT NULL,
    Jugador_ID integer NOT NULL,
    num_Turnos integer NOT NULL,
    num_Ayudantes integer NOT NULL,
    CONSTRAINT Batalla_pk PRIMARY KEY (Jugador_ID,Enemigo_ID),
    FOREIGN KEY (Enemigo_ID) REFERENCES Enemigo (Enemigo_ID),
    FOREIGN KEY (Jugador_ID) REFERENCES Jugador (Jugador_ID)
);

-- Table: Jugador_Items
CREATE TABLE Jugador_Items (
    Jugador_ID integer NOT NULL,
    items_Nombre text NOT NULL,
    num_Items integer NOT NULL,
    CONSTRAINT Jugador_Items_pk PRIMARY KEY (Jugador_ID,items_Nombre),
    FOREIGN KEY (Jugador_ID) REFERENCES Jugador (Jugador_ID),
    FOREIGN KEY (items_Nombre) REFERENCES Items (Nombre)
);

-- Table: Habilidad
CREATE TABLE Habilidad (
    Nombre text NOT NULL PRIMARY KEY,
    Coste_PF integer NOT NULL,
    Indice_ataque integer NOT NULL,
    Indice_defensa integer NOT NULL,
    Descripcion text NOT NULL,
    Personaje_Nombre text NOT NULL,
    FOREIGN KEY (Personaje_Nombre) REFERENCES Personaje (Nombre)
);



--INSERTS
INSERT INTO Lugar(Nombre, NPCs, Enemigos) VALUES ('Villa Viciosa', 15, 14);
INSERT INTO Lugar(Nombre, NPCs, Enemigos) VALUES ('Subsuelo de Villa Viciosa', 13, 8);
INSERT INTO Lugar(Nombre, NPCs, Enemigos) VALUES ('Llanura Estelar', 14, 9);
INSERT INTO Lugar(Nombre, NPCs, Enemigos) VALUES ('Villa Verde', 7, 0);
INSERT INTO Lugar(Nombre, NPCs, Enemigos) VALUES ('Fortaleza de Piedra', 8, 13);
INSERT INTO Lugar(Nombre, NPCs, Enemigos) VALUES ('Castillo de Goombaba', 12, 17);
INSERT INTO Lugar(Nombre, NPCs, Enemigos) VALUES ('Bosque Maravilloso', 17, 19);
INSERT INTO Lugar(Nombre, NPCs, Enemigos) VALUES ('Gran Árbol', 12, 8);
INSERT INTO Lugar(Nombre, NPCs, Enemigos) VALUES ('Casa de Claudia', 7, 0);
INSERT INTO Lugar(Nombre, NPCs, Enemigos) VALUES ('Ciudad Dojo', 9, 16);
INSERT INTO Lugar(Nombre, NPCs, Enemigos) VALUES ('Villa Sombría', 18, 20);
INSERT INTO Lugar(Nombre, NPCs, Enemigos) VALUES ('Camino Sombrío', 16, 18);
INSERT INTO Lugar(Nombre, NPCs, Enemigos) VALUES ('Templo Lúgubre', 12, 9);
INSERT INTO Lugar(Nombre, NPCs, Enemigos) VALUES ('Isla Trópico', 11, 5);
INSERT INTO Lugar(Nombre, NPCs, Enemigos) VALUES ('Cueva de los Piratas', 11, 20);
INSERT INTO Lugar(Nombre, NPCs, Enemigos) VALUES ('Estación de Riverside', 9, 16);
INSERT INTO Lugar(Nombre, NPCs, Enemigos) VALUES ('Villa Preciosa', 18, 0);
INSERT INTO Lugar(Nombre, NPCs, Enemigos) VALUES ('Bomburgo', 12, 14);
INSERT INTO Lugar(Nombre, NPCs, Enemigos) VALUES ('La Luna', 7, 6);
INSERT INTO Lugar(Nombre, NPCs, Enemigos) VALUES ('Palacio de la Oscuridad', 8, 11);
INSERT INTO Lugar(Nombre, NPCs, Enemigos) VALUES ('Cien Mazmorras', 15, 7);

INSERT INTO Usuario(ID_Usuario, Nombre) VALUES (1, 'Alberto');
INSERT INTO Usuario(ID_Usuario, Nombre) VALUES (2, 'Alejandro');
INSERT INTO Usuario(ID_Usuario, Nombre) VALUES (3, 'Blanca');
INSERT INTO Usuario(ID_Usuario, Nombre) VALUES (4, 'Carlota');
INSERT INTO Usuario(ID_Usuario, Nombre) VALUES (5, 'Emilio');
INSERT INTO Usuario(ID_Usuario, Nombre) VALUES (6, 'Héctor');
INSERT INTO Usuario(ID_Usuario, Nombre) VALUES (7, 'Irene');
INSERT INTO Usuario(ID_Usuario, Nombre) VALUES (8, 'Luis');
INSERT INTO Usuario(ID_Usuario, Nombre) VALUES (9, 'Sandro');
INSERT INTO Usuario(ID_Usuario, Nombre) VALUES (10, 'Verónica');

INSERT INTO Items(Nombre, Descripcion) VALUES ('Seta', 'Recupera 5 PC.');
INSERT INTO Items(Nombre, Descripcion) VALUES ('Gelatina', 'Recupera 5 PF.');
INSERT INTO Items(Nombre, Descripcion) VALUES ('Ultra Seta', 'Recupera 15 PC.');
INSERT INTO Items(Nombre, Descripcion) VALUES ('Grandimiel', 'Recupera 15 PF.');
INSERT INTO Items(Nombre, Descripcion) VALUES ('Flor de fuego', 'Quita 3 PC a todos los enemigos.');
INSERT INTO Items(Nombre, Descripcion) VALUES ('Bloque POW', 'Quita 2 PC a todos los enemigos y da vuelta a enemigos con caparazón');
INSERT INTO Items(Nombre, Descripcion) VALUES ('Furia trueno', 'Quita 4 PC a todos los enemigos.');
INSERT INTO Items(Nombre, Descripcion) VALUES ('Estrella Fugaz', 'Quita 6 PC a todos los enemigos.');
INSERT INTO Items(Nombre, Descripcion) VALUES ('Tónico', 'Cura estados.');
INSERT INTO Items(Nombre, Descripcion) VALUES ('Espíritu', 'Te cubre de ataques enemigos.');
INSERT INTO Items(Nombre, Descripcion) VALUES ('Disco Mareo', 'Marea a los enemigos.');
INSERT INTO Items(Nombre, Descripcion) VALUES ('Don Blandito', 'Reduce el ataque de los enemigos.');
INSERT INTO Items(Nombre, Descripcion) VALUES ('Concha Protectora', 'Te protege de ataques enemigos.');
INSERT INTO Items(Nombre, Descripcion) VALUES ('Capote', 'Esquiva ataques de enemigos');
INSERT INTO Items(Nombre, Descripcion) VALUES ('Chupa PC', 'Quita PC a un enemigo y se lo da a tu personaje.');
INSERT INTO Items(Nombre, Descripcion) VALUES ('Oveja Sueño', 'Duerme a los enemigos.');


INSERT INTO Enemigo(Enemigo_ID, Nombre, Region, Puntos_ataque, Puntos_defensa, Puntos_corazon, Vuela, Tiene_pincho, Tiene_caparazon, Es_Boss) VALUES (1, 'Goomba', 'Diversos lugares', 1, 0, 2, 0, 0, 0, 0);
INSERT INTO Enemigo(Enemigo_ID, Nombre, Region, Puntos_ataque, Puntos_defensa, Puntos_corazon, Vuela, Tiene_pincho, Tiene_caparazon, Es_Boss) VALUES (2, 'Paragoomba', 'Diversos lugares', 1, 0, 2, 1, 0, 0, 0);
INSERT INTO Enemigo(Enemigo_ID, Nombre, Region, Puntos_ataque, Puntos_defensa, Puntos_corazon, Vuela, Tiene_pincho, Tiene_caparazon, Es_Boss) VALUES (3, 'Goompincho', 'Diversos lugares', 2, 0, 2, 0, 1, 0, 0);
INSERT INTO Enemigo(Enemigo_ID, Nombre, Region, Puntos_ataque, Puntos_defensa, Puntos_corazon, Vuela, Tiene_pincho, Tiene_caparazon, Es_Boss) VALUES (4, 'Híper Goomba', 'Camino Sombrío', 2, 0, 8, 0, 0, 0, 0);
INSERT INTO Enemigo(Enemigo_ID, Nombre, Region, Puntos_ataque, Puntos_defensa, Puntos_corazon, Vuela, Tiene_pincho, Tiene_caparazon, Es_Boss) VALUES (5, 'Híper Paragoomba', 'Camino Sombrío', 2, 0, 8, 1, 0, 0, 0);
INSERT INTO Enemigo(Enemigo_ID, Nombre, Region, Puntos_ataque, Puntos_defensa, Puntos_corazon, Vuela, Tiene_pincho, Tiene_caparazon, Es_Boss) VALUES (6, 'Híper Goompincho', 'Camino Sombrío', 3, 0, 8, 0, 1, 0, 0);
INSERT INTO Enemigo(Enemigo_ID, Nombre, Region, Puntos_ataque, Puntos_defensa, Puntos_corazon, Vuela, Tiene_pincho, Tiene_caparazon, Es_Boss) VALUES (7, 'Gloomba', 'Cien Mazmorras', 3, 0, 7, 0, 0, 0, 0);
INSERT INTO Enemigo(Enemigo_ID, Nombre, Region, Puntos_ataque, Puntos_defensa, Puntos_corazon, Vuela, Tiene_pincho, Tiene_caparazon, Es_Boss) VALUES (8, 'Paragloomba', 'Cien Mazmorras', 3, 0, 7, 1, 0, 0, 0);
INSERT INTO Enemigo(Enemigo_ID, Nombre, Region, Puntos_ataque, Puntos_defensa, Puntos_corazon, Vuela, Tiene_pincho, Tiene_caparazon, Es_Boss) VALUES (9, 'Gloompincho', 'Cien Mazmorras', 4, 0, 7, 0, 1, 0, 0);
INSERT INTO Enemigo(Enemigo_ID, Nombre, Region, Puntos_ataque, Puntos_defensa, Puntos_corazon, Vuela, Tiene_pincho, Tiene_caparazon, Es_Boss) VALUES (10, 'Koopa Troopa', 'Llanura Estelar', 2, 1, 4, 0, 0, 1, 0);
INSERT INTO Enemigo(Enemigo_ID, Nombre, Region, Puntos_ataque, Puntos_defensa, Puntos_corazon, Vuela, Tiene_pincho, Tiene_caparazon, Es_Boss) VALUES (11, 'Paratroopa', 'Castillo de Goombaba', 2, 1, 4, 1, 0, 1, 0);
INSERT INTO Enemigo(Enemigo_ID, Nombre, Region, Puntos_ataque, Puntos_defensa, Puntos_corazon, Vuela, Tiene_pincho, Tiene_caparazon, Es_Boss) VALUES (12, 'Reservoir Troopa', 'Ciudad Dojo', 2, 4, 4, 0, 0, 1, 0);
INSERT INTO Enemigo(Enemigo_ID, Nombre, Region, Puntos_ataque, Puntos_defensa, Puntos_corazon, Vuela, Tiene_pincho, Tiene_caparazon, Es_Boss) VALUES (13, 'Reservoir Para', 'Ciudad Dojo', 2, 1, 4, 1, 0, 1, 0);
INSERT INTO Enemigo(Enemigo_ID, Nombre, Region, Puntos_ataque, Puntos_defensa, Puntos_corazon, Vuela, Tiene_pincho, Tiene_caparazon, Es_Boss) VALUES (14, 'Antitroopa', 'Ciudad Dojo', 3, 1, 8, 0, 0, 1, 0);
INSERT INTO Enemigo(Enemigo_ID, Nombre, Region, Puntos_ataque, Puntos_defensa, Puntos_corazon, Vuela, Tiene_pincho, Tiene_caparazon, Es_Boss) VALUES (15, 'Antipara', 'Ciudad Dojo', 3, 1, 8, 1, 0, 1, 0);
INSERT INTO Enemigo(Enemigo_ID, Nombre, Region, Puntos_ataque, Puntos_defensa, Puntos_corazon, Vuela, Tiene_pincho, Tiene_caparazon, Es_Boss) VALUES (16, 'Koopa Oscuro', 'Cien Mazmorras', 4, 2, 8, 0, 0, 1, 0);
INSERT INTO Enemigo(Enemigo_ID, Nombre, Region, Puntos_ataque, Puntos_defensa, Puntos_corazon, Vuela, Tiene_pincho, Tiene_caparazon, Es_Boss) VALUES (17, 'Paratroopa Oscuro', 'Cien Mazmorras', 4, 2, 8, 1, 0, 1, 0);
INSERT INTO Enemigo(Enemigo_ID, Nombre, Region, Puntos_ataque, Puntos_defensa, Puntos_corazon, Vuela, Tiene_pincho, Tiene_caparazon, Es_Boss) VALUES (18, 'Koopatrullero', 'Subsuelo de Villa Viciosa', 4, 2, 6, 0, 1, 1, 0);
INSERT INTO Enemigo(Enemigo_ID, Nombre, Region, Puntos_ataque, Puntos_defensa, Puntos_corazon, Vuela, Tiene_pincho, Tiene_caparazon, Es_Boss) VALUES (19, 'Koopatrullero Oscuro', 'Ciudad Dojo', 5, 2, 25, 0, 1, 1, 0);
INSERT INTO Enemigo(Enemigo_ID, Nombre, Region, Puntos_ataque, Puntos_defensa, Puntos_corazon, Vuela, Tiene_pincho, Tiene_caparazon, Es_Boss) VALUES (20, 'Koopa Esqueleto', 'Castillo de Goombaba', 2, 1, 1, 0, 0, 1, 0);
INSERT INTO Enemigo(Enemigo_ID, Nombre, Region, Puntos_ataque, Puntos_defensa, Puntos_corazon, Vuela, Tiene_pincho, Tiene_caparazon, Es_Boss) VALUES (21, 'Koopa Esqueleto Rojo', 'Castillo de Goombaba', 3, 1, 5, 0, 0, 1, 0);
INSERT INTO Enemigo(Enemigo_ID, Nombre, Region, Puntos_ataque, Puntos_defensa, Puntos_corazon, Vuela, Tiene_pincho, Tiene_caparazon, Es_Boss) VALUES (22, 'Huesitos', 'Palacio de la Oscuridad', 5, 2, 8, 0, 0, 1, 0);
INSERT INTO Enemigo(Enemigo_ID, Nombre, Region, Puntos_ataque, Puntos_defensa, Puntos_corazon, Vuela, Tiene_pincho, Tiene_caparazon, Es_Boss) VALUES (23, 'Koopa Esqueleto Negro', 'Palacio de la Oscuridad', 5, 2, 20, 0, 0, 1, 0);
INSERT INTO Enemigo(Enemigo_ID, Nombre, Region, Puntos_ataque, Puntos_defensa, Puntos_corazon, Vuela, Tiene_pincho, Tiene_caparazon, Es_Boss) VALUES (24, 'Hermano Martillo', 'Ciudad Dojo', 4, 1, 7, 0, 0, 1, 0);
INSERT INTO Enemigo(Enemigo_ID, Nombre, Region, Puntos_ataque, Puntos_defensa, Puntos_corazon, Vuela, Tiene_pincho, Tiene_caparazon, Es_Boss) VALUES (25, 'Hermano Boomerang', 'Ciudad Dojo', 2, 1, 7, 0, 0, 1, 0);
INSERT INTO Enemigo(Enemigo_ID, Nombre, Region, Puntos_ataque, Puntos_defensa, Puntos_corazon, Vuela, Tiene_pincho, Tiene_caparazon, Es_Boss) VALUES (26, 'Hermano Fuego', 'Ciudad Dojo', 3, 1, 7, 0, 0, 1, 0);
INSERT INTO Enemigo(Enemigo_ID, Nombre, Region, Puntos_ataque, Puntos_defensa, Puntos_corazon, Vuela, Tiene_pincho, Tiene_caparazon, Es_Boss) VALUES (27, 'Lakitu', 'Ciudad Dojo', 2, 0, 5, 1, 0, 0, 0);
INSERT INTO Enemigo(Enemigo_ID, Nombre, Region, Puntos_ataque, Puntos_defensa, Puntos_corazon, Vuela, Tiene_pincho, Tiene_caparazon, Es_Boss) VALUES (28, 'Lakitu Oscuro', 'Cien Mazmorras', 5, 0, 13, 1, 0, 0, 0);
INSERT INTO Enemigo(Enemigo_ID, Nombre, Region, Puntos_ataque, Puntos_defensa, Puntos_corazon, Vuela, Tiene_pincho, Tiene_caparazon, Es_Boss) VALUES (29, 'Pinchón', 'Ciudad Dojo', 3, 3, 3, 0, 1, 1, 0);
INSERT INTO Enemigo(Enemigo_ID, Nombre, Region, Puntos_ataque, Puntos_defensa, Puntos_corazon, Vuela, Tiene_pincho, Tiene_caparazon, Es_Boss) VALUES (30, 'Pinchón Celeste', 'Cien Mazmorras', 6, 4, 6, 0, 1, 1, 0);
INSERT INTO Enemigo(Enemigo_ID, Nombre, Region, Puntos_ataque, Puntos_defensa, Puntos_corazon, Vuela, Tiene_pincho, Tiene_caparazon, Es_Boss) VALUES (31, 'Buzzy Beetle', 'Templo Lúgubre', 3, 4, 5, 0, 0, 1, 0);
INSERT INTO Enemigo(Enemigo_ID, Nombre, Region, Puntos_ataque, Puntos_defensa, Puntos_corazon, Vuela, Tiene_pincho, Tiene_caparazon, Es_Boss) VALUES (32, 'Punzón', 'Templo Lúgubre', 3, 4, 5, 0, 1, 1, 0);
INSERT INTO Enemigo(Enemigo_ID, Nombre, Region, Puntos_ataque, Puntos_defensa, Puntos_corazon, Vuela, Tiene_pincho, Tiene_caparazon, Es_Boss) VALUES (33, 'Parabuzzy', 'Cueva de los Piratas', 3, 4, 5, 1, 0, 1, 0);
INSERT INTO Enemigo(Enemigo_ID, Nombre, Region, Puntos_ataque, Puntos_defensa, Puntos_corazon, Vuela, Tiene_pincho, Tiene_caparazon, Es_Boss) VALUES (34, 'Parapunzón', 'Estación de Riverside', 3, 4, 5, 1, 1, 1, 0);
INSERT INTO Enemigo(Enemigo_ID, Nombre, Region, Puntos_ataque, Puntos_defensa, Puntos_corazon, Vuela, Tiene_pincho, Tiene_caparazon, Es_Boss) VALUES (35, 'Punzón Rojo', 'Ciudad Dojo', 3, 4, 5, 0, 1, 1, 0);
INSERT INTO Enemigo(Enemigo_ID, Nombre, Region, Puntos_ataque, Puntos_defensa, Puntos_corazon, Vuela, Tiene_pincho, Tiene_caparazon, Es_Boss) VALUES (36, 'Magikoopa', 'Subsuelo de Villa Viciosa', 4, 0, 7, 0, 0, 0, 0);
INSERT INTO Enemigo(Enemigo_ID, Nombre, Region, Puntos_ataque, Puntos_defensa, Puntos_corazon, Vuela, Tiene_pincho, Tiene_caparazon, Es_Boss) VALUES (37, 'Magikoopa Rojo', 'Ciudad Dojo', 4, 0, 7, 0, 0, 0, 0);
INSERT INTO Enemigo(Enemigo_ID, Nombre, Region, Puntos_ataque, Puntos_defensa, Puntos_corazon, Vuela, Tiene_pincho, Tiene_caparazon, Es_Boss) VALUES (38, 'Magikoopa Blanco', 'Ciudad Dojo', 4, 0, 7, 0, 0, 0, 0);
INSERT INTO Enemigo(Enemigo_ID, Nombre, Region, Puntos_ataque, Puntos_defensa, Puntos_corazon, Vuela, Tiene_pincho, Tiene_caparazon, Es_Boss) VALUES (39, 'Magikoopa Verde', 'Ciudad Dojo', 4, 0, 7, 0, 0, 0, 0);
INSERT INTO Enemigo(Enemigo_ID, Nombre, Region, Puntos_ataque, Puntos_defensa, Puntos_corazon, Vuela, Tiene_pincho, Tiene_caparazon, Es_Boss) VALUES (40, 'Kammy Koopa', 'Diversos lugares', 5, 0, 50, 0, 0, 1, 1);
INSERT INTO Enemigo(Enemigo_ID, Nombre, Region, Puntos_ataque, Puntos_defensa, Puntos_corazon, Vuela, Tiene_pincho, Tiene_caparazon, Es_Boss) VALUES (41, 'Bowser', 'Diversos lugares', 3, 1, 30, 0, 1, 1, 1);
INSERT INTO Enemigo(Enemigo_ID, Nombre, Region, Puntos_ataque, Puntos_defensa, Puntos_corazon, Vuela, Tiene_pincho, Tiene_caparazon, Es_Boss) VALUES (42, 'Angui Lucho', 'Villa Viciosa', 3, 0, 20, 0, 1, 0, 0);
INSERT INTO Enemigo(Enemigo_ID, Nombre, Region, Puntos_ataque, Puntos_defensa, Puntos_corazon, Vuela, Tiene_pincho, Tiene_caparazon, Es_Boss) VALUES (43, 'El Rompehuesos', 'Ciudad Dojo', 6, 0, 20, 0, 1, 0, 0);
INSERT INTO Enemigo(Enemigo_ID, Nombre, Region, Puntos_ataque, Puntos_defensa, Puntos_corazon, Vuela, Tiene_pincho, Tiene_caparazon, Es_Boss) VALUES (44, 'Bandido', 'Ciudad Dojo', 2, 0, 5, 0, 0, 0, 0);
INSERT INTO Enemigo(Enemigo_ID, Nombre, Region, Puntos_ataque, Puntos_defensa, Puntos_corazon, Vuela, Tiene_pincho, Tiene_caparazon, Es_Boss) VALUES (45, 'Gran Bandido', 'Ciudad Dojo', 3, 0, 8, 0, 0, 0, 0);
INSERT INTO Enemigo(Enemigo_ID, Nombre, Region, Puntos_ataque, Puntos_defensa, Puntos_corazon, Vuela, Tiene_pincho, Tiene_caparazon, Es_Boss) VALUES (46, 'Bandido Medallas', 'Cien Mazmorras', 5, 0, 12, 0, 0, 0, 0);
INSERT INTO Enemigo(Enemigo_ID, Nombre, Region, Puntos_ataque, Puntos_defensa, Puntos_corazon, Vuela, Tiene_pincho, Tiene_caparazon, Es_Boss) VALUES (47, 'Farolín', 'Subsuelo de Villa Viciosa', 1, 0, 3, 0, 0, 0, 0);
INSERT INTO Enemigo(Enemigo_ID, Nombre, Region, Puntos_ataque, Puntos_defensa, Puntos_corazon, Vuela, Tiene_pincho, Tiene_caparazon, Es_Boss) VALUES (48, 'Farolán', 'Subsuelo de Villa Viciosa', 1, 0, 3, 0, 1, 0, 0);
INSERT INTO Enemigo(Enemigo_ID, Nombre, Region, Puntos_ataque, Puntos_defensa, Puntos_corazon, Vuela, Tiene_pincho, Tiene_caparazon, Es_Boss) VALUES (49, 'Farolén', 'Cien Mazmorras', 7, 2, 12, 0, 1, 0, 0);
INSERT INTO Enemigo(Enemigo_ID, Nombre, Region, Puntos_ataque, Puntos_defensa, Puntos_corazon, Vuela, Tiene_pincho, Tiene_caparazon, Es_Boss) VALUES (50, 'Fuzzy', 'Fortaleza de Piedra', 1, 0, 3, 0, 0, 0, 0);
INSERT INTO Enemigo(Enemigo_ID, Nombre, Region, Puntos_ataque, Puntos_defensa, Puntos_corazon, Vuela, Tiene_pincho, Tiene_caparazon, Es_Boss) VALUES (51, 'Fuzzy Dorado', 'Fortaleza de Piedra', 1, 0, 10, 0, 0, 0, 0);
INSERT INTO Enemigo(Enemigo_ID, Nombre, Region, Puntos_ataque, Puntos_defensa, Puntos_corazon, Vuela, Tiene_pincho, Tiene_caparazon, Es_Boss) VALUES (52, 'Fuzzy Bosque', 'Isla Trópico', 3, 0, 5, 0, 0, 0, 0);
INSERT INTO Enemigo(Enemigo_ID, Nombre, Region, Puntos_ataque, Puntos_defensa, Puntos_corazon, Vuela, Tiene_pincho, Tiene_caparazon, Es_Boss) VALUES (53, 'Fuzzy Flor', 'Isla Trópico', 3, 0, 6, 0, 0, 0, 0);
INSERT INTO Enemigo(Enemigo_ID, Nombre, Region, Puntos_ataque, Puntos_defensa, Puntos_corazon, Vuela, Tiene_pincho, Tiene_caparazon, Es_Boss) VALUES (54, 'Pokey', 'Ciudad Dojo', 3, 0, 4, 0, 1, 0, 0);
INSERT INTO Enemigo(Enemigo_ID, Nombre, Region, Puntos_ataque, Puntos_defensa, Puntos_corazon, Vuela, Tiene_pincho, Tiene_caparazon, Es_Boss) VALUES (55, 'Pokey Venenoso', 'Estación de Riverside', 4, 0, 8, 0, 1, 0, 0);
INSERT INTO Enemigo(Enemigo_ID, Nombre, Region, Puntos_ataque, Puntos_defensa, Puntos_corazon, Vuela, Tiene_pincho, Tiene_caparazon, Es_Boss) VALUES (56, 'Planta Piraña Gris', 'Bosque Maravilloso', 2, 0, 4, 0, 1, 0, 0);
INSERT INTO Enemigo(Enemigo_ID, Nombre, Region, Puntos_ataque, Puntos_defensa, Puntos_corazon, Vuela, Tiene_pincho, Tiene_caparazon, Es_Boss) VALUES (57, 'Piraña Pocha', 'Isla Trópico', 3, 0, 8, 0, 1, 0, 0);
INSERT INTO Enemigo(Enemigo_ID, Nombre, Region, Puntos_ataque, Puntos_defensa, Puntos_corazon, Vuela, Tiene_pincho, Tiene_caparazon, Es_Boss) VALUES (58, 'Piraña Hielo', 'Bomburgo', 5, 0, 10, 0, 1, 0, 0);
INSERT INTO Enemigo(Enemigo_ID, Nombre, Region, Puntos_ataque, Puntos_defensa, Puntos_corazon, Vuela, Tiene_pincho, Tiene_caparazon, Es_Boss) VALUES (59, 'Planta Piraña', 'Cien Mazmorras', 9, 0, 15, 0, 1, 0, 0);
INSERT INTO Enemigo(Enemigo_ID, Nombre, Region, Puntos_ataque, Puntos_defensa, Puntos_corazon, Vuela, Tiene_pincho, Tiene_caparazon, Es_Boss) VALUES (60, 'Margaloca', 'Camino Sombrío', 2, 0, 7, 0, 0, 0, 0);
INSERT INTO Enemigo(Enemigo_ID, Nombre, Region, Puntos_ataque, Puntos_defensa, Puntos_corazon, Vuela, Tiene_pincho, Tiene_caparazon, Es_Boss) VALUES (61, 'Margamola', 'Camino Sombrío', 20, 1, 20, 0, 0, 0, 0);
INSERT INTO Enemigo(Enemigo_ID, Nombre, Region, Puntos_ataque, Puntos_defensa, Puntos_corazon, Vuela, Tiene_pincho, Tiene_caparazon, Es_Boss) VALUES (62, 'Aracnoide', 'Gran Árbol', 2, 0, 5, 1, 0, 0, 0);
INSERT INTO Enemigo(Enemigo_ID, Nombre, Region, Puntos_ataque, Puntos_defensa, Puntos_corazon, Vuela, Tiene_pincho, Tiene_caparazon, Es_Boss) VALUES (63, 'Arántula', 'Cien Mazmorras', 7, 0, 16, 1, 0, 0, 0);
INSERT INTO Enemigo(Enemigo_ID, Nombre, Region, Puntos_ataque, Puntos_defensa, Puntos_corazon, Vuela, Tiene_pincho, Tiene_caparazon, Es_Boss) VALUES (64, 'Swooper', 'Templo Lúgubre', 3, 0, 6, 1, 0, 0, 0);
INSERT INTO Enemigo(Enemigo_ID, Nombre, Region, Puntos_ataque, Puntos_defensa, Puntos_corazon, Vuela, Tiene_pincho, Tiene_caparazon, Es_Boss) VALUES (65, 'Supula', 'Palacio de la Oscuridad', 4, 0, 9, 1, 0, 0, 0);
INSERT INTO Enemigo(Enemigo_ID, Nombre, Region, Puntos_ataque, Puntos_defensa, Puntos_corazon, Vuela, Tiene_pincho, Tiene_caparazon, Es_Boss) VALUES (66, 'Vampirito', 'Cien Mazmorras', 6, 0, 20, 1, 0, 0, 0);
INSERT INTO Enemigo(Enemigo_ID, Nombre, Region, Puntos_ataque, Puntos_defensa, Puntos_corazon, Vuela, Tiene_pincho, Tiene_caparazon, Es_Boss) VALUES (67, 'Puff Oscuro', 'Bosque Maravilloso', 2, 0, 3, 1, 0, 0, 0);
INSERT INTO Enemigo(Enemigo_ID, Nombre, Region, Puntos_ataque, Puntos_defensa, Puntos_corazon, Vuela, Tiene_pincho, Tiene_caparazon, Es_Boss) VALUES (68, 'Ruff Puff', 'Estación de Riverside', 4, 0, 7, 1, 0, 0, 0);
INSERT INTO Enemigo(Enemigo_ID, Nombre, Region, Puntos_ataque, Puntos_defensa, Puntos_corazon, Vuela, Tiene_pincho, Tiene_caparazon, Es_Boss) VALUES (69, 'Puff Helado', 'Bomburgo', 4, 0, 9, 1, 0, 0, 0);
INSERT INTO Enemigo(Enemigo_ID, Nombre, Region, Puntos_ataque, Puntos_defensa, Puntos_corazon, Vuela, Tiene_pincho, Tiene_caparazon, Es_Boss) VALUES (70, 'Puff Venenoso', 'Cien Mazmorras', 8, 0, 15, 1, 0, 0, 0);

INSERT INTO Lugar_Enemigo(Nombre_Lugar, Enemigo_ID) VALUES ('Templo Lúgubre', 31);
INSERT INTO Lugar_Enemigo(Nombre_Lugar, Enemigo_ID) VALUES ('Llanura Estelar', 10);
INSERT INTO Lugar_Enemigo(Nombre_Lugar, Enemigo_ID) VALUES ('Isla Trópico', 52);
INSERT INTO Lugar_Enemigo(Nombre_Lugar, Enemigo_ID) VALUES ('Fortaleza de Piedra', 50);
INSERT INTO Lugar_Enemigo(Nombre_Lugar, Enemigo_ID) VALUES ('Templo Lúgubre', 64);
INSERT INTO Lugar_Enemigo(Nombre_Lugar, Enemigo_ID) VALUES ('Bomburgo', 69);
INSERT INTO Lugar_Enemigo(Nombre_Lugar, Enemigo_ID) VALUES ('Bomburgo', 58);
INSERT INTO Lugar_Enemigo(Nombre_Lugar, Enemigo_ID) VALUES ('Villa Viciosa', 42);
INSERT INTO Lugar_Enemigo(Nombre_Lugar, Enemigo_ID) VALUES ('Cien Mazmorras', 30);
INSERT INTO Lugar_Enemigo(Nombre_Lugar, Enemigo_ID) VALUES ('Subsuelo de Villa Viciosa', 18);
INSERT INTO Lugar_Enemigo(Nombre_Lugar, Enemigo_ID) VALUES ('Llanura Estelar', 2);
INSERT INTO Lugar_Enemigo(Nombre_Lugar, Enemigo_ID) VALUES ('Castillo de Goombaba', 20);
INSERT INTO Lugar_Enemigo(Nombre_Lugar, Enemigo_ID) VALUES ('Camino Sombrío', 61);
INSERT INTO Lugar_Enemigo(Nombre_Lugar, Enemigo_ID) VALUES ('Ciudad Dojo', 38);
INSERT INTO Lugar_Enemigo(Nombre_Lugar, Enemigo_ID) VALUES ('Gran Árbol', 62);
INSERT INTO Lugar_Enemigo(Nombre_Lugar, Enemigo_ID) VALUES ('Ciudad Dojo', 14);
INSERT INTO Lugar_Enemigo(Nombre_Lugar, Enemigo_ID) VALUES ('Cien Mazmorras', 46);
INSERT INTO Lugar_Enemigo(Nombre_Lugar, Enemigo_ID) VALUES ('Ciudad Dojo', 39);
INSERT INTO Lugar_Enemigo(Nombre_Lugar, Enemigo_ID) VALUES ('Ciudad Dojo', 27);
INSERT INTO Lugar_Enemigo(Nombre_Lugar, Enemigo_ID) VALUES ('Bosque Maravilloso', 67);


INSERT INTO Personaje(Nombre, PC, PF, Procedencia, Descripcion) VALUES ('Goomarina', 25, 15, 'Villa Viciosa', 'Una Goomba universitaria que aspira a ser arqueóloga.');
INSERT INTO Personaje(Nombre, PC, PF, Procedencia, Descripcion) VALUES ('Koops', 15, 20, 'Villa Verde', 'Un joven Koopa que desea volverse más fuerte.');
INSERT INTO Personaje(Nombre, PC, PF, Procedencia, Descripcion) VALUES ('Claudia', 35, 30, 'Bosque Maravilloso', '¡Un espíritu nebuloso con un cuerpo que es pura dinamita!');
INSERT INTO Personaje(Nombre, PC, PF, Procedencia, Descripcion) VALUES ('Yoshi', 20, 20, 'Ciudad Dojo', 'Un Yoshi recién nacido. Pequeño pero matón.');
INSERT INTO Personaje(Nombre, PC, PF, Procedencia, Descripcion) VALUES ('Bibiana', 25, 25, 'Villa Sombría', 'Este antiguo miembro del Trío de las Sombras parece una chica, pero en realidad es un chico.');
INSERT INTO Personaje(Nombre, PC, PF, Procedencia, Descripcion) VALUES ('Bombard', 30, 20, 'Villa Viciosa', 'Un viejo lobo de mar Bob-omb; era el marido de Bombaret.');
INSERT INTO Personaje(Nombre, PC, PF, Procedencia, Descripcion) VALUES ('Lupina', 25, 15, 'Villa Viciosa', 'Esta ladrona en realidad es la dueña de la tienda de medallas de Villa Viciosa.');


INSERT INTO Jugador(Jugador_ID, Puntos_corazon, Puntos_flor, Puntos_estrella, Monedas, Estado, Personaje) VALUES (1, 32, 21, 0, 104, 4, 'Bombard');
INSERT INTO Jugador(Jugador_ID, Puntos_corazon, Puntos_flor, Puntos_estrella, Monedas, Estado, Personaje) VALUES (2, 34, 30, 4, 31, 1, 'Koops');
INSERT INTO Jugador(Jugador_ID, Puntos_corazon, Puntos_flor, Puntos_estrella, Monedas, Estado, Personaje) VALUES (3, 27, 24, 4, 48, 1, 'Bibiana');
INSERT INTO Jugador(Jugador_ID, Puntos_corazon, Puntos_flor, Puntos_estrella, Monedas, Estado, Personaje) VALUES (4, 18, 26, 4, 81, 2, 'Yoshi');
INSERT INTO Jugador(Jugador_ID, Puntos_corazon, Puntos_flor, Puntos_estrella, Monedas, Estado, Personaje) VALUES (5, 16, 20, 0, 72, 5, 'Koops');
INSERT INTO Jugador(Jugador_ID, Puntos_corazon, Puntos_flor, Puntos_estrella, Monedas, Estado, Personaje) VALUES (6, 19, 30, 1, 22, 1, 'Goomarina');
INSERT INTO Jugador(Jugador_ID, Puntos_corazon, Puntos_flor, Puntos_estrella, Monedas, Estado, Personaje) VALUES (7, 8, 20, 4, 46, 4, 'Lupina');
INSERT INTO Jugador(Jugador_ID, Puntos_corazon, Puntos_flor, Puntos_estrella, Monedas, Estado, Personaje) VALUES (8, 2, 22, 0, 35, 5, 'Claudia');
INSERT INTO Jugador(Jugador_ID, Puntos_corazon, Puntos_flor, Puntos_estrella, Monedas, Estado, Personaje) VALUES (9, 13, 30, 1, 5, 2, 'Bibiana');
INSERT INTO Jugador(Jugador_ID, Puntos_corazon, Puntos_flor, Puntos_estrella, Monedas, Estado, Personaje) VALUES (10, 12, 23, 1, 97, 3, 'Koops');


INSERT INTO Partida(Nombre, Horas_Jugadas, Usuario_ID, Jugador_ID) VALUES ('Alberto', 19, 1, 1);
INSERT INTO Partida(Nombre, Horas_Jugadas, Usuario_ID, Jugador_ID) VALUES ('Alejandro', 27, 2, 2);
INSERT INTO Partida(Nombre, Horas_Jugadas, Usuario_ID, Jugador_ID) VALUES ('Blanca', 27, 3, 3);
INSERT INTO Partida(Nombre, Horas_Jugadas, Usuario_ID, Jugador_ID) VALUES ('Carlota', 40, 4, 4);
INSERT INTO Partida(Nombre, Horas_Jugadas, Usuario_ID, Jugador_ID) VALUES ('Emilio', 49, 5, 5);
INSERT INTO Partida(Nombre, Horas_Jugadas, Usuario_ID, Jugador_ID) VALUES ('Héctor', 24, 6, 6);
INSERT INTO Partida(Nombre, Horas_Jugadas, Usuario_ID, Jugador_ID) VALUES ('Irene', 17, 7, 7);
INSERT INTO Partida(Nombre, Horas_Jugadas, Usuario_ID, Jugador_ID) VALUES ('Luis', 17, 8, 8);
INSERT INTO Partida(Nombre, Horas_Jugadas, Usuario_ID, Jugador_ID) VALUES ('Sandro', 46, 9, 9);
INSERT INTO Partida(Nombre, Horas_Jugadas, Usuario_ID, Jugador_ID) VALUES ('Verónica', 28, 10, 10);

INSERT INTO Medalla(Nombre, Coste_PM, Descripcion, Jugador_ID) VALUES ('Salto Potente', 1, 'Permite realizar un Salto Potente. Gasta 2 PF. Salta con mucho poder de ataque.', 3);
INSERT INTO Medalla(Nombre, Coste_PM, Descripcion, Jugador_ID) VALUES ('Multi-Rebote', 1, 'Permite realizar un Multi-Rebote. Gasta 2 PF. Puedes saltar sobre todos los enemigos.', 10);
INSERT INTO Medalla(Nombre, Coste_PM, Descripcion, Jugador_ID) VALUES ('Golpe Potente', 1, 'Permite realizar un Golpe Potente. Gasta 2 PF. Martillea con mucho poder de ataque.', 2);
INSERT INTO Medalla(Nombre, Coste_PM, Descripcion, Jugador_ID) VALUES ('Martillo Terremoto', 2, 'Permite realizar un Martillo Terremoto. Gasta 3 PF. Daña a todos los enemigos del suelo y techo.', 6);
INSERT INTO Medalla(Nombre, Coste_PM, Descripcion, Jugador_ID) VALUES ('Golpe Confusión', 1, 'Permite realizar un Golpe Confusión. Gasta 2 PF. El enemigo golpeado quedará confuso.', 2);
INSERT INTO Medalla(Nombre, Coste_PM, Descripcion, Jugador_ID) VALUES ('Doble Objeto', 3, 'En el combate, permite a Mario usar dos objetos durante un turno. Gasta 4 PF.', 2);
INSERT INTO Medalla(Nombre, Coste_PM, Descripcion, Jugador_ID) VALUES ('Más Fuerza', 6, 'Incrementa los poderes de Salto y Martillo en 1 Punto.', 9);
INSERT INTO Medalla(Nombre, Coste_PM, Descripcion, Jugador_ID) VALUES ('Mega Prisa', 1, 'Cuando Mario está en peligro, su poder de ataque sube en 5 puntos.', 2);
INSERT INTO Medalla(Nombre, Coste_PM, Descripcion, Jugador_ID) VALUES ('Última Posibilidad', 1, 'Cuando Mario está en peligro, solo recibe la mitad del daño.', 6);
INSERT INTO Medalla(Nombre, Coste_PM, Descripcion, Jugador_ID) VALUES ('Más PC', 3, 'Incrementa los PC Máximos de Mario en 5 puntos.', 1);
INSERT INTO Medalla(Nombre, Coste_PM, Descripcion, Jugador_ID) VALUES ('Más PF', 3, 'Incrementa los PF Máximos en 5 puntos.', 7);
INSERT INTO Medalla(Nombre, Coste_PM, Descripcion, Jugador_ID) VALUES ('Ahorraflores', 4, 'En el combate, ahorra 1 PF cada vez que Mario ataca.', 10);
INSERT INTO Medalla(Nombre, Coste_PM, Descripcion, Jugador_ID) VALUES ('Anti-Pinchos', 3, 'Permite saltar sobre un enemigo con pinchos sin recibir daño.', 5);
INSERT INTO Medalla(Nombre, Coste_PM, Descripcion, Jugador_ID) VALUES ('Vacuna', 4, 'Protege a Mario de mareos y envenenamientos durante el combate.', 4);
INSERT INTO Medalla(Nombre, Coste_PM, Descripcion, Jugador_ID) VALUES ('Corazón Feliz', 2, 'Va recuperando los PC de Mario durante el combate.', 1);
INSERT INTO Medalla(Nombre, Coste_PM, Descripcion, Jugador_ID) VALUES ('Día Suerte', 7, 'Hace que el enemigo falle mucho al atacar a Mario.', 7);
INSERT INTO Medalla(Nombre, Coste_PM, Descripcion, Jugador_ID) VALUES ('Cambio Rápido', 7, 'Permite cambiar de compañero sin perder turno.', 10);
INSERT INTO Medalla(Nombre, Coste_PM, Descripcion, Jugador_ID) VALUES ('FX Ataque A', 0, 'Cuando Mario ataca, se oye el sonido de una rana.', 4);
INSERT INTO Medalla(Nombre, Coste_PM, Descripcion, Jugador_ID) VALUES ('Emblema L', 0, 'El traje de Mario se volverá como el de Luigi.', 3);

INSERT INTO Hab_Estrella(Nombre, Coste_PE, Descripcion, Jugador_ID) VALUES ('Recuperar', 1, 'Recupera PC y PF, curando a Mario y a su compañero.', 6);
INSERT INTO Hab_Estrella(Nombre, Coste_PE, Descripcion, Jugador_ID) VALUES ('Terremoto', 2, 'Ataca a todos los enemigos haciendo temblar el suelo.', 7);
INSERT INTO Hab_Estrella(Nombre, Coste_PE, Descripcion, Jugador_ID) VALUES ('Tiempo Muerto', 2, 'Detiene durante un rato a todos los enemigos.', 4);
INSERT INTO Hab_Estrella(Nombre, Coste_PE, Descripcion, Jugador_ID) VALUES ('Recargar', 3, 'Aumenta durante un rato el poder de ataque y defensa.', 1);
INSERT INTO Hab_Estrella(Nombre, Coste_PE, Descripcion, Jugador_ID) VALUES ('Ataque Estelar', 4, 'Ataca a todos los enemigos rodeados por las estrellas.', 5);
INSERT INTO Hab_Estrella(Nombre, Coste_PE, Descripcion, Jugador_ID) VALUES ('Como Nuevo', 5, 'Recupera PC y PF y, además, cura a Mario y a su compañero.', 4);
INSERT INTO Hab_Estrella(Nombre, Coste_PE, Descripcion, Jugador_ID) VALUES ('Golpe Final', 2, 'Termina con los enemigos de un golpe.', 1);


-- BATALLA
INSERT INTO Batalla(Enemigo_ID, Jugador_ID, num_Turnos, num_Ayudantes) VALUES (59, 1, 3, 0);
INSERT INTO Batalla(Enemigo_ID, Jugador_ID, num_Turnos, num_Ayudantes) VALUES (12, 2, 2, 3);
INSERT INTO Batalla(Enemigo_ID, Jugador_ID, num_Turnos, num_Ayudantes) VALUES (32, 3, 10, 0);
INSERT INTO Batalla(Enemigo_ID, Jugador_ID, num_Turnos, num_Ayudantes) VALUES (2, 4, 9, 2);
INSERT INTO Batalla(Enemigo_ID, Jugador_ID, num_Turnos, num_Ayudantes) VALUES (10, 5, 3, 0);
INSERT INTO Batalla(Enemigo_ID, Jugador_ID, num_Turnos, num_Ayudantes) VALUES (66, 6, 9, 0);
INSERT INTO Batalla(Enemigo_ID, Jugador_ID, num_Turnos, num_Ayudantes) VALUES (41, 7, 4, 3);
INSERT INTO Batalla(Enemigo_ID, Jugador_ID, num_Turnos, num_Ayudantes) VALUES (23, 8, 2, 1);
INSERT INTO Batalla(Enemigo_ID, Jugador_ID, num_Turnos, num_Ayudantes) VALUES (4, 9, 6, 0);
INSERT INTO Batalla(Enemigo_ID, Jugador_ID, num_Turnos, num_Ayudantes) VALUES (44, 10, 4, 0);



INSERT INTO Jugador_Items(Jugador_ID, items_Nombre, num_Items) VALUES (1, 'Seta', 100);
INSERT INTO Jugador_Items(Jugador_ID, items_Nombre, num_Items) VALUES (2, 'Espíritu', 59);
INSERT INTO Jugador_Items(Jugador_ID, items_Nombre, num_Items) VALUES (3, 'Tónico', 81);
INSERT INTO Jugador_Items(Jugador_ID, items_Nombre, num_Items) VALUES (4, 'Concha Protectora', 99);
INSERT INTO Jugador_Items(Jugador_ID, items_Nombre, num_Items) VALUES (5, 'Chupa PC', 87);
INSERT INTO Jugador_Items(Jugador_ID, items_Nombre, num_Items) VALUES (6, 'Furia trueno', 30);
INSERT INTO Jugador_Items(Jugador_ID, items_Nombre, num_Items) VALUES (7, 'Flor de fuego', 94);
INSERT INTO Jugador_Items(Jugador_ID, items_Nombre, num_Items) VALUES (8, 'Gelatina', 75);
INSERT INTO Jugador_Items(Jugador_ID, items_Nombre, num_Items) VALUES (9, 'Oveja Sueño', 85);
INSERT INTO Jugador_Items(Jugador_ID, items_Nombre, num_Items) VALUES (10, 'Capote', 55);


INSERT INTO Habilidad(Nombre, Coste_PF, Indice_ataque, Indice_defensa, Descripcion, Personaje_Nombre) VALUES ('Cabezazo', 0, 4, 0, 'Ataca a un enemigo de un cabezazo.', 'Goomarina');
INSERT INTO Habilidad(Nombre, Coste_PF, Indice_ataque, Indice_defensa, Descripcion, Personaje_Nombre) VALUES ('Descripción', 0, 0, 0, 'Muestra la descripción del enemigo y sus PC.', 'Goomarina');
INSERT INTO Habilidad(Nombre, Coste_PF, Indice_ataque, Indice_defensa, Descripcion, Personaje_Nombre) VALUES ('Multicabezazo', 3, 3, 0, 'Ataca a un enemigo hasta fallar.', 'Goomarina');
INSERT INTO Habilidad(Nombre, Coste_PF, Indice_ataque, Indice_defensa, Descripcion, Personaje_Nombre) VALUES ('Beso de Ánimo', 4, 0, 0, 'Hace que Mario realice dos acciones en un turno.', 'Goomarina');
INSERT INTO Habilidad(Nombre, Coste_PF, Indice_ataque, Indice_defensa, Descripcion, Personaje_Nombre) VALUES ('Lanzaconcha', 0, 4, 0, 'Lanza la concha a un enemigo.', 'Koops');
INSERT INTO Habilidad(Nombre, Coste_PF, Indice_ataque, Indice_defensa, Descripcion, Personaje_Nombre) VALUES ('Súper Concha', 3, 2, 0, 'Lanza la concha contra todos los enemigos.', 'Koops');
INSERT INTO Habilidad(Nombre, Coste_PF, Indice_ataque, Indice_defensa, Descripcion, Personaje_Nombre) VALUES ('Protegeconcha', 4, 0, 3, 'Deja caer una concha que protege a Mario.', 'Koops');
INSERT INTO Habilidad(Nombre, Coste_PF, Indice_ataque, Indice_defensa, Descripcion, Personaje_Nombre) VALUES ('Concha Furia', 6, 4, 0, 'Ataca a todos los enemigos del suelo.', 'Koops');
INSERT INTO Habilidad(Nombre, Coste_PF, Indice_ataque, Indice_defensa, Descripcion, Personaje_Nombre) VALUES ('Placaje', 0, 4, 0, 'Ataca a un enemigo aplastándolo con el cuerpo.', 'Claudia');
INSERT INTO Habilidad(Nombre, Coste_PF, Indice_ataque, Indice_defensa, Descripcion, Personaje_Nombre) VALUES ('Vendaval', 4, 2, 0, 'Levanta un vendaval y lanza a los enemigos por los aires.', 'Claudia');
INSERT INTO Habilidad(Nombre, Coste_PF, Indice_ataque, Indice_defensa, Descripcion, Personaje_Nombre) VALUES ('Achuchón', 3, 3, 0, 'Achucha al enemigo para drenar sus PC.', 'Claudia');
INSERT INTO Habilidad(Nombre, Coste_PF, Indice_ataque, Indice_defensa, Descripcion, Personaje_Nombre) VALUES ('Cortina Humo', 4, 0, 2, 'Hace que Mario esquive los ataques durante un rato.', 'Claudia');
INSERT INTO Habilidad(Nombre, Coste_PF, Indice_ataque, Indice_defensa, Descripcion, Personaje_Nombre) VALUES ('Golpe Cadera', 0, 2, 0, 'Golpea al enemigo repetidamente.', 'Yoshi');
INSERT INTO Habilidad(Nombre, Coste_PF, Indice_ataque, Indice_defensa, Descripcion, Personaje_Nombre) VALUES ('Engullir', 4, 3, 0, 'Engulle a un enemigo para usarlo como arma arrojadiza.', 'Yoshi');
INSERT INTO Habilidad(Nombre, Coste_PF, Indice_ataque, Indice_defensa, Descripcion, Personaje_Nombre) VALUES ('Huevos Reductores', 3, 0, 0, 'Arroja huevos a los enemigos y los reduce de tamaño.', 'Yoshi');
INSERT INTO Habilidad(Nombre, Coste_PF, Indice_ataque, Indice_defensa, Descripcion, Personaje_Nombre) VALUES ('Estampida', 6, 2, 0, 'Ataca a los enemigos con una estampida de Yoshis.', 'Yoshi');
INSERT INTO Habilidad(Nombre, Coste_PF, Indice_ataque, Indice_defensa, Descripcion, Personaje_Nombre) VALUES ('Golpe Sombra', 0, 2, 0, 'Ataca a un enemigo con un puñetazo y le prende fuego.', 'Bibiana');
INSERT INTO Habilidad(Nombre, Coste_PF, Indice_ataque, Indice_defensa, Descripcion, Personaje_Nombre) VALUES ('Transparencia', 1, 0, 3, 'Esconde a Mario para evitar los ataques de los enemigos.', 'Bibiana');
INSERT INTO Habilidad(Nombre, Coste_PF, Indice_ataque, Indice_defensa, Descripcion, Personaje_Nombre) VALUES ('Llamarada', 6, 4, 0, 'Ataca a todos los enemigos con una llamarada.', 'Bibiana');
INSERT INTO Habilidad(Nombre, Coste_PF, Indice_ataque, Indice_defensa, Descripcion, Personaje_Nombre) VALUES ('Embelesamiento', 4, 0, 0, 'Confunde a los enemigos con un beso sensual.', 'Bibiana');
INSERT INTO Habilidad(Nombre, Coste_PF, Indice_ataque, Indice_defensa, Descripcion, Personaje_Nombre) VALUES ('Bomba', 0, 4, 0, 'Explota atacando a un enemigo que esté en el suelo.', 'Bombard');
INSERT INTO Habilidad(Nombre, Coste_PF, Indice_ataque, Indice_defensa, Descripcion, Personaje_Nombre) VALUES ('Bomba Tiempo', 3, 3, 0, 'Arroja tres bombas que explotan un turno después.', 'Bombard');
INSERT INTO Habilidad(Nombre, Coste_PF, Indice_ataque, Indice_defensa, Descripcion, Personaje_Nombre) VALUES ('Mina', 4, 4, 4, 'Causa daño al enemigo que ataque a Bombard.', 'Bombard');
INSERT INTO Habilidad(Nombre, Coste_PF, Indice_ataque, Indice_defensa, Descripcion, Personaje_Nombre) VALUES ('Gran Explosión', 9, 4, 0, 'Explota atacando a todos los enemigos.', 'Bombard');
INSERT INTO Habilidad(Nombre, Coste_PF, Indice_ataque, Indice_defensa, Descripcion, Personaje_Nombre) VALUES ('Bofetada del Amor', 0, 4, 0, 'Ataca a un enemigo de una bofetada.', 'Lupina');
INSERT INTO Habilidad(Nombre, Coste_PF, Indice_ataque, Indice_defensa, Descripcion, Personaje_Nombre) VALUES ('Beso Furtivo', 2, 0, 0, 'Roba los objetos y medallas que tengan los enemigos.', 'Lupina');


--CONSULTAS
-- Simples

-- Todos los jugadores con más de 50 monedas y 30 puntos flor.
SELECT * FROM Jugador WHERE Monedas > 50 AND Puntos_flor > 20;

-- Todas las habilidades estrella que consuman más de 4 puntos estrella
SELECT Nombre FROM Hab_Estrella WHERE Coste_PE > 4;

-- Todos los lugares donde haya más de 10 enemigos y 5 NPCs.
SELECT Nombre FROM Lugar WHERE Enemigos > 10 AND NPCs > 5;

-- Compuestas

-- Todos los enemigos que vuelan que vivan en X región.
SELECT e.Nombre FROM Enemigo e INNER JOIN Lugar_Enemigo l ON e.Enemigo_ID=l.Enemigo_ID
WHERE e.Vuela = 1 AND l.Nombre_Lugar = "Llanura Estelar";
-----------------------------------------------------------------------------------------

-- CONSULTAS
--Compuestas:
--El nombre de la habilidad con mayor indice de ataque de entre los personajes 
--cuyo valor de PF sea mayor o igual que 5. REVISAR!!!!!!!!!!!!!!!!!!!!!!
SELECT h.Nombre FROM Personaje p JOIN Habilidad h ON h.Personaje_Nombre = p.Nombre
WHERE h.Indice_ataque = (SELECT max(Indice_ataque) FROM Habilidad
WHERE h.Personaje_Nombre = (SELECT Nombre FROM Personaje WHERE PF >= 5));


--La descripción de un ítem cuyo nombre sea X del jugador con id X.
SELECT i.Descripcion FROM Items i JOIN Jugador_Items j ON j.items_Nombre = i.Nombre WHERE 
i.Nombre = "Concha Protectora" AND j.Jugador_ID = "4";
--Mostrar el nombre de los enemigos que se han enfrentado al jugador con id X
SELECT e.Nombre FROM Enemigo e JOIN Batalla b ON e.Enemigo_ID = b.Enemigo_ID
WHERE b.Jugador_ID = 1;

--Agrupadas:
--Agrupar las habilidades estrella según su coste y mostrar cuantas habilidades
--hay de cada coste
SELECT count(Coste_PE),coste_PE FROM Hab_Estrella GROUP BY Coste_PE;
--Calcular la media de PF de los personajes según su procedencia
SELECT Procedencia, round(avg(PC),2) FROM Personaje GROUP BY Procedencia;
--Calcular el numero total de items de los jugadores
SELECT Jugador_ID, sum(num_Items) FROM Jugador_Items GROUP BY Jugador_ID;
--Nombre, puntos de fuerza, y atque total de todas las habilidades
--de un personaje agrupadas pot el nomre
SELECT p.Nombre, p.PF, sum(h.Indice_ataque) AS Ataque_Total_Hab
FROM Habilidad h JOIN Personaje p ON h.Personaje_Nombre = p.Nombre
GROUP BY p.Nombre;