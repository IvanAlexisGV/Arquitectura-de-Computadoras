module BancoRAM(
    input habilitarEscritura, 
    input [31:0] entradaDatos, 
    input [3:0] direccion,
    output reg [31:0] salidaDatos
);

reg [3:0] almacenamiento [0:15];

always @ * begin
    if(habilitarEscritura) begin
        almacenamiento[direccion] = entradaDatos;
    end
    else begin
        salidaDatos = almacenamiento[direccion];
    end
end
endmodule

