float cTimer, shade, pie, speed, acc, circles, squares;
int rCooker, rTimer, count, x, y;
boolean once, tally;
PVector center;
int controller = 3600;
Rice[] r = new Rice[controller];
Circle c;
Square s;
int scoreDisplayStart;
int scoreDisplayWait = 10000;
int tallyCount;

void setup() {
  size(1280, 720);
  center = new PVector(width/2, height/2);
  rTimer = 0;
  cTimer = 0;
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
  tallyCount = 0;
  scoreDisplayStart = 0;
}

void draw() {
  if (rTimer<controller) {
    x = rTimer+int(speed);
  } 
  else {
    shade+=.01;
    noFill();
    strokeWeight(4);
    rectMode(CENTER);
    c.highlight(shade);
    s.highlight(shade); 
    if (shade>5 && rCooker<controller) {
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
    else if (rCooker>=controller) {
      tally = true;
    }
  }
  noStroke();
  while (rTimer<x && rTimer<controller) {
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
    tallyCount++;
    if(tallyCount==1){
      println("eval");
      finalScore();
      
    } else if (millis()-scoreDisplayStart > scoreDisplayWait) {
      setup();
    } else {
      //pass
    }
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
  int ts = width/2 - 240;
  int ypos = 75;
  text(green, ts+10, ypos);
  fill(255);
  text("/", ts+125, ypos);
  text("=", ts+245, ypos);
  fill(255, 0, 0);
  text(red, ts+150, ypos);
  fill(0, 145, 255);
  text(finalScore, ts+275, ypos);
  scoreDisplayStart = millis();
}

