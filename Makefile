Prueba_1:
	iverilog BancoPrueba_1.v
	./a.out
	rm a.out
	gtkwave Prueba_1.vcd