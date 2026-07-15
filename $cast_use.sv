/* Write a SystemVerilog program demonstrating upcasting and downcasting between a base transaction class
and a derived packet class using $cast() */

class transaction;
  int a;
  int b;
endclass

class packet extends transaction;
  int c;
endclass

module tb;

  initial begin

    transaction t1;
    packet p1, p2;

    p1 = new();

    // Upcasting
    t1 = p1;

    // Downcasting
    if ($cast(p2, t1))
      $display("Downcasting successful");
    else
      $display("Downcasting failed");

  end

endmodule
