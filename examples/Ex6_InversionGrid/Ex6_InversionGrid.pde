import complexP5.*;


ComplexPlane cxplane;
int n=5;
int pointSize=2;
ComplexFunction inv;

void setup() {
  size(800, 800);
  cxplane = new ComplexPlane(this, 10.0f);
  background(255);
  inv=new Inversion();
}

void draw() {
  background(255);
  cxplane.start();
  cxplane.drawInfomation();
  ComplexGrid grid= new ComplexGrid(Complex.ZERO, sqrt(2), sqrt(2), n, n, cxplane);
  grid.translate(cxplane.mouse());
  ComplexGrid gridInv=new ComplexGrid(grid);
  gridInv.transform(inv);
  colorMode(HSB);
  /* start drawing normal grid*/
  pointSize=constrain(5-(int)log(n), 1, 5);
  noFill();
  stroke(0);
  grid.draw();
  noStroke();
  fill(#23DBD6);
  grid.drawPoints(pointSize);
  /* start drawing inverted grid*/
  noFill();
  stroke(0);
  gridInv.draw();
  noStroke();
  fill(#E8D52A);
  gridInv.drawPoints(pointSize);
  /* END */
  cxplane.end();
}

void keyPressed() {
  if (  key == 'a') {
    n++;
  }
  if (  key == 'z') {
    if (n > 3)n--;
  }
}