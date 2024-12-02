class Ideal{
  double height;
  int gender=1;

  Ideal(this.height,this.gender);



  String getIdealWeight(){
    if (gender==1){
      return (50+( 0.91 * (height - 152.4))).toStringAsFixed(2);
    }
    else if(gender ==0){
      return (45.5+( 0.91 * (height - 152.4))).toStringAsFixed(2);
    }
    return "choose a gender";

  }
}