import complexP5.*;

ComplexPlane cxplane;
float t=0;
float r1;
float angulo=0;
int aux=1;

void setup(){

 size(700,700);
 background(225);
 cxplane = new ComplexPlane(this, 10.0f);
 r1=0.25;
 
}

void draw(){
  
  background(225);
  
  cxplane.start();
  cxplane.drawInfomation();
  cxplane.drawMouse();
  
  if(t<6*PI && aux==1)
    t+=0.1;
  else {
    if(t>=0)
      t-=0.1;
      aux=0;
      if(t<0){
        aux=1;
        t=0;
      }
  }
  
  Complex m = Complex.polar(1,angulo);
  Complex uno,dos,tres,cuatro,cinco,seis,siete,ocho;
  
  Complex c = new Complex(0.0f);
  
  uno = new Complex(r1*(t-sin(t)), r1*(1 - cos(t)));
  dos = new Complex(r1*(t-sin(t)), -r1*(1 - cos(t)));
  tres = new Complex(-r1*(t-sin(t)), r1*(1 - cos(t)));
  cuatro = new Complex(-r1*(t-sin(t)), -r1*(1 - cos(t)));  
  cinco = new Complex(r1*(1 - cos(t)), r1*(t-sin(t)));
  seis = new Complex(r1*(1 - cos(t)), -r1*(t-sin(t)));
  siete = new Complex(-r1*(1 - cos(t)), r1*(t-sin(t)));
  ocho = new Complex(-r1*(1 - cos(t)), -r1*(t-sin(t)));
  
  fill(35,24,198,80);
  
  cxplane.ellipse(uno.mul(m), 0.1, 0.1);
  cxplane.ellipse(dos.mul(m), 0.1, 0.1);  
  cxplane.ellipse(tres.mul(m), 0.1, 0.1);  
  cxplane.ellipse(cuatro.mul(m), 0.1, 0.1);  
  cxplane.ellipse(cinco.mul(m), 0.1, 0.1);  
  cxplane.ellipse(seis.mul(m), 0.1, 0.1);  
  cxplane.ellipse(siete.mul(m), 0.1, 0.1);
  cxplane.ellipse(ocho.mul(m), 0.1, 0.1);
  
  Complex radio = new Complex(r1,0);
  
  cxplane.end();
  
  cxplane.complexText("Radio",radio, 20,20,25);

}

void keyPressed() {
  
  /* Height */
   
  if (key == 'a') {  
    if(r1<0.55)
     r1+=0.05;
  }
  if (key == 'z') {
    if (r1>=0.05 )
     r1-=0.05;
  }
  
  /* Reset */
  if(key == 'v'){
    t=0;
    aux=1;
    r1=0.25;
    angulo=0;
 }
 
  /* Rotation */
 
  if(key == 'r')
    angulo+=0.1;
    
  if(key == 't'){
    angulo-=0.1;
  }
 
}