class CarModeRadioModel {
  bool isSelected = false;
  String? text;

  CarModeRadioModel(this.text);

  void toggle() => isSelected = !isSelected;
}
