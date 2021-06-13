module DeMux2x1(
    output reg [7:0]dataOut0_cond,
    output reg [7:0]dataOut1_cond,
    output reg validOut0_cond,
    output reg validOut1_cond,
    input [7:0]dataIn,
    input validIn,
    input clk,
    input reset);

    reg [7:0]out0_cond = 'b0;
    reg [7:0]out1_cond = 'b0;
    reg validDeMux0_cond = 0;
    reg validDeMux1_cond = 0;
    reg selector_cond;

    always @(posedge clk)begin
        if (reset == 0)begin
            selector_cond <= 1;
        end
        else begin
            selector_cond <= selector_cond + 1;
        end
    end
    
    always @(*)
        begin
            out0_cond = dataOut0_cond;
            out1_cond = dataOut1_cond;
            validDeMux0_cond = validOut0_cond;
            validDeMux1_cond = validOut1_cond;
            if(selector_cond == 1) begin
                out1_cond = dataIn;
                validDeMux1_cond = validIn;
            end
            else if (selector_cond == 0)begin
                out0_cond = dataIn;
                validDeMux0_cond = validIn;
            end
        end
    // Flop que guarda lo que sea que este ee el cable out que conecta el mux con el flop
    always @(posedge clk)
        begin
            if (reset == 0)begin
                dataOut0_cond  <= 8'b00000000;
                validOut0_cond <= 0;
            end
            else begin
                if (validDeMux0_cond == 1)begin
                    dataOut0_cond <= out0_cond;
                    validOut0_cond <= validDeMux0_cond;
                    end
                else if (validDeMux0_cond == 0)begin
                    dataOut0_cond <= dataOut0_cond; 
                    validOut0_cond <= validDeMux0_cond;   
                end
            end
        end
    always @(posedge clk) 
        begin
            if (reset == 0)begin
                    dataOut1_cond  <= 8'b00000000;
                    validOut1_cond <= 0;
                end
            else begin
                if (validDeMux1_cond == 1)begin
                    dataOut1_cond <= out1_cond;
                    validOut1_cond <= validDeMux1_cond;
                    end
                else if (validDeMux1_cond == 0) begin
                    dataOut1_cond <= dataOut1_cond; 
                    validOut1_cond <= validDeMux1_cond;   
                end
            end
        end
endmodule