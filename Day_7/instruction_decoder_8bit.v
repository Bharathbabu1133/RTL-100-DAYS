module instruction_decoder_8bit (
    input  wire        clk,
    input  wire        rst,
    input  wire [7:0]  instruction
);

    
    reg [7:0] R0, R1, R2, R3;

  
    wire [3:0] opcode = instruction[7:4];
    wire [1:0] src    = instruction[3:2];
    wire [1:0] dst    = instruction[1:0];

    reg [7:0] src_data;
    reg [7:0] dst_data;
    reg [7:0] alu_out;

    always @(*) begin
        case (src)
            2'b00: src_data = R0;
            2'b01: src_data = R1;
            2'b10: src_data = R2;
            2'b11: src_data = R3;
        endcase
    end

    always @(*) begin
        case (dst)
            2'b00: dst_data = R0;
            2'b01: dst_data = R1;
            2'b10: dst_data = R2;
            2'b11: dst_data = R3;
        endcase
    end

    always @(*) begin
        case (opcode)
            4'h0: alu_out = dst_data + src_data;   // ADD
            4'h1: alu_out = dst_data - src_data;   // SUB
            4'h2: alu_out = dst_data & src_data;   // AND
            4'h3: alu_out = dst_data | src_data;   // OR
            4'h4: alu_out = dst_data ^ src_data;   // XOR
            4'h5: alu_out = ~dst_data;              // NOT
            4'h6: alu_out = dst_data << 1;          // SHL
            4'h7: alu_out = dst_data >> 1;          // SHR
            4'h8: alu_out = dst_data + 1;           // INC
            4'h9: alu_out = dst_data - 1;           // DEC
            4'hA: alu_out = src_data;               // MOV
            4'hB: alu_out = 8'h00;                  // CLR
            4'hC: alu_out = (dst_data == src_data); // CMP
            4'hD: alu_out = dst_data;               // NOP
            4'hE: alu_out = 8'hFF;                  // SET
            4'hF: alu_out = dst_data;               // RESERVED
        endcase
    end

 
    always @(posedge clk or posedge rst) begin
        if (rst) begin
            R0 <= 8'd0;
            R1 <= 8'd0;
            R2 <= 8'd0;
            R3 <= 8'd0;
        end else begin
            case (dst)
                2'b00: R0 <= alu_out;
                2'b01: R1 <= alu_out;
                2'b10: R2 <= alu_out;
                2'b11: R3 <= alu_out;
            endcase
        end
    end

endmodule
