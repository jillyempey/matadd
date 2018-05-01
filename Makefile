CXX = gcc
CFLAGS = -O3  -Wall -g
SRCS = 2matadd.s matadd-driver.o
BIN = matadd

all:
	$(CXX) $(CFLAGS) -o $(BIN) $(SRCS)

clean:
	rm -f $(BIN)
