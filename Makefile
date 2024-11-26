# 1. Variables
CC = gcc
CFLAGS = -Wall -g
LDFLAGS = SDL2

SRC_DIR = src
OBJ_DIR = obj
INC_DIR = include
TARGET = mi_juego

# 2. Archivos fuente
SRC = $(wildcard $(SRC_DIR)/*.c)
OBJ = $(SRC:$(SRC_DIR)/%.c=$(OBJ_DIR)/%.o)

# 3. Objetivo principal: generar el ejecutable
$(TARGET): $(OBJ)
	$(CC) $(OBJ) -o $(TARGET) $(LDFLAGS)

# 4. Regla implícita: compilar .c a .o
$(OBJ_DIR)/%.o: $(SRC_DIR)/%.c
	$(CC) $(CFLAGS) -I$(INC_DIR) -c $< -o $@

# 5. Regla para limpiar archivos generados
clean:
	rm -f $(OBJ) $(TARGET)

# 6. Declarar objetivos "no archivo"
.PHONY: clean

