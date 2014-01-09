import complexP5.*;

/*
Basic Complex number tutorial
*/

/* 1) create Complex number */
// a = 2 + 4i
Complex a = new Complex(2.0, 4.0);
// b = 1 + 5i
Complex b = new Complex(1.0, 5.0);
// c = 1
Complex c = new Complex(1.0);
// another way of doing this is
c = Complex.ONE; // There is also ZERO and I

/* 2)  Modifying and accessing parts  */
float re = a.real(); //real part (2)
float im = a.imag(); //imaginary (4)
// Copy from another number, a=b
a.copy(b);
// Change number, a = 3+2i
a.set(3.0, 2.0);
// Duplicate a number , a=b
c = a.dup();
// Printing numbers
println("== Complex Numbers ==");
println("a = " + a);
println("b = " + b);

/* 3)  Operations */
//There are four basic operations:
println("== Basic Operations ==");
println("a-b = " + a.add(b) );
println("a+b = " + a.sub(b) );
println("a*b = " + a.mul(b) );
println("a/b = " + a.div(b) );
//Each operation has:
// A static method
Complex sum = Complex.add(a, b) ;
// a normal method
sum = a.add(b);
// and method to apply to itself, i.e. a+=b
//you just add "i" as in "in itself"
a.addi(b);

//reset a
a.set(3.0, 2.0);
/* 4)  More complex operations */
// Most operations also have "i" (in itself) type functions
println("== More Operations ==");
// Abs or modulus
println("|a| = " + a.abs() );
// Argument or phase
println("arg(a) = " + a.arg() );
// Negative
println("-a = " + a.neg() );
// Conjugate
println("ā = " + a.conj() );
// Inverse
println("a^-1 = " + a.inv() );
// Sqrt
println("√a = " + a.sqrt() );
// Exponentiation
println("exp(a)= e^a = " + a.exp() );
// Cos
println("cos(a) = " + a.cos() );
// Sin
println("sin(a) = " + a.sin() );
// Tan
println("tan(a) = " + a.tan() );
/* 5)  Boolean operations */
println("== Boolean Operations ==");
// Equality
println("a = b? " + a.eq(b));
// Non-equality
println("a ≠ b? " + a.neq(b));
// Zero?
println("a = 0? " + a.isZero());
// Olny a real number
println("imag(a) = 0? " + a.isReal());
// Olny an imaginary number
println("real(a) = 0? " + a.isImag());
