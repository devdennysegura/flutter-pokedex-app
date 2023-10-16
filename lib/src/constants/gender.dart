part of com.devdennysegura.pokedex.constants;

Map<String, String> genderCalculator(int femaleValue, int maleValue) {
  int sum = femaleValue + maleValue;
  return <String, String>{
    'male': '${(maleValue / sum) * 100}%',
    'female': '${(femaleValue / sum) * 100}%',
  };
}
