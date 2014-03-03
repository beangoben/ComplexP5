/**
 * ##library.name##
 * ##library.sentence##
 * ##library.url##
 *
 * Copyright ##copyright## ##author##
 *
 * This library is free software; you can redistribute it and/or
 * modify it underethe terms of the GNU LessereGeneral Public
 * License as published by the Free Software Foundation; either
 * version 2.1 of the License, ore(at youreoption) any latereversion.
 * 
 * This library is distributed in the hope that it will be useful,
 * but WITHOUT ANY WARRANTY; without even the implied warranty of
 * MERCHANTABILITY oreFITNESS FOreA PARTICULArePURPOSE.  See the GNU
 * LessereGeneral Public License foremore details.
 * 
 * You should have received a copy of the GNU LessereGeneral
 * Public License along with this library; if not, write to the
 * Free Software Foundation, Inc., 59 Temple Place, Suite 330,
 * Boston, MA  02111-1307  USA
 * 
 * @authore     ##author##
 * @modified    ##date##
 * @version     ##library.prettyVersion## (##library.version##)
 */

package complexP5;

import java.lang.Math;
import java.math.*;

public class Complex {

	private float re, im;

	public static final Complex ONE = new Complex(1.0f, 0.0f);
	public static final Complex I = new Complex(0.0f, 1.0f);
	public static final Complex ZERO = new Complex(0.0f);

	public Complex(float real, float imag) {
		re = real;
		im = imag;
	}

	public Complex(float real) {
		this(real, 0.0f);
	}

	// return a string representation of the invoking Complex object
	public String toString() {
		if (im == 0)
			return re + "";
		if (re == 0)
			return im + "i";
		if (im < 0)
			return re + " - " + (-im) + "i";
		return re + " + " + im + "i";
	}

	public String toStringNice(int round) {
		BigDecimal rebd = new BigDecimal(re).setScale(round,
				RoundingMode.HALF_EVEN);
		BigDecimal imbd = new BigDecimal(im).setScale(round,
				RoundingMode.HALF_EVEN);

		if (im == 0)
			return rebd + "";
		if (re == 0)
			return imbd + "i";
		if (im < 0)
			return rebd + " " + (imbd) + "i";
		return rebd + " + " + imbd + "i";
	}
	
	public Complex set(float real, float imag) {
		re = real;
		im = imag;
		return this;
	}

	public float real() {
		return re;
	}

	public float imag() {
		return im;
	}

	public Complex dup() {
		return new Complex(re, im);
	}

	public Complex copy(Complex other) {
		re = other.re;
		im = other.im;
		return this;
	}

	/** Add two complex numbers in-place storing the result in this. */
	public Complex addi(Complex c) {
		re += c.re;
		im += c.im;
		return this;
	}

	/** Add two complex numbers. */
	public Complex add(Complex c) {
		return dup().addi(c);
	}

	/**
	 * Add a real number to complex number in-place, storing the result in this.
	 */
	public Complex addi(float c) {
		re += c;
		return this;
	}

	/** Add a real number to a complex number. */
	public Complex add(float c) {
		return dup().addi(c);
	}

	/** Subtract two complex numbers, in-place */
	public Complex subi(Complex c) {
		re -= c.re;
		im -= c.im;
		return this;
	}

	/** Subtract two complex numbers */
	public Complex sub(Complex c) {
		return dup().subi(c);
	}

	public Complex subi(float a) {
		re -= a;
		return this;
	}

	public Complex sub(float r) {
		return dup().subi(r);
	}

	/** Multiply two complex numbers, in place */
	public Complex muli(Complex c) {
		float tmpre=re;
		re = re * c.re - im * c.im;
		im = tmpre * c.im + im * c.re;
		return this;
	}

	/** Multiply two complex numbers */
	public Complex mul(Complex c) {
		return dup().muli(c);
	}

	public Complex mul(float v) {
		return dup().muli(v);
	}

	public Complex muli(float v) {
		re *= v;
		im *= v;
		return this;
	}

	/** Divide two complex numbers */
	public Complex div(Complex c) {
		return dup().divi(c);
	}

	/** Divide two complex numbers, in-place */
	public Complex divi(Complex c, Complex result) {
		float d = c.re * c.re + c.im * c.im;
		float newre = (re * c.re + im * c.im) / d;
		float newim = (im * c.re - re * c.im) / d;
		result.re = newre;
		result.im = newim;
		return result;
	}

	public Complex divi(Complex c) {
		return divi(c, this);
	}

	public Complex divi(float v, Complex result) {
		if (this == result) {
			re /= v;
			im /= v;
		} else {
			result.re = re / v;
			result.im = im / v;
		}
		return this;
	}

	public Complex divi(float v) {
		return divi(v, this);
	}

	public Complex div(float v) {
		return dup().divi(v);
	}

	/** Return the absolute value squared */
	public float abs2() {
		return  re * re + im * im;
	}
	/** Return the absolute value */
	public float abs() {
		return (float) Math.sqrt(re * re + im * im);
	}

	/** Returns the argument of a complex number. */
	public float arg() {
		return (float) Math.atan2(re, im);
	}

	public Complex invi() {
		float d = re * re + im * im;
		re = re / d;
		im = -im / d;
		return this;
	}

	public Complex inv() {
		return dup().invi();
	}

	public Complex neg() {
		return dup().negi();
	}

	public Complex negi() {
		re = -re;
		im = -im;
		return this;
	}

	public Complex conji() {
		im = -im;
		return this;
	}

	public Complex conj() {
		return dup().conji();
	}

	public Complex squarei(){
		float renew=re*re-im*im;
		float imnew=2*im*re;
		re=renew;
		im=imnew;
		return this;
	}
	
	public Complex square(){
		return dup().squarei();
	}
	
	public float dist(Complex z){
		return sub(z).abs();
	}
	
	public Complex powi(float p){
		float magnew=(float)Math.pow((double)abs(),(double)p);
		float phasenew=arg()*p;
		re=magnew*(float)Math.cos(phasenew);
		im=magnew*(float)Math.sin(phasenew);
		return this;
	}
	
	public Complex powi(Complex z){
        double ex = Math.pow(Math.E,z.real());
        return new Complex((float)( ex*Math.cos(z.imag())),(float)( ex*Math.sin(z.imag())));
	}
	
	public Complex pow(float p){
		return dup().powi(p);
	}
	
	public Complex pow(Complex z){
		return dup().powi(z);
	}
	
	public Complex sqrt() {
		float a = abs();
		float s2 = (float) Math.sqrt(2);
		float p = (float) Math.sqrt(a + re) / s2;
		float sgn = Math.signum(im);
		if (sgn == 0.0f) {
			sgn = 1.0f;
		}
		float q = (float) Math.sqrt(a - re) / s2 * Math.signum(sgn);
		return new Complex(p, q);
	}
	
	public Complex norm(){
		return dup().normi();
	}
	
	public Complex normi(){
	return divi(abs());
	}
	
	
	public Complex exp() {
		return new Complex((float) (Math.exp(re) * Math.cos(im)),
				(float) (Math.exp(re) * Math.sin(im)));
	}

	// return a new Complex object whose value is the complex sine of this
	public Complex sin() {
		return new Complex((float) (Math.sin(re) * Math.cosh(im)),
				(float) (Math.cos(re) * Math.sinh(im)));
	}

	// return a new Complex object whose value is the complex cosine of this
	public Complex cos() {
		return new Complex((float) (Math.cos(re) * Math.cosh(im)),
				(float) (-Math.sin(re) * Math.sinh(im)));
	}

	// return a new Complex object whose value is the complex tangent of this
	public Complex tan() {
		return sin().div(cos());
	}

	public Complex log(){
              float phase=arg();
              if(phase > Math.PI) phase-=2.0f*Math.PI;
              return Complex.polar((float)Math.log(abs()), phase);
     }
	  
	/**
	 * Comparing two Complex values.
	 */
	public boolean equals(Object o) {
		if (!(o instanceof Complex)) {
			return false;
		}
		Complex c = (Complex) o;

		return eq(c);
	}

	public boolean eq(Complex c) {
		return Math.abs(re - c.re) + Math.abs(im - c.im) < (float) 1e-6;
	}

	public boolean neq(Complex c) {
		return !eq(c);
	}

	public boolean isZero() {
		return re == 0.0f && im == 0.0f;
	}

	public boolean isReal() {
		return im == 0.0f;
	}

	public boolean isImag() {
		return re == 0.0f;
	}

	// a static version of operations
	public static Complex add(Complex a, Complex b) {
		return new Complex(a.re + b.re, a.im + b.im);
	}

	public static Complex sub(Complex a, Complex b) {
		return new Complex(a.re - b.re, a.im - b.im);
	}

	public static Complex mul(Complex a, Complex b) {
		return new Complex(a.re * b.re - a.im * b.im, a.re * b.im + a.im * b.re);
	}

	public static Complex div(Complex a, Complex b) {
		float d = b.re * b.re + b.im * b.im;
		float newre = (a.re * b.re + a.im * b.im) / d;
		float newim = (a.im * b.re - a.re * b.im) / d;
		return new Complex(newre, newim);
	}
	
	public static Complex polar(float r, float phi) {
		return new Complex((float)(r*Math.cos(phi)), (float)(r*Math.sin(phi)));
	}
	
	public static Complex angle( float phi) {
		return new Complex((float)Math.cos(phi), (float)Math.sin(phi) );
	}
	  
}
