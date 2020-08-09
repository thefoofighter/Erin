#pragma once

#include "Core.h"
#include "Events/Event.h"

namespace DKGL {

	class DKGL_API Application
	{
	public:
		Application();
		virtual ~Application();

		void Run();

		
	};

	Application* CreateApplication();
}

