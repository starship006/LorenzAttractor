import peasy.*;

float x = 0.0001;
float y = 0.0001;
float z = 0.0001;

float x2 = 0.0002;
float y2 = 0.0002;
float z2 = 0.0002;

float dt = 0.01;
float a=10;
float b = 28;
float c = 8/3;


int timerCount = 0;
PeasyCam cam;


lorenzDot dot1;
lorenzDot dot2;
lorenzDot dot3;
lorenzDot dot4;
ArrayList<lorenzDot> dots = new ArrayList<lorenzDot>();

void setup() {
  frameRate(60);
  size(1600, 1200, P3D);
  colorMode(HSB);
  cam = new PeasyCam(this, 736, -535, 209, 1722); 
  cam.rotateY(-80);
  cam.rotateX(10);
  /*
   dot1 = new lorenzDot(0.01,0.01,0.01);
   dots.add(dot1);
   dot2 = new lorenzDot(0.02,0.02,0.02);
   dots.add(dot2);
   dot3 = new lorenzDot(0.03,0.03,0.03);
   dots.add(dot3);
   dot4 = new lorenzDot(0.04,0.04,0.04);
   dots.add(dot4);*/

  for (int i=1; i<2550; i++) {
        lorenzDot dotHop = new lorenzDot(i*0.0001, i*0.0001, i*0.0001);
    dots.add(dotHop);
  }
}

void draw() {
  background(0);
  float hu = 0;

  //axis'
  stroke(100, 255, 255);
  line(-50, 0, 0, 50, 0, 0);
  stroke(125, 255, 255);
  line(0, -50, 0, 0, 50, 0);  
  stroke(150, 255, 255);
  line(0, 0, -50, 0, 0, 50); 

  scale(10);
  for (lorenzDot a : dots) {
    stroke(hu, 255, 255);
    a.calcNewPos();
    a.display();
    hu += 0.1;
  }


  //saveFrame("completeSet/gol_####.png");   used to create the video
  println(timerCount);
  //println(cam.getLookAt());         used to debug
  //println(cam.getDistance());       used to debug
  timerCount++;
}





class lorenzDot {
  float xPos;
  float yPos;
  float zPos;

  lorenzDot(float x, float y, float z) {
    xPos = x;
    yPos = y;
    zPos = z;
  }

  void display() {
    point(xPos, yPos, zPos);
  }
  void calcNewPos() {     
    float dx = (a * (yPos - xPos))*dt;
    float dy = (xPos * (b - zPos) -yPos)*dt;
    float dz = (xPos * yPos - c * zPos)*dt;
    xPos = xPos+ dx;
    yPos = yPos + dy;
    zPos = zPos + dz;
  }
}
