module probador_2(
    input [7:0]dataOut0,
    input [7:0]dataOut1,
    input [7:0]dataOut2,
    input [7:0]dataOut3,
    input [7:0]dataOut4,
    input [7:0]dataOut5,
    input validOut0,
    input validOut1,
    input validOut2,
    input validOut3,
    input validOut4,
    input validOut5,
    output reg [7:0]dataIn0,
    output reg [7:0]dataIn1,
    output reg validIn0,
    output reg validIn1,
    output reg selector,
    output reg clk_1,
    output reg clk_2,
    output reg reset);

    initial begin
        $dumpfile ("Prueba_2.vcd");
        $dumpvars;

        {reset, selector} = 1'b0;
        {validIn0, validIn1} = 1'b0;
        {dataIn0, dataIn1} = 8'b00000000;

        repeat (1) begin
            @(posedge clk_1);
                reset <= 1;
                selector <= 0;
        end 

        @(posedge clk_1);
            dataIn0 <= 8'b11111111;
            dataIn1 <= 8'b00010101;
            validIn0 <= 1'b1;
            validIn1 <= 1'b1;
		
        @(posedge clk_1);
            selector <= 1'b0;

        @(posedge clk_1);

        @(posedge clk_1);
            selector <= 1'b1;

        @(posedge clk_1);
            validIn0 <= 1'b0;
            validIn1 <= 1'b0;

        @(posedge clk_1);

        @(posedge clk_1);
            selector <= 1'b0;


        $finish;
    end

    initial	clk_1 	<= 0;
    initial	clk_2 	<= 0;
	always	#2 clk_1 	<= ~clk_1;
    always	#1 clk_2 	<= ~clk_2;
endmodule