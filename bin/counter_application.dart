import 'dart:io';

void main(List<String> arguments) {
  String? tempInput;
  int choice;
  int operationValue;
  bool stop = false;
  LBSIMCounter lbsimCounter;

  print('Please enter user name');
  tempInput = stdin.readLineSync();

  if (tempInput != null && tempInput.isNotEmpty) {
    lbsimCounter = LBSIMCounter(
      userName: tempInput,
      count: 100,
    );
  } else {
    return;
  }
  while (!stop) {
    print('Enter operational value');
    tempInput = stdin.readLineSync();

    if (tempInput != null && tempInput.isNotEmpty) {
      // print('tempInput is : $tempInput');
      operationValue = int.parse(tempInput);
    } else {
      operationValue = 0;
    }

    print('''
   \n List of functions
    0. Print value
    1. Increment
    2. Decrement
    3. Multiply 
    4. Divide
    5. Remainder
    6. Change User Name
    7. Stop the operation
  ''');

    print('Enter your choice');
    tempInput = stdin.readLineSync();
    if (tempInput != null && tempInput.isNotEmpty) {
      choice = int.parse(tempInput);
    } else {
      choice = -1;
    }
    print('starting counter with value: ${lbsimCounter.count}');
    switch (choice) {
      case 0:
        print('The value of count is ${lbsimCounter.count}');
        break;
      case 1:
        incrementCounter(counter: lbsimCounter, incrementValue: operationValue);
        break;
      case 2:
        decrementCounter(counter: lbsimCounter, decrementValue: operationValue);
        break;
      case 3:
        multiply(counter: lbsimCounter, anotherValue: operationValue);
        break;
      case 4:
        divide(counter: lbsimCounter, anotherValue: operationValue);
        break;
      case 5:
        remainder(counter: lbsimCounter, anotherValue: operationValue);
        break;
      case 6:
        changeUserName(counter: lbsimCounter);
        break;
      case 7:
        stop = true;
        break;
      default:
        print('Wrong Input');
    }
    print('Another Value: $operationValue');
    print(
        'Current value of count is ${lbsimCounter.count} by ${lbsimCounter.userName}');
  }
  print(
      '\nFinal value of count is ${lbsimCounter.count} ${lbsimCounter.userName}');
}

void changeUserName({required LBSIMCounter counter}) {
  print('Enter New User');
  String? tempInput = stdin.readLineSync();
  if (tempInput != null && tempInput.isNotEmpty) {
    print('New user is :$tempInput');
    counter.userName = tempInput;
  }
}

void incrementCounter(
    {required LBSIMCounter counter, required int incrementValue}) {
  counter.count = counter.count + incrementValue;
}

void decrementCounter(
    {required LBSIMCounter counter, required int decrementValue}) {
  counter.count = counter.count - decrementValue;
}

void multiply({required LBSIMCounter counter, required int anotherValue}) {
  counter.count = counter.count * anotherValue;
}

void divide({required LBSIMCounter counter, required int anotherValue}) {
  counter.count = (counter.count / anotherValue).floor();
}

void remainder({required LBSIMCounter counter, required int anotherValue}) {
  counter.count = counter.count % anotherValue;
}

class LBSIMCounter {
  int count;
  String userName;

  LBSIMCounter({required this.count, required this.userName});
}
