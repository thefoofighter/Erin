project(ErinCore CXX)

################################################################################
# Source groups
################################################################################
set(no_group_source_files
    "src/ErinCore.h"
)
source_group("" FILES ${no_group_source_files})

set(ErinCore
    "src/ErinCore/Application.cpp"
    "src/ErinCore/Application.h"
    "src/ErinCore/Core.h"
    "src/ErinCore/EntryPoint.h"
    "src/ErinCore/Log.cpp"
    "src/ErinCore/Log.h"
)
source_group("ErinCore" FILES ${ErinCore})

set(ErinCore__Events
    "src/ErinCore/Events/ApplicationEvent.h"
    "src/ErinCore/Events/Event.h"
    "src/ErinCore/Events/KeyEvent.h"
    "src/ErinCore/Events/MouseEvent.h"
)
source_group("ErinCore\\Events" FILES ${ErinCore__Events})

set(ALL_FILES
    ${no_group_source_files}
    ${ErinCore}
    ${ErinCore__Events}
)

################################################################################
# Target
################################################################################
add_library(${PROJECT_NAME} SHARED ${ALL_FILES})

use_props(${PROJECT_NAME} "${CMAKE_CONFIGURATION_TYPES}" "${DEFAULT_CXX_PROPS}")
set(ROOT_NAMESPACE ErinCore)

set_target_properties(${PROJECT_NAME} PROPERTIES
    VS_GLOBAL_KEYWORD "Win32Proj"
)
################################################################################
# Target name
################################################################################
set_target_properties(${PROJECT_NAME} PROPERTIES
    TARGET_NAME_DEBUG   "ErinCore"
    TARGET_NAME_DIST    "ErinCore"
    TARGET_NAME_RELEASE "ErinCore"
)
################################################################################
# Output directory
################################################################################
set_target_properties(${PROJECT_NAME} PROPERTIES
    OUTPUT_DIRECTORY_DEBUG   "${CMAKE_CURRENT_SOURCE_DIR}/../Build/bin/Debug-windows-x86_64/ErinCore/"
    OUTPUT_DIRECTORY_DIST    "${CMAKE_CURRENT_SOURCE_DIR}/../Build/bin/Dist-windows-x86_64/ErinCore/"
    OUTPUT_DIRECTORY_RELEASE "${CMAKE_CURRENT_SOURCE_DIR}/../Build/bin/Release-windows-x86_64/ErinCore/"
)
set_target_properties(${PROJECT_NAME} PROPERTIES
    ARCHIVE_OUTPUT_DIRECTORY_DEBUG   "${CMAKE_CURRENT_SOURCE_DIR}/../Build/bin/Debug-windows-x86_64/ErinCore"
    ARCHIVE_OUTPUT_DIRECTORY_DIST    "${CMAKE_CURRENT_SOURCE_DIR}/../Build/bin/Dist-windows-x86_64/ErinCore"
    ARCHIVE_OUTPUT_DIRECTORY_RELEASE "${CMAKE_CURRENT_SOURCE_DIR}/../Build/bin/Release-windows-x86_64/ErinCore"
)
set_target_properties(${PROJECT_NAME} PROPERTIES
    ARCHIVE_OUTPUT_NAME_DEBUG   "ErinCore"
    ARCHIVE_OUTPUT_NAME_DIST    "ErinCore"
    ARCHIVE_OUTPUT_NAME_RELEASE "ErinCore"
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
        "ERN_DEBUG"
    ">"
    "$<$<CONFIG:Dist>:"
        "ERN_DIST"
    ">"
    "$<$<CONFIG:Release>:"
        "ERN_RELEASE"
    ">"
    "ERN_PLATFORM_WINDOWS;"
    "ERN_BUILD_DLL;"
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
    COMMAND   $<CONFIG:Debug> IF EXIST ..\\Build\\bin\\Debug-windows-x86_64\\ErinCore\\ErinCore.dll\\ (xcopy /Q /E /Y /I ..\\Build\\bin\\Debug-windows-x86_64\\ErinCore\\ErinCore.dll ..\\Build\\bin\\Debug-windows-x86_64\\Erin > nul) ELSE (xcopy /Q /Y /I ..\\Build\\bin\\Debug-windows-x86_64\\ErinCore\\ErinCore.dll ..\\Build\\bin\\Debug-windows-x86_64\\Erin > nul)
    COMMAND    $<CONFIG:Dist> IF EXIST ..\\Build\\bin\\Dist-windows-x86_64\\ErinCore\\ErinCore.dll\\ (xcopy /Q /E /Y /I ..\\Build\\bin\\Dist-windows-x86_64\\ErinCore\\ErinCore.dll ..\\Build\\bin\\Dist-windows-x86_64\\Erin > nul) ELSE (xcopy /Q /Y /I ..\\Build\\bin\\Dist-windows-x86_64\\ErinCore\\ErinCore.dll ..\\Build\\bin\\Dist-windows-x86_64\\Erin > nul)
    COMMAND $<CONFIG:Release> IF EXIST ..\\Build\\bin\\Release-windows-x86_64\\ErinCore\\ErinCore.dll\\ (xcopy /Q /E /Y /I ..\\Build\\bin\\Release-windows-x86_64\\ErinCore\\ErinCore.dll ..\\Build\\bin\\Release-windows-x86_64\\Erin > nul) ELSE (xcopy /Q /Y /I ..\\Build\\bin\\Release-windows-x86_64\\ErinCore\\ErinCore.dll ..\\Build\\bin\\Release-windows-x86_64\\Erin > nul)
)

