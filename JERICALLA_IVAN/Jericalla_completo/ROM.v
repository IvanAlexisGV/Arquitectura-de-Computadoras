module BancoROM( 

    input [3:0] entrada1, entrada2,
    output reg [31:0] salidaDato1, salidaDato2

);

reg [31:0] almacenamiento [0:15];

initial begin

    $readmemb("data.txt", almacenamiento);

end

    

always @ * begin

    begin

        salidaDato1 = almacenamiento[entrada1];
        salidaDato2 = almacenamiento[entrada2];

    end

end

endmodule
