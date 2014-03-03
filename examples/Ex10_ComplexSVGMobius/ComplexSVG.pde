class ComplexSVG{
  
  RShape svg;
  float size;
  PApplet p;
  RPoint points[],original[];
  boolean drawable=true;
  
  ComplexSVG(PApplet p,String name,float size ){
    this.p=p;
    RShape shp = RG.loadShape(name);
    shp.scale(1.0,-1.0);
    RG.setPolygonizer(RG.ADAPTATIVE);
    svg = RG.polygonize(shp);
    RPoint center =svg.getCenter();
    this.size = (size/max(svg.getWidth(),svg.getHeight()))*2.0;
    //translate(new Complex(-center.x,-center.y));
    moveRShape(svg,-center.x,-center.y,this.size,this.size);
    points = svg.getPoints();
    original = new RPoint[points.length];
    for(int i=0; i < points.length; i++){
      original[i]=new RPoint(points[i].x,points[i].y);
    }
    
  }
  
  
  
  void reset(){
    drawable=true;
  for(int i=0; i < points.length; i++){
      points[i].x=original[i].x;
      points[i].y=original[i].y;
    }
  }
  
    void save(){

  for(int i=0; i < points.length; i++){
      original[i].x=points[i].x;
      original[i].y=points[i].y;
    }
  }
  
  void translate(Complex t){
    RPoint center = svg.getCenter();
    moveRShape(svg,t.real()-center.x,t.imag()-center.y);
  }
  /*
// Tranform coordinates
void transform(Transform T){
  transformRPaths(svg,T);
    for(int i=0;i<svg.countChildren();i++){
      transformRShape(svg.children[i],T);
    }
  size= max(svg.getWidth(),svg.getHeight());
}
*/
void transform(ComplexFunction T){  
  Complex tmp =Complex.ZERO;
  for(int i=0; i < points.length; i++){
    tmp.set(points[i].x,points[i].y);
    tmp=T.map(tmp);
    points[i].x=tmp.real();
    points[i].y=tmp.imag();
  }
  size= max(svg.getWidth(),svg.getHeight());  
  drawable=((size*4 > cxplane.xpixel()) && (size/2 < cxplane.width()) );
}

void transformRShape(RShape sh,ComplexFunction T){
  p.g.pushStyle();
  setContext(sh.getStyle());
  transformRPaths(sh,T);
    for(int i=0;i<sh.countChildren();i++){
      transformRShape(sh.children[i],T);
    }
  p.g.popStyle();
}

void transformRPaths(RShape sh,ComplexFunction T){
    int numPaths = sh.countPaths();
    if(numPaths!=0){
      Complex tmp = Complex.ZERO;
        boolean useContours = (numPaths>1);
        g.beginShape();
        for(int i=0;i<numPaths;i++){
          if (useContours && i>0) g.beginContour();
          RPath path = sh.paths[i];
          for(int j = 0; j < path.countCommands(); j++ ){
            RPoint[] pnts = path.commands[j].getHandles();
            if (j==0) {
              tmp.set(pnts[0].x, pnts[0].y);
              T.mapi(tmp);
              pnts[0].x=tmp.real();
              pnts[0].y=tmp.imag();
            }
           tmp.set(pnts[1].x, pnts[1].y);
           T.mapi(tmp);
           pnts[1].x=tmp.real();
           pnts[1].y=tmp.imag();
          }
          if (useContours && i>0) {
              p.endContour();
          }
        }
        p.endShape(PConstants.OPEN);
    } 
  }
//Draw functions with transforms
void draw(ComplexFunction T){
  p.g.pushStyle();
  setContext(svg.getStyle());
  drawRPaths(svg,T);
    for(int i=0;i<svg.countChildren();i++){
      drawRShape(svg.children[i],T);
    }
  p.g.popStyle();
}

void drawRShape(RShape sh,ComplexFunction T){
    p.pushStyle();
    setContext(sh.getStyle());
    drawRPaths(sh,T);
    for(int i=0;i<sh.countChildren();i++){
      drawRShape(sh.children[i],T);
    }
    p.popStyle();
}

void drawRPaths(RShape sh,ComplexFunction T){
    int numPaths = sh.countPaths();
    if(numPaths!=0){
        boolean useContours = (numPaths>1);
        g.beginShape();
        for(int i=0;i<numPaths;i++){
          if (useContours && i>0) g.beginContour();
          RPath path = sh.paths[i];
          Complex tmp=Complex.ZERO;
          for(int j = 0; j < path.countCommands(); j++ ){
            RPoint[] pnts = path.commands[j].getHandles();
            if (j==0) {
              tmp.set(pnts[0].x, pnts[0].y);
              T.mapi(tmp);
              p.vertex(tmp.real(),tmp.imag());
            }
           tmp.set(pnts[1].x, pnts[1].y);
           T.mapi(tmp);
           p.vertex(tmp.real(), tmp.imag() );    
          }
          if (useContours && i>0) {
              p.endContour();
          }
        }
        p.endShape(PConstants.OPEN);
    } 
  }

void updateStrokeWeight(){
   updateStrokeWeight(svg);
}

void updateStrokeWeight(RShape sh){
  RStyle style=sh.getStyle();
  if(style.strokeWeightDef){
    style.setStrokeWeight(cxplane.strokeWScale(style.strokeWeight));
  }
    for(int i=0;i<sh.countChildren();i++){
      updateStrokeWeight(sh.children[i]);
    }
}

//Simple Draw functions
void draw(){
  if(drawable){

    //svg.setStrokeWeight(cxplane.strokeWeight(1.0));
    svg.draw();
    /*
  p.g.pushStyle();
  setContext(svg.getStyle());
  drawRPaths(svg);
    for(int i=0;i<svg.countChildren();i++){
      drawRShape(svg.children[i]);
    }
  p.g.popStyle();
  */
  }
}

void drawRShape(RShape sh){
    p.pushStyle();
    setContext(sh.getStyle());
    drawRPaths(sh);
    for(int i=0;i<sh.countChildren();i++){
      drawRShape(sh.children[i]);
    }
    p.popStyle();
}

void drawRPaths(RShape sh){
    int numPaths = sh.countPaths();
    if(numPaths!=0){
        boolean useContours = (numPaths>1);
        g.beginShape();
        for(int i=0;i<numPaths;i++){
          if (useContours && i>0) g.beginContour();
          RPath path = sh.paths[i];
          for(int j = 0; j < path.countCommands(); j++ ){
            RPoint[] pnts = path.commands[j].getHandles();
            if (j==0) {
              p.vertex(pnts[0].x, pnts[0].y);
            }
           p.vertex( pnts[1].x, pnts[1].y );    
          }
          if (useContours && i>0) {
              p.endContour();
          }
        }
        p.endShape(PConstants.OPEN);
    } 
  }

//Style functions
void setContext(RStyle style){
    
    if(style.fillAlphaDef){
      if(style.fillDef){
        style.fillColor = (( style.fillAlpha << 24) & 0xff000000) | (style.fillColor & 0x00ffffff);
      }else{
        if(p.g.fill){
          p.g.fill(((style.fillAlpha << 24) & 0xff000000) | (p.g.fillColor & 0x00ffffff));
        }
      }
    }
    
    if(style.fillDef){
      p.g.fill(style.fillColor);
      if(!style.fill){
        p.g.noFill();
      }
    }

    if(style.strokeWeightDef){      
      p.g.strokeWeight(cxplane.strokeWScale(style.strokeWeight)*min(size,1.0));
    }

    if(style.strokeAlphaDef){
      if(style.strokeDef){
        style.strokeColor = ((style.strokeAlpha) << 24 & 0xff000000) | (style.strokeColor & 0x00ffffff);
      }else{
        if(p.g.stroke){
          p.g.stroke(((style.strokeAlpha) << 24 & 0xff000000) | (p.g.strokeColor & 0x00ffffff));
        }
      }
    }

    if(style.strokeDef){
      p.g.stroke(style.strokeColor);
      if(!style.stroke){
        p.g.noStroke();
      }
    }
  }
//Move shape functions
void moveRShape(RShape sh,float x,float y){
    moveRPaths(sh,x,y);
    for(int i=0;i<sh.countChildren();i++){
      moveRShape(sh.children[i],x,y);
    }
}

void moveRShape(RShape sh,float x,float y,float sizex,float sizey){
    moveRPaths(sh,x,y,sizex,sizey);
    for(int i=0;i<sh.countChildren();i++){
      moveRShape(sh.children[i],x,y,sizex,sizey);
    }
}
//Moving Path functions
  void moveRPaths(RShape sh,float x,float y,float sizex,float sizey){
    int numPaths = sh.countPaths();
    if(numPaths!=0){
        for(int i=0;i<numPaths;i++){
          RPath path = sh.paths[i];
          for(int j = 0; j < path.countCommands(); j++ ){
            RPoint[] pnts = path.commands[j].getHandles();       
            if (j==0) {
              pnts[0].x=(pnts[0].x+x)*sizex;
              pnts[0].y=(pnts[0].y+y)*sizey;
            }
            pnts[1].x=(pnts[1].x+x)*sizex;
              pnts[1].y=(pnts[1].y+y)*sizey; 
          }
        }
      }    
    }
    
  void moveRPaths(RShape sh,float x,float y){
    int numPaths = sh.countPaths();
    if(numPaths!=0){
        for(int i=0;i<numPaths;i++){
          RPath path = sh.paths[i];
          for(int j = 0; j < path.countCommands(); j++ ){
            RPoint[] pnts = path.commands[j].getHandles();       
            if (j==0) {
              pnts[0].x=(pnts[0].x+x);
              pnts[0].y=(pnts[0].y+y);
            }
            pnts[1].x=(pnts[1].x+x);
              pnts[1].y=(pnts[1].y+y); 
          }
        }
      }    
    }
    
}