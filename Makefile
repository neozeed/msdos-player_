CC=gcc
CXX=g++
CFLAGS=-O2 -I.
LIBS=-lwinmm -lpsapi -lgdi32 -luser32 -ladvapi32 -lSetupapi -lmpr -static

all: msdos286.exe msdos386.exe msdos486.exe

msdos286.exe: msdos286.o
	$(CXX) msdos286.o -o msdos286.exe $(LIBS)

msdos386.exe: msdos386.o
	$(CXX) msdos386.o -o msdos386.exe $(LIBS)

msdos486.exe: msdos486.o
	$(CXX) msdos486.o -o msdos486.exe $(LIBS)


msdos286.o: msdos.cpp
	$(CXX) $(CFLAGS) -DHAS_I286 -c msdos.cpp -o msdos286.o

msdos386.o: msdos.cpp
	$(CXX) $(CFLAGS) -DHAS_I386 -c msdos.cpp -o msdos386.o

msdos486.o: msdos.cpp
	$(CXX) $(CFLAGS) -DHAS_I486 -c msdos.cpp -o msdos486.o


clean:
	del msdos286.exe msdos286.o
	del msdos386.exe msdos386.o
	del msdos486.exe msdos486.o