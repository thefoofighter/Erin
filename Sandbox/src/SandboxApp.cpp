#include <Erin.h>

class ExampleLayer : public Erin::Layer
{
public:
    ExampleLayer()
            : Layer("Example")
    {
    }

    void OnUpdate() override
    {
        CLIENT_LOG_INFO("ExampleLayer::Update");
    }

    void OnEvent(Erin::Event& event) override
    {
        CLIENT_LOG_TRACE("{0}", event);
    }

};

class SandboxApp : public Erin::Application
{
public:
	SandboxApp(){
        Erin::Log::InitClientLogger("Sandbox");
        PushLayer(new ExampleLayer());
        PushOverlay(new Erin::ImGuiLayer());
	}
	~SandboxApp(){}

};

Erin::Application* Erin::CreateApplication()
{
	return new SandboxApp();
}