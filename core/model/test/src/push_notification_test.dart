import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:model/model.dart';

import 'push_notification_test.mocks.dart';

void main() {
  late PushNotification pushNotification;

  setUp(() {
    pushNotification = MockPushNotification();
  });

  test('should be able to initialize, modify and access data, [Setters]', () {
    //Arrange: Initialize and Access
    pushNotification.title = 'Advertising';
    pushNotification.body = 'What should I advertise next?';
    // Assert
    verify(pushNotification.title = 'Advertising');
    verify(pushNotification.body = 'What should I advertise next?');

    //Arrange: Modify & Access
    pushNotification.title = 'New Title';
    pushNotification.body = 'Modified Body';
    // Assert
    verify(pushNotification.title = 'New Title');
    verify(pushNotification.body = 'Modified Body');
  });
}
