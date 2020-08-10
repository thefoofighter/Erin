#pragma once


extern Erin::Application* Erin::CreateApplication();

int main(int argc, char** argv)
{
	Erin::Log::Init();
	ERIN_CORE_LOG_WARN("Logger Init!");
	int a = 9;
	ERIN_LOG_INFO("Hello World! I am {0}", a);
	
	auto app = Erin::CreateApplication();
	app->Run();
	delete app;
}
