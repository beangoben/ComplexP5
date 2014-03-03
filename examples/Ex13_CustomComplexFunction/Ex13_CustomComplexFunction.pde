import complexP5.*;
//global variables
ComplexPlane cxplane;
//La funcion
Prueba F;
//Parametros de la funcion
MobiusTransform f,g;
ComplexCircle disk;
float theta=PI;
Complex alpha;

void setup(){
  //drawing options
  size(800,800);
  background(255); 
  cxplane = new ComplexPlane(this,10);
// creamos parametros
// disco, centrado en 1,1 con radio 1
  float radDisk=1.0;
  Complex center=new Complex(2.0,0.0);
  disk=new ComplexCircle(center, radDisk,cxplane);
// definimos alpha dentro del disk
  alpha=Complex.polar(radDisk,random(0,TWO_PI)).addi(center);
// f = az
  f=new MobiusTransform(alpha,Complex.ZERO);
// g = ae^itheta *z + 2 alpha (1 - e^itheta)
// definimos parte a = alpha*e^itheta
 Complex tmpa=Complex.angle(theta).muli(alpha);
// definimos parte b
//(1 - e^itheta)
  Complex tmpb= (Complex.ONE).sub(Complex.angle(theta));
  // 2 alpha
  tmpb.muli(alpha.mul(2.0));
  g=new MobiusTransform(tmpa,tmpb);
// creamos funcion
  F = new Prueba(alpha,theta,f,g,disk);
}

void draw(){
  
  background(255);
  //Start the complex plane
  cxplane.start();
  //draw Axis, grid, mouse and unit circle
  cxplane.drawAxis();
  cxplane.drawGrid();

  Complex z=cxplane.mouse();
    
  stroke(0);
  beginShape();
  noFill();
  cxplane.vertex(z);
  cxplane.circle(z,cxplane.xpixel()*2);
  for(int i=0 ; i < 100; i++){
    z=F.map(z);
    cxplane.vertex(z);
    cxplane.circle(z,cxplane.xpixel()*2);
  }
 endShape();

  fill(255,0,0,75);
  disk.draw();
  
  //end the complex plane
  cxplane.end();
  
  cxplane.mobiusText("f",F.f,20,20,48);
  cxplane.mobiusText("g",F.g,20,80,48);
  cxplane.complexText("a",alpha,20,150,28);
  cxplane.complexText("Disk center",disk.center(),20,200,28);

}