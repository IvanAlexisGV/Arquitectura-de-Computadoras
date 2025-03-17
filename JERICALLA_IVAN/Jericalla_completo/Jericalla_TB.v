`timescale 1ns/1ns

module JericallaTB();

reg [16:0] TBin;
wire [31:0] resOutput;
wire ZFtb;

Jericalla Jerica_inst(.instr(TBin), .data_out(resOutput), .zf(ZFtb)); 

initial begin

    TBin = 17'b0; 
    #50;	

    TBin = 17'b00110010010001101;
    #100;
    TBin = 17'b00110000010001101;
    #100;
    TBin = 17'b00110001010001101;
    #100;
    TBin = 17'b00110110010001101;
    #100;
    TBin = 17'b00110111010001101;
    #100;
    TBin = 17'b0011100010001101;
    #100;


end

initial begin

    $monitor("Tiempo=%0t | TBin=%b | resOutput=%b | ZFtb=%b", 
             $time, TBin, resOutput, ZFtb);
end

endmodule

