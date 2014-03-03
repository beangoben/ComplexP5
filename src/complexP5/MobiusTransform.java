package complexP5;

public class MobiusTransform implements ComplexFunction {
    private Complex a, b, c, d;

    public MobiusTransform() {
        a = Complex.ONE;
        b = Complex.ZERO;
        c = Complex.ZERO;
        d = Complex.ONE;
    }
    
    public MobiusTransform(Complex ai, Complex bi) {
        a = ai.dup();
        b = bi.dup();
        c = Complex.ZERO;
        d = Complex.ONE;
    }
    
    public MobiusTransform(Complex ai, Complex bi, Complex ci, Complex di) {
        a = ai.dup();
        b = bi.dup();
        c = ci.dup();
        d = di.dup();
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
    public Complex getC() {
        return c;
    }

    public void setC(Complex co) {
        c.copy(co);
    }
    
    public Complex getD() {
        return d;
    }
    
    public void setD(Complex dd) {
        d.copy(dd);
    }
    
    public void set(Complex ai, Complex bi, Complex ci, Complex di) {
            a = ai.dup();
            b = bi.dup();
            c = ci.dup();
            d = di.dup();
    }
    
    public void copy(MobiusTransform other) {
        a.copy(other.getA());
        b.copy(other.getB());
        c.copy(other.getC());
        d.copy(other.getD());
    }

    public MobiusTransform dup() {
        return new MobiusTransform(a, b, c, d);
    }
    
    
    
    public Complex det() {
        Complex tmp1 = a.mul(d);
        Complex tmp2 = b.mul(c);
        return tmp1.subi(tmp2);
    }

    public MobiusTransform normi() {
        Complex sqrtdet = (this.det()).sqrt();
        a.divi(sqrtdet);
        b.divi(sqrtdet);
        c.divi(sqrtdet);
        d.divi(sqrtdet);
        return this;
    }
    
    public MobiusTransform norm() {
        return dup().normi();
    }
    

    public Complex trace() {
        return a.add(d);
    }

    public Complex map(Complex z) {
        return mapi(z.dup());
    }

    public Complex mapi(Complex z) {
        Complex numerator = a.mul(z);
        numerator.addi(b);
        Complex denominator = c.mul(z);
        denominator.addi(d);
        z = numerator.divi(denominator);
        return z;
    }

    public MobiusTransform invi() {
        Complex det1 = det();
        Complex det2 = det1.neg();
        d.divi(det1);
        b.divi(det2);
        c.divi(det2);
        a.divi(det1);
        return this;
    }

    public MobiusTransform inv() {
        return dup().invi();
    }

    public MobiusTransform compose(MobiusTransform T) {
        return dup().composei(T);
    }

    public MobiusTransform composei(MobiusTransform T) {
        a.copy((a.mul(T.a)).addi( b.mul(T.c)));
        b.copy((a.mul(T.b)).addi( b.mul(T.d)));
        c.copy((c.mul(T.a)).addi( d.mul(T.c)));
        d.copy((c.mul(T.b)).addi( d.mul(T.d)));
        return this;
    }

    public MobiusTransform conjugate(MobiusTransform S) {
        MobiusTransform inv = S.inv();
        return S.compose(this.compose(inv));
    }

    public String toString() {
        return "a= " + a.toStringNice(2) + ", b= " + b.toStringNice(2) + "\n c=" + c.toStringNice(2) + ", d=" + c.toStringNice(2);
    }

    public Complex fixed1() {
        Complex ad = a.sub(d);
        Complex tmp1 = (b.mul(c));
        tmp1.muli(4);
        Complex tmp2 = (ad.mul(ad));
        tmp2.addi(tmp1);
        tmp2 = tmp2.sqrt();
        tmp2.addi(ad);
        tmp2.divi(c.mul(2));
        return tmp2;
    }

    public Complex fixed2() {
        Complex ad = a.sub(d);
        Complex tmp1 = (b.mul(c));
        tmp1.muli(4);
        Complex tmp2 = (ad.mul(ad));
        tmp2.addi(tmp1);
        tmp2 = tmp2.sqrt();
        tmp2.subi(ad);
        tmp2.divi(c.mul(2));
        return tmp2;
    }

}
