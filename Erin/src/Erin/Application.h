#pragma once

#include "Core.h"
#include "Erin/Events/Event.h"
#include "Erin/Events/ApplicationEvent.h"
#include "Window.h"

namespace Erin {

    class ERIN_API Application
    {
    public:
        Application();
        virtual ~Application();

        void Run();

        void OnEvent(Event& e);
    private:
        bool OnWindowClose(WindowCloseEvent& e);

        std::unique_ptr<Window> m_Window;
        bool m_Running = true;

    };

    Application* CreateApplication();
}

