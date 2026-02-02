CC = gcc
CFLAGS = -Wall -O2 -march=native -mtune=native -flto
SRC = src/main.c 
OBJ = $(patsubst src/%.c,build/%.o,$(SRC))
TARGET = bin/learning-c 

all: $(TARGET)
# Link object files to create executable
$(TARGET): $(OBJ) | bin build
        $(CC) $(CFLAGS) -o $@ $^

# Compile .c files to .o in build/
build/%.o: src/%.c | build
        $(CC) $(CFLAGS) -c $< -o $@

bin:
        mkdir -p bin

build:
        mkdir -p build

clean:
        rm -rf build $(TARGET)

.PHONY: all clean bin build