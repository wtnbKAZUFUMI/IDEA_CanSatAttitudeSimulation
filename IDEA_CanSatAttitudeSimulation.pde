import processing.serial.*;
PShape s;
float rotX;
float rotY;
float rotZ;
float rotX_port;
float rotY_port;
float rotZ_port;
int count = 0;

int lf = 0;
String str_get_data = null;
String buf[];

Serial myPort;

float time = millis();
float time_old;
float dt;
float rot_x_prime;
float rot_y_prime;
float rot_z_prime;
float rotX_port_prime = 0;
float rotY_port_prime = 0;
float rotZ_port_prime = 0;
float rotX_port_prime_old = 0;
float rotY_port_prime_old = 0;
float rotZ_port_prime_old = 0;
float rot_y_prime_old = 0;
float rot_z_prime_old = 0;

int x;

void setup()
{
  size(500, 500, P3D);
  //fullScreen(P3D);
  s = loadShape("can_6_textured_centered_reversed.obj");
  frameRate(50);
  s.scale(30);
  printArray(Serial.list());


  //myPort = new Serial(this, Serial.list()[3], 9600);
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
  //moduleTest();
}
/*
void moduleTest()
{
  //serialdata input
  rot_x_prime = radians(10.0);//radians(10.0) for testing
  rot_y_prime = radians(10.0);//radians(10.0) for testing
  rot_z_prime = radians(10.0);//radians(10.0) for testing
  dt = (millis() - time)*0.001;
  //trapezoidal integral
  rotX = rotX + (rot_x_prime + rot_x_prime_old)*0.5 * dt;
  rotY = rotY + (rot_y_prime + rot_y_prime_old)*0.5 * dt;
  rotZ = rotZ + (rot_z_prime + rot_z_prime_old)*0.5 * dt;
  //status update
  time = millis();
  rot_x_prime_old = rot_x_prime;
  rot_y_prime_old = rot_y_prime;
  rot_z_prime_old = rot_z_prime;
}
*/


void serialEvent(Serial myPort)
{
  str_get_data = myPort.readStringUntil(lf);
  if (str_get_data != null){
    str_get_data = trim(str_get_data);
    buf = split(str_get_data,",");
    rotX_port_prime = float(buf[0]);
    rotY_port_prime = float(buf[1]);
    rotZ_port_prime = float(buf[2]);   
    dt = (millis() - time)*0.001;
    rotX_port = rotX_port + (rotX_port_prime + rotX_port_prime_old)*0.5 * dt;
    rotY_port = rotY_port + (rotY_port_prime + rotY_port_prime_old)*0.5 * dt;
    rotZ_port = rotZ_port + (rotZ_port_prime + rotZ_port_prime_old)*0.5 * dt;
    //status update
    time = millis();
    rotX_port_prime_old = rot_x_prime;
    rotY_port_prime_old = rot_y_prime;
    rotZ_port_prime_old = rot_z_prime;
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