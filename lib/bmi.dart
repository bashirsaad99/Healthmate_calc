import 'dart:math';
class Bmi{

  double weight;
  double height;
  double waist;
  double neck;

  Bmi(this.weight, this.height, this.waist, this.neck);

  @override
  String toString() {
    // TODO: implement toString
    return 'BMI = $weight';

  }

  String getTotalBMI(){
    height/=100;
    return (weight/(height*height)).toStringAsFixed(2);
  }

  String getTotalBFP(){
    return ( (86.010 * log(waist - neck)) - (70.041 * log(height) )+ 36.76).toStringAsFixed(2);
  }


}