class child;
  int c;

  function child copy ();
    copy = new ();
    copy.c = this.c;
  endfunction
endclass

class parent;
  int a;
  int b;
  child child_h;

  function new ();
    child_h = new ();
  endfunction

  function parent copy();
    copy = new();
    copy.a = this.a;
    copy.b = this.b;
    copy.child_h = this.child_h.copy();
  endfunction
endclass

module tb;
  initial begin
    parent p1,p2;
    p1 = new();
    p1.a = 10;
    p1.b = 20;
    p1.child_h.c = 30;

    p2 = p1.copy();
  end
endmodule
