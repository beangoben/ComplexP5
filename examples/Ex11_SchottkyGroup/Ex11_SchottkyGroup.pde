import complexP5.*;

ComplexPlane cxplane;

void setup(){
  //drawing options
  size(800,800);
  smooth();
  background(255);
  //Start the complex plane with center a 0 and 10 units wide in each direction
  cxplane = new ComplexPlane(this,10);
  //noLoop();
}

void draw(){
  
  background(255);
  //Start the complex plane
  cxplane.start();
  //draw Axis, grid, mouse and unit circle
  cxplane.drawInfomation();
  // get position of mouse
  Complex mouse = cxplane.mouse();
  //Start Drawing Here!
  float x=sqrt(2);
  float u=x;
  float y=1;
  float v=y;
  float k=1;
  // coordinates for circle B
  ComplexCircle cB = new ComplexCircle(new Complex(-x/y,0.0),1.0/y,cxplane);
  ComplexCircle cb = new ComplexCircle(new Complex(x/y,0.0),1.0/y,cxplane);  
  ComplexCircle cA = new ComplexCircle(new Complex(0.0,-(u*k)/v),k/v,cxplane); 
  ComplexCircle ca = new ComplexCircle(new Complex(0.0,(u*k)/v),k/v,cxplane); 
  ComplexCircle cc = new ComplexCircle(new Complex(0.0,0.0),x/y-1.0/y,cxplane); 
  // define transform
  MobiusTransform a = new MobiusTransform (
  new Complex (u,0.0) , new Complex (0,k*v) ,
  new Complex (0,-v/k) , new Complex (u, 0.0) );
  MobiusTransform A = a.inv();
  MobiusTransform b = new MobiusTransform (
  new Complex (x,0.0) , new Complex (1,0) ,
  new Complex (1,0) , new Complex (x, 0.0) );
  MobiusTransform B = b.inv();
/*
  Circle tB = new Circle(cB);
  Circle tb = new Circle(cb);
  Circle tA = new Circle(cA);
  Circle ta = new Circle(ca);
   Circle tc = new Circle(cc);
   */
 // drawOrbital(tB,b,B,50);
 // drawOrbital(ta,b,B,50);
 // drawOrbital(tA,b,B,50);
 // drawOrbital(tc,b,B,50);
//   drawOrbital(tc,b,B,50);
//cc.draw();
  //get transformed

  ComplexCircle tB = new ComplexCircle(cB);
  ComplexCircle tb = new ComplexCircle(cb);
  ComplexCircle tA = new ComplexCircle(cA);
  ComplexCircle ta = new ComplexCircle(ca);
  
  noFill();
  fill(255,0,0,75);


  ca.draw();
  
  for(int i=0; i < 10; i++){
    tB.transform(a);
    tB.draw();
    tb.transform(a);
    tb.draw();
    ta.transform(a);
    ta.draw();
  }  
  noFill();
  fill(0,255,0,75);
  cA.draw();
  tB = new ComplexCircle(cB);
  tb = new ComplexCircle(cb);
  tA = new ComplexCircle(cA);
  ta = new ComplexCircle(ca);
    for(int i=0; i < 10; i++){
    tB.transform(A);
    tB.draw();
    tb.transform(A);
    tb.draw();
    tA.transform(A);
    tA.draw();
  }  
  
  noFill();
  fill(0,0,255,75);
  cb.draw();
 
 tB = new ComplexCircle(cB);
  tb = new ComplexCircle(cb);
  tA = new ComplexCircle(cA);
  ta = new ComplexCircle(ca);
    for(int i=0; i < 10; i++){
    tA.transform(b);
    tA.draw();
    tb.transform(b);
    tb.draw();
    ta.transform(b);
    ta.draw();
  }  
  noFill();
  fill(254,128,55,75);
  cB.draw();
  tB = new ComplexCircle(cB);
  tb = new ComplexCircle(cb);
  tA = new ComplexCircle(cA);
  ta = new ComplexCircle(ca);
    for(int i=0; i < 10; i++){
    tB.transform(B);
    tB.draw();
    tA.transform(B);
    tA.draw();
    ta.transform(B);
    ta.draw();
  }  

  //end the complex plane
  cxplane.end();
  
}
