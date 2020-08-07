#pragma once

#if defined DKGL_PLATFORM_WINDOWS
	#ifdef DKGL_BUILD_DLL
		#define DKGL_API __declspec(dllexport)
	#else
		#define DKGL_API __declspec(dllimport)
	#endif
#elif defined DKGL_PLATFORM_LINUX
    #ifdef DKGL_BUILD_DLL
		#define DKGL_API __attribute__((visibility("default")))
	#else
		#define DKGL_API
    #endif
#elif defined DKGL_PLATFORM_MAC
    #ifdef DKGL_BUILD_DLL
		#define DKGL_API __attribute__((visibility("default")))
	#else
		#define DKGL_API
	#endif
#else
    #error Unsupported platform!
#endif

#define BIT(x) (1 << x)