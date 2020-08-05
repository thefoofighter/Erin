project(DKGLCore CXX)

################################################################################
# Source groups
################################################################################
set(no_group_source_files
    "src/DKGLCore.h"
)
source_group("" FILES ${no_group_source_files})

set(DKGLCore
    "src/DKGLCore/Application.cpp"
    "src/DKGLCore/Application.h"
    "src/DKGLCore/Core.h"
    "src/DKGLCore/EntryPoint.h"
    "src/DKGLCore/Log.cpp"
    "src/DKGLCore/Log.h"
)
source_group("DKGLCore" FILES ${DKGLCore})

set(DKGLCore__Events
    "src/DKGLCore/Events/ApplicationEvent.h"
    "src/DKGLCore/Events/Event.h"
    "src/DKGLCore/Events/KeyEvent.h"
    "src/DKGLCore/Events/MouseEvent.h"
)
source_group("DKGLCore\\Events" FILES ${DKGLCore__Events})

set(ALL_FILES
    ${no_group_source_files}
    ${DKGLCore}
    ${DKGLCore__Events}
)

################################################################################
# Target
################################################################################
add_library(${PROJECT_NAME} SHARED ${ALL_FILES})

use_props(${PROJECT_NAME} "${CMAKE_CONFIGURATION_TYPES}" "${DEFAULT_CXX_PROPS}")
set(ROOT_NAMESPACE DKGLCore)

set_target_properties(${PROJECT_NAME} PROPERTIES
    VS_GLOBAL_KEYWORD "Win32Proj"
)
################################################################################
# Target name
################################################################################
set_target_properties(${PROJECT_NAME} PROPERTIES
    TARGET_NAME_DEBUG   "DKGLCore"
    TARGET_NAME_DIST    "DKGLCore"
    TARGET_NAME_RELEASE "DKGLCore"
)
################################################################################
# Output directory
################################################################################
set_target_properties(${PROJECT_NAME} PROPERTIES
    OUTPUT_DIRECTORY_DEBUG   "${CMAKE_CURRENT_SOURCE_DIR}/../Build/bin/Debug-windows-x86_64/DKGLCore/"
    OUTPUT_DIRECTORY_DIST    "${CMAKE_CURRENT_SOURCE_DIR}/../Build/bin/Dist-windows-x86_64/DKGLCore/"
    OUTPUT_DIRECTORY_RELEASE "${CMAKE_CURRENT_SOURCE_DIR}/../Build/bin/Release-windows-x86_64/DKGLCore/"
)
set_target_properties(${PROJECT_NAME} PROPERTIES
    ARCHIVE_OUTPUT_DIRECTORY_DEBUG   "${CMAKE_CURRENT_SOURCE_DIR}/../Build/bin/Debug-windows-x86_64/DKGLCore"
    ARCHIVE_OUTPUT_DIRECTORY_DIST    "${CMAKE_CURRENT_SOURCE_DIR}/../Build/bin/Dist-windows-x86_64/DKGLCore"
    ARCHIVE_OUTPUT_DIRECTORY_RELEASE "${CMAKE_CURRENT_SOURCE_DIR}/../Build/bin/Release-windows-x86_64/DKGLCore"
)
set_target_properties(${PROJECT_NAME} PROPERTIES
    ARCHIVE_OUTPUT_NAME_DEBUG   "DKGLCore"
    ARCHIVE_OUTPUT_NAME_DIST    "DKGLCore"
    ARCHIVE_OUTPUT_NAME_RELEASE "DKGLCore"
)
################################################################################
# Include directories
################################################################################
target_include_directories(${PROJECT_NAME} PUBLIC
    "${CMAKE_CURRENT_SOURCE_DIR}/src;"
    "${CMAKE_CURRENT_SOURCE_DIR}/3rdparty/spdlog/include"
)

################################################################################
# Compile definitions
################################################################################
target_compile_definitions(${PROJECT_NAME} PRIVATE
    "$<$<CONFIG:Debug>:"
        "DKGL_DEBUG"
    ">"
    "$<$<CONFIG:Dist>:"
        "DKGL_DIST"
    ">"
    "$<$<CONFIG:Release>:"
        "DKGL_RELEASE"
    ">"
    "DKGL_PLATFORM_WINDOWS;"
    "DKGL_BUILD_DLL;"
    "UNICODE;"
    "_UNICODE"
)

################################################################################
# Compile and link options
################################################################################
if(MSVC)
    target_compile_options(${PROJECT_NAME} PRIVATE
        $<$<CONFIG:Debug>:
            /Od;
            /MTd;
            /ZI
        >
        $<$<CONFIG:Dist>:
            /Gm-;
            /Ox;
            /Oi;
            /GF;
            /MT;
            /Gy;
            ${DEFAULT_CXX_DEBUG_INFORMATION_FORMAT}
        >
        $<$<CONFIG:Release>:
            /Gm-;
            /Ox;
            /Oi;
            /GF;
            /MT;
            /Gy;
            ${DEFAULT_CXX_DEBUG_INFORMATION_FORMAT}
        >
        /std:c++17;
        /W3;
        ${DEFAULT_CXX_EXCEPTION_HANDLING};
        /Y-
    )
    target_link_options(${PROJECT_NAME} PRIVATE
        $<$<CONFIG:Debug>:
            /DEBUG;
            /INCREMENTAL
        >
        $<$<CONFIG:Dist>:
            /DEBUG:FULL;
            /OPT:REF;
            /OPT:ICF;
            /INCREMENTAL:NO
        >
        $<$<CONFIG:Release>:
            /DEBUG:FULL;
            /OPT:REF;
            /OPT:ICF;
            /INCREMENTAL:NO
        >
        /SUBSYSTEM:WINDOWS
    )
endif()

################################################################################
# Post build events
################################################################################
add_custom_command_if(
    TARGET ${PROJECT_NAME}
    POST_BUILD
    COMMANDS
    COMMAND   $<CONFIG:Debug> IF EXIST ..\\Build\\bin\\Debug-windows-x86_64\\DKGLCore\\DKGLCore.dll\\ (xcopy /Q /E /Y /I ..\\Build\\bin\\Debug-windows-x86_64\\DKGLCore\\DKGLCore.dll ..\\Build\\bin\\Debug-windows-x86_64\\DKGL > nul) ELSE (xcopy /Q /Y /I ..\\Build\\bin\\Debug-windows-x86_64\\DKGLCore\\DKGLCore.dll ..\\Build\\bin\\Debug-windows-x86_64\\DKGL > nul)
    COMMAND    $<CONFIG:Dist> IF EXIST ..\\Build\\bin\\Dist-windows-x86_64\\DKGLCore\\DKGLCore.dll\\ (xcopy /Q /E /Y /I ..\\Build\\bin\\Dist-windows-x86_64\\DKGLCore\\DKGLCore.dll ..\\Build\\bin\\Dist-windows-x86_64\\DKGL > nul) ELSE (xcopy /Q /Y /I ..\\Build\\bin\\Dist-windows-x86_64\\DKGLCore\\DKGLCore.dll ..\\Build\\bin\\Dist-windows-x86_64\\DKGL > nul)
    COMMAND $<CONFIG:Release> IF EXIST ..\\Build\\bin\\Release-windows-x86_64\\DKGLCore\\DKGLCore.dll\\ (xcopy /Q /E /Y /I ..\\Build\\bin\\Release-windows-x86_64\\DKGLCore\\DKGLCore.dll ..\\Build\\bin\\Release-windows-x86_64\\DKGL > nul) ELSE (xcopy /Q /Y /I ..\\Build\\bin\\Release-windows-x86_64\\DKGLCore\\DKGLCore.dll ..\\Build\\bin\\Release-windows-x86_64\\DKGL > nul)
)

