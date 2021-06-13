module Probador_PHY(
    input [7:0] dataOutProbador0_cond,
    input [7:0] dataOutProbador1_cond,
    input [7:0] dataOutProbador2_cond,
    input [7:0] dataOutProbador3_cond,
    input validOutProbador0_cond,
    input validOutProbador1_cond,
    input validOutProbador2_cond,
    input validOutProbador3_cond,
    input [7:0] dataOut0_Rx_cond,
    input [7:0] dataOut1_Rx_cond,
    input [7:0] dataOut2_Rx_cond,
    input [7:0] dataOut3_Rx_cond,
    input validOut0_Rx_cond,
    input validOut1_Rx_cond,
    input validOut2_Rx_cond,
    input validOut3_Rx_cond,
    input [7:0] dataOutProbador0_synth,
    input [7:0] dataOutProbador1_synth,
    input [7:0] dataOutProbador2_synth,
    input [7:0] dataOutProbador3_synth,
    input validOutProbador0_synth,
    input validOutProbador1_synth,
    input validOutProbador2_synth,
    input validOutProbador3_synth,
    input [7:0] dataOut0_Rx_synth,
    input [7:0] dataOut1_Rx_synth,
    input [7:0] dataOut2_Rx_synth,
    input [7:0] dataOut3_Rx_synth,
    input validOut0_Rx_synth,
    input validOut1_Rx_synth,
    input validOut2_Rx_synth,
    input validOut3_Rx_synth,
    output reg [7:0]dataIn0,
    output reg [7:0]dataIn1,
    output reg [7:0]dataIn2,
    output reg [7:0]dataIn3,
    output reg validIn0,
    output reg validIn1,
    output reg validIn2,
    output reg validIn3,
    output reg clk_4f,
    output reg clk_2f,
    output reg clk_f,
    output reg clk_32f,
    output reg reset);

    reg [3:0] contador_1, contador_2, contador_4;

    initial begin
        $dumpfile ("Prueba_Final_PHY.vcd");
        $dumpvars;


        {contador_1, contador_2, contador_4} = 4'b0;
        {reset} = 1'b0;
        {validIn0, validIn1, validIn2, validIn3} = 1'b0;
        {dataIn0, dataIn1, dataIn2, dataIn3} = 8'b00000000;

        repeat (8) begin
            @(posedge clk_32f);
                reset <= 0;
        end
        
        @(posedge clk_2f);
            reset <= 1;
            
        @(posedge clk_f);
            dataIn0 <= 8'b11111110;
            dataIn1 <= 8'b11101110;
            dataIn2 <= 8'b11011101;
            dataIn3 <= 8'b11001100;
            validIn0 <= 1'b0;
            validIn1 <= 1'b0;
            validIn2 <= 1'b0;
            validIn3 <= 1'b0;

        @(posedge clk_f);
            dataIn0 <= 8'b11111111;
            dataIn1 <= 8'b11101110;
            dataIn2 <= 8'b11011101;
            dataIn3 <= 8'b11001100;
            validIn0 <= 1'b1;
            validIn1 <= 1'b1;
            validIn2 <= 1'b1;
            validIn3 <= 1'b1;
    
        @(posedge clk_f);
            dataIn0 <= 8'b10111011; //BB
            dataIn1 <= 8'b10101010; //AA
            dataIn2 <= 8'b10011001; //99
            dataIn3 <= 8'b10001000; //88
            
        @(posedge clk_f);
            dataIn0 <= 8'b00000000;
            dataIn1 <= 8'b00000000;
            dataIn2 <= 8'b1110111; //77
            dataIn3 <= 8'b00000000;
            validIn0 <= 1'b0;
            validIn1 <= 1'b0;
            validIn2 <= 1'b1;
            validIn3 <= 1'b0;

        @(posedge clk_f);
            dataIn2 <= 8'b00000000;
            validIn2 <= 0;
        
        @(posedge clk_f);
            dataIn2 <= 8'b00000000;
            validIn2 <= 0;

        @(posedge clk_f);
                    dataIn2 <= 8'b00000000;
                    validIn2 <= 0;

        @(posedge clk_f);
                    dataIn2 <= 8'b00000000;
                    validIn2 <= 0;

        @(posedge clk_f);
                    dataIn2 <= 8'b00000000;
                    validIn2 <= 0;


        $finish;
    end

    initial	clk_4f 	  <= 1; // clk_4f
    initial	clk_2f 	  <= 1; // clk_2ff
    initial	clk_f 	  <= 1; // Clk_f
    initial	clk_32f   <= 1;


	always	#3 clk_32f 	<= ~clk_32f;

    always @(posedge clk_32f) begin
        contador_1 <= contador_1 + 1;
        contador_2 <= contador_2 + 1;
        contador_4 <= contador_4 + 1;
    end

    always @(posedge clk_32f) begin
        if (contador_4 == 4'b0011) begin
            clk_4f 	<= ~clk_4f;
            contador_4 <= 0;
        end
    end

    always @(posedge clk_32f) begin
        if (contador_2 == 4'b0111) begin
            clk_2f 	<= ~clk_2f;
            contador_2 <= 0;
        end
    end

    always @(posedge clk_32f) begin
        if (contador_1 == 4'b1111) begin
            clk_f 	<= ~clk_f;
            contador_1 <= 0;
        end
    end
endmodule 


