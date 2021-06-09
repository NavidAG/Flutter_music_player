import 'package:flutter/material.dart';
import 'package:musicplayer/models/car_mode_radio_model.dart';

class AudioSettingPage extends StatefulWidget {
  const AudioSettingPage({Key? key}) : super(key: key);

  @override
  _AudioSettingPageState createState() => _AudioSettingPageState();
}

class _AudioSettingPageState extends State<AudioSettingPage> {
  double volumeSliderValue = 30;

  List<CarModeRadioModel> carModelRadios = [];

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    carModelRadios.add(new CarModeRadioModel('On'));
    carModelRadios.add(new CarModeRadioModel('Off'));
    carModelRadios.add(new CarModeRadioModel('Auto'));
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          gradient: LinearGradient(
        begin: Alignment.topCenter,
        end: Alignment.bottomCenter,
        colors: [
          Color.fromRGBO(1, 200, 239, 1),
          Color.fromRGBO(17, 17, 17, 1),
        ],
      )),
      child: Scaffold(
        appBar: AppBar(
          centerTitle: false,
          title: Text("Audio Settings"),
          elevation: 0,
          backgroundColor: Colors.transparent,
        ),
        backgroundColor: Colors.transparent,
        body: Container(
          child: Column(
            children: [
              Container(
                child: Row(
                  children: [
                    Container(
                      margin: EdgeInsets.only(left: 20),
                      child: Icon(Icons.volume_mute_outlined),
                    ),
                    Expanded(
                      child: Slider(
                        activeColor: Colors.white,
                        inactiveColor: Colors.white.withOpacity(0.4),
                        min: 0,
                        max: 100,
                        value: volumeSliderValue,
                        onChanged: (value) {
                          setState(() {
                            volumeSliderValue = value;
                          });
                        },
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.only(right: 20),
                      child: Icon(Icons.volume_up),
                    ),
                  ],
                ),
              ),
              _customDivider(),
              Container(
                padding: EdgeInsets.symmetric(horizontal: 10),
                child: ListTile(
                  leading: Icon(Icons.car_rental),
                  title: Text(
                    "Car Mode",
                    style: TextStyle(fontWeight: FontWeight.w600, fontSize: 18),
                  ),
                ),
              ),
              // Container(child: Row(children: [],),)
            ],
          ),
        ),
      ),
    );
  }

  _customDivider() {
    return Container(
      height: 0.5,
      margin: EdgeInsets.symmetric(horizontal: 20, vertical: 20),
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.centerLeft,
          end: Alignment.centerRight,
          colors: [
            Color.fromRGBO(96, 169, 199, 1),
            Colors.white,
            Color.fromRGBO(96, 169, 199, 1),
          ],
        ),
      ),
    );
  }
}
