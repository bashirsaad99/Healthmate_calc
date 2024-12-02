import 'package:flutter/material.dart';
import 'home.dart';
import 'bmiPage.dart';
import 'ten.dart';
import 'activity.dart';


class tenPage extends StatefulWidget {
  const tenPage({super.key});

  @override
  State<tenPage> createState() => _tenPageState();
}

class _tenPageState extends State<tenPage> {
  double _height=-1;
  double _weight=-1;
  double _age=-1;
  String _text= "";
  Ten _ten= Ten(-1, -1, 0, 1, activities.first);




  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("TEN"),
        backgroundColor: Colors.redAccent,
      ),

      body: SingleChildScrollView( /*Center(*/ child: Column(
         children: [
            const Text("Total Energy Needs Per Day", style: TextStyle(fontSize: 30),),
            const SizedBox(height: 25.0),
            MyTextField(f:updateHeight, hint:"Enter Your Height in Cm",),
            SizedBox(height: 25.0),
            MyTextField(f:updateWeight, hint:"Enter Your Weight in Kg",),
            SizedBox(height: 25.0),
            MyTextField(f:updateAge, hint:"Enter Your Age",),
            SizedBox(height: 25.0),
            Gender(ten: _ten),
            SizedBox(height: 25.0),
            const Text("Activity Factor:", style: TextStyle(fontSize: 15),),
            SizedBox(height:15.0),
            MyDropdownMenu(updateActivity: updateActivity),
            SizedBox(height: 25.0),
            ElevatedButton(onPressed: () {validate();}, child: Text('Calculate', style: TextStyle(fontSize: 24.0),)),
            SizedBox(height: 25.0),
            Text('$_text ', style: const TextStyle(fontSize: 18.0)),
           const SizedBox(height: 130.0,),
           ElevatedButton(
               onPressed: (){
                 Navigator.of(context).pop(

                 );
               },
               child: const Icon(Icons.navigate_before, size:60))

          ],
      ),),
    );
  }// build
  void validate(){
      if(_height==-1 || _weight==-1 || _age==-1){
        setState(() {
          _text="Please enter all fields";
        });

      }
      else{
          updateTen();
      }

  }
  void updateHeight(String height){
    if (height.trim()==''){
      _height=-1;
    }
    else
    {
      _height=double.parse(height);
    }

  }
  void updateWeight(String weight){
    if (weight.trim()==''){
      _weight=-1;
    }
    else
    {
      _weight=double.parse(weight);
    }
  }
  void updateAge(String age){
    if(age.trim()==''){
      _age=-1;
    }
    else{
      _age=double.parse(age);
    }
  }
  void updateActivity(Activity activity){
    _ten.activity = Activity(_ten.activity.name, _ten.activity.value);

    setState(() {
      _ten.activity= activity;
      print(_ten.getBEE() );
      print(_ten.getTEN());
    });

  }
  void updateTen(){
    _ten=Ten(_height,_weight,_age,_ten.gender,_ten.activity);
    String tenResult= _ten.getTEN();
    setState(() {
      _text= 'Your body needs = $tenResult KCal/day';
    });
  }
}// state





/// /////////// G e n d e r   R a d i o   /////////////////////////////////
class Gender extends StatefulWidget {

  Ten ten;
  Gender({required this.ten, super.key});
  @override
  State<Gender> createState() => _GenderState();
}

class _GenderState extends State<Gender> {
  @override
  Widget build(BuildContext context) {
    return Row(mainAxisAlignment: MainAxisAlignment.center,children: [
      const Text('Gender', style: TextStyle(fontSize: 18.0),),
      ///male
      Radio(value: 1, groupValue: widget.ten.gender, onChanged:(val){
        setState(() {
          widget.ten.gender= val as int;

        });
      },),const Text('Male', style: TextStyle(fontSize: 18.0)),
      ///female
      Radio(value: 0, groupValue: widget.ten.gender, onChanged:(val){
        setState(() {
          widget.ten.gender= val as int;

        });
      },),const Text('Female', style: TextStyle(fontSize: 18.0)),

    ],);
  }



}

/// //////// S e l e c t  A c t i v i t y   /////////////////////////
class MyDropdownMenu extends StatelessWidget {
  final Function(Activity) updateActivity;
  const MyDropdownMenu({required this.updateActivity ,super.key});

  @override
  Widget build(BuildContext context) {
    return DropdownMenu(
        dropdownMenuEntries: activities.map<DropdownMenuEntry<Activity>>((Activity activity){
              return DropdownMenuEntry(value: activity, label: activity.toString());

        }).toList(),
      width:250.0,
      initialSelection:activities.first,
      onSelected:(Activity? activity){
          updateActivity(activity as Activity);

      },
    );
  }
}
