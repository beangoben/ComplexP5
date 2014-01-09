import complexP5.*;


ComplexPlane cxplane;
int n=5; //sides of polygon
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
  //begin n-polygon!
  npolygon(cxplane.mouse(), rad, n);
  npolygonInv(cxplane.mouse(), rad, n);
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

void npolygon(Complex center, float r, float n) {
  //original
  fill(color(0, 255, 255, 75));
  float angle=TWO_PI/(float)n;
  beginShape();
  for (int i=0; i < n; i++) {
    Complex z = Complex.polar(r, angle*i);
    z.addi(center);
    cxplane.vertex(z);
    cxplane.ellipse(z, 0.1, 0.10);
  }	  
  endShape(CLOSE);
  //negative
  fill(color(25, 255, 255, 75));
  beginShape();
  for (int i=0; i < n; i++) {
    Complex z = Complex.polar(r, angle*i);
    z.addi(center);
    z.negi();
    cxplane.vertex(z);
  }    
  endShape(CLOSE);
  //conjugated
  fill(color(50, 255, 255, 75));
  beginShape();
  for (int i=0; i < n; i++) {
    Complex z = Complex.polar(r, angle*i);
    z.addi(center);
    z.conji();
    cxplane.vertex(z);
  }    
  endShape(CLOSE);
  //conjugated negative
  fill(color(125, 255, 255, 75));
  beginShape();
  for (int i=0; i < n; i++) {
    Complex z = Complex.polar(r, angle*i);
    z.addi(center);
    z.conji().negi();
    cxplane.vertex(z);
  }    
  endShape(CLOSE);
}

void npolygonInv(Complex center, float r, float n) {
  //original
  fill(color(125, 255, 255, 75));
  float angle=TWO_PI/(float)n;
  beginShape();
  for (int i=0; i < n; i++) {
    Complex z = Complex.polar(r, angle*i);
    z.addi(center);
    z.invi();
    cxplane.vertex(z);
  }    
  endShape(CLOSE);
  //negative
  fill(color(150, 255, 255, 75));
  beginShape();
  for (int i=0; i < n; i++) {
    Complex z = Complex.polar(r, angle*i);
    z.addi(center);
    z.invi().negi();
    cxplane.vertex(z);
  }    
  endShape(CLOSE);
  //conjugated
  fill(color(175, 255, 255, 75));
  beginShape();
  for (int i=0; i < n; i++) {
    Complex z = Complex.polar(r, angle*i);
    z.addi(center);
    z.invi().conji();
    cxplane.vertex(z);
  }    
  endShape(CLOSE);
  //conjugated negative
  fill(color(200, 255, 255, 75));
  beginShape();
  for (int i=0; i < n; i++) {
    Complex z = Complex.polar(r, angle*i);
    z.addi(center);
    z.invi().conji().negi();
    cxplane.vertex(z);
  }    
  endShape(CLOSE);
}
