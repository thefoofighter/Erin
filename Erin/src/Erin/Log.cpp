#include "ErinPCH.h"

#include "spdlog/sinks/stdout_color_sinks.h"

namespace Erin
{
	std::shared_ptr<spdlog::logger> Log::s_ErinLogger;
	std::shared_ptr<spdlog::logger> Log::s_ClientLogger;

	void Log::Init()
	{
		spdlog::set_pattern("%^[%T] %n: %v%$");
		s_ErinLogger = spdlog::stdout_color_mt("Erin Log");
		s_ErinLogger->set_level(spdlog::level::trace);

		s_ClientLogger = spdlog::stdout_color_mt("Sandbox Log");
		s_ClientLogger->set_level(spdlog::level::trace);
	}
}
