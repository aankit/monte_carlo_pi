class Square {
  PVector c;
  float x, y, s, px, py, t, a;
  int turn;
  Square(PVector _c) {
    c = new PVector();
    c.set(_c);
    s = 2*width/3;
    x=c.x-s/2;
    y=c.y-s/2;
    px=x;
    py=y;
    turn = 0;
    t=1;
    a=255;
  }

  void display() {
    float d = abs((x-px) + (y-py));
    if (d>s-1) {
      px = x;
      py = y;
      turn++;
    }
    if (turn==0) x+=t;
    else if (turn==1) y+=t;
    else if (turn==2) x-=t;
    else if (turn==3) y-=t;
    else {
      a=0;
    }
    fill(255, a);
    rectMode(CENTER);
    rect(x, y, 3, 3);
  }

  void highlight(float shade) {
    stroke(255, 0, 0, shade);
    rect(c.x, c.y, s, s);
  }
  
  boolean inside(PVector test) {
    if (test.x>=(x) && test.x<=(c.x+s/2) && test.y>=(y) && test.y<=(c.y+s/2)){
      return true;
    }
    else return false;
  }
}

