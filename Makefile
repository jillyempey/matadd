CXX = gcc
CFLAGS = -O1 -Wall -g
SRCS = matadd.s matadd-driver2.s
BIN = matadd

all:
	$(CXX) $(CFLAGS) -o $(BIN) $(SRCS)

clean:
	rm -f $(BIN)
