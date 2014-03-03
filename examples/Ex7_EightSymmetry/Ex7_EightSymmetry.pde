import complexP5.*;


ComplexPlane cxplane;
int n=5; //sides of polygon
float rad=1.0; //radius of polygon
ComplexFunction[] symmetries; 

void setup() {
  size(800, 800);
  cxplane = new ComplexPlane(this, 10.0f);
  background(255);
  symmetries=new ComplexFunction[7];
  symmetries[0]=new Negative();
  symmetries[1]=new Conjugate();
  symmetries[2]=new ConjuNeg();
  symmetries[3]=new Inversion();
  symmetries[4]=new InvNegative();
  symmetries[5]=new InvConjugate();
  symmetries[6]=new InvConjuNeg();
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
  fill(color(127, 127, 127, 75));
  float angle=TWO_PI/(float)n;
  beginShape();
  for (int i=0; i < n; i++) {
    Complex z = Complex.polar(r, angle*i);
    z.addi(center);
    cxplane.vertex(z);
    cxplane.ellipse(z, 0.1, 0.10);
  }	  
  endShape(CLOSE);
  colorMode(HSB);
  for(int si=0; si < 7; si++){
    fill(color(255/7.0f*si, 255, 255, 75));
    beginShape();
    for (int i=0; i < n; i++) {
      Complex z = Complex.polar(r, angle*i);
      z.addi(center);
      symmetries[si].mapi(z);
      cxplane.vertex(z);
    }
      endShape(CLOSE);
  }
}