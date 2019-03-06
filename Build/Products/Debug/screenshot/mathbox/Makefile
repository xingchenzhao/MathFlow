OBJECTS = *.o
GCH = *.gch
TEST = wtest mtest
REDUNDANTS = $(OBJECTS) $(GCH) $(TEST)

CC = gcc
STD = -std=c11
DEBUG = -Wall -Wextra -Wfloat-equal -Wundef -Wcast-align -Wwrite-strings -Wmissing-declarations -Wredundant-decls -Wshadow #-Wlogical-op
#VECTOR = -O3 -ftree-vectorize -fopt-info-vec -fopt-invo-vec-missed -falign-functions=32 -falign-loops=32 -ffast-math -march=native
FLAGS = $(STD) $(DEBUG) #$(VECTOR)

mathbox : main.c wolfram.o mathpix.o wolframscript
	$(CC) $(FLAGS) -o mathbox main.c wolfram.o mathpix.o

wolfram.o : wolfram.c wolfram.h
	$(CC) $(FLAGS) -c wolfram.c

mathpix.o : mathpix.c mathpix.h
	$(CC) $(FLAGS) -c mathpix.c

wolframscript: WolframScript.pkg
	$(command -v wolframscript>/dev/null 2>&1 || open WolframScript.pkg)

test : $(TEST)
	echo "test compiled"

wtest : wtest.c wolfram.o
	$(CC) $(FLAGS) -o wtest wtest.c wolfram.o

mtest : mtest.c mathpix.o
	$(CC) $(FLAGS) -o mtest mtest.c mathpix.o


.PHONY : obj gch clean

obj:
	$(CC) $(FLAGS) -c *.c
gch:
	$(CC) $(FLAGS) -c *.h
clean :
	rm -f $(REDUNDANTS)