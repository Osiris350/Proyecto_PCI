module SerialParalelo_PhyRX(
    input clk,
    input clk_4f,
    input serial,
    input reset, 
    output reg [7:0] paralelo_cond,
    output reg validOut_cond,
    output reg active_cond
);

reg BC_counter = 0;
reg[3:0] i = 'b0;
reg[7:0] temp = 'b0;
reg[7:0] temp2 = 'b0;
reg[7:0] temp3 = 'b0;
reg[7:0] data2send = 'b0;
reg aux1 = 0;
reg aux2 = 0;
reg aux3 = 0;

always  @(posedge clk)begin
    if(reset == 1) begin
        i <= i-1;
        if (i == 0) begin
            i <= 7;
            temp2 = temp;
        end
        temp3[1*i+:1] <= serial;
    end 
	else begin
        i <= 7;
        temp2 <= 'b0;
        temp3 <= 'b0;
    end
end

always @(posedge clk_4f)begin
    if(reset == 0)begin
        active_cond <= 0;
        validOut_cond <= 0;
        //data2send = 8'b00000000;
        aux1 <= 0;
        aux2 <= 0;
        aux3 <= 0;
        BC_counter <= 0;
        paralelo_cond <= 'b0;
    end
    else begin
        if (temp2 == 8'b10111100) begin
            aux1 <= 1;
            aux2 <= aux1;
            aux3 <= aux2;
            BC_counter <= aux3;
            validOut_cond<=0;
            active_cond <= 0;
        end else begin
            aux1 = 0;
            aux2 = 0;
            aux3 = 0;
            active_cond <= 0;
            paralelo_cond <= temp2;
            if (active_cond == 1)
                validOut_cond <=1;
        end
        if (BC_counter == 1)begin
            active_cond <= 1;
            BC_counter <=1;
        end
        if (BC_counter == 0)begin
            active_cond <= 0;
        end
    end
end

always @(posedge clk_4f)begin
    temp = temp3;
    if(reset ==1)begin
        temp[1*i+:1] = serial;
    end
    data2send<=temp2;
end

endmodule
