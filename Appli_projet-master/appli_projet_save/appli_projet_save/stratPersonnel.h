#pragma once
#include "stratCRUD.h"

ref class stratPersonnel: public stratCRUD
{
public:
	void create() override {};
	void create(String^, String^, String^, String^, String^, String^) override;
	//client
	void create(String^, String^, String^, String^, String^, String^, String^, String^, String^) override {};
	//commande
	void create(String^, String^, String^, String^, String^, String^, String^, String^) override {};
	//stock
	void create(int, int, String^, String^, String^, String^, String^, int) override {};

	void update() override {};
	void update(String^, String^, String^, String^, String^, String^, String^) override;
	//client
	void update(String^, String^, String^, String^ ) override {};

	void suppr() override {};
	void suppr(String^) override;


};