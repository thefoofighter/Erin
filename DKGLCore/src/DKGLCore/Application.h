#pragma once

#include "Core.h"

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

