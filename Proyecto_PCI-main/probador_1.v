module probador_1(
    input [7:0]dataOut0,
    input [7:0]dataOut1,
    input [7:0]dataOut2,
    input [7:0]dataOut3,
    input [7:0]dataOut4,
    input [7:0]dataOut5,
    input [7:0]dataOut6,
    input [7:0]dataOut7,
    input [7:0]dataOut8,
    input validOut0,
    input validOut1,
    input validOut2,
    input validOut3,
    input validOut4,
    input validOut5,
    input validOut6,
    input validOut7,
    input validOut8,
    output reg [7:0]dataIn0,
    output reg [7:0]dataIn1,
    output reg [7:0]dataIn2,
    output reg [7:0]dataIn3,
    output reg validIn0,
    output reg validIn1,
    output reg validIn2,
    output reg validIn3,
    output reg selector0,
    output reg selector1,
    output reg clk_1,
    output reg clk_2,
    output reg clk_3,
    output reg reset);

    initial begin
        $dumpfile ("Prueba_1.vcd");
        $dumpvars;

        {reset, selector0,selector1} = 1'b0;
        {validIn0, validIn1, validIn2, validIn3} = 1'b0;
        {dataIn0, dataIn1, dataIn2, dataIn3} = 8'b00000000;

        repeat (1) begin
            @(posedge clk_3);
                reset <= 1;
        end 

        @(posedge clk_2);
            selector0 <= 1;
        @(posedge clk_2);
            selector0 <= 0;

        @(posedge clk_1);
            selector1 <= 1;

        @(posedge clk_3);
            dataIn0 <= 8'b11111111;
            dataIn1 <= 8'b11101110;
            dataIn2 <= 8'b11011101;
            dataIn3 <= 8'b11001100;
            validIn0 <= 1'b1;
            validIn1 <= 1'b1;
            validIn2 <= 1'b1;
            validIn3 <= 1'b1;

        @(posedge clk_1);
            selector1 <= 0;

        @(posedge clk_2);
            selector0 <= 1;

        @(posedge clk_1);
            selector1 <= 1;
        @(posedge clk_1);
            selector1 <= 0;

        @(posedge clk_2);
            selector0 <= 0;

        @(posedge clk_1);
            selector1 <= 1;
		
        @(posedge clk_3);
            dataIn0 <= 8'b10111011; //BB
            dataIn1 <= 8'b10101010; //AA
            dataIn2 <= 8'b10011001; //99
            dataIn3 <= 8'b10001000; //88

        @(posedge clk_1);
            selector1 <= 0;
        @(posedge clk_2);
            selector0 <= 1;
        @(posedge clk_1);
            selector1 <= 1;
        @(posedge clk_1);
            selector1 <= 0;
        @(posedge clk_2);
            selector0 <= 0;
        @(posedge clk_1);
            selector1 <= 1;
            
        @(posedge clk_3);
            dataIn0 <= 8'b00000000;
            dataIn1 <= 8'b00000000;
            dataIn2 <= 8'b1110111; //77
            dataIn3 <= 8'b00000000;
            validIn0 <= 1'b0;
            validIn1 <= 1'b0;
            validIn2 <= 1'b1;
            validIn3 <= 1'b0;
        @(posedge clk_1);
            selector1 <= 0;
        @(posedge clk_2);
            selector0<=1;  

        @(posedge clk_1);
            selector1 <= 1; 
        @(posedge clk_1);
            selector1 <= 0;
        @(posedge clk_2);
            selector0<=0; 
        @(posedge clk_3);
            dataIn2 <= 8'b00000000;
            validIn2 <= 0;
        @(posedge clk_2);
            selector0<=0; 
        @(posedge clk_2);
            selector0<=1;
        @(posedge clk_2);
            selector0<=0;
        @(posedge clk_2);
            selector0<=1;
        @(posedge clk_2);
            selector0<=0;

        $finish;
    end

    initial	clk_1 	<= 0;
    initial	clk_2 	<= 0;
    initial clk_3   <= 0;
	always	#1 clk_1 	<= ~clk_1;
    always	#2 clk_2 	<= ~clk_2;
    always	#4 clk_3 	<= ~clk_3;
endmodule