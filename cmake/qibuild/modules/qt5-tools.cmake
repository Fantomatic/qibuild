##
# This is called *before* any call to qi_use_lib() is made.
# Here we need to define the qt macros, such as qt5_wrap_cpp,
# qt5_add_resources, qt5_wrap_ui
set(CMAKE_AUTOMOC ON)
find_package(Qt5Core REQUIRED)
include("${Qt5Core_DIR}/Qt5CoreMacros.cmake")

find_package(Qt5Widgets REQUIRED)
include("${Qt5Widgets_DIR}/Qt5WidgetsMacros.cmake")

function(qi_generate_qt_conf)
  # First, find qt and generate qt.conf
  # containing paths in the toolchain
  if(DEFINED QT_PLUGINS_PATH)
    set(_plugins_path "${QT_PLUGINS_PATH}")
  else()
    list(GET QT5_CORE_LIBRARIES 0 _lib)
    if("${_lib}" STREQUAL "debug"
        OR "${_lib}" STREQUAL "optimized"
        OR "${_lib}" STREQUAL "general")
      list(GET QT5_CORE_LIBRARIES 1 _lib)
    endif()

    get_filename_component(_lib_path ${_lib} PATH)
    set(_plugins_path ${_lib_path}/qt5/plugins)
  endif()

  file(WRITE "${QI_SDK_DIR}/${QI_SDK_BIN}/qt.conf"
"[Paths]
Plugins = ${_plugins_path}
")

  # Then, generate and install a qt.conf
  # containing relative paths
  if(APPLE)
    set(_relative_plugins_path "../../lib/qt5/plugins")
  else()
    set(_relative_plugins_path "../lib/qt5/plugins")
  endif()
  file(WRITE "${CMAKE_BINARY_DIR}/qt.conf"
"[Paths]
Plugins = ${_relative_plugins_path}
")
  install(FILES "${CMAKE_BINARY_DIR}/qt.conf" DESTINATION bin COMPONENT runtime)

endfunction()
