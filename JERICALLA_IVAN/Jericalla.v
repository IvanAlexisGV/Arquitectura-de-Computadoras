`include "ROM.v"

module Jericalla(
    input operacion, 
    input [3:0] direccionResultado, direccionUno, direccionDos,
    output reg [31:0] salidaDatos
);

BancoROM memoriaROM(.entrada1(direccionUno), .entrada2(direccionDos));

endmodule

