#include <DKGLCore.h>

class DKGLApp : public DKGL::Application
{
public:
	DKGLApp(){}
	~DKGLApp(){}

};

DKGL::Application* DKGL::CreateApplication()
{
	return new DKGLApp();
}