#pragma once

#ifdef ERN_PLATFORM_WINDOWS
	#ifdef ERN_BUILD_DLL
		#define ERN_API __declspec(dllexport)
	#else
		#define ERN_API __declspec(dllimport)
	#endif
#else
	#error Erin Only supports Windows for now!
#endif

#define BIT(x) (1 << x)