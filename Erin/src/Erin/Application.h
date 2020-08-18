#pragma once

#include "Core.h"
#include "Window.h"
#include "Erin/LayerStack.h"
#include "Erin/Events/Event.h"
#include "Erin/Events/ApplicationEvent.h"


namespace Erin {

    class ERIN_API Application
    {
    public:
        Application();
        virtual ~Application();

        void Run();

        void OnEvent(Event& e);

        void PushLayer(Layer* layer);
        void PushOverlay(Layer* layer);
    private:
        bool OnWindowClose(WindowCloseEvent& e);

        std::unique_ptr<Window> m_Window;
        bool m_Running = true;

        LayerStack m_LayerStack;

    };

    Application* CreateApplication();
}

