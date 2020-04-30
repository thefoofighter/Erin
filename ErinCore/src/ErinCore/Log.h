#pragma once

#include <memory>

#include "Core.h"
#include "spdlog/spdlog.h"

namespace Erin
{

	class ERN_API Log
	{
	public:
		static void Init();

		static std::shared_ptr<spdlog::logger>& GetCoreLogger() { return s_CoreLogger; }
		static std::shared_ptr<spdlog::logger>& GetClientLogger() { return s_ClientLogger; }
	private:
		static std::shared_ptr<spdlog::logger> s_CoreLogger;
		static std::shared_ptr<spdlog::logger> s_ClientLogger;
	};

}

// Erin Core Logging Macros
#define ERN_CORE_LOG_TRACE(...)     ::Erin::Log::GetCoreLogger()->trace(__VA_ARGS__)
#define ERN_CORE_LOG_INFO(...)      ::Erin::Log::GetCoreLogger()->info(__VA_ARGS__)
#define ERN_CORE_LOG_WARN(...)      ::Erin::Log::GetCoreLogger()->warn(__VA_ARGS__)
#define ERN_CORE_LOG_ERROR(...)     ::Erin::Log::GetCoreLogger()->error(__VA_ARGS__)
#define ERN_CORE_LOG_FATAL(...)     ::Erin::Log::GetCoreLogger()->critical(__VA_ARGS__)

// Erin Application Logging Macros
#define ERN_LOG_TRACE(...)          ::Erin::Log::GetClientLogger()->trace(__VA_ARGS__)
#define ERN_LOG_INFO(...)           ::Erin::Log::GetClientLogger()->info(__VA_ARGS__)
#define ERN_LOG_WARN(...)           ::Erin::Log::GetClientLogger()->warn(__VA_ARGS__)
#define ERN_LOG_ERROR(...)          ::Erin::Log::GetClientLogger()->error(__VA_ARGS__)
#define ERN_LOG_FATAL(...)          ::Erin::Log::GetClientLogger()->critical(__VA_ARGS__)