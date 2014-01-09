import complexP5.*;

ComplexPlane cxplane;
int n=6; //sides of polygon
float rad=1.0; //radius of polygon

void setup() {
  size(800, 800);
  cxplane = new ComplexPlane(this, 10.0f);
  background(255);
}

void draw() {
  background(255);
  cxplane.start();
  cxplane.drawInfomation();
  /* start drawing */
  //color stuff
  colorMode(HSB);
  fill(color(noise(millis()/10000.0)*255, 255, 255, 125));
  //begin n-polygon!
  float angle=TWO_PI/(float)n;
  beginShape();
  for (int i=0; i < n; i++) {
    Complex z=Complex.polar(rad, angle*i);
    cxplane.vertex(z);
  }
  endShape(CLOSE);

  /* END */
  cxplane.end();
}

void keyPressed() {
  // number of sides control
  if (key == 'a') {
    n++;
  }
  if (key == 'z') {
    if (n > 3) n--;
  }
  // radius controls
  if (key == 's') {	
    rad*=1.1;
  }
  if (key == 'x') {
    if (rad > (float) 1e-6 )rad*=0.9;
  }
}
