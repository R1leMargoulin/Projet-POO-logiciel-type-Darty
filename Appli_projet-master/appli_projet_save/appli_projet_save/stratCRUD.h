#pragma once
using namespace System;
using namespace MySql::Data::MySqlClient;
using namespace System::Data;

ref class stratCRUD
{
public:
	virtual void create() = 0;
	//client
	virtual void create(String^, String^, String^, String^, String^, String^, String^, String^, String^) = 0;
	//perso
	virtual void create(String^, String^, String^, String^, String^, String^) =0;
	//stock
	virtual void create(int, int, String^, String^, String^, String^, String^, int) =0;
	//commande
	virtual void create(String^, String^, String^, String^, String^, String^, String^, String^) =0;

	virtual void update() = 0;
	//client
	virtual void update(String^, String^, String^, String^ ) =0;
	//perso AND stock
	virtual void update(String^, String^, String^, String^, String^, String^, String^) = 0;


	virtual void suppr() = 0;
	//perso
	virtual void suppr(String^) = 0;
	
protected:
	String^ constring = L"datasource=;port=;username=;password=;Allow User Variables=True";
	String^ cmdclient;
	String^ cmdid;
	String^ cmdpersonnel;
	String^ cmdstock;
	MySqlConnection^ conDataBase = gcnew MySql::Data::MySqlClient::MySqlConnection(constring);
	MySqlCommand^ command = gcnew MySql::Data::MySqlClient::MySqlCommand(cmdclient, conDataBase);
	MySqlCommand^ commandstock = gcnew MySql::Data::MySqlClient::MySqlCommand(cmdstock, conDataBase);
	MySqlCommand^ commandpersonnel = gcnew MySql::Data::MySqlClient::MySqlCommand(cmdpersonnel, conDataBase);
	MySqlCommand^ commandid = gcnew MySql::Data::MySqlClient::MySqlCommand(cmdid, conDataBase);
	MySqlDataAdapter^ myReader = gcnew MySql::Data::MySqlClient::MySqlDataAdapter(command);
	DataTable^ DS = gcnew DataTable();
};





