project "Glad"
    kind "StaticLib"
    language "C"

    targetdir ("Build/bin/" .. outputdir .. "/%{prj.name}")
    objdir ("Build/bintermediate/" .. outputdir .. "/%{prj.name}")

    files
    {
        "include/glad/glad.h",
        "include/KHR/khrplatform.h",
        "src/glad.c"
    }

    includedirs
    {
        "include"
    }

    filter "system:windows"
        systemversion "latest"
        staticruntime "On"

    filter "system:linux"
        pic "On"
        systemversion "latest"
        staticruntime "On"

    filter "system:macosx"
        pic "On"
        systemversion "latest"
        staticruntime "On"

    filter { "system:windows", "configurations:Release", "action:vs*" }
        buildoptions "/MT"