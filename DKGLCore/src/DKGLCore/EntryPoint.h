#pragma once

#ifdef DKGL_PLATFORM_WINDOWS

extern DKGL::Application* DKGL::CreateApplication();

int main(int argc, char** argv)
{
	DKGL::Log::Init();
	DKGL_CORE_LOG_WARN("Logger Init!");
	int a = 9;
	DKGL_LOG_INFO("Hello World! I am {0}", a);
	
	auto app = DKGL::CreateApplication();
	app->Run();
	delete app;
}

#endif