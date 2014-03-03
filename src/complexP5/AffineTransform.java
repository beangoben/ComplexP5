package complexP5;

public class AffineTransform implements ComplexFunction {

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

    public void setA(Complex ao) {
        a.copy(ao);
    }
    
    public Complex getB() {
        return b;
    }

    public void setB(Complex bo) {
        b.copy(bo);
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
        return this.mapi(z.dup());
    }

    public Complex mapi(Complex z) {
        z.muli(a);
        z.addi(b);
        return z;
    }
      
    public AffineTransform normi() {
        if (!a.isZero())a.divi(a.abs());
        return this;
    }
    
    public AffineTransform norm() {
        return this.dup().normi();
    }

    public AffineTransform invi() {
    	b.divi(a).negi();
    	a.invi();
        return this;
    }
    
    public AffineTransform inv() {
        return this.dup().invi();
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
