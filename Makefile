#########################################################
#             PROJECT 1: MetroSim Makefile             #
#########################################################

CXX      = clang++
CXXFLAGS = -g3 -Wall -Wextra -Wpedantic -Wshadow
LDFLAGS  = -g3

MetroSim: MetroSim.o Passenger.o PassengerQueue.o main.o
	$(CXX) $(LDFLAGS) -o $@ $^

# MetroSim: MetroSim.o Passenger.o PassengerQueue.o test_main.o
# 	$(CXX) $(LDFLAGS) -o $@ $^

# test_main.o: test_main.cpp MetroSim.h PassengerQueue.h Passenger.h
# 	$(CXX) $(CXXFLAGS) -c test_main.cpp

main.o: main.cpp MetroSim.h PassengerQueue.h Passenger.h
	$(CXX) $(CXXFLAGS) -c main.cpp

MetroSim.o: MetroSim.cpp MetroSim.h PassengerQueue.h Passenger.h
	$(CXX) $(CXXFLAGS) -c MetroSim.cpp

# This rule builds PassengerQueue.o
PassengerQueue.o: PassengerQueue.cpp PassengerQueue.h Passenger.h 
	$(CXX) $(CXXFLAGS) -c PassengerQueue.cpp

Passenger.o: Passenger.cpp Passenger.h 
	$(CXX) $(CXXFLAGS) -c Passenger.cpp

unit_test: unit_test_driver.o PassengerQueue.o Passenger.o
	$(CXX) $(CXXFLAGS) $^


# This rule provides your final submission 
# NOTE: Don't forget to add any additional files you want to submit to this
#		rule! If you do not add them, they will not be submitted.
provide:
	provide comp15 proj1_MetroSim PassengerQueue.h \
				    PassengerQueue.cpp \
				    Passenger.h Passenger.cpp \
					MetroSim.h MetroSim.cpp \
					main.cpp \
					test_main.cpp test_commands.txt 30_stations.txt \
					test_arrival_before_departure.txt test_ends_on_eof.txt \
					test_passenger_at_station.txt test_passenger_on_train.txt \
					test_same_arrival_departure.txt \
					test_train_loops_twice.txt \
				    unit_tests.h Makefile README

# remove executables, object code, and temporary files from the current folder 
# -- the executable created by unit_test is called a.out
clean: 
	rm *.o *~ a.out
