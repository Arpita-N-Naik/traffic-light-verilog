
module traffic_light(
    input clk,
    input reset,
    output reg red,
    output reg yellow,
    output reg green
);

reg [1:0] state;

// State encoding
parameter RED = 2'b00;
parameter GREEN = 2'b01;
parameter YELLOW = 2'b10;

always @(posedge clk or posedge reset)
begin
    if (reset)
        state <= RED;
    else
        case(state)
            RED: state <= GREEN;
            GREEN: state <= YELLOW;
            YELLOW: state <= RED;
            default: state <= RED;
        endcase
end

always @(state)
begin
    case(state)
        RED: begin
            red = 1;
            yellow = 0;
            green = 0;
        end
        GREEN: begin
            red = 0;
            yellow = 0;
            green = 1;
        end
        YELLOW: begin
            red = 0;
            yellow = 1;
            green = 0;
        end
    endcase
end

endmodule