class Rice {
  int hdiam, vdiam, type;
  float r, t;
  PVector center, pos;
  HashMap<Integer, PVector> hm = new HashMap<Integer, PVector>();
  IntList list = new IntList();
  
  Rice(PVector _c) {
    center = new PVector();
    pos = new PVector();
    center.set(_c);
    hdiam = 3;
    vdiam = 5;
    r = 280*pow(random(0,1),.5);
    t = random(0,2*PI);
    pos.set(center.x+r*cos(t),center.y+r*sin(t));
    circles=0;
    squares=0;
    pie=0;
  }
  void display() {
    fill(255);
    ellipse(pos.x, pos.y, hdiam, vdiam);
  }

  void setHash() {
    for (int i=0;i<60;i++) {
      for (int j=0;j<60;j++) {
        int map = j+i*60;
        list.append(map);
        PVector pos = new PVector(float(i)*10+10, float(j)*10+10);
        hm.put(map, pos);
      }
    }
    list.shuffle();
  }

  int highlight() {
    if (c.inside(pos)) {
      fill(0, 255, 0, 255);
      type = 0;
    }
    else if (s.inside(pos)) {
      fill(255, 0, 0, 255);
      type = 1;
    }
    else {
      fill(0,0,0);
      type = 2;
    }
    ellipse(pos.x, pos.y, hdiam, vdiam);
    return type;
  }
}

