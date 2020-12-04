#include "pch.h"

void stratCommande::create(String^ ref, String^ paiement, String^ numclient, String^ adrfact,String^ adrlivr, String^ datefact, String^ datelivr,String^ commandstring ) {
	conDataBase->Open();
	cmdclient = "SET @ref ='" + ref + "';SET @num = " + numclient + "; SET @nbrpaie = " + paiement + "; SET @adremis = " + adrfact + "; SET @adrlivr = " + adrlivr + "; SET @anncli = (SELECT BIRTHDATE FROM projetpoo.CLIENT WHERE NUMCLIENT = @num);	SET @annfco = (SELECT FIRSTCOMMANDE FROM projetpoo.CLIENT WHERE NUMCLIENT = @num);SET @dateemis = " + datefact + ";SET @datelivr = " + datelivr + "; SET @prom_anncli = CASE	WHEN DAY(@anncli) = DAY(@dateemis) AND MONTH(@anncli) = MONTH(@dateemis) THEN 1	ELSE 0 END;	SET @prom_annfco = CASE	WHEN DAY(@annfco) = DAY(@dateemis) AND MONTH(@annfco) = MONTH(@dateemis) THEN 1	ELSE 0	END;SET @prixht = 0;SET @tva = 0;SET @prixttc = 0;INSERT INTO projetpoo.COMMANDE(REF, NUMCLIENT, DATEEMIS, DATELIVR, ADRESSEEMIS, ADRESSELIVR,NBRPAIE)	VALUES(@ref, @num, @dateemis, @datelivr, @adremis, @adrlivr,@nbrpaie);UPDATE projetpoo.CLIENT SET FIRSTCOMMANDE = CASE WHEN FIRSTCOMMANDE IS NULL THEN @dateemis	END	WHERE NUMCLIENT = @num;" + commandstring + "UPDATE projetpoo.COMMANDE SET PRIXHT = @prixht, TVA = @tva, PRIXTTC = @prixttc WHERE REF = @ref ;";
	command = gcnew MySql::Data::MySqlClient::MySqlCommand(cmdclient, conDataBase);
	MySqlDataReader^ myreader = command->ExecuteReader();
	myreader->Read();
	myreader->Close();
};
//void stratCommande::read() {
//
//};
//void stratCommande::update() {
//
//};
//void stratCommande::suppr() {
//
//};