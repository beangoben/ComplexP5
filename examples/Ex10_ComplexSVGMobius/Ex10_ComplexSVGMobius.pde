import geomerative.*;
import complexP5.*;

ComplexPlane cxplane;
ComplexSVG cxsvg;

float radius=random(0.1,1.1);

Complex cxa=new Complex (1,5.0);
Complex cxb=new Complex (1.0,0.0);
Complex cxc=new Complex (1.0,0.0);
Complex cxd=new Complex (1,5.0);

void setup(){
  size(800, 800);
  smooth();
  RG.init(this);
  smooth(16);
  //Start the complex plane with center a 0 and 10 units wide in each direction
  cxplane = new ComplexPlane(this,10);
  cxsvg = new ComplexSVG(this,"cactus.svg",radius);
 //noLoop();
 cxsvg.updateStrokeWeight();
}

void draw(){
  background(255);

 //Start the complex plane
  cxplane.start();  
  //draw Axis, grid, mouse and unit circle
  cxplane.drawInfomation();
  cxsvg.reset();
  cxsvg.translate(cxplane.mouse());
  cxsvg.save();
  stroke(0);
  noFill();
  
  MobiusTransform T = new MobiusTransform (cxa,cxb,cxc,cxd);
  MobiusTransform Tinv = T.inv();
  cxsvg.draw();
  for(int i=0; i < 50; i++){
    strokeWeight(cxplane.strokeWScale(1.0));
    cxsvg.transform(T);
    cxsvg.draw();
  }
  
 cxsvg.reset();
 cxsvg.translate(cxplane.mouse());
  for(int i=0; i < 50; i++){
    strokeWeight(cxplane.strokeWScale(1));
    cxsvg.transform(Tinv);
    cxsvg.draw();
  }
  
  cxplane.end();
 
  cxplane.mobiusText("M",T,0,0,64);
}

void keyPressed (){

}
