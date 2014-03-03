package complexP5;

import processing.core.PApplet;

public class ComplexGrid {
	  int nwidth=5;
	  int nheight=5; 
	  Complex p[][];
	  float diag;
	  ComplexPlane cxplane;

public  ComplexGrid(Complex center, float width,float height, int n1, int n2, ComplexPlane plane) {
	    nwidth=n1;
	    nheight=n2;
	    p=new Complex[nheight][nwidth];
	    cxplane=plane;
	    diag=PApplet.sqrt(width*width+height*height);
	    for (int j=0; j < nheight; j++) {
	      float y=PApplet.map(j,0,nheight-1.0f, center.imag()-height/2.0f,center.imag()+height/2.0f);
	      for (int i=0; i < nwidth; i++) {
	        float x=PApplet.map(i,0,nwidth-1.0f, center.real()-width/2.0f,center.imag()+width/2.0f);
	        p[j][i]=new Complex(x, y);
	      }
	    }
	  } 
	  
public  ComplexGrid(ComplexGrid g) {
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


public  void draw() {
	    if (diag > cxplane.xpixel()) {
	      for (int j=0; j < nheight; j++) {
	    	  cxplane.app.beginShape();
	        for (int i=0; i < nwidth; i++) {
	        	cxplane.vertex(p[j][i]);
	        }
	        cxplane.app.endShape();
	      }

	      for (int i=0; i < nwidth; i++) {
	    	cxplane.app.beginShape();
	        for (int j=0; j < nheight; j++) {
	        	cxplane.vertex(p[j][i]);
	        }
	        cxplane.app.endShape();
	      }
	    }
	  }

public void drawPoints(float n) {

	    if (diag > cxplane.xpixel()) {
	      for (int j=0; j < nheight; j++) {
	        for (int i=0; i < nwidth; i++) {
	        	cxplane.ellipse(p[j][i], cxplane.xpixel()*n, cxplane.xpixel()*n);
	        }
	      }
	    }
	  }

public void translate(Complex t) {
	    for (int j=0; j < nheight; j++) {
	      for (int i=0; i < nwidth; i++) {
	        p[j][i].addi(t);
	      }
	    }
	  }
	  
public void transform(ComplexFunction f) {
	    for (int j=0; j < nheight; j++) {
	      for (int i=0; i < nwidth; i++) {
	        f.mapi(p[j][i]);
	      }
	    }
	  }
	  
}