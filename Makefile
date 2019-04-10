# Makefile for ACOTSP
VERSION=1.03

OPTIM_FLAGS=-O
WARN_FLAGS=-Wall -ansi -pedantic
CFLAGS=$(WARN_FLAGS) $(OPTIM_FLAGS)
# To change the default timer implementation, uncomment the line below
# or call 'make TIMER=unix'
TIMER=dos
#TIMER=unix
LDLIBS=-lm

acotsp.exe: acotsp.o TSP.o utilities.o ants.o InOut.o $(TIMER)_timer.o ls.o parse.o
	gcc -o acotsp.exe *.o -I.

all: clean acotsp.exe

clean:
	del *.o acotsp.exe

acotsp.o: acotsp.c
	gcc -c acotsp.c -I.

TSP.o: TSP.c TSP.h
	gcc -c TSP.c -I.

ants.o: ants.c ants.h
	gcc -c ants.c -I.

InOut.o: InOut.c InOut.h
	gcc -c InOut.c -I.

utilities.o: utilities.c utilities.h
	gcc -c utilities.c -I.

ls.o: ls.c ls.h
	gcc -c ls.c -I.

parse.o: parse.c parse.h
	gcc -c parse.c -I.

$(TIMER)_timer.o: $(TIMER)_timer.c timer.h
	gcc -c $(TIMER)_timer.c -I.
