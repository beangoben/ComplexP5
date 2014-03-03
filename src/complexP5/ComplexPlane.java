/**
 * 
 */
package complexP5;

import processing.core.PApplet;
import processing.core.PConstants;

/**
 * @author beangoben
 * 
 */

public class ComplexPlane {
	public PApplet app;
	// range
	private float xmin = -3, xmax = 3;
	private float ymin = -3, ymax = 3;
	private float xcenter, ycenter;
	// size of range
	private float xsize = xmax - xmin, ysize = ymax - ymin;
	// scaling factors for drawing
	private float xscale, yscale;
	// size of pixel
	private float xpix, ypix;
	// For writting numbers
	private processing.core.PFont latexfont;

	// default Constructor
	/*
	 * ComplexPlane(){
	 * 
	 * }
	 */
	
	public ComplexPlane(PApplet p, float xo, float yo, float cxwidth,
			float cxheight) {
		setup(p, xo, yo, cxwidth, cxheight);
	}

	public ComplexPlane(PApplet p, Complex c, float cxwidth, float cxheight) {
		setup(p, c.real(), c.imag(), cxwidth, cxheight);
	}

	public ComplexPlane(PApplet p, float size) {
		setup(p, 0.0f, 0.0f, size, size);
		setSize(size);
	}

	public ComplexPlane(PApplet p) {
		setup(p, 0.0f, 0.0f, 10.0f, 10.0f);
		setSize(10.0f);
	}

	public void setup(PApplet p, float xo, float yo, float cxwidth,
			float cxheight) {
		app = p;

		xcenter = xo;
		ycenter = yo;

		xsize = cxwidth;
		ysize = cxheight;

		// update sizes
		xmin = (float) (xcenter - xsize / 2.0);
		xmax = (float) (xcenter + xsize / 2.0);
		ymin = (float) (ycenter - ysize / 2.0);
		ymax = (float) (ycenter + ysize / 2.0);

		xscale = (float) app.width / xsize;
		yscale = (float) app.height / ysize;
		xpix = xsize / (float) app.width;
		ypix = ysize / (float) app.height;
		app.ellipseMode(PConstants.RADIUS);

		latexfont = app.loadFont("LMRoman10-Italic-96.vlw");
		app.textFont(latexfont, 48);
	}

	public void zoom(float factor) {
		zoom(0.0f, 0.0f, factor);
	}

	public void zoom(float xo, float yo, float factor) {
		xcenter = xo;
		ycenter = yo;
		xsize = xsize / factor;
		ysize = ysize / factor;

		// update sizes
		xmin = (float) (xcenter - xsize / 2.0);
		xmax = (float) (xcenter + xsize / 2.0);
		ymin = (float) (ycenter - ysize / 2.0);
		ymax = (float) (ycenter + ysize / 2.0);

		xscale = (float) app.width / xsize;
		yscale = (float) app.height / ysize;
		xpix = xsize / (float) app.width;
		ypix = ysize / (float) app.height;
	}

	public void setSize(float newsize) {
		float factor = xsize / newsize;
		xsize = xsize / factor;
		ysize = ysize / factor;

		// update sizes
		xmin = (float) (xcenter - xsize / 2.0);
		xmax = (float) (xcenter + xsize / 2.0);
		ymin = (float) (ycenter - ysize / 2.0);
		ymax = (float) (ycenter + ysize / 2.0);

		xscale = (float) app.width / xsize;
		yscale = (float) app.height / ysize;
		xpix = xsize / (float) app.width;
		ypix = ysize / (float) app.height;
	}

	public float pixelX(int i) {
		float x = (i / (float) app.width) * xsize + xmin;
		return x;
	}

	public float pixelY(int j) {
		float y = (j / (float) app.height) * ysize + ymin;
		y = PApplet.map(j, 0, app.width, ymin, ymax);
		return y;
	}

	public float mouseX() {
		return pixelX(app.mouseX);
	}

	public float mouseY() {
		return pixelY(app.mouseY);
	}

	public Complex pixel(int i, int j) {
		return new Complex(pixelX(i), -pixelY(j));
	}

	public Complex mouse() {
		return pixel(app.mouseX, app.mouseY);
	}
	
	public float xpixel(){
		return xpix;
	}
	
