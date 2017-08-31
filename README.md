# IDEA_CanSatAttitudeSimulation

## Environment
- Processing3.3.5
- No extra libraries needed

## About Processing
Processing is graphic library wrapper language based on Java/Python and etc...  
We can use graphic libraries like OpenOL by simple code.  

## Usage
Just run IDEA_CanSatAttitudeSimulation.pde, after installing Processing3.3.5.  

## About Code
- **setup()**  
PShape: 3D model object in this program.  
s.scale(): expansion rate of object s.  
P3D: a render mode.  
s.trancelate(): move object location.  

- **draw()**  
background(): the color of the background.  
light(): turn light on.  
trancelate(): move coodinate location.  
shape(): draw the object.  

- **serialEvent()**  
**Under Construction**  
It receives rotation data via serial communication and visualize it.  

- **keyPressed()**  
**under Construction**  
It receives commands from keyboard. it can be utilized for additional function.  

- **mouseDragged()**
It receives mause movements.  

```IDEA_CanSatAttitudeSimulation.pde
import processing.serial.*;

PShape s;
float rotX;
float rotY;
Serial port;

void setup()
{
  //size(1440, 900, P3D);
  fullScreen(P3D);
  s = loadShape("can_6_textured_centered_reversed.obj");
  frameRate(60);
  s.scale(30);
  //s.translate(0, 0);
}

void draw()
{
  background(0);
  lights();

  translate(width/2, height/2, 0);
  //rotateY(radians(frameCount));
  //rotateX(radians(frameCount));
  //rotateZ(radians(frameCount));
  rotateX(rotY);
  rotateY(rotX);
  shape(s, 0, 0);
}

/*
void serialEvent(Serial p)
{
  code
}
*/
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
```



