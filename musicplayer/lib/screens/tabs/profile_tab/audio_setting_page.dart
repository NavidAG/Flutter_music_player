import 'package:flutter/material.dart';

import '../../../models/car_mode_radio_model.dart';
import '../../../widgets/car_mode_radio.dart';

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
    carModelRadios[1].isSelected = true;
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
          child: ListView(
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
              Expanded(
                child: GridView.builder(
                  itemCount: 3,
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 3, childAspectRatio: 3),
                  padding: EdgeInsets.symmetric(horizontal: 30, vertical: 10),
                  scrollDirection: Axis.vertical,
                  shrinkWrap: true,
                  physics: NeverScrollableScrollPhysics(),
                  itemBuilder: (_, index) {
                    return GestureDetector(
                      child: CarModeRadio(carModelRadios[index]),
                      onTap: () {
                        setState(() {
                          carModelRadios.forEach(
                            (element) => element.isSelected = false,
                          );
                          carModelRadios[index].toggle();
                        });
                      },
                    );
                  },
                ),
              ),
              _customDivider(),
              Container(
                padding: EdgeInsets.symmetric(horizontal: 10),
                child: ListTile(
                  leading: Icon(Icons.equalizer_rounded),
                  title: Text(
                    "Equalizer",
                    style: TextStyle(fontWeight: FontWeight.w600, fontSize: 18),
                  ),
                ),
              ),
              _customDivider(),
              Padding(
                padding: const EdgeInsets.all(20),
                child: Text(
                  "Connect to a device",
                  style: TextStyle(fontWeight: FontWeight.w600, fontSize: 18),
                ),
              ),
              Container(
                height: 70,
                margin: EdgeInsets.fromLTRB(20, 0, 20, 10),
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    elevation: 0,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20)),
                    primary: Colors.white.withOpacity(0.2),
                    shadowColor: Colors.transparent,
                  ),
                  onPressed: () {},
                  child: ListTile(
                    contentPadding: EdgeInsets.zero,
                    leading: Icon(Icons.phone_iphone_outlined),
                    title: Text(
                      "This Android",
                      style:
                          TextStyle(fontWeight: FontWeight.w500, fontSize: 18),
                    ),
                    trailing: Icon(Icons.check),
                  ),
                ),
              ),
              _customDivider(),
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                child: ListTile(
                  trailing: Icon(Icons.chevron_right),
                  title: Text("Listen on your computer"),
                ),
              ),
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                child: ListTile(
                  trailing: Icon(Icons.chevron_right),
                  title: Text("Listen on another phone"),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  _customDivider() {
    return Container(
      height: 0.5,
      margin: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      decoration: BoxDecoration(
        color: Colors.red,
        gradient: LinearGradient(
          begin: Alignment.centerLeft,
          end: Alignment.centerRight,
          colors: [
            Colors.white.withOpacity(0),
            Colors.white.withOpacity(1),
            Colors.white.withOpacity(0),
          ],
        ),
      ),
    );
  }
}
