import 'package:flutter/material.dart';
import 'home.dart';
import 'bmi.dart';
class bmiPage extends StatefulWidget {
  const bmiPage({super.key});

  @override
  State<bmiPage> createState() => _bmiPageState();
}

class _bmiPageState extends State<bmiPage> {

  double _weight=-1;
  double _height=-1;
  double _waist=-1;
  double _neck=-1;

  String _text="";
  String _state="";
  String _fat="";

  Bmi _bmi = Bmi(0, 0,0,0);
  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        title: const Text("BCS"),
        backgroundColor: Colors.green,
      ),

      body: Center( child: Column(
        // mainAxisAlignment: MainAxisAlignment.center,
        children:[
            SizedBox( height: 7.5,),
            const Text("BMI and Fat Percentage", style: TextStyle(fontSize: 30),),
            SizedBox( height: 25.0,),
            MyTextField(f: updateWeight, hint: 'Enter Weight in Kg',),
            SizedBox( height: 15.0,),
            MyTextField(f:updateHeight, hint:"Enter Height in Cm",),
            SizedBox( height: 15.0,),
            MyTextField(f:updateWaist, hint:"Enter Waist Perimeter in Cm",),
            SizedBox( height: 15.0,),
            MyTextField(f:updateNeck, hint:"Enter Neck Perimeter in Cm",),

          const SizedBox(height: 20.0,),
          ElevatedButton(onPressed: () {validate();}, child: Text('Calculate', style: TextStyle(fontSize: 24.0),)),
          const SizedBox(height: 40.0,),
          Text('$_text', style: const TextStyle(fontSize: 18.0)),
          const SizedBox(height: 20.0,),
         Text('$_state', style: const TextStyle(fontSize: 18.0),),

         /// ////////////// add here the state of the result //////////////////////////////
          const SizedBox(height: 40.0,),
          Text('$_fat', style: const TextStyle(fontSize: 18.0)),
          const SizedBox(height: 100.0,),
          ElevatedButton(
              onPressed: (){
                Navigator.of(context).pop(

                );
              },
              child: const Icon(Icons.navigate_before, size:60))

          ],
      ),),
    );
  }//build

  void validate(){
    if(_height==-1 || _weight==-1 || _waist==-1 || _neck==-1){
      setState(() {
        _text= 'Please fill all fields';
        _state="";
        _fat="";
      });

    }else{
      updateBmi();
      updateState();
      updateBFP();
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
  void updateHeight(String height){
    if (height.trim()==''){
      _height=-1;
    }
    else
    {
      _height=double.parse(height);
    }
  }
  void updateWaist(String waist){
    if (waist.trim()==''){
      _waist=-1;
    }
    else
    {
      _waist=double.parse(waist);
    }
  }
  void updateNeck(String neck){
    if (neck.trim()==''){
      _neck=-1;
    }
    else
    {
      _neck=double.parse(neck);
    }
  }
  void updateBmi(){
    _bmi = Bmi(_weight, _height, _waist,_neck);
    String bmiResult = _bmi.getTotalBMI();
    setState(() {
      if(_weight==-1 || _height==-1){
        _text= 'Please fill all fields';
      }else {
        _text = 'Body Mass Index: $bmiResult';
      }
    });

  }
  void updateState(){
    _bmi = Bmi(_weight, _height, _waist,_neck);
    double Total= double.parse(_bmi.getTotalBMI());
    String s="";
    if(Total<18.5){ s='You are underweight.';}else if(Total>=18.5 && Total<25){s='Your weight is within the normal range.'; }else if(Total>=25 && Total<30){s='You are overweight. Go to a dietitian.';}else if(Total>=30){s='You are in the obesity range. Get some help!';}
    setState(() {
      _state=' $s ';
    });
  }
  void updateBFP(){
    _bmi = Bmi(_weight, _height, _waist,_neck);
    String bfpResult= _bmi.getTotalBFP();
    setState(() {
      _fat= 'Your Body Fat Percentage: $bfpResult %';
    });

    ///
  }
} // state


class MyTextField extends StatelessWidget{
  Function(String) f;
  String hint;

  MyTextField({required this.hint, required this.f, super.key,});

  @override
  Widget build(BuildContext context){
    return SizedBox(width: 300.0, height:50.0,
      child: TextField(
        style: const TextStyle(fontSize: 18.0),
        keyboardType: TextInputType.number,
        decoration:  InputDecoration(
            border: const OutlineInputBorder(),hintText: hint

        ),
        onChanged: (text){f(text);},
      ),
    );
  }
}

