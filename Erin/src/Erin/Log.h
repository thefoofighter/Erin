#pragma once

#include "Core.h"
#include "spdlog/spdlog.h"
#include "spdlog/fmt/ostr.h"

namespace Erin
{
    class ERIN_API Log
    {
    public:
        static void InitErinLogger(const std::string& name);
        static void InitClientLogger(const std::string& name);

        static std::shared_ptr<spdlog::logger>& GetErinLogger() { return s_ErinLogger; }
        static std::shared_ptr<spdlog::logger>& GetClientLogger() { return s_ClientLogger; }
    private:
        static std::shared_ptr<spdlog::logger> s_ErinLogger;
        static std::shared_ptr<spdlog::logger> s_ClientLogger;
    };
}

// ERIN Logging Macros
#define ERIN_LOG_TRACE(...)     ::Erin::Log::GetErinLogger()->trace(__VA_ARGS__)
#define ERIN_LOG_INFO(...)      ::Erin::Log::GetErinLogger()->info(__VA_ARGS__)
#define ERIN_LOG_WARN(...)      ::Erin::Log::GetErinLogger()->warn(__VA_ARGS__)
#define ERIN_LOG_ERROR(...)     ::Erin::Log::GetErinLogger()->error(__VA_ARGS__)
#define ERIN_LOG_FATAL(...)     ::Erin::Log::GetErinLogger()->critical(__VA_ARGS__)

// CLIENT Logging Macros
#define CLIENT_LOG_TRACE(...)          ::Erin::Log::GetClientLogger()->trace(__VA_ARGS__)
#define CLIENT_LOG_INFO(...)           ::Erin::Log::GetClientLogger()->info(__VA_ARGS__)
#define CLIENT_LOG_WARN(...)           ::Erin::Log::GetClientLogger()->warn(__VA_ARGS__)
#define CLIENT_LOG_ERROR(...)          ::Erin::Log::GetClientLogger()->error(__VA_ARGS__)
#define CLIENT_LOG_FATAL(...)          ::Erin::Log::GetClientLogger()->critical(__VA_ARGS__)