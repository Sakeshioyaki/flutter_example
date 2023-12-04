import 'dart:async';
import 'dart:math';

import 'package:flutter_example/stream/stream_state.dart';

class MyStreamController {
  int counter = 0;
  UserModal user = UserModal(name: 'Anh1', age: 24, email: 'abc@gmail.com');
  StreamController<int> counterController = StreamController<int>.broadcast();
  StreamController<UserModal> userController = StreamController<UserModal>.broadcast();
  Stream<int> get counterStream => counterController.stream;
  Stream<UserModal> get userStream => userController.stream;
  Stream<int> get countStreamSub => countStream();

  // var counterTranformer = StreamTransformer<int, int>.fromHandlers(handleData: (data, sink) {
  //   data += 5;
  //   sink.add(data);
  // });


  Stream<int> countStream() async* {
    for (int i = 1; i <= 10; i++) {
      await Future.delayed(const Duration(seconds: 1));
      yield i;
    }
  }

  void increment() {
    counter += 1;
    counterController.sink.add(counter);
    // counterController.add(counter);
  }

  void changeName() {
    var tmp = Random().nextInt(100);
    var newUser = UserModal(
      name: '${user.name}$tmp',
      age: user.age,
      email: user.email,
    );
    user = newUser;
    userController.sink.add(user);
  }

  void dispose() {
    counterController.close();
    userController.close();
  }
}
