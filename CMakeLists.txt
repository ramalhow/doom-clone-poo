cmake_minimum_required(VERSION 3.16)

project(MainProject LANGUAGES CXX)

# Usa C++20
set(CMAKE_CXX_STANDARD 20)
set(CMAKE_CXX_STANDARD_REQUIRED ON)
set(CMAKE_CXX_EXTENSIONS OFF)

# Diretórios para buscar arquivos
set(SOURCE_DIRS src Engine)

# Busca recursivamente arquivos .cpp e .hpp nas pastas especificadas
file(GLOB_RECURSE CPP_SOURCES CONFIGURE_DEPENDS
    ${SOURCE_DIRS}/*.cpp
)
file(GLOB_RECURSE HPP_HEADERS CONFIGURE_DEPENDS
    ${SOURCE_DIRS}/*.hpp
)

# Cria o executável com os arquivos .cpp (headers são incluídos automaticamente)
add_executable(main ${CPP_SOURCES})

# Flags de compilação
target_compile_options(main PRIVATE
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

# Flags de link (necessárias para sanitizers funcionarem)
target_link_options(main PRIVATE
    -fsanitize=undefined
    -fsanitize=address
)

# Opcional: inclui diretórios para facilitar inclusão de headers
target_include_directories(main PRIVATE ${SOURCE_DIRS})
