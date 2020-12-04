#include "pch.h"

void stratPersonnel::create(String^ nom, String^ prenom, String^ embauche, String^ rue, String^ ville, String^ CP) {
	CLpersonnel obj;
	obj.setnom(nom);
	obj.setprenom(prenom);
	obj.setadresse(rue);
	obj.setdateEmbauche(embauche);
	conDataBase->Open();
	
	cmdclient = "INSERT INTO projetpoo.ADRESSES (NUM_ET_RUE, VILLE, CP) VALUES('" + rue + "','" + ville + "','" + CP + "');";
	command = gcnew MySql::Data::MySqlClient::MySqlCommand(cmdclient, conDataBase);
	myReader = gcnew MySql::Data::MySqlClient::MySqlDataAdapter(command);
	myReader->Fill(DS);

	cmdid = "select IDADR from projetpoo.ADRESSES where NUM_ET_RUE= '" + rue + "' and VILLE = '" + ville + "' and CP='" + CP + "';";
	commandid = gcnew MySql::Data::MySqlClient::MySqlCommand(cmdid, conDataBase);
	MySqlDataReader^ myreader = commandid->ExecuteReader();
	myreader->Read();
	int^ idadresse = myreader->GetInt32(0);
	myreader->Close();
	
	cmdclient = "insert into projetpoo.PERSONNEL(IDADR,NOM,PRENOM,DATEEMBAUCHE) values (" + idadresse + ",'" + nom + "','" + prenom + "','" + embauche + "');";
	command = gcnew MySql::Data::MySqlClient::MySqlCommand(cmdclient, conDataBase);
	myReader = gcnew MySql::Data::MySqlClient::MySqlDataAdapter(command);
	myReader->Fill(DS);
};
void stratPersonnel::update(String^ nom, String^ prenom, String^ rue, String^ ville, String^ CP, String^ id, String^ idsup) {
	conDataBase->Open();

	cmdclient = "insert into projetpoo.ADRESSES(NUM_ET_RUE,VILLE,CP) values ('" + rue + "','" + ville + "','" + CP + "');";
	command = gcnew MySql::Data::MySqlClient::MySqlCommand(cmdclient, conDataBase);
	myReader = gcnew MySql::Data::MySqlClient::MySqlDataAdapter(command);
	myReader->Fill(DS);

	cmdid = "select IDADR from projetpoo.ADRESSES where NUM_ET_RUE= '" + rue + "' and VILLE = '" + ville + "' and CP='" + CP + "';";
	commandid = gcnew MySql::Data::MySqlClient::MySqlCommand(cmdid, conDataBase);
	MySqlDataReader^ myreader = commandid->ExecuteReader();
	myreader->Read();
	int^ idadresse = myreader->GetInt32(0);
	myreader->Close();

	if (idsup != "") {
		cmdclient = "UPDATE projetpoo.PERSONNEL SET NOM = '" + nom + "', PRENOM ='" + prenom + "',IDADR= " + idadresse + ",PER_IDPERSO=" + idsup + " where IDPERSO=" + id + ";";
	}
	else
	{
		cmdclient = "UPDATE projetpoo.PERSONNEL SET NOM = '" + nom + "', PRENOM ='" + prenom + "',IDADR= " + idadresse + ",PER_IDPERSO= NULL where IDPERSO=" + id + ";";
	}
	command = gcnew MySql::Data::MySqlClient::MySqlCommand(cmdclient, conDataBase);
	myReader = gcnew MySql::Data::MySqlClient::MySqlDataAdapter(command);
	myReader->Fill(DS);
	conDataBase->Close();
};
void stratPersonnel::suppr(String^ id) {
	String^ constring = L"datasource=192.168.233.132;port=3306;username=TeoMoca;password=Iammoca*76";
	MySqlConnection^ conDataBase = gcnew MySqlConnection(constring);
	conDataBase->Open();
	String^ queryString = "UPDATE projetpoo.PERSONNEL SET PER_IDPERSO = NULL WHERE PER_IDPERSO = " + id + "; DELETE FROM projetpoo.PERSONNEL WHERE IDPERSO = " + id + ";";
	MySqlCommand^ command = gcnew MySqlCommand(queryString, conDataBase);
	MySqlDataAdapter^ myAdapter = gcnew MySqlDataAdapter(command);
	DataTable^ DT = gcnew DataTable();
	myAdapter->Fill(DT);
}