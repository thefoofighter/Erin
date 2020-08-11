#pragma once

#if defined ERIN_PLATFORM_WINDOWS
    #ifdef ERIN_BUILD_DLL
        #define ERIN_API __declspec(dllexport)
    #else
        #define ERIN_API __declspec(dllimport)
    #endif
#elif defined ERIN_PLATFORM_LINUX
    #ifdef ERIN_BUILD_DLL
        #define ERIN_API __attribute__((visibility("default")))
    #else
        #define ERIN_API
    #endif
#elif defined ERIN_PLATFORM_MAC
    #ifdef ERIN_BUILD_DLL
        #define ERIN_API __attribute__((visibility("default")))
    #else
        #define ERIN_API
    #endif
#else
    #error Unsupported platform!
#endif

#ifdef ERIN_ENABLE_ASSERTS
    #define ERIN_ASSERT(x, ...) { if(!(x)) { ERIN_ERROR("Assertion Failed: {0}", __VA_ARGS__); __debugbreak(); } }
    #define ERIN_CORE_ASSERT(x, ...) { if(!(x)) { ERIN_CORE_ERROR("Assertion Failed: {0}", __VA_ARGS__); __debugbreak(); } }
#else
    #define ERIN_ASSERT(x, ...)
    #define ERIN_CORE_ASSERT(x, ...)
#endif

#define BIT(x) (1 << x)