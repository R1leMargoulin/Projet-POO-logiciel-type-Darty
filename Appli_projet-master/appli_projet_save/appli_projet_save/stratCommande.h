#pragma once
#include "pch.h"

ref class stratCommande:public stratCRUD
{
public:
	void create() override {};
	void create(int, int, String^, String^, String^, String^, String^, int)  override{};
	void create(String^, String^, String^, String^, String^, String^, String^, String^) override;
	
	//personnel
	void create(String^, String^, String^, String^, String^, String^) override {};
	//client
	void create(String^, String^, String^, String^, String^, String^, String^, String^, String^) override {};


	void update() override {};
	void update(String^, String^, String^, String^, String^, String^, String^) override {};
	//client
	void update(String^, String^, String^, String^) override {};


	void suppr() override {};
	//personnel
	void suppr(String^) override {};
	//void read() override;
	//void update() override;
	//void suppr() override;
};

