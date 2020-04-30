solution "Erin"
	architecture "x64"

	configurations
	{
		"Debug",
		"Release",
		"Dist"
	}

outputdir = "%{cfg.buildcfg}-%{cfg.system}-%{cfg.architecture}"

-- Config for Erin Core Engine
project "ErinCore"
	location "ErinCore"
	kind "SharedLib"
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
		"%{prj.name}/src",
		"%{prj.name}/3rdparty/spdlog/include"
	}

	filter "system:windows"
		cppdialect "C++17"
		staticruntime "On"
		systemversion "latest"

		defines
		{
			"ERN_PLATFORM_WINDOWS",
			"ERN_BUILD_DLL"
		}

		postbuildcommands
		{
			( "{COPY} %{cfg.buildtarget.relpath} ../Build/bin/" .. outputdir .. "/Erin" )
		}


	filter "configurations:Debug"
		defines "ERN_DEBUG"
		symbols "On"

	filter "configurations:Release"
		defines "ERN_RELEASE"
		optimize "On"

	filter "configurations:Dist"
		defines "ERN_DIST"
		optimize "On"

-- Config for the Erin 3D Editor
project "Erin"
	location "Erin"
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
		"ErinCore/3rdparty/spdlog/include",
		"ErinCore/src"
	}

	links
	{
		"ErinCore"
	}

	filter "system:windows"
		cppdialect "C++17"
		staticruntime "On"
		systemversion "latest"

		defines
		{
			"ERN_PLATFORM_WINDOWS"
		}

	filter "configurations:Debug"
		defines "ERN_DEBUG"
		symbols "On"

	filter "configurations:Release"
		defines "ERN_RELEASE"
		optimize "On"

	filter "configurations:Dist"
		defines "ERN_DIST"
		optimize "On"