module Jericalla(

    input [16:0] instr,
    output [31:0] data_out,
    output zf

);

wire [31:0] rom_data1, rom_data2, alu_result, ram_output;

ROM rom_inst(.addr1(instr[4:1]), .addr2(instr[8:5]), .data1Out(rom_data1), .data2Out(rom_data2));
ALU alu_inst(.A(rom_data1), .B(rom_data2), .ALU_Sel(instr[12:9]), .R(alu_result), .Zero_Flag(zf));
RAM ram_inst(.WEn(instr[0]), .dataIn(alu_result), .addr(instr[16:13]), .dataOut(data_out));

endmodule



module ROM( 
    input [3:0] addr1, addr2,
    output reg [31:0] data1Out, data2Out
);

reg [31:0] memory [0:15];

initial begin

    $readmemb("data.txt", memory);
end



always @ * begin

    begin

        data1Out = memory[addr1];
        data2Out = memory[addr2];
    end

end

endmodule

module RAM(

    input WEn, 
    input [31:0] dataIn, 
    input [3:0] addr,
    output reg [31:0] dataOut

);

reg [31:0] memory [0:15];

always @ * begin

    if(WEn) begin

        memory[addr] = dataIn;
    end

    begin

        dataOut = memory[addr];

    end

end

endmodule



module ALU (

    input [31:0] A,
    input [31:0] B,
    input [3:0] ALU_Sel,
    output reg [31:0] R,
    output reg Zero_Flag

);

    always @(*) begin

        case (ALU_Sel)

            4'b0000: R = A & B;        
            4'b0001: R = A | B;        
            4'b0010: R = A + B;       
            4'b0110: R = A - B;        
            4'b0111: R = (A < B) ? 32'd1 : 32'd0;
            4'b1100: R = ~(A | B);        

            default: R = 32'd0;  
    
        endcase
        
        Zero_Flag = (R == 32'd0) ? 1'b1 : 1'b0;

    end
    
endmodule

