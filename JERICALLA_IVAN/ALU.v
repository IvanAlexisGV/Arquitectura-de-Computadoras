module UnidadAritmeticaLogica (
    input wire [31:0] operandoA,
    input wire [31:0] operandoB,
    input wire [2:0] seleccionOperacion,
    output reg [31:0] resultado,
    output reg banderaCero
);

    always @(*) begin
        case (seleccionOperacion)
            3'b000: resultado = operandoA + operandoB;        
            3'b001: resultado = operandoA - operandoB;        
            3'b010: resultado = operandoA & operandoB;       
            3'b011: resultado = operandoA | operandoB;        
            3'b100: resultado = (operandoA < operandoB) ? 32'd1 : 32'd0; 
            default: resultado = 32'd0;       
        endcase
        
        banderaCero = (resultado == 32'd0) ? 1'b1 : 1'b0;
    end
    
endmodule
