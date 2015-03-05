class Circle {
  float r, a;
  PVector c, pos;

  Circle(PVector _c) {
    c = new PVector();
    pos = new PVector();
    c.set(_c);
    r = width/3;
    a=0;
  }

  void display(float t) {
    a=t;
    pos.x = c.x+cos(a)*r;
    pos.y = c.y+sin(a)*r;
    fill(255);
    ellipse(pos.x, pos.y, 3, 3);
  }

  void highlight(float shade) {
    stroke(0, 255, 0, shade);
    ellipse(c.x, c.y, r*2, r*2);
  }

  boolean inside(PVector test) {
    if (test.dist(c)<r){
      return true;
    }
    else return false;
  }
}

