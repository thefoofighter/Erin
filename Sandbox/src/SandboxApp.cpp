#include <Erin.h>

class SandboxApp : public Erin::Application
{
public:
	SandboxApp(){}
	~SandboxApp(){}

};

Erin::Application* Erin::CreateApplication()
{
	return new SandboxApp();
}