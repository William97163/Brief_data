#------------------------------------------------------------
#        Script MySQL.
#------------------------------------------------------------


#------------------------------------------------------------
# Table: Magasin
#------------------------------------------------------------

CREATE TABLE Magasin(
        id         Int  Auto_increment  NOT NULL ,
        ville      Varchar (50) NOT NULL ,
        nb_salarie Int NOT NULL
	,CONSTRAINT Magasin_PK PRIMARY KEY (id)
)ENGINE=InnoDB;


#------------------------------------------------------------
# Table: Produit
#------------------------------------------------------------

CREATE TABLE Produit(
        id_ref Int  Auto_increment  NOT NULL ,
        nom    Varchar (50) NOT NULL ,
        prix   Decimal NOT NULL ,
        stock  Int NOT NULL
	,CONSTRAINT Produit_PK PRIMARY KEY (id_ref)
)ENGINE=InnoDB;


#------------------------------------------------------------
# Table: Ventes
#------------------------------------------------------------

CREATE TABLE Ventes(
        id               Int  Auto_increment  NOT NULL ,
        _date            Date NOT NULL ,
        quantite         Int NOT NULL ,
        id_ref           Int NOT NULL ,
        id_magasin       Int NOT NULL
	,CONSTRAINT Ventes_PK PRIMARY KEY (id)

	,CONSTRAINT Ventes_Magasin_FK FOREIGN KEY (id_magasin) REFERENCES Magasin(id)
    ,CONSTRAINT Ventes_Produit_FK FOREIGN KEY (id_ref) REFERENCES Produit(id_ref)
)ENGINE=InnoDB;


#------------------------------------------------------------
# Table: contenir
#------------------------------------------------------------

CREATE TABLE contenir(
        id_ref Int NOT NULL ,
        id_vente     Int NOT NULL
	,CONSTRAINT contenir_PK PRIMARY KEY (id_ref,id)

	,CONSTRAINT contenir_Produit_FK FOREIGN KEY (id_ref) REFERENCES Produit(id_ref)
	,CONSTRAINT contenir_Ventes0_FK FOREIGN KEY (id_vente) REFERENCES Ventes(id)
)ENGINE=InnoDB;