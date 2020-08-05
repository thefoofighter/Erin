#pragma once

#include <memory>

#include "Core.h"
#include "spdlog/spdlog.h"

namespace DKGL
{

	class DKGL_API Log
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

// DKGL Core Logging Macros
#define DKGL_CORE_LOG_TRACE(...)     ::DKGL::Log::GetCoreLogger()->trace(__VA_ARGS__)
#define DKGL_CORE_LOG_INFO(...)      ::DKGL::Log::GetCoreLogger()->info(__VA_ARGS__)
#define DKGL_CORE_LOG_WARN(...)      ::DKGL::Log::GetCoreLogger()->warn(__VA_ARGS__)
#define DKGL_CORE_LOG_ERROR(...)     ::DKGL::Log::GetCoreLogger()->error(__VA_ARGS__)
#define DKGL_CORE_LOG_FATAL(...)     ::DKGL::Log::GetCoreLogger()->critical(__VA_ARGS__)

// DKGL Application Logging Macros
#define DKGL_LOG_TRACE(...)          ::DKGL::Log::GetClientLogger()->trace(__VA_ARGS__)
#define DKGL_LOG_INFO(...)           ::DKGL::Log::GetClientLogger()->info(__VA_ARGS__)
#define DKGL_LOG_WARN(...)           ::DKGL::Log::GetClientLogger()->warn(__VA_ARGS__)
#define DKGL_LOG_ERROR(...)          ::DKGL::Log::GetClientLogger()->error(__VA_ARGS__)
#define DKGL_LOG_FATAL(...)          ::DKGL::Log::GetClientLogger()->critical(__VA_ARGS__)