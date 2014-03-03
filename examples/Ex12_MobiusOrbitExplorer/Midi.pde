import promidi.*;

MidiIO midiIO;

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

void noteOff(Note note, int device, int channel) {
  int num = note.getPitch();
  int val = 0;
  int index=num%10 - 1;
  int group=num/10;

  println("num"+ num);
  if (group == 0 && index< sliders.length) {
    controlP5.controller(sliders[index]).setValue(map(val, 0, 127, sliderMin[index], sliderMax[index]));
  } 
  else if (group == 1 && index< knobs.length) {
    controlP5.controller(knobs[index]).setValue(map(val, 0, 127, knobMin[index], knobMax[index]));
  }
  else if (group == 2 && index< butt1.length) {
    controlP5.controller(butt1[index]).setValue(val);
  }
  else if (group == 3 && index< butt2.length) {
    controlP5.controller(butt2[index]).setValue(val);
  }
  else if (group ==4 && index< butt3.length) {
    controlP5.controller(butt3[index]).setValue(val);
  }
}

void controllerIn(promidi.Controller controller, int device, int channel) {
  int num = controller.getNumber();
  int val = controller.getValue();

  int index=num%10 - 1;
  int group=num/10;

  //  println(group+ "group");
  //  println(index+ "index");

  if (group == 0 && index< sliders.length) {
    controlP5.controller(sliders[index]).setValue(map(val, 0, 127, sliderMin[index], sliderMax[index]));
  } 
  else if (group == 1 && index< knobs.length) {
    controlP5.controller(knobs[index]).setValue(map(val, 0, 127, knobMin[index], knobMax[index]));
  }
  else if (group == 2 && index< butt1.length) {
    controlP5.controller(butt1[index]).setValue(val);
  }
  else if (group == 3 && index< butt2.length) {
    controlP5.controller(butt2[index]).setValue(val);
  }
  else if (group ==4 && index< butt3.length) {
    controlP5.controller(butt3[index]).setValue(val);
  }
}


//SET UP FOR MIDI
void setupMidi() {
  try {
    midiIO = MidiIO.getInstance(this);
    midiIO.printDevices();
    midiIO.openInput(0, 0);
  }
  catch(java.lang.IndexOutOfBoundsException e) {
    println("-----//////////////////////////-------");
    println("NO MIDI CONECTED");
    println("-----//////////////////////////-------");
  }
}

