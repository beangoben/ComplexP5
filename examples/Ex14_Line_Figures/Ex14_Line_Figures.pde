import complexP5.*;

ComplexPlane cxplane;

//Initial conditions
float r=3.8;
int n=100;
int k=70;
float t=0.0;

void setup(){
  
  size(800, 800);
  background(225);
  cxplane = new ComplexPlane(this, 10f);
  
}

void draw(){

  background(200);
  
  cxplane.start();
  cxplane.drawInfomation();
  cxplane.drawMouse();
  
  t +=0.01;
  stroke(color(noise(millis()/1000.0)*100, 0, 120,100));
  beginShape();
  for(int i=1; i<=400; i++){
  
  Complex a = Complex.polar(r, k*PI/n*i+t); //Defining Circle 1
  Complex b = Complex.polar(3.1, PI/(2*n)*i+t); //Defining Circle 2
  cxplane.line(a,b); //Connecting points
  
 }
  endShape();
  
  cxplane.end();
}

void keyPressed() {
  
  // Radius control - Circle 1
  if (key == 'd') {  
    r*=1.1;
  }
  
  if (key == 'c') {
    if (r > (float) 1e-6 )
    r*=0.9;
  }
  
   // Control partitions - Circle 1
  if (key == 's') {
    k++;
  }
  if (key == 'x') {
    if (k>0) 
    k--;
  }
  
}