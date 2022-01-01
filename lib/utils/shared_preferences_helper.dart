import 'package:aman_task/utils/string_constants.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SharedPreferencesHelper {
  static final SharedPreferencesHelper _sharedPreferencesHelper = SharedPreferencesHelper._privateConstructor();
  factory SharedPreferencesHelper(){
    return _sharedPreferencesHelper;
  }
  SharedPreferencesHelper._privateConstructor();


  // Form Field Check

  Future<bool> isFormFilled() async {
    bool isFormField = false;
    SharedPreferences _sharedPreferences = await SharedPreferences.getInstance();
    isFormField = _sharedPreferences.getBool(sharedPreferencesKeyIsFormField) ?? false;
    return isFormField;
  }

  setFormFilled(bool isFormField) async{
    SharedPreferences _sharedPreferences = await SharedPreferences.getInstance();
    _sharedPreferences.setBool(sharedPreferencesKeyIsFormField, isFormField);
  }

}
