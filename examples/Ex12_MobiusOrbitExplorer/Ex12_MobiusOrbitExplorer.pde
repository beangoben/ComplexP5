
import complexP5.*;
//global variables
ComplexPlane cxplane;
DiscretePalete1D colors;

PFrame controlWindowFrame;

Complex a=new Complex (1.0,-5.0);
Complex b=new Complex (1,0);
Complex c=new Complex (1,0);
Complex d=new Complex (1.0, -5.0);
 
float alphaBack=255,alphaDraw=75;
boolean drawBack=true;
boolean drawInfo=true;
boolean complexInfo=true;
boolean orbitals=true;
boolean drawFixed=true;
boolean savingImage=false;

void setup(){
  //drawing options
  size(800,800);
  background(255);
  controlWindowFrame = new PFrame();
  setupMidi();
  //extra colors
  colors=new DiscretePalete1D(2500,(int)random(1,61));
  //Start the complex plane with center a 0 and 10 units wide in each direction
  cxplane = new ComplexPlane(this,10);
  curveTightness(0);
}

void draw(){

  if(drawBack){
      fill(255,alphaBack);
      rect(0,0,width,height);
  }

  //Start the complex plane
  cxplane.start();
  //draw Axis, grid, mouse and unit circle
  if(complexInfo)cxplane.drawInfomation();
  // get position of mouse
  Complex mouse = cxplane.mouse();
  //Start Drawing Here!
  ComplexCircle circ = new ComplexCircle( Complex.polar(radCenter,angCenter),radiusCircle,cxplane);

  // define transform
  a= Complex.polar(radA,angA);
  b= Complex.polar(radB,angB);
  c= Complex.polar(radC,angC);
  d= Complex.polar(radD,angD);
  
  MobiusTransform T = new MobiusTransform (a,b,c,d);
  MobiusTransform Tinv= T.inv();
 
  //circ.translate(mouse);
  if(orbitals){
  drawOrbital(circ,T,Tinv,150);
  }
  else{
    drawOrbital(circ.center(),T,Tinv,150); 
  }
  if(drawFixed)drawFixedPoints(T);
  //end the complex plane
  cxplane.end();
  
  if(drawInfo && drawBack){
    cxplane.mobiusText("M",T,0,0,64);
  }
 
}

//Function for orbital drawing
void drawOrbital(ComplexCircle c, MobiusTransform t, MobiusTransform tinv, int n){
  //draw z
  fill(colors.next(),alphaDraw);
  c.draw();
  //create tramsformed coordinates for T
  stroke(0);
  ComplexCircle tc=new ComplexCircle(c);
  for(int i=0; i < n; i++){
    fill(colors.next(),alphaDraw);
    tc.transform(t);
    tc.draw();
  }
 //create tramsformed coordinates for T^-1
  stroke(255);
  tc.copy(c);
  for(int i=0; i < n; i++){
    fill(colors.next(),alphaDraw);
    tc.transform(tinv);
    tc.draw();
  } 
  
}


//Function for orbital drawing
void drawOrbital(Complex center, ComplexFunction t, ComplexFunction tinv, int n){
  //draw z
  //create tramsformed coordinates for T
  noFill();
  Complex tcenter =  center.dup() ;
  beginShape();
  for(int i=0; i < 2; i++){
  tcenter=tinv.map(tcenter);
  }
  for(int i=0; i < n; i++){
    stroke(colors.next(),alphaDraw);
    tcenter=t.map(tcenter);
    // draw transformed circle
    curveVertex(tcenter.real(),tcenter.imag());
  }
  endShape();
 //create tramsformed coordinates for T^-1
  stroke(255);
  beginShape();
    tcenter =  center ;
 for(int i=0; i < 2; i++){
  tcenter=t.map(tcenter);
  }
  for(int i=0; i < n; i++){
    stroke(colors.next(),alphaDraw);
    tcenter=tinv.map(tcenter);
   curveVertex(tcenter.real(),tcenter.imag());
  } 
   endShape();
}

void drawFixedPoints(MobiusTransform T){
    stroke(255);
    fill(0,alphaBack);
    cxplane.ellipse(T.fixed1(),3*cxplane.xpixel(),3*cxplane.xpixel());
    stroke(0);
    fill(255,alphaBack);
    cxplane.ellipse(T.fixed2(),3*cxplane.xpixel(),3*cxplane.xpixel());
}