class Activity{

  String name;
  double value;

  Activity(this.name, this.value);

    @override
    String toString(){
      return' $name $value';
    }

}
List<Activity> activities=[
  Activity('Confined to Bed', 1.2),
  Activity('Low Activity', 1.3),
  Activity('Average Activity', 1.6),
  Activity('Highly Active', 2.0),
];