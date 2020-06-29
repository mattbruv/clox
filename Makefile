BUILD_DIR := build
SOURCE_DIR := src

CC := gcc
CFLAGS := -std=c99 -Wall -Wextra -Werror -Wno-unused-parameter

SOURCES := $(wildcard $(SOURCE_DIR)/*.c)
HEADERS := $(wildcard $(SOURCE_DIR)/*.h)
OBJECTS := $(addprefix $(BUILD_DIR)/, $(notdir $(SOURCES:.c=.o)))

clox: $(OBJECTS)
	$(CC) $(CFLAGS) $^ -o $@

$(BUILD_DIR)/%.o: $(SOURCE_DIR)/%.c $(HEADERS)
	$(CC) -c $(CFLAGS) -o $@ $<