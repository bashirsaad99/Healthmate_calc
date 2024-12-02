import 'activity.dart';
class Ten{
  double height;
  double weight;
  double age;
  int gender=1;
  Activity activity=activities.first;

    Ten(this.height, this.weight, this.age, this.gender, this.activity);
    double getBEE(){
      if(gender==1){
        return (10 * weight) + (6.25 * height) - (5 * age) + 5;
      }
      else if(gender==0){
        return (10 * weight) + (6.25 * height) - (5 * age) - 161;
      }
      return 0;

    }

    String getTEN(){
      return  (activity.value * getBEE() ).toStringAsFixed(2);
    }
}
