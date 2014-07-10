import complexP5.*;

ComplexPlane cxplane;

float r=0.4; //Define radius n-polygon
int n=3; //Define sides n-polygon
float t; //Variable rotation of the n-polygon
float r1=0.4,r2=0.01; //Defined conditions of the transformation

void setup(){

  size(800, 800);
  background(225);
  cxplane = new ComplexPlane(this, 30f);
  
}

void draw(){
 
  
  background(225);
  cxplane.start();
  cxplane.drawInfomation();
  cxplane.drawMouse();
  
  Complex d = cxplane.mouse();
  
  t+=0.1; //Rotation speed of the n.polygon

 //Translation and rotation of the transformation
 for(int j=1; j<30; j++){
  
  Complex trans = new Complex(j*r2,j*r2);
  Complex rot = Complex.polar(r1*j,j*r1);
  fill(color(noise(millis()/10000.0)*125, 100, 105, 85));
 
  //Construction of n-polygon
   beginShape();  
  
  for(int i=0; i<=n; i++){
    
    Complex a = Complex.polar(r, 2*PI/n*i+t);
    a=a.add(d);
    cxplane.vertex((a.muli(rot)).add(trans));
    
}
  endShape();
  //End n-polygon
 }
//End Transformation
  cxplane.end();

}

void keyPressed() {
  
  /* Number of sides control */
  
  if (key == 'a') {
    n++;
  }
  if (key == 'z') {
    if (n > 3) n--;
  }
  
  /* Radius controls */
   
  if (key == 's') {  
    if(r<2) r*=1.1;
  }
  if (key == 'x') {
    if(0.01<r)
    r/=1.1;
  }
  
  /* Control Transformation */
  
  if(key == 'd'){
    if(r1<4) r1*=1.1;
  }
  
  if(key == 'c'){
  if(0.01<=r1)
    r1/=1.1;
  }
  
  if(key == 'f'){
    if(r2<2) r2+=.1;
  }
  
  if(key == 'v'){
  if(-1.5<r2)
    r2-=.1;
  }

}