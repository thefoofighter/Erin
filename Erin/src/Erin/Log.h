#pragma once

#include "Core.h"
#include "spdlog/spdlog.h"
#include "spdlog/fmt/ostr.h"

namespace Erin
{
	class ERIN_API Log
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

// ERIN Core Logging Macros
#define ERIN_CORE_LOG_TRACE(...)     ::Erin::Log::GetCoreLogger()->trace(__VA_ARGS__)
#define ERIN_CORE_LOG_INFO(...)      ::Erin::Log::GetCoreLogger()->info(__VA_ARGS__)
#define ERIN_CORE_LOG_WARN(...)      ::Erin::Log::GetCoreLogger()->warn(__VA_ARGS__)
#define ERIN_CORE_LOG_ERROR(...)     ::Erin::Log::GetCoreLogger()->error(__VA_ARGS__)
#define ERIN_CORE_LOG_FATAL(...)     ::Erin::Log::GetCoreLogger()->critical(__VA_ARGS__)

// ERIN Application Logging Macros
#define ERIN_LOG_TRACE(...)          ::Erin::Log::GetClientLogger()->trace(__VA_ARGS__)
#define ERIN_LOG_INFO(...)           ::Erin::Log::GetClientLogger()->info(__VA_ARGS__)
#define ERIN_LOG_WARN(...)           ::Erin::Log::GetClientLogger()->warn(__VA_ARGS__)
#define ERIN_LOG_ERROR(...)          ::Erin::Log::GetClientLogger()->error(__VA_ARGS__)
#define ERIN_LOG_FATAL(...)          ::Erin::Log::GetClientLogger()->critical(__VA_ARGS__)