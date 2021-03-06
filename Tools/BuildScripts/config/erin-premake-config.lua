workspace "Erin"
    architecture "x64"
    startproject "Sandbox"
    configurations
    {
        "Debug",
        "Release"
    }

-- Get cur dir helper for windows?
-- print("Working Dir: " .. io.popen"cd":read'*l')

outputdir = "%{cfg.buildcfg}-%{cfg.system}-%{cfg.architecture}"

-- Include directories relative to root folder (solution directory)
IncludeDir = {}
IncludeDir["GLFW"] = "Erin/3rdparty/glfw/include"
IncludeDir["Glad"] = "Erin/3rdparty/glad/include"
IncludeDir["ImGui"] = "Erin/3rdparty/imgui"

include "Erin/3rdparty/glfw/glfw-premake-config.lua"
include "Erin/3rdparty/glad/glad-premake-config.lua"
include "Erin/3rdparty/imgui/imgui-premake-config.lua"

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
        "%{prj.name}/3rdparty/spdlog/include",
        "%{IncludeDir.GLFW}",
        "%{IncludeDir.Glad}",
        "%{IncludeDir.ImGui}"
    }

    links
    {
        "GLFW",
        "Glad",
        "ImGui"
    }

    filter "system:windows"
        cppdialect "C++17"
        staticruntime "On"
        systemversion "latest"

        defines
        {
            "ERIN_PLATFORM_WINDOWS",
            "ERIN_BUILD_DLL",
            "GLFW_INCLUDE_NONE"
        }

        links
        {
            "opengl32",
            "gdi32"
        }


    filter "system:linux"
        pic "On"
        cppdialect "C++17"
        staticruntime "On"
        systemversion "latest"

        defines
        {
            "ERIN_PLATFORM_LINUX",
            "ERIN_BUILD_DLL"
        }

        links
        {
            "Xrandr",
            "Xi",
            "GLEW",
            "GLU",
            "GL",
            "X11",
            "pthread"
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

        links
        {
            "OpenGL.framework",
            "Cocoa.framework",
            "IOKit.framework",
            "CoreFoundation.framework"
        }


    filter "configurations:Debug"
        defines "ERIN_DEBUG"
        runtime "Debug"
        symbols "On"
        filter { "system:windows", "configurations:Debug", "action:vs*" }
            buildoptions "-MDd"

    filter "configurations:Release"
        defines "ERIN_RELEASE"
        runtime "Release"
        optimize "On"
        filter { "system:windows", "configurations:Release", "action:vs*"  }
            buildoptions "/MD"

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
        runtime "Debug"
        symbols "On"
        filter { "system:windows", "configurations:Debug", "action:vs*"  }
            buildoptions "-MDd"

    filter "configurations:Release"
        defines "ERIN_RELEASE"
        runtime "Release"
        optimize "On"
        filter { "system:windows", "configurations:Release", "action:vs*"  }
            buildoptions "/MD"

