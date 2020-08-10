#pragma once

#include "Core.h"
#include "Events/Event.h"

namespace Erin {

	class ERIN_API Application
	{
	public:
		Application();
		virtual ~Application();

		void Run();

		
	};

	Application* CreateApplication();
}

