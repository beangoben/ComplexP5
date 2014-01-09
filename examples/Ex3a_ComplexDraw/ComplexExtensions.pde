//* 2D Primitives with complex numbers *//
void line(Complex a, Complex b) {
  line(a.real(), a.imag(), b.real(), b.imag());
}

void ellipse(Complex a, float wid, float hei) {
  ellipse(a.real(), a.imag(), wid, hei);
}

void point(Complex a) {
  point(a.real(), a.imag());
}

void quad(Complex a, Complex b, Complex c, Complex d) {
  quad( a.real(), a.imag(), b.real(), b.imag(), c.real(), c.imag(), d.real(), d.imag());
}

void rect(Complex a, Complex b) {
  rect( a.real(), a.imag(), b.real(), b.imag());
}

void rect(Complex a, Complex b, float r) {
  rect( a.real(), a.imag(), b.real(), b.imag(), r);
}

void rect(Complex a, Complex b, float tl, float tr, float br, float bl) {
  rect( a.real(), a.imag(), b.real(), b.imag(), tl, tr, br, bl);
}

void triangle(Complex a, Complex b, Complex c) {
  triangle( a.real(), a.imag(), b.real(), b.imag(), c.real(), c.imag());
}

void arc(Complex a, float wid, float hei, float start, float stop) {
  arc(a.real(), a.imag(), wid, hei, start, stop);
}

void arc(Complex a, float wid, float hei, float start, float stop, int mode) {
  arc(a.real(), a.imag(), wid, hei, start, stop, mode);
}
//* Vertex with complex numbers *//
void vertex(Complex a) {
  vertex(a.real(), a.imag());
}

void curveVertex(Complex a) {
  curveVertex(a.real(), a.imag());
}

void quadraticVertex(Complex a, Complex b) {
  quadraticVertex(a.real(), a.imag(), b.real(), b.imag());
}

void bezierVertex(Complex a, Complex b, Complex c) {
  bezierVertex( a.real(), a.imag(), b.real(), b.imag(), c.real(), c.imag());
}
//* Transformations *//
void translate(Complex a){
	translate(a.real(), a.imag());
	}
	
void rotate(Complex a){
	rotate(a.arg());
	}
	
void scale(Complex a){
	scale(a.abs());
	}