package complexP5;

public class ComplexCircle {
    private float r;
    private Complex c;
    ComplexPlane cxplane;

    public ComplexCircle(ComplexPlane plane) {
        r = 1.0f;
        c = Complex.ZERO;
        cxplane = plane;
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
    public ComplexCircle dup(ComplexCircle circ) {
        return new ComplexCircle(circ.center(), circ.rad(), cxplane);
    }

    public void copy(ComplexCircle circ) {
        r = circ.rad();
        c = (circ.center()).dup();
    }

    public void transform(AffineTransform T) {
        T.mapi(c);
        r *= T.getA().abs();
    }

    void draw() {
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