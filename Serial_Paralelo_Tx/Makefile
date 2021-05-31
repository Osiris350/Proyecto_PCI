run:
	yosys -s sintesis_sptx.ys
	sed -i 's/SerialParalelo_Tx/SerialParalelo_Tx_sintetizado/g' SerialParalelo_Tx_sintetizado.v
	sed -i 's/_cond/_synth/g' SerialParalelo_Tx_sintetizado.v
	emacs BancoPrueba_SerialParalelo.v -f verilog-batch-auto --batch
	iverilog -o prueba.vvp BancoPrueba_SerialParalelo.v
	vvp prueba.vvp
	gtkwave SerialParalelo_Tx.vcd
	rm prueba.vvp SerialParalelo_Tx.vcd SerialParalelo_Tx_sintetizado.v
