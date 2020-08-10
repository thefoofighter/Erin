solution "Erin"
	architecture "x64"

	configurations
	{
		"Debug",
		"Release",
		"Dist"
	}

outputdir = "%{cfg.buildcfg}-%{cfg.system}-%{cfg.architecture}"

-- Config for the Erin Engine
project "Erin"
	location "Erin"
	kind "SharedLib"
	language "c++"

	targetdir ("Build/bin/" .. outputdir .. "/%{prj.name}")
	objdir ("Build/bintermediate/" .. outputdir .. "/%{prj.name}")

	pchheader "ErinPCH.h"
	pchsource "%{prj.name}/src/ErinPCH.cpp"

	files
	{
		"%{prj.name}/src/**.h",
		"%{prj.name}/src/**.cpp",
	}

	includedirs
	{
		"%{prj.name}/src",
		"%{prj.name}/3rdparty/spdlog/include"
	}

	filter "system:windows"
		cppdialect "C++17"
		staticruntime "On"
		systemversion "latest"

		defines
		{
			"ERIN_PLATFORM_WINDOWS",
			"ERIN_BUILD_DLL"
		}


	filter "system:linux"
		cppdialect "C++17"
		staticruntime "On"
		systemversion "latest"

		defines
		{
			"ERIN_PLATFORM_LINUX",
			"ERIN_BUILD_DLL"	
		}


	filter "system:macosx"
		cppdialect "C++17"
		staticruntime "On"
		systemversion "latest"

		defines
		{
			"ERIN_PLATFORM_MAC",
			"ERIN_BUILD_DLL"	
		}


	filter "configurations:Debug"
		defines "ERIN_DEBUG"
		symbols "On"

	filter "configurations:Release"
		defines "ERIN_RELEASE"
		optimize "On"

	filter "configurations:Dist"
		defines "ERIN_DIST"
		optimize "On"

-- Config for the Sandbox
project "Sandbox"
	location "Sandbox"
	kind "ConsoleApp"
	language "c++"

	targetdir ("Build/bin/" .. outputdir .. "/%{prj.name}")
	objdir ("Build/bintermediate/" .. outputdir .. "/%{prj.name}")

	files
	{
		"%{prj.name}/src/**.h",
		"%{prj.name}/src/**.cpp",
	}

	includedirs
	{
		"Erin/3rdparty/spdlog/include",
		"Erin/src"
	}

	links
	{
		"Erin"
	}

	filter "system:windows"
		cppdialect "C++17"
		staticruntime "On"
		systemversion "latest"

		defines
		{
			"ERIN_PLATFORM_WINDOWS"
		}

		postbuildcommands
		{
			"{COPY} ../Build/bin/" .. outputdir .. "/Erin/ ../Build/bin/" .. outputdir .. "/Sandbox/"
		}

	filter "system:linux"
		cppdialect "C++17"
		staticruntime "On"
		systemversion "latest"

		defines
		{
			"ERIN_PLATFORM_LINUX"	
		}

		postbuildcommands
		{
			"{COPY} ../Build/bin/" .. outputdir .. "/Erin/* ../Build/bin/" .. outputdir .. "/Sandbox"
		}

	filter "system:macosx"
		cppdialect "C++17"
		staticruntime "On"
		systemversion "latest"

		defines
		{
			"ERIN_PLATFORM_MAC"
		}

		postbuildcommands
		{
			"{COPY} ../Build/bin/" .. outputdir .. "/Erin/* ../Build/bin/" .. outputdir .. "/Sandbox"
		}

	filter "configurations:Debug"
		defines "ERIN_DEBUG"
		symbols "On"

	filter "configurations:Release"
		defines "ERIN_RELEASE"
		optimize "On"

	filter "configurations:Dist"
		defines "ERIN_DIST"
		optimize "On"

