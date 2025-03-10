module BancoROM( 
    input [3:0] entrada1, entrada2,
    output reg [31:0] salidaDato1, salidaDato2
);

initial begin
    $readmemb("datos", almacenamiento);
end

    reg [31:0] almacenamiento [0:15];

always @ * begin
    begin
        salidaDato1 = almacenamiento[entrada1];
        salidaDato2 = almacenamiento[entrada2];
    end
end
endmodule
