import 'package:flutter_test/flutter_test.dart';

void main() {
  test('TODO: Implement tests for register_usecase.dart', () {
    String fullName = '';

    StringUtils stringUtils = StringUtils();
   var actual= stringUtils.extractFirstName(fullName);
   expect(actual, ' ');

  });
}

class StringUtils{
  String extractFirstName(String fullName){
    return fullName.split(' ')[0];
  }
  String extractLastName(String fullName){
    return fullName.split(' ')[1];
  }
}