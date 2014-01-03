/**
 * ##library.name##
 * ##library.sentence##
 * ##library.url##
 *
 * Copyright ##copyright## ##author##
 *
 * This library is free software; you can redistribute it and/or
 * modify it under the terms of the GNU Lesser General Public
 * License as published by the Free Software Foundation; either
 * version 2.1 of the License, or (at your option) any later version.
 * 
 * This library is distributed in the hope that it will be useful,
 * but WITHOUT ANY WARRANTY; without even the implied warranty of
 * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU
 * Lesser General Public License for more details.
 * 
 * You should have received a copy of the GNU Lesser General
 * Public License along with this library; if not, write to the
 * Free Software Foundation, Inc., 59 Temple Place, Suite 330,
 * Boston, MA  02111-1307  USA
 * 
 * @author      ##author##
 * @modified    ##date##
 * @version     ##library.prettyVersion## (##library.version##)
 */

package complexP5.library;


import processing.core.*;

public class Complex {

  private float r, i;

  public static final Complex ONE = new Complex(1.0f, 0.0f);
  public static final Complex I = new Complex(0.0f, 1.0f);
  public static final Complex NEG_ONE = new Complex(-1.0f, 0.0f);
  public static final Complex NEG_I = new Complex(0.0f, -1.0f);
  public static final Complex ZERO = new Complex(0.0f);


  public Complex(float real, float imag) {
    r = real;
    i = imag;
  }

  public Complex(float real) {
    this(real, 0.0f);
  }

  // return a string representation of the invoking Complex object
  public String toString() {
    if (i == 0) return r + "";
    if (r == 0) return i + "i";
    if (i <  0) return r + " - " + (-i) + "i";
    return r + " + " + i + "i";
  }

  public Complex set(float real, float imag) {
    r = real;
    i = imag;
    return this;
  }

  public float real() {
    return r;
  }

  public float imag() {
    return i;
  }

  public Complex dup() {
    return new Complex(r, i);
  }

  public Complex copy(Complex other) {
    r = other.r;
    i = other.i;
    return this;
  }

  /** Add two complex numbers in-place */
  public Complex addi(Complex c, Complex result) {
    if (this == result) {
      r += c.r;
      i += c.i;
    } 
    else {
      result.r = r + c.r;
      result.i = i + c.i;
    }
    return result;
  }

  /** Add two complex numbers in-place storing the result in this. */
  public Complex addi(Complex c) {
    return addi(c, this);
  }

  /** Add two complex numbers. */
  public Complex add(Complex c) {
    return dup().addi(c);
  }

  /** Add a real number to a complex number in-place. */
  public Complex addi(float a, Complex result) {
    if (this == result) {
      r += a;
    } 
    else {
      result.r = r + a;
      result.i = i;
    }
    return result;
  }

  /** Add a real number to complex number in-place, storing the result in this. */
  public Complex addi(float c) {
    return addi(c, this);
  }

  /** Add a real number to a complex number. */
  public Complex add(float c) {
    return dup().addi(c);
  }

  /** Subtract two complex numbers, in-place */
  public Complex subi(Complex c, Complex result) {
    if (this == result) {
      r -= c.r;
      i -= c.i;
    } 
    else {
      result.r = r - c.r;
      result.i = i - c.i;
    }
    return this;
  }

  public Complex subi(Complex c) {
    return subi(c, this);
  }

  /** Subtract two complex numbers */
  public Complex sub(Complex c) {
    return dup().subi(c);
  }

  public Complex subi(float a, Complex result) {
    if (this == result) {
      r -= a;
    } 
    else {
      result.r = r - a;
      result.i = i;
    }
    return result;
  }

  public Complex subi(float a) {
    return subi(a, this);
  }

  public Complex sub(float r) {
    return dup().subi(r);
  }

  /** Multiply two complex numbers, inplace */
  public Complex muli(Complex c, Complex result) {
    float newR = r * c.r - i * c.i;
    float newI = r * c.i + i * c.r;
    result.r = newR;
    result.i = newI;
    return result;
  }

  public Complex muli(Complex c) {
    return muli(c, this);
  }

  /** Multiply two complex numbers */
  public Complex mul(Complex c) {
    return dup().muli(c);
  }

  public Complex mul(float v) {
    return dup().muli(v);
  }

  public Complex muli(float v, Complex result) {
    if (this == result) {
      r *= v;
      i *= v;
    } 
    else {
      result.r = r * v;
      result.i = i * v;
    }
    return this;
  }

  public Complex muli(float v) {
    return muli(v, this);
  }

  /** Divide two complex numbers */
  public Complex div(Complex c) {
    return dup().divi(c);
  }

  /** Divide two complex numbers, in-place */
  public Complex divi(Complex c, Complex result) {
    float d = c.r * c.r + c.i * c.i;
    float newR = (r * c.r + i * c.i) / d;
    float newI = (i * c.r - r * c.i) / d;
    result.r = newR;
    result.i = newI;
    return result;
  }

  public Complex divi(Complex c) {
    return divi(c, this);
  }

  public Complex divi(float v, Complex result) {
    if (this == result) {
      r /= v;
      i /= v;
    } 
    else {
      result.r = r / v;
      result.i = i / v;
    }
    return this;
  }

  public Complex divi(float v) {
    return divi(v, this);
  }

  public Complex div(float v) {
    return dup().divi(v);
  }

  /** Return the absolute value */
  public float abs() {
    return  processing.core.PApplet.sqrt(r * r + i * i);
  }

  /** Returns the argument of a complex number. */
  public float arg() {
    return processing.core.PApplet.atan2(r, i);
  }

  public Complex invi() {
    float d = r * r + i * i;
    r = r / d;
    i = -i / d;
    return this;
  }

  public Complex inv() {
    return dup().invi();
  }

  public Complex neg() {
    return dup().negi();
  }

  public Complex negi() {
    r = -r;
    i = -i;
    return this;
  }

  public Complex conji() {
    i = -i;
    return this;
  }

  public Complex conj() {
    return dup().conji();
  }

  public Complex sqrt() {
    float a = abs();
    float s2 = processing.core.PApplet.sqrt(2);
    float p = processing.core.PApplet.sqrt(a + r)/s2;
    float sgn = Math.signum(i);
    if (sgn == 0.0f) {
      sgn = 1.0f;
    }
    float q = processing.core.PApplet.sqrt(a - r)/s2 * Math.signum(sgn);
    return new Complex(p, q);
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
    return processing.core.PApplet.abs(r - c.r) + processing.core.PApplet.abs(i - c.i) < (float) 1e-6;
  }

  public boolean ne(Complex c) {
    return !eq(c);
  }

  public boolean isZero() {
    return r == 0.0f && i == 0.0f;
  }

  public boolean isReal() {
    return i == 0.0f;
  }

  public boolean isImag() {
    return r == 0.0f;
  }
}

