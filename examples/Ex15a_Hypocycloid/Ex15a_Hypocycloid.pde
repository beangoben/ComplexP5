import complexP5.*;

ComplexPlane cxplane;
float t=0;
float r1,r2;

void setup(){

 size(700,700);
 background(225);
 cxplane = new ComplexPlane(this, 10.0f);
 r1=3.0;
 r2=1.0;
 
}

void draw(){
  
  background(225);
  
  cxplane.start();
  cxplane.drawInfomation();
  cxplane.drawMouse();
  
  t+=0.025;
  stroke(0);
  Complex uno,linea1,linea2;
  
  Complex c = new Complex(0.0f);
  
  uno = new Complex((r1 - r2)*sin(t) - r2*cos(t*((r1/r2) - 1)),
    (r1 - r2)*cos(t) - r2*sin(t*((r1/r2) - 1)));
  linea1 = new Complex(r1, 0.0);
  linea2 = new Complex(-r1, 0.0);
  
  Complex radio1,radio2,k;
  radio1= new Complex(r1,0);
  radio2= new Complex(r2,0);
  if(r2==0) {
    k= new Complex(0.0, 0.0);
  }
  else {
    k= new Complex(r1/r2,0);
  }
  cxplane.line(uno,linea1);
  cxplane.line(uno,linea2);
  
  fill(175,40,120,40);
  cxplane.ellipse(c, r1, r1);
  
  fill(150,25,40,50);
  cxplane.ellipse(uno, r2,r2);
  
  fill(35,24,198,80);
  cxplane.ellipse(uno, 0.1, 0.1);
  
  cxplane.end();
  
  cxplane.complexText("Posición ",uno,20,600,25);
  cxplane.complexText("Radio Circulo1 ",radio1,50,20,25);
  cxplane.complexText("Radio Circulo2 ",radio2,350,20,25);
  cxplane.complexText("K ",k,250,70,20);
}

void keyPressed() {
  
  /* Radius controls */
   
  if (key == 'a') {  
    r1+=0.05;
  }
  if (key == 'z') {
    if (r1>0 && r2+0.05<r1)
    r1-=0.05;
  }
  
  /* Radius Controls */
  
  if(key == 's'){
    if(r2+0.05<r1)
    
    r2+=0.05;
    
  }
  
  if(key == 'x'){
    if(r2>0 && r2<=r1) 
    r2 -=0.05;
  }

}
