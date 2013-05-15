import peasy.*;

PeasyCam cam;

void setup() {
  size(640,480,OPENGL);
  background(0x555555);
  lights();
  
  cam = new PeasyCam(this, 0, 0, 0, 500);
  cam.setMaximumDistance(5000);
  cam.setMinimumDistance(10);
}

float i = 0.0;
Selection_in_P3D_OPENGL_A3D s = new Selection_in_P3D_OPENGL_A3D();
void draw() {
  background(0x555555);

  
  s.captureViewMatrix((PGraphics3D) this.g);
  
  pushMatrix();

  translate(20,20,100);
  rotateY(0.5 + i);
  fill(#BC4C4C);
  box(40);
  popMatrix();
  
  PVector start = s.ptStartPos;
  PVector end = s.ptEndPos;
  pushMatrix();
  translate(start.x, start.y, start.z);
  fill(#FC4C4C);
  sphere(5);
  popMatrix();
  pushMatrix();
  translate(end.x, end.y, end.z);
  sphere(30);
  popMatrix();
  

  i += 0.01;
}

void mouseClicked() {
  print(s.calculatePickPoints(mouseX, mouseY));
}
