cmake_minimum_required(VERSION 3.16)
project(eduamigac_game_ace_smoke C)

if(NOT DEFINED ACE_ROOT)
  set(ACE_ROOT "/opt/course/deps/ace")
endif()

add_subdirectory("${ACE_ROOT}" ace)
add_executable(ace-smoke main.c)
target_link_libraries(ace-smoke ace)
