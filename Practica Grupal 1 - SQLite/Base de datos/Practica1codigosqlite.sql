-- Created by Vertabelo (http://vertabelo.com)
-- Last modification date: 2024-02-28 14:15:59.157

-- tables
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

-- Table: Hab_Estrella
CREATE TABLE Hab_Estrella (
    Nombre text NOT NULL PRIMARY KEY,
    Coste_PE integer NOT NULL,
    Descripcion text NOT NULL,
    Jugador_ID integer NOT NULL,
    FOREIGN KEY (Jugador_ID) REFERENCES Jugador (Jugador_ID)
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

-- Table: Items
CREATE TABLE Items (
    Nombre text NOT NULL PRIMARY KEY,
    Descripcion text NOT NULL
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

-- Table: Jugador_Items
CREATE TABLE Jugador_Items (
    Jugador_ID integer NOT NULL,
    items_Nombre text NOT NULL,
    num_Items integer NOT NULL,
    CONSTRAINT Jugador_Items_pk PRIMARY KEY (Jugador_ID,items_Nombre),
    FOREIGN KEY (Jugador_ID) REFERENCES Jugador (Jugador_ID),
    FOREIGN KEY (items_Nombre) REFERENCES Items (Nombre)
);

-- Table: Lugar
CREATE TABLE Lugar (
    Nombre text NOT NULL PRIMARY KEY,
    NPCs integer NOT NULL,
    Enemigos integer NOT NULL
);

-- Table: Lugar_Enemigo
CREATE TABLE Lugar_Enemigo (
    Nombre_Lugar text NOT NULL,
    Enemigo_ID integer NOT NULL,
    CONSTRAINT Lugar_Enemigo_pk PRIMARY KEY (Nombre_Lugar,Enemigo_ID),
    FOREIGN KEY (Nombre_Lugar) REFERENCES Lugar (Nombre),
    FOREIGN KEY (Enemigo_ID) REFERENCES Enemigo (Enemigo_ID)
);

-- Table: Medalla
CREATE TABLE Medalla (
    Nombre text NOT NULL PRIMARY KEY,
    Coste_PM integer NOT NULL,
    Descripcion text NOT NULL,
    Jugador_ID integer NOT NULL,
    FOREIGN KEY (Jugador_ID) REFERENCES Jugador (Jugador_ID)
);

-- Table: Partida
CREATE TABLE Partida (
    Nombre integer NOT NULL PRIMARY KEY,
    Horas_jugadas integer NOT NULL,
    Usuario_ID text NOT NULL,
    Jugador_ID integer NOT NULL,
    FOREIGN KEY (Usuario_ID) REFERENCES Usuario (ID_Usuario),
    FOREIGN KEY (Jugador_ID) REFERENCES Jugador (Jugador_ID)
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

-- Table: Usuario
CREATE TABLE Usuario (
    ID_Usuario text NOT NULL PRIMARY KEY,
    Nombre text NOT NULL
);

-- End of file.

