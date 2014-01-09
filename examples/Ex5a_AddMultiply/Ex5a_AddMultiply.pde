import complexP5.*;


ComplexPlane cxplane;
int n=6; //sides of polygon
float rad=1.0; //radius of polygon
Complex a, b;

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
  //begin n-polygon!
  a=cxplane.mouse().div(cxplane.mouse().abs());
  b=cxplane.mouse();
  fill(color(noise(millis()/10000.0)*255, 255, 255, 125));

  npolygon(rad, n);

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

void npolygon(float r, float n) {
  float angle=TWO_PI/(float)n;
  beginShape();
  for (int i=0; i < n; i++) {
    Complex z = Complex.polar(r, angle*i);
    z.muli(a);
    z.addi(b);
    cxplane.vertex(z);
  }	  
  endShape(CLOSE);
}

