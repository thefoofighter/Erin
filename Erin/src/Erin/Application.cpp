#ifndef ERINPCH_H
#define ERINPCH_H

#include "Application.h"

#include "Events/ApplicationEvent.h"
#include "Log.h"

namespace Erin {

	Application::Application()
	{
	}

	Application::~Application()
	{
	}

	void Application::Run()
	{
	    WindowResizeEvent e(1280, 760);
	    ERIN_LOG_TRACE(e);

		while (true);
	}

}

#endif