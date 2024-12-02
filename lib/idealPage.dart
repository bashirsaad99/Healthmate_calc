import 'package:flutter/material.dart';
import 'bmiPage.dart';
import 'ideal.dart';

class idealPage extends StatefulWidget {
  const idealPage({super.key});

  @override
  State<idealPage> createState() => _idealPageState();
}

class _idealPageState extends State<idealPage> {
  double _height=-1;
  String _text= "";
  Ideal _ideal= Ideal(0,1);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Ideal Body Weight"),
      ),

      body:   Center( child: Column(
        children:[

          SizedBox(height: 25.0,),
          Text("The Excellent Weight for your Body ", style: TextStyle(fontSize: 24),),
          SizedBox(height: 25.0),
          MyTextField(f:updateHeight, hint:"Enter Height in Cm",),
          SizedBox(height: 25.0),
          Gender(ideal:_ideal),
          SizedBox(height: 25.0),
          ElevatedButton(onPressed: () {validate();}, child: Text('Calculate', style: TextStyle(fontSize: 24.0),)),
          SizedBox(height: 25.0),
          Text('$_text ', style: const TextStyle(fontSize: 18.0)),
          const SizedBox(height: 50.0,),
          ElevatedButton(
              onPressed: (){
                Navigator.of(context).pop(

                );
              },
              child: const Icon(Icons.navigate_before, size:60))

        ],
      )),
    );

  } // build

    void validate(){
      if(_height==-1){
          setState(() {
            _text="Please enter your height";
          });
      }else{
          updateIdeal();
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
  void updateIdeal(){
    _ideal = Ideal(_height,_ideal.gender);
    String idealResult = _ideal.getIdealWeight();
    setState(() {
      _text = 'Your Ideal body Weight= $idealResult KG';
    });

  }
}


class Gender extends StatefulWidget {

  Ideal ideal;
   Gender({required this.ideal, super.key});
  @override
  State<Gender> createState() => _GenderState();
}

class _GenderState extends State<Gender> {
  @override
  Widget build(BuildContext context) {
    return Row(mainAxisAlignment: MainAxisAlignment.center,children: [
        const Text('Gender', style: TextStyle(fontSize: 18.0),),
      ///male
      Radio(value: 1, groupValue: widget.ideal.gender, onChanged:(val){
              setState(() {
                widget.ideal.gender= val as int;

              });
        },),const Text('Male', style: TextStyle(fontSize: 18.0)),
      ///female
      Radio(value: 0, groupValue: widget.ideal.gender, onChanged:(val){
        setState(() {
          widget.ideal.gender= val as int;

        });
      },),const Text('Female', style: TextStyle(fontSize: 18.0)),

    ],);
  }
}
