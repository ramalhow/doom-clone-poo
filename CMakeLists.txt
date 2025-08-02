cmake_minimum_required(VERSION 3.16)

project(MainProject LANGUAGES CXX)

# Usa C++20
set(CMAKE_CXX_STANDARD 20)
set(CMAKE_CXX_STANDARD_REQUIRED ON)
set(CMAKE_CXX_EXTENSIONS OFF)

# Flags comuns
set(COMMON_COMPILE_FLAGS
    -O2
    -Wall
    -Wextra
    -Wno-sign-conversion
    -Wno-unused-parameter
    -Wno-unused-function
    -Wconversion
    -Wdouble-promotion
    -fsanitize=undefined
    -fsanitize=address
)

set(COMMON_LINK_FLAGS
    -fsanitize=undefined
    -fsanitize=address
)

# =============================================================================
# ENGINE LIBRARY
# =============================================================================
file(GLOB_RECURSE ENGINE_SOURCES CONFIGURE_DEPENDS
    Engine/*.cpp
)

add_library(engine STATIC ${ENGINE_SOURCES})

target_compile_options(engine PRIVATE ${COMMON_COMPILE_FLAGS})
target_link_options(engine PRIVATE ${COMMON_LINK_FLAGS})

target_include_directories(engine PUBLIC Engine)

# =============================================================================
# MAIN EXECUTABLE
# =============================================================================
file(GLOB_RECURSE MAIN_SOURCES CONFIGURE_DEPENDS
    src/*.cpp
)

add_executable(main ${MAIN_SOURCES})

target_compile_options(main PRIVATE ${COMMON_COMPILE_FLAGS})
target_link_options(main PRIVATE ${COMMON_LINK_FLAGS})

target_include_directories(main PRIVATE src)

# Linka com a engine
target_link_libraries(main PRIVATE engine)

# Diretórios de include (para includes relativos como "Engine/...")
target_include_directories(main PRIVATE
    ${CMAKE_SOURCE_DIR}  # permite includes como #include "Engine/..."
    src
)