# Compile/run:
- Compile using
     make MetroSim
- run executable with
     ./MetroSim stationsFile passFile [commands]


# Program Purpose:
The purpose of this program is to design and implement a program that monitors a simulation of a train traveling a simplified course of the Green Line Extension, managing Passengers as they board and depart at
     specified stops along the way. There are three main, high-level tasks
     for this program. The first is to create an interactive front-end
     simulation that works with both files and the command line. The second
     is to design and develop an object-oriented approach to solving the
     back-end logic for the simulation. The third is to connect the front-end
     and back-end systems.

# Files: 
main.cpp:
     Main file should be short and handle simple driver
     functions such as reading in files.

MetroSim.cpp:
     Implementation of MetroSim class.  Main
     functionality of running the Metro Simulation, should be able to
     move trains and deal with passengers going on/off the train.

MetroSim.h:
     Interface of MetroSim class.

stations.txt:
     an example file containing a list of stations.

test_commands.txt:
     sample list of commands that you could give to the simulator

the_metroSim:
     reference implementation for students to see how 

# Data Structures:
     Passenger was given to us as a struct consisting of their ID, departure
     station, and arrival station. I included a vector of type
     Passenger as a private member function of the PassengerQueue class to
     represent PassengerQueues. In MetroSim.h, I created a Station struct
     made up of a name, number, and PassengerQueue. Within the MetroSim
     class, I used a Stations vector, and a vector made up of PassengerQueues
     to represent the train. Each element of the train vector essentially
     represents a "car" designated for passengers getting off at a specific
     station (index of train car represents station number).

# Testing:
     For the Passenger struct and PassengerQueue class, I used unit tests for
     testing their member functions. My general methods of testing were using
     sizes of 0, 1, and 3 for PassengerQueues, and calling the same function
     consecutively to test that it worked every time. I verified the tests
     using assert statements that checked for correct Passengers and
     PassengerQueues.

     For testing MetroSim, I used diff testing to compare my program to the
     reference. I created a selection of .txt files to use as command files,
     considering various base and edge cases. One of the base cases I tested
     for was if a command file ends on end-of-file rather than a "m f"
     command, and a major problem I encountered was not fully understanding
     what redirecting standard output and input really meant. In this base
     case I tried to send the contents of the file to std::cin, but the
     program wouldn't end because MetroSim only ends through the command line
     when "m f" is inputted. Other base cases that I tested included adding
     Passengers whose arrival stations were before, the same as, or after
     their departure stations. I also tested for ending the simulation while
     a passenger was still on the train or waiting at a station. These were
     relatively simple base cases that I thought of during the implementation
     of my add_passenger and metro_move functions. I tested these base cases
     after implementing my program, which, in hindsight, was risky had my
     program failed to succeed in these tests. During the implementation
     stages, I was mostly using main.cpp and test_main.cpp to implement each
     function one-by-one and run the program each time using the test_commands
     file. Next time, I will likely plan to include more unit tests during
     the implementation stages on top of my test .txt files to check on my
     progress. In terms of edge cases, the main one I tested for was the
     train looping around the stations twice. I also made a larger stations
     file containing 30 stations, to test if my program would still run the
     same as the demo.
