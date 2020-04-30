#pragma once

#include "Core.h"

namespace Erin {

	class ERN_API Application
	{
	public:
		Application();
		virtual ~Application();

		void Run();

		
	};

	Application* CreateApplication();
}

