class Negative implements ComplexFunction{
  Negative(){} 
  Complex mapi(Complex z){
    return z.negi();
  }
  Complex map(Complex z){
    return this.mapi(z.dup());
  } 
}

class Conjugate implements ComplexFunction{
  Conjugate(){} 
  Complex mapi(Complex z){
    return z.conji();
  }
  Complex map(Complex z){
    return this.mapi(z.dup());
  } 
}

class ConjuNeg implements ComplexFunction{
  ConjuNeg(){} 
  Complex mapi(Complex z){
    return z.conji().negi();
  }
  Complex map(Complex z){
    return this.mapi(z.dup());
  } 
}

class Inversion implements ComplexFunction{
  Inversion(){}  
  Complex mapi(Complex z){
    return z.invi();
  }
  Complex map(Complex z){
    return this.mapi(z.dup());
  }
}

class InvNegative implements ComplexFunction{
  InvNegative(){} 
  Complex mapi(Complex z){
    return z.invi().negi();
  }
  Complex map(Complex z){
    return this.mapi(z.dup());
  } 
}

class InvConjugate implements ComplexFunction{
  InvConjugate(){} 
  Complex mapi(Complex z){
    return z.invi().conji();
  }
  Complex map(Complex z){
    return this.mapi(z.dup());
  } 
}

class InvConjuNeg implements ComplexFunction{
  InvConjuNeg(){} 
  Complex mapi(Complex z){
    return z.invi().conji().negi();
  }
  Complex map(Complex z){
    return this.mapi(z.dup());
  } 
}