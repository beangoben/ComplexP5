class ComplexGrid {
  int nwidth=5;
  int nheight=5; 
  Complex p[][];
  float diag;
  ComplexPlane cxplane;

  ComplexGrid(Complex center, float width,float height, int n1, int n2, ComplexPlane plane) {
    nwidth=n1;
    nheight=n2;
    p=new Complex[nheight][nwidth];
    cxplane=plane;
    diag=sqrt(width*width+height*height);
    for (int j=0; j < nheight; j++) {
      float y=map(j,0,nheight-1, center.imag()-height/2.0,center.imag()+height/2.0);
      for (int i=0; i < nwidth; i++) {
        float x=map(i,0,nwidth-1, center.real()-width/2.0,center.imag()+width/2.0);
        p[j][i]=new Complex(x, y);
      }
    }
  } 
  
  ComplexGrid(ComplexGrid g) {
    nwidth=g.nwidth;
    nheight=g.nheight;
    diag=g.diag;
    cxplane=g.cxplane;
    p=new Complex[nheight][nwidth];
    for (int j=0; j < nheight; j++) {
      for (int i=0; i < nwidth; i++) {
        p[j][i]=g.p[j][i].dup();
      }
    }
  } 


  void draw() {
    if (diag > cxplane.xpixel()) {
      for (int j=0; j < nheight; j++) {
        beginShape();
        for (int i=0; i < nwidth; i++) {
          vertex((float)p[j][i].real(), (float)p[j][i].imag());
        }
        endShape();
      }

      for (int i=0; i < nwidth; i++) {
        beginShape();
        for (int j=0; j < nheight; j++) {
          vertex(p[j][i].real(), p[j][i].imag());
        }
        endShape();
      }
    }
  }

  void drawPoints(float n) {

    if (diag > cxplane.xpixel()) {
      for (int j=0; j < nheight; j++) {
        for (int i=0; i < nwidth; i++) {
          ellipse(p[j][i].real(), p[j][i].imag(), cxplane.xpixel()*n, cxplane.xpixel()*n);
        }
      }
    }
  }

  void translate(Complex t) {
    for (int j=0; j < nheight; j++) {
      for (int i=0; i < nwidth; i++) {
        p[j][i].addi(t);
      }
    }
  }
  
 void invert() {
    for (int j=0; j < nheight; j++) {
      for (int i=0; i < nwidth; i++) {
        p[j][i].invi();
      }
    }
  }
  
}