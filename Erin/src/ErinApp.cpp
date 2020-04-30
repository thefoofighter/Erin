#include <ErinCore.h>

class ErinApp : public Erin::Application
{
public:
	ErinApp(){}
	~ErinApp(){}

};

Erin::Application* Erin::CreateApplication()
{
	return new ErinApp();
}