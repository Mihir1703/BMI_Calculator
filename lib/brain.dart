class CalculateBMI{
  CalculateBMI({required this.weight,required this.height});
  final double height;
  final double weight;
  late double _bmi;

  String getBMI(){
    _bmi = 1e4*weight/(height*height);
    return _bmi.toStringAsFixed(2);
  }
  String getShortDescription(){
    getBMI();
    if(_bmi >= 25){
      return 'Overweight';
    }else if(_bmi >= 18.5){
      return 'Normal';
    }else{
      return 'Underweight';
    }
  }
  String getDescription(){
    getBMI();
    if(_bmi >= 25){
      return 'You have higher body weight than normal, try to exercise more';
    }else if(_bmi >= 18.5){
      return 'You have maintained well, Good Job!';
    }else{
      return 'You have lower body weight than normal, try to increase your appetite';
    }
  }
}