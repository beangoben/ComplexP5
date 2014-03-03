import complexP5.*;


ComplexPlane cxplane;

float r=0.5;
ComplexCircle circ;
Complex a, b;
AffineTransform A;

void setup() {
  size(800, 800);
  cxplane = new ComplexPlane(this, 10.0f);
  background(255);
  circ=new ComplexCircle(Complex.ZERO, r, cxplane);
  a=new Complex(random(-1, 1), random(-1, 1));
  b=new Complex(random(-1, 1), random(-1, 1));
  A= new AffineTransform(a, b);
}

void draw() {
  background(255);
  cxplane.start();
  cxplane.drawInfomation();
  circ.set(cxplane.mouse(), r);

  fill(color(255,0,0,75));
  circ.draw();
  circ.transform(A);
   fill(color(0,0,255,75));
  circ.draw();
   

  /* END */
  cxplane.end();
  cxplane.affineText("A",A,0,0,48);
}