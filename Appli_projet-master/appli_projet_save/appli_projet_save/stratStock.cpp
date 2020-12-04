#include "pch.h"

void stratStock::create(int idnature, int idcouleur, String^ desi, String^ quant, String^ seuil, String^ prixach, String^ ht, int tva) {
	String^ constring = L"datasource=192.168.233.132;port=3306;username=TeoMoca;password=Iammoca*76";
	MySqlConnection^ conDataBase = gcnew MySqlConnection(constring);
	conDataBase->Open();
	String^ queryString = "	INSERT INTO projetpoo.ARTICLE(IDNATURE, IDCOULEUR, DESIGNATION, QUANTDISPO, SEUILAPPRO, PRIXACHAT, PRIXHT, TVA) VALUES(" + idnature + ", " + idcouleur + ",'" + desi + "'," + quant + "," + seuil + ", " + prixach + ", " + ht + "," + tva + ");";
	MySqlCommand^ command = gcnew MySqlCommand(queryString, conDataBase);
	MySqlDataAdapter^ myAdapter = gcnew MySqlDataAdapter(command);
	DataTable^ DT = gcnew DataTable();
	myAdapter->Fill(DT);
	conDataBase->Close();
};

void stratStock::update(String^ designation, String^ quantite, String^ seuil, String^ prix_achat, String^prix_HT, String^ TVA, String^ Article_Ref) {
	String^ constring = L"datasource=192.168.233.132;port=3306;username=TeoMoca;password=Iammoca*76";
	MySqlConnection^ conDataBase = gcnew MySql::Data::MySqlClient::MySqlConnection(constring);
	conDataBase->Open();
	String^ cmdclient = "	UPDATE projetpoo.ARTICLE SET DESIGNATION = '" + designation + "', QUANTDISPO = " + quantite + ", SEUILAPPRO = " + seuil + ", PRIXACHAT = " + prix_achat + ", PRIXHT = " + prix_HT + ", TVA = " + TVA + " WHERE ARTREF=" + Article_Ref + ";";
	MySqlCommand^ command = gcnew MySql::Data::MySqlClient::MySqlCommand(cmdclient, conDataBase);
	MySqlDataAdapter^ myReader = gcnew MySql::Data::MySqlClient::MySqlDataAdapter(command);
	DataTable^ DS = gcnew DataTable();
	myReader->Fill(DS);
	conDataBase->Close();
};
