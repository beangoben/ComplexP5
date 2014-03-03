package complexP5;

public class ComplexCircle {
    private float r;
    private Complex c;
    private ComplexPlane cxplane;

    public ComplexCircle(ComplexPlane plane) {
        r = 1.0f;
        c = Complex.ZERO;
        cxplane = plane;
    }

    public ComplexCircle(ComplexCircle other) {
        r = other.rad();
        c = other.center().dup();
        cxplane = other.cxplane();
    }

    
    public ComplexCircle(Complex center, float rad, ComplexPlane plane) {
        r = rad;
        c = center.dup();
        cxplane = plane;
    }

    public ComplexCircle(float rad, ComplexPlane plane) {
        r = rad;
        c = Complex.ZERO;
        cxplane = plane;
    }

    public void set(Complex center, float rad) {
        r = rad;
        c.copy(center);
    }

    public void setRadius( float rad) {
        r = rad;
    }

    public String toString() {
        return "center at " + c.toStringNice(2) + ", radius= " + r;
    }

    public void setCenter(Complex center) {
        c.copy(center);
    }

    public float rad( ) {
        return r;
    }

    public Complex center() {
        return c;
    }
    
    public ComplexPlane cxplane() {
        return cxplane;
    }
    
    public ComplexCircle dup() {
        return new ComplexCircle(this);
    }

    public void copy(ComplexCircle circ) {
        r = circ.rad();
        c = (circ.center()).dup();
    }

    public void transform(AffineTransform T) {
        T.mapi(c);
        r *= T.getA().abs();
    }
    
    public void transform(ComplexFunction T) {
        T.mapi(c);
    }
    
    public boolean isInside(Complex z){
    	return z.dist(c) <= r;
    }
    
    public void draw() {
        if ((r > cxplane.xpixel()) && (r < cxplane.width() ) )
            cxplane.ellipse(c, r, r);
    }

    public void transform(MobiusTransform T) {
        Complex oldcenter = c.dup();
        //update center
        Complex z = oldcenter.add(T.getD().div(T.getC()));
        z.conji().invi();
        z.muli(r * r).negi();
        z.addi(oldcenter);
        c = T.map(z);
        //update radius
        z = T.map(oldcenter.add(r));
        z.subi(c);
        r = z.abs();
    }

    public void inv() {
        r = 1.0f / r;
        c.invi();
    }

    public void translate(Complex t) {
        c.addi(t);
    }

}