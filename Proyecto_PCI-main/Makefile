Prueba_1:
	iverilog BancoPrueba_1.v
	./a.out
	rm a.out
	gtkwave Prueba_1.vcd

Prueba_2:
	iverilog BancoPrueba_2.v
	./a.out
	rm a.out
	gtkwave Prueba_2.vcd
yosys:
	yosys -s mux_yosys1.ys
	sed -i 's/MuxL1/mux_L1_synth/' mux_L1_synth.v
	yosys -s mux_yosys2.ys
	sed -i 's/MuxL2/mux_L2_synth/' mux_L2_synth.v
	yosys -s demux_yosys1.ys
	sed -i 's/DeMuxL1/demux_L1_synth/' demux_L1_synth.v
	yosys -s demux_yosys2.ys
	sed -i 's/DeMuxL2/demux_L2_synth/' demux_L2_synth.v
