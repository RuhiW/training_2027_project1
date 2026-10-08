
import 'dart:io';

String askForString(String prompt) {
  stdout.write(prompt);
  return stdin.readLineSync() ?? '';
}
double askForDouble(String prompt) {
  while (true) {
    try {
      String rawInput = askForString(prompt);
      return double.parse(rawInput);
    } catch (e) {
      print('Please enter a number');
    }
  }
}
bool askForBool(String prompt) {
  while (true) {
    try {
      String rawInput = askForString(prompt);
      return bool.parse(rawInput);
    } catch (e) {
      print('Please enter a number');
    }
  }
}
int askForInt(String prompt) {
  while (true) {
    try {
      String rawInput = askForString(prompt);
      return int.parse(rawInput);
    } catch (e) {
      print('Please enter a number');
    }
  }
}