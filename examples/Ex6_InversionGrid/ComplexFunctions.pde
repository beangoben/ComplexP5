class Inversion implements ComplexFunction{

  Inversion(){}
  
  Complex mapi(Complex z){
    return z.invi();
  }
  
  Complex map(Complex z){
    return this.mapi(z.dup());
  }
  
}

