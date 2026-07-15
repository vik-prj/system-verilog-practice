/* Write a SystemVerilog program where a base class transaction has a virtual display() method, 
two derived classes read_transaction and write_transaction override it, and a base-class handle 
is used to call the appropriate derived-class method. */

class transaction;
  virtual function void display();
    $display("Base Class");
  endfunction
endclass

class read_transaction extends transaction;
  virtual function void display();
    $display("RD Class");
  endfunction
endclass

class write_transaction extends transaction;
  virtual function void display();
    $display("WR Class");
  endfunction
endclass

module tb;
  initial begin
    transaction txn = new();
    read_transaction rd_txn = new();
    write_transaction wr_txn = new();

    txn.display();
    rd_txn.display();
    wr_txn.display();

    txn = rd_txn;
    txn.display();

    txn = wr_txn;
    txn.display();
  end
endmodule

  
