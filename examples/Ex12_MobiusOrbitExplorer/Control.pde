import java.awt.Frame;
import javax.swing.JFrame;
import controlP5.*;

ControlP5 controlP5;
ControlWindow controlWindow;

float radCenter=0.0,radA=5.1,radB=1.0,radC=1.0,radD=5.1,radiusCircle=0.5;
float angCenter=0.0,angA=1.373,angB=0.0,angC=0.0,angD=1.373;

//Values for Sliders
String [] sliders= {
  "radA", "radB","radC", "radD","radCenter","radiusCircle"
};
float [] sliderMin= {
  0.0,0.0, 0.0, 0.0, 0.0,0.0
};

float [] sliderMax= {
  10.0,10.0, 10.0, 10.0, 10.0,10.0
};

float [] sliderDefaulValues = {
  5.1,1.0, 1.0, 5.1,0.0,0.2
};
//Declaramos valores para los knobs
String [] knobs= {
 "angA", "angB","angC","angD","angCenter","alphaBack","alphaDraw","complexSize"
};
float [] knobMin= {
  0.0,0.0, 0.0, 0.0, 0.0,0.0,0.0,-3.0
};
float [] knobMax= {
  TWO_PI,TWO_PI, TWO_PI, TWO_PI, TWO_PI,255,255,3.0
};
float [] knobDefaulValues = {
  1.373,HALF_PI,0.0,1.373,0.0,255,alphaDraw,1.0
};


//Values for Buttons
String [] butt1= {
"drawBack","drawInfo","complexInfo","orbitals","drawFixed","changePalete"
};
boolean [] butt1DefaultValue= {
drawBack,drawInfo,complexInfo,orbitals,drawFixed,false
};
String [] butt2= {

};

String [] butt3= {

};

//creation Second Window
public class PFrame extends JFrame {
  
  secondApplet s;
  public PFrame() {
    setBounds(0, 0, 940, 370);
    s = new secondApplet();
    add(s);
    s.init();
    show();
  }
}

public class secondApplet extends PApplet {
      //Write functions here
  void radCenter(float value){
    radCenter=value;
  }
  
    void radiusCircle(float value){
    radiusCircle=value;
  }
  
  void angCenter(float value){
    angCenter=value;
  }
  
  void radA(float value){
    radA=value;
  }
  
  void angA(float value){
    angA=value;
  }
  
  void radB(float value){
    radB=value;
  }
  
  void angB(float value){
    angB=value;
  }
  
  void radC(float value){
    radC=value;
  }
  
  void angC(float value){
    angC=value;
  }
  
  void radD(float value){
    radD=value;
  }
  
  void angD(float value){
    angD=value;
  }
    void alphaBack(float value){
    alphaBack=value;
  }

    void alphaDraw(float value){
    alphaDraw=value;
  }
  
  void drawBack(boolean value){
    drawBack=value;
  }
  
   void drawInfo(boolean value){
    drawInfo=value;
  }
  
  void drawFixed(boolean value){
    drawFixed=value;
  }
   void complexInfo(boolean value){
    complexInfo=value;
  }
  
   void orbitals(boolean value){
    orbitals=value;
  }
  
  void changePalete(){
  colors.randomPalete();
  }
  
  void complexSize(float exponent){
   cxplane.setSize(pow(10,exponent));
  }
  
  public void setup() {
    background(0);
    menuSetup();
  }

  public void draw() {
    background(0);
  }


  public void menuSetup() {
    controlP5 = new ControlP5(this);
    controlP5.setAutoDraw(true);
    
    
    //Korg nano-kontrol automatic gui creation
    int x1=10;
    int y1=10;

    for (int i=0; i < sliders.length; i++)
      controlP5.addSlider(sliders[i]).setRange(sliderMin[i], sliderMax[i]).setValue(sliderDefaulValues[i])
        .setPosition(x1+60+i*115, y1+100).setSize(18, 180)
          .setColorForeground(color(255));

    for (int i=0; i < knobs.length; i++) {
      controlP5.addKnob(knobs[i]).setRange(knobMin[i], knobMax[i]).setValue(knobDefaulValues[i])
        .setPosition(x1+i*118, y1).setRadius(35).setViewStyle(Knob.ARC)
          .setDragDirection(Knob.VERTICAL).setColorBackground(color(0, 160, 100))
            .setColorForeground(color(255));
    }

    for (int i=0; i < butt1.length; i++) {
      controlP5.addToggle(butt1[i]).setValue(false).setPosition(x1+i*115, y1+100).setValue(butt1DefaultValue[i])
        .setSize(35, 35).setColorActive(color(255));
    }

    for (int i=0; i < butt2.length; i++) {
      controlP5.addToggle(butt2[i]).setValue(false).setPosition(x1+i*115, y1+170).setValue(false)
        .setSize(35, 35).setColorActive(color(255));
    }

    for (int i=0; i < butt3.length; i++) {
      controlP5.addToggle(butt3[i]).setValue(false).setPosition(x1+i*115, y1+230).setValue(false)
        .setSize(35, 35).setColorActive(color(255));
    }
  }
  
}


