#include "Application.h"

#include "Events/ApplicationEvent.h"
#include "Log.h"

namespace DKGL {



	Application::Application()
	{
	}

	Application::~Application()
	{
	}

	void Application::Run()
	{
	    WindowResizeEvent e(1280, 760);
	    DKGL_LOG_TRACE(e);

		while (true);
	}

}