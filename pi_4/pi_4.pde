float cTimer, shade, pie, speed, acc, circles, squares;
int rCooker, rTimer, count, x, y;
boolean once, tally;
PVector center;
Rice[] r = new Rice[3600];
Circle c;
Square s;

void setup() {
  size(600, 600);
  center = new PVector(width/2, height/2);
  rTimer = 0;
  shade = 0;
  c = new Circle(center);
  s = new Square(center);
  background(0);
  once = false;
  tally = false;
  rCooker = 0;
  count = 0;
  speed = 1;
  x = 0;
  y = 0;
  acc = 0.001;
}

void draw() {
  if (rTimer<3600) {
    x = rTimer+int(speed);
  } 
  else {
    shade+=.01;
    noFill();
    strokeWeight(4);
    rectMode(CENTER);
    c.highlight(shade);
    s.highlight(shade); 
    if (shade>5 && rCooker<3600) {
      y = rCooker+2;
      while (rCooker<y) {
        println(rCooker);
        if (r[rCooker].highlight()==0) {
          circles++;
        }
        else if (r[rCooker].highlight()==1) {
          squares++;
        }
        rCooker++;
      }
    }
    else if (rCooker>=3600) {
      tally = true;
    }
  }
  noStroke();
  while (rTimer<x && rTimer<3600) {
    r[rTimer] = new Rice(center);
    r[rTimer].display();
    rTimer++;
  }
  if (cTimer<2*PI) { 
    cTimer+=.004;
    c.display(cTimer);
  }
  s.display();

  if (tally) {
    println("eval");
    finalScore();
  }
  count++;
  speed += acc*pow(count/360,2);
}

void finalScore() {
  pie = circles/squares;
  String green = str(circles);
  String red = str(squares);
  String finalScore = str(pie);
  textSize(32);
  fill(0, 255, 0);
  int ts = 80;
  text(green, ts+10, 50);
  fill(255);
  text("/", ts+125, 50);
  text("=", ts+245, 50);
  fill(255, 0, 0);
  text(red, ts+150, 50);
  fill(0, 145, 255);
  text(finalScore, ts+275, 50);
}

