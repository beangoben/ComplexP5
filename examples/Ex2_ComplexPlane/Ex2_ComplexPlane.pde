import complexP5.*;

ComplexPlane cxplane;

void setup() {
  size(800, 800);
  //Start the complex plane with center a 0 and 10 units wide in each direction
  cxplane = new ComplexPlane(this, 0.0, 0.0, 10.0, 10.0);

  background(255);
}

void draw() {
  background(255);
  //Start the complex plane
  cxplane.start();
  //draw Axis, grid and unit circle
  cxplane.drawInfomation();

  cxplane.drawMouse();
  //End the complex plane
  cxplane.end();
}

void keyPressed() {
  if (key == 'a') {
    cxplane.zoom(1.1);
  }
  if (key == 'z') {
    cxplane.zoom(0.9);
  }
}

