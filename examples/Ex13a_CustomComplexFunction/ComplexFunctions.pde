class Prueba implements ComplexFunction{
  /* Parametros de la funcion */
  Complex alpha;
  float theta;
  MobiusTransform f;
  MobiusTransform g;
  ComplexCircle d;
  /* constructor */
  Prueba(Complex alphaa,float thetaa,MobiusTransform ff, MobiusTransform gg,ComplexCircle dd){
  alpha=alphaa.dup();
  theta=thetaa;
  f=ff.dup();
  g=gg.dup();
  d=dd.dup();
  }
  
  Complex map(Complex z){
    return this.mapi(z.dup());
  }
  /* Aqui definimos la funcion */
  Complex mapi(Complex z){
    
    if(d.isInside(z)){
      z=g.map(z);
    }
    else {
      z=f.map(z);
    }

    return z;
  }
  
}