package complexP5;

public class AffineTransform {

    private Complex a, b;

    public AffineTransform(Complex ao, Complex bo) {
        a = ao.dup();
        b = bo.dup();
    }

    public AffineTransform(Complex ao) {
        a = ao.dup();
        b = Complex.ZERO;
    }

    public AffineTransform() {
        a = Complex.ONE;
        b = Complex.ZERO;
    }

    public Complex getA() {
        return a;
    }

    public Complex getB() {
        return b;
    }

    public void set(Complex ao, Complex bo) {
        a = ao.dup();
        b = bo.dup();
    }

    public void copy (AffineTransform other) {
        a.copy(other.getA());
        b.copy(other.getB());
    }

    public String toString() {
        return "a= " + a.toStringNice(2) + ", b= " + b.toStringNice(2);
    }

    public AffineTransform dup () {
        return new AffineTransform(a, b);
    }

    public Complex map(Complex z) {
        return (a.mul(z)).addi(b);
    }

    public void mapi(Complex z) {
        z.muli(a);
        z.addi(b);
    }

    public void normalize() {
        if (!a.isZero())a.divi(a.abs());
    }

    public AffineTransform inverse() {
        return new AffineTransform(a.inv(), (b.div(a)).negi());
    }

    public AffineTransform compose(AffineTransform T) {
        return dup().composei(T);
    }

    public AffineTransform composei(AffineTransform other) {
        b.addi(a.mul(other.getB()));
        a.muli(other.getA());
        return this;
    }

}
