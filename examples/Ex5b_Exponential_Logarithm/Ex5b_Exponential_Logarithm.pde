import complexP5.*;

ComplexPlane cxplane;

int n = 6; //Define sides of polygon
float r = 0.7; //Define radius of polygon
float ang = TWO_PI; //variable to create the polygon

void setup(){

  size(800,800);
  cxplane = new ComplexPlane (this, 10f);
  background(225);

}

void draw(){

  background(225);
  
  cxplane.start();
  cxplane.drawInfomation();
  cxplane.drawMouse();
  
  Complex m = cxplane.mouse(); //allow to move the mouse polygono ( .add(m) )

float ang=TWO_PI/(float)n; //variable to create the polygon

//Create original polygon
fill(150,150,30, 50);
  beginShape();
  for (int i=0; i < n; i++) {
    Complex z=Complex.polar(r, ang*i);
    cxplane.vertex(z.add(m));
  }
  endShape();
  
  //Applying transformation .exp() 
fill(14, 6, 137, 100);

  beginShape();
  for (int i=0; i < n; i++) {
    Complex z=Complex.polar(r, ang*i);
    cxplane.vertex(z.add(m).exp());
  }
  endShape();

//Applying transformation .exp().log() 
fill(216, 21, 11, 100);

  beginShape();
  for (int i=0; i < n; i++) {
    Complex z=Complex.polar(r, ang*i);
    cxplane.vertex(z.add(m).exp().log());
  }
  endShape();
  
  cxplane.end();

}

void keyPressed() {
  //Radius controls
  if (key == 's') {  
    if (r <= 10) r*=1.1;
  }
  
  if (key == 'x'){
    r/=1.1;
  }
  
  //Sides controls
  if (key == 'a') {
    n++;
  }  
  
  if (key == 'z') {
    if (n > 4) n--;
  }
}
