recirculador:

	yosys -s sintesis_r.ys
	sed -i 's/Recirculador/Recirculador_sintetizado/g' Recirculador_sintetizado.v
	sed -i 's/_cond/_synth/g' Recirculador_sintetizado.v
	emacs BancoPrueba_Recirculador.v -f verilog-batch-auto --batch
	iverilog -o prueba.vvp BancoPrueba_Recirculador.v
	vvp prueba.vvp
	gtkwave Recirculador.vcd
	rm prueba.vvp Recirculador.vcd Recirculador_sintetizado.v
