import complexP5.*;

ComplexPlane cxplane;

void setup() {
  size(800, 800);
  cxplane = new ComplexPlane(this, 10.0f);
  background(255);
}

void draw() {
  background(255);
  cxplane.start();
  cxplane.drawInfomation();
  cxplane.drawMouse();
  /* start drawing */
  Complex a = new Complex(2.1, 4.3);
  Complex b = new Complex(1.43, 2.2);
  Complex c = new Complex(-3.0);
  Complex d = cxplane.mouse();
  stroke(0);
  line(a, d);

  stroke(color(255, 0, 0));
  point(b);

  stroke(0);
  fill(255, 0, 0, 75);
  ellipse(d, 1.0, 1.0);

  fill(0, 255, 0, 75);
  quad(a, b, c, d);

  fill(0, 0, 255, 75);
  rect(a, d);

  fill(0, 255, 255, 75);
  triangle(a, b, c);

  fill(0, 255, 255, 75);
  triangle(a, b, c);

  fill(255, 0, 255, 75);
  arc( c, 1.0, 1.0, 0.0, PI+QUARTER_PI, PIE);
  /* END */
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
