testbench: tb.cpp
	verilator -Wall -Wno-fatal --trace --cc --exe --build tb.cpp top.sv 
