cmake_minimum_required(VERSION 3.19)
project(reaper_dax_mcu LANGUAGES C CXX RC)

option(DAX_MCU_FADER_DEBUG "Log fader MIDI and motor activity" OFF)

add_library(reaper_dax_mcu SHARED
  reaper-plugins/reaper_csurf/csurf_main.cpp
  reaper-plugins/reaper_csurf/dax_api.cpp
  reaper-plugins/reaper_csurf/csurf_mcu.cpp
  reaper-plugins/reaper_csurf/res.rc)

target_compile_features(reaper_dax_mcu PRIVATE cxx_std_17)
target_compile_definitions(reaper_dax_mcu PRIVATE NOMINMAX)
if(DAX_MCU_FADER_DEBUG)
  target_compile_definitions(reaper_dax_mcu PRIVATE DAX_MCU_FADER_DEBUG=1)
endif()
target_include_directories(reaper_dax_mcu PRIVATE sdk)
target_compile_options(reaper_dax_mcu PRIVATE /utf-8 /W3 /EHsc /wd4244 /wd4996)
target_link_libraries(reaper_dax_mcu PRIVATE winmm)
set_target_properties(reaper_dax_mcu PROPERTIES
  PREFIX ""
  OUTPUT_NAME "$<IF:$<BOOL:${DAX_MCU_FADER_DEBUG}>,reaper_dax_mcu-debug-x64,reaper_dax_mcu-x64>"
  MSVC_RUNTIME_LIBRARY "MultiThreaded$<$<CONFIG:Debug>:Debug>")