	public float ypixel(){
		return ypix;
	}
	
	public float width(){
		return xsize;
	}
	
	public float height(){
		return ysize;
	}
	
	public void start() {
		app.pushMatrix();
		app.translate(app.width / 2, app.height / 2);
		app.scale(xscale, -yscale);
		app.translate(-xcenter, -ycenter);
		app.strokeWeight(strokeWScale(1.0f));
	}

	public void end() {
		app.popMatrix();
	}

	public void drawAxis() {
		app.stroke(0);
		app.noFill();
		app.line(xmin, 0.0f, xmax, 0.0f);
		app.line(0.0f, ymin, 0.0f, ymax);
	}

	public void drawCenter() {
		app.stroke(0);
		app.fill(255, 0, 0, 25);
		app.ellipse(xcenter, ycenter, xpix * 10, ypix * 10);
		app.fill(0);
		drawText("O", app.width / 2.0f, app.height / 2.0f,24);
	}

	public void drawMouse() {
		Complex pos = mouse();
		app.noStroke();
		app.fill(13107200, 78);// #C80000
		app.ellipse(pos.real(), pos.imag(), xpix * 10, ypix * 10);
		app.fill(0, 78);
		app.fill(50);
		drawText(pos.toStringNice(2), (float) app.mouseX, (float) app.mouseY,24);
	}

	public void drawText(String s, float x, float y,int sizet) {
		app.pushMatrix();
		app.translate(xcenter, -ycenter);
		app.scale(1.0f / xscale, -1.0f / yscale);
		app.translate(-app.width / 2.0f, -app.height / 2.0f);
		app.textSize(sizet);
		app.text(s, x, y);
		app.popMatrix();
	}

	public void drawString(String s, float x, float y,int sizet) {		 
		app.pushMatrix();
		app.translate(0,0);
		app.stroke(0);
		app.fill(0);
		app.textSize(sizet);
		app.textFont(latexfont,sizet);
		app.text(s, x, y);
		app.popMatrix();
	}
	
	public float strokeWScale(float w) {
		return (w / (xscale));
	}

	void drawUnitaryCircle() {
		app.stroke(0);
		app.noFill();
		app.strokeWeight(strokeWScale(2.0f));
		app.ellipse(0, 0, 1, 1);
		app.strokeWeight(strokeWScale(1.0f));
	}

	public void drawInfomation() {
		drawUnitaryCircle();
		// draw a grid each 0.25 in x and y
		drawGrid(1, 1);
		// cxplane.drawMousePosition();
		drawAxis();
		drawCenter();
		app.noFill();
		app.stroke(0);
	}

	public void drawGrid(float spaceX, float spaceY) {
		app.stroke(125, 125);

		for (float xpos = xcenter; xpos <= xmax; xpos = xpos + spaceX) {
			app.line(xpos, ymax, xpos, ymin);
		}

		for (float xpos = -spaceX + xcenter; xpos >= xmin; xpos = xpos - spaceX) {
			app.line(xpos, ymax, xpos, ymin);
		}

		for (float ypos = ycenter; ypos <= ymax; ypos = ypos + spaceY) {
			app.line(xmin, ypos, xmax, ypos);
		}

		for (float ypos = -spaceY + ycenter; ypos >= ymin; ypos = ypos - spaceY) {
			app.line(xmin, ypos, xmax, ypos);
		}

	}
	
	public void drawGrid() {
		drawGrid(1.0f,1.0f);
	}
	
	
	public void complexText(String name,Complex z,float x,float y,int sizet){
		  app.pushMatrix();
		  app.translate(0,0);
		  app.stroke(0);
		  app.fill(0);
		  app.textSize(sizet);
		  app.textFont(latexfont,sizet);
		  app.text(name+"=",x,y+sizet);
		  String zs=z.toStringNice(2);
		  float ts=app.textWidth(name+"= ");
		 app.text(zs,x+ts,y+sizet);
		 app.popMatrix();
		}
	
	public void affineText(String name,AffineTransform T,float x,float y,int sizet){
		  app.pushMatrix();
		  app.translate(0,0);
		  app.stroke(0);
		  app.fill(0);
		  app.textSize(sizet);
		  app.textFont(latexfont,sizet);
		  app.text(name+"(z)=",x,y+sizet);
		  app.textFont(latexfont,sizet/2);
		  String numerator="("+T.getA().toStringNice(2)+") z + ("+T.getB().toStringNice(2)+")";
		 app.text(numerator,x+sizet*3.2f,y+sizet*0.75f);
		 app.popMatrix();
		}

	public void mobiusText(String name,MobiusTransform T,float x,float y,int sizet){
		  app.pushMatrix();
		  app.translate(0,0);
		  app.stroke(0);
		  app.fill(0);
		  app.textSize(sizet);
		  app.textFont(latexfont,sizet);
		  app.text(name+"(z)=",x,y+sizet);
		  app.textFont(latexfont,sizet/2);
		  String numerator="("+T.getA().toStringNice(2)+") z + ("+T.getB().toStringNice(2)+")";
		  String denominator="("+T.getC().toStringNice(2)+") z + ("+T.getD().toStringNice(2)+")";
		 float linewidth=PApplet.max(app.textWidth(numerator),app.textWidth(denominator))*1.1f;
		 app.text(numerator,x+sizet*3.2f,y+(sizet*1.2f)/2f);
		 app.text(denominator,x+sizet*3.2f,y+(sizet*1.2f));
		 app.strokeWeight(3);
		  app.line(x+sizet*3f,y+(sizet*1.5f)/2,x+sizet*3f+linewidth,y+(sizet*1.5f)/2f);
		  app.strokeWeight(1);
		 // text("Center at "+complexString(circ.center)+", r="+nf(circ.r,1,2),x,sizet*2+y);
		 // text("trace = "+complexString(T.trace()),x,sizet*2.5+y);
		 // text("det = "+complexString(T.det()),x,sizet*3+y); 
		  app.popMatrix();
		}
	
	//* 2D Primitives with complex numbers *//
	public void line(Complex a,Complex b){
		app.line(a.real(),a.imag(),b.real(),b.imag());
	}

	public void circle(Complex a,float rad){
		app.ellipse(a.real(),a.imag(),rad,rad);
	}

	public void ellipse(Complex a,float wid,float hei){
		app.ellipse(a.real(),a.imag(),wid,hei);
	}

	public void point(Complex a){
		app.point(a.real(),a.imag());
	}

	public void quad(Complex a,Complex b,Complex c,Complex d){
		app.quad( a.real(),a.imag(),b.real(),b.imag(),c.real(),c.imag(),d.real(),d.imag());
	}

	public void rect(Complex a,Complex b){
		app.rect( a.real(),a.imag(),b.real(),b.imag());
	}

	public void rect(Complex a,Complex b,float r){
		app.rect( a.real(),a.imag(),b.real(),b.imag(),r);
	}

	public void rect(Complex a,Complex b,float tl,float tr,float br,float bl){
		app.rect( a.real(),a.imag(),b.real(),b.imag(),tl, tr, br, bl);
	}

	public void triangle(Complex a,Complex b,Complex c){
		app.triangle( a.real(),a.imag(),b.real(),b.imag(),c.real(),c.imag());
	}

	public void arc(Complex a,float wid,float hei,float start,float stop){
		app.arc(a.real(),a.imag(),wid,hei,start,stop);
	}

	public void arc(Complex a,float wid,float hei,float start,float stop,int mode){
		app.arc(a.real(),a.imag(),wid,hei,start,stop,mode);
	}
	//* Vertex with complex numbers *//
	public void vertex(Complex a){
		app.vertex(a.real(),a.imag()); 
	}

	public void curveVertex(Complex a){
		app.curveVertex(a.real(),a.imag()); 
	}

	public void quadraticVertex(Complex a,Complex b){
		app.quadraticVertex(a.real(),a.imag(),b.real(),b.imag()); 
	}

	public void bezierVertex(Complex a,Complex b,Complex c){
	  app.bezierVertex( a.real(),a.imag(),b.real(),b.imag(),c.real(),c.imag());
	}
	//* Transformations *//
	public void translate(Complex a){
		app.translate(a.real(), a.imag());
	}
	
	public void rotate(Complex a){
		app.rotate(a.arg());
	}
	
	public void scale(Complex a){
		app.scale(a.abs());
	}
	
}
