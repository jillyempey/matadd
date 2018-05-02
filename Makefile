CXX = gcc
CFLAGS = -O3  -Wall -g
SRCS = matadd8.s matadd-driver.o
BIN = matadd

all:
	$(CXX) $(CFLAGS) -o $(BIN) $(SRCS)

clean:
	rm -f $(BIN)
