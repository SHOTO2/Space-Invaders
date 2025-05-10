
CXX      := g++
CXXFLAGS := -std=c++17 -Wall -Wextra -O2 $(shell pkg-config --cflags raylib)


LDFLAGS  := $(shell pkg-config --libs raylib)


SRCDIR   := src
SOURCES  := $(wildcard $(SRCDIR)/*.cpp)
OBJECTS  := $(SOURCES:.cpp=.o)


TARGET   := SpaceInvaders

.PHONY: all clean

all: $(TARGET)


$(TARGET): $(OBJECTS)
	$(CXX) -o $@ $^ $(LDFLAGS)

$(SRCDIR)/%.o: $(SRCDIR)/%.cpp
	$(CXX) -c -o $@ $< $(CXXFLAGS)

clean:
	rm -f $(SRCDIR)/*.o $(TARGET)