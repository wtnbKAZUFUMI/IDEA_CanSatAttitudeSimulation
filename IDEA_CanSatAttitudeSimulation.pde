import processing.serial.*;
PShape s;
float rotX;
float rotY;
int rotX_port;
int rotY_port;
int rotZ_port;
int count = 0;

int lf = 0;
String str_get_data = null;
String buf[];

Serial myPort;

int x;

void setup()
{
  size(500, 500, P3D);
  //fullScreen(P3D);
  s = loadShape("can_6_textured_centered_reversed.obj");
  frameRate(50);
  s.scale(30);
  printArray(Serial.list());

  myPort = new Serial(this, Serial.list()[3], 9600);
  //s.translate(0, 0);
}

void draw()
{
  background(0);
  lights();

  translate(width/2, height/2, 0);
  rotateY(radians(rotX_port));
  rotateX(radians(rotY_port));
  rotateZ(radians(rotZ_port));
  rotateX(rotY);
  rotateY(rotX);
  shape(s, 0, 0);
}

void serialEvent(Serial myPort)
{
  str_get_data = myPort.readStringUntil(lf);
  if (str_get_data != null){
    count = count + 1;
    println(count);
    println(frameCount/50.0);
    
    str_get_data = trim(str_get_data);
    buf = split(str_get_data,",");
    //println(int(buf[0]));
    //println(int(buf[1]));
    //println(int(buf[2]));
    rotX_port = int(buf[0]);
    rotY_port = int(buf[1]);
    rotZ_port = int(buf[2]);
  }
}

/*
void keyPressed()
{
  code
}
*/
void mouseDragged()
{
    rotX += (mouseX - pmouseX) * 0.01;
    rotY -= (mouseY - pmouseY) * 0.01;
}