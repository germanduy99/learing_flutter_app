import 'package:englishapp/values/app_assets.dart';
import 'package:englishapp/values/app_colors.dart';
import 'package:englishapp/values/app_styles.dart';
import 'package:englishapp/values/share_key.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ControlPage extends StatefulWidget {
  const ControlPage({Key? key}) : super(key: key);

  @override
  State<ControlPage> createState() => _ControlPageState();
}

class _ControlPageState extends State<ControlPage> {

  double sliderValue =5;
  late SharedPreferences prefs ;

  @override
  void initState() {
    super.initState();
    initDefaultValue();
  }

  initDefaultValue() async{
    prefs = await SharedPreferences.getInstance();
    int value = prefs.getInt(ShareKey.counter)??5;
    setState(() {
      sliderValue = value.toDouble();
    });

  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Appcolors.secondColor,
      appBar: AppBar(
        backgroundColor: Appcolors.secondColor,
        elevation: 0,
        title: Text(
          'Your control',
          style:
          AppStyles.h3.copyWith(color: Appcolors.textColor, fontSize: 36),
        ),
        leading: InkWell(
          onTap: () async{
            final SharedPreferences prefs = await SharedPreferences.getInstance();
            await prefs.setInt(ShareKey.counter, sliderValue.toInt());
          Navigator.pop(context);
          },
          child: Image.asset(AppAssets.leftArrow),
        ),
      ),
      body: Container(
        width: double.infinity,
        child: Column(
          children: [
            Spacer(),
            Text('How much a number word at one',style: AppStyles.h4.copyWith(color: Appcolors.lightGrey, fontSize: 18),),
            Spacer(),
            Text('${sliderValue.toInt()}',style: AppStyles.h1.copyWith(color: Appcolors.primaryColor, fontSize: 150,fontWeight: FontWeight.bold),),
            Spacer(),
            Slider(
                value: sliderValue,
                min: 5,
                max: 100,
                divisions: 95,
                activeColor: Appcolors.primaryColor,
                inactiveColor: Appcolors.primaryColor,
                onChanged: (value){
              print(value);
              setState(() {
                sliderValue =value;
              });
            }),
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 32),
              alignment: Alignment.centerLeft,
                child: Text('Slide to set',style: AppStyles.h5.copyWith(color: Appcolors.textColor,),)),
            Spacer(),
            Spacer(),
            Spacer(),
          ],
        ),
      ),
    );
  }
}
