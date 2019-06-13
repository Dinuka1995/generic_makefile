TARGET = exec1

SRC = src
INC = include
BIN = bin

SOURCE= $(wildcard $(SRC)/*.cpp)
OBJECT= $(patsubst %,$(BIN)/%, $(notdir $(SOURCE:.cpp=.o)) )


CC = g++

CFLAGS = -std=c++0x -I$(INC) 

$(BIN)/$(TARGET) : $(OBJECT)
	$(CC) -o $@ $^

$(BIN)/%.o : $(SRC)/%.cpp
	$(CC) $(CFLAGS) -c $< -o $@


help :
	@echo "src :$(SOURCE)"
	@echo "obj :$(OBJECT)"

clean:
	rm -rf $(OBJECT)*.o $(TARGET)

