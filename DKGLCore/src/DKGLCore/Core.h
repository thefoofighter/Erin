#pragma once

#ifdef DKGL_PLATFORM_WINDOWS
	#ifdef DKGL_BUILD_DLL
		#define DKGL_API __declspec(dllexport)
	#else
		#define DKGL_API __declspec(dllimport)
	#endif
#else
	#error DKGL Only supports Windows for now!
#endif

#define BIT(x) (1 << x)