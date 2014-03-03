class PolygonCircle {
  int n;
  float rad;
  Complex center;
  Complex[] v;
  ComplexPlane cxplane;

  PolygonCircle(Complex c, float r, int nn, ComplexPlane cxp) {
    n=nn;
    rad=r;
    center=c.dup();
    cxplane=cxp;
    v=new Complex[n];
    float ang=TWO_PI/(float)n;
    for (int i=0; i < n; i++) {
      v[i]=Complex.polar(rad, ang*i).addi(center);
    }
  }

  void draw() {
    if ( center.abs() < cxplane.width()*2) {
      beginShape();
      for (int i=0; i < n; i++) {
        cxplane.vertex(v[i]);
      }
      endShape(CLOSE);
    }
  }  

  void transform(ComplexFunction f) {
    for (int i=0; i < n; i++) {
      v[i]=f.map(v[i]);
    }
    center=f.map(center);
  }
}
