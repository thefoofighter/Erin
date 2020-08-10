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

#define BIT(x) (1 << x)