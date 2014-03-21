import complexP5.*;

ComplexPlane cxplane;

float r=0.7; //Define radius n-polygon
int n=3; //Define sides n-polygon
float t; //Variable rotation of the n-polygon
float r1=0.5,r2=0.05; //Defined conditions of the transformation

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
  
  Complex tras = new Complex(noise(millis()/2000.0)*j, noise(millis()/2000.0)*j);
  Complex rot = Complex.polar((r1)*j,(r1*n)*j);
  fill(color(noise(millis()/10000.0)*125, 100, 105, 85));
 
  //Construction of n-polygon
   beginShape();  
  
  for(int i=0; i<=n; i++){
    
    Complex a = Complex.polar(r, 2*PI/n*i+t);
    a.add(tras);
    cxplane.vertex(d.add(a).mul(rot).add(tras));
    
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
    r/=1.1;
  }
  
  /* Control Transformation */
  
  if(key == 'd'){
    if(r1<4) r1*=1.1;
  }
  
  if(key == 'c'){
    r1/=1.1;
  }
  

}

