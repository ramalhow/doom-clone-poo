# Compilador
CXX := g++

# Flags de compilação
CXXFLAGS := -O2 -Wall -Wextra -Wno-sign-conversion -Wno-unused-parameter -Wno-unused-function -Wconversion -Wdouble-promotion -std=c++20 -fsanitize=undefined -fsanitize=address

# Nome do executável
OUTPUT := main.exe

# Diretórios com arquivos .cpp
SRC_DIRS := src engine

# Coleta todos os arquivos .cpp de forma recursiva
SRCS := $(wildcard $(addsuffix /**/*.cpp, $(SRC_DIRS)))

# Arquivo de saída final
.PHONY: all
all: $(OUTPUT)

# Regra de compilação
$(OUTPUT): $(SRCS)
	@echo "Compilando com o seguinte comando:"
	@echo "$(CXX) $(CXXFLAGS) -o $@ $^"
	$(CXX) $(CXXFLAGS) -o $@ $^

# Limpa o executável
.PHONY: clean
clean:
	@echo "Removendo $(OUTPUT)..."
	rm -f $(OUTPUT)
