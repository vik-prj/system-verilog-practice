/* Write a SystemVerilog testbench using producer and consumer classes with a parameterized mailbox,
where the producer generates and sends 10 randomized transactions and the consumer receives and displays
them concurrently */

class transaction;

  rand bit [7:0] data;
  rand bit [3:0] addr;

endclass


class producer;

  transaction txn;
  mailbox #(transaction) prod2cons;

  function new(mailbox #(transaction) prod2cons);
    this.prod2cons = prod2cons;
  endfunction

  task start;
    repeat(10) begin
      txn = new();

      assert(txn.randomize())
      else
        $error("Randomization failed");

      $display("PRODUCER: %p", txn);

      prod2cons.put(txn);
    end
  endtask

endclass


class consumer;

  transaction txn;
  mailbox #(transaction) prod2cons;

  function new(mailbox #(transaction) prod2cons);
    this.prod2cons = prod2cons;
  endfunction

  task start;
    repeat(10) begin
      prod2cons.get(txn);

      $display("CONSUMER: %p", txn);
    end
  endtask

endclass


module top;

  mailbox #(transaction) prod2cons;

  producer prod_h;
  consumer cons_h;

  initial begin

    prod2cons = new();

    prod_h = new(prod2cons);
    cons_h = new(prod2cons);

    fork
      prod_h.start;
      cons_h.start;
    join

  end

endmodule
