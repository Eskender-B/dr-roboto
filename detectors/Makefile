CC	:= gcc

all:
	$(CC) `pkg-config --cflags guile-2.2` -shared -o libdetectors.so -fPIC *.cpp
