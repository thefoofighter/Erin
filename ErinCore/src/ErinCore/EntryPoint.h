#pragma once

#ifdef ERN_PLATFORM_WINDOWS

extern Erin::Application* Erin::CreateApplication();

int main(int argc, char** argv)
{
	Erin::Log::Init();
	ERN_CORE_LOG_WARN("Logger Init!");
	int a = 9;
	ERN_LOG_INFO("Hello World! I am {0}", a);
	
	auto app = Erin::CreateApplication();
	app->Run();
	delete app;
}

#endif