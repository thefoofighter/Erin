solution "DKGL"
	architecture "x64"

	configurations
	{
		"Debug",
		"Release",
		"Dist"
	}

outputdir = "%{cfg.buildcfg}-%{cfg.system}-%{cfg.architecture}"

-- Config for DKGL Core Engine
project "DKGLCore"
	location "DKGLCore"
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
			"DKGL_PLATFORM_WINDOWS",
			"DKGL_BUILD_DLL"
		}

		postbuildcommands
		{
			( "{COPY} %{cfg.buildtarget.relpath} ../Build/bin/" .. outputdir .. "/DKGL" )
		}

	filter "system:linux"
		cppdialect "C++17"
		staticruntime "On"
		systemversion "latest"

		defines
		{
			"DKGL_PLATFORM_LINUX",
			"DKGL_BUILD_DLL"	
		}

		postbuildcommands
		{
			( "{COPY} %{cfg.buildtarget.relpath} ../Build/bin/" .. outputdir .. "/DKGL" )
		}


	filter "configurations:Debug"
		defines "DKGL_DEBUG"
		symbols "On"

	filter "configurations:Release"
		defines "DKGL_RELEASE"
		optimize "On"

	filter "configurations:Dist"
		defines "DKGL_DIST"
		optimize "On"

-- Config for the DKGL 3D Editor
project "DKGL"
	location "DKGL"
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
		"DKGLCore/3rdparty/spdlog/include",
		"DKGLCore/src"
	}

	links
	{
		"DKGLCore"
	}

	filter "system:windows"
		cppdialect "C++17"
		staticruntime "On"
		systemversion "latest"

		defines
		{
			"DKGL_PLATFORM_WINDOWS"
		}

	filter "system:linux"
		cppdialect "C++17"
		staticruntime "On"
		systemversion "latest"

		defines
		{
			"DKGL_PLATFORM_LINUX"	
		}

	filter "configurations:Debug"
		defines "DKGL_DEBUG"
		symbols "On"

	filter "configurations:Release"
		defines "DKGL_RELEASE"
		optimize "On"

	filter "configurations:Dist"
		defines "DKGL_DIST"
		optimize "On"