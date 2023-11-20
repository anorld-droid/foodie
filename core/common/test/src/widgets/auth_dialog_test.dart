import 'package:common/src/controller/controller.dart';
import 'package:common/src/strings.dart';
import 'package:common/src/widgets/auth_dialog.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:get/get.dart';
import 'package:mockito/mockito.dart';

//Set up
class MockCommonController extends GetxController
    with Mock, GetTickerProviderStateMixin
    implements CommonController {
  MockCommonController() {
    mockTabController = TabController(
      length: 2,
      vsync: this,
    );
  }
  TabController? mockTabController;
  @override
  TabController get tabController => mockTabController!;
  @override
  TextEditingController get emailController => TextEditingController();
  @override
  TextEditingController get passwordController => TextEditingController();

  @override
  TextEditingController get phoneController => TextEditingController();
  @override
  Rx<bool> get searching => Rx(false);
}

// ignore: avoid_init_to_null
Widget createAuthDialog({CommonController? commonController = null}) =>
    GetMaterialApp(
        home: GetBuilder<CommonController>(
            init: commonController ?? MockCommonController(),
            builder: (_) {
              return const AuthDialog();
            }));

void main() {
  late final mock;

  setUp(() {
    Get.put<CommonController>(MockCommonController());
    mock = Get.find<CommonController>();
  });

  testWidgets(
    'auth dialog should show up with the default tab being Log in',
    (tester) async {
      // Create the widget by telling the tester to build it.
      await tester.pumpWidget(createAuthDialog());

      //Repeatedly calls pump() with the given duration
      //until there are no longer any frames scheduled.
      //This, essentially, waits for all animations to complete.
      await tester.pumpAndSettle();

      expect(find.widgetWithText(Tab, 'Log in'), findsOneWidget);
      expect(find.text(CommonStrings.welcome), findsOneWidget);

      expect(find.text('Terms of Service'), findsNothing);
    },
  );
  testWidgets('Switch between tabs', (WidgetTester tester) async {
    // Create the widget by telling the tester to build it.
    await tester.pumpWidget(createAuthDialog());

    await tester.tap(find.text('Create Account'));

    await tester.pump(const Duration(milliseconds: 300));
    await tester.pumpAndSettle();

    expect(find.text(CommonStrings.welcome), findsNothing);
    expect(find.text(CommonStrings.logoutSal), findsOneWidget);
  });

  testWidgets('Login Form Test', (WidgetTester tester) async {
    //Arrange

    when(mock.sign()).thenAnswer((_) => Future.value(true));

    // Create the widget by telling the tester to build it.
    await tester.pumpWidget(createAuthDialog());

    // Simulate user input in the login form
    final emailTextFieldFiender = find.byWidgetPredicate(
      (Widget widget) {
        return widget is TextField &&
            widget.decoration is InputDecoration &&
            (widget.decoration as InputDecoration).hintText ==
                CommonStrings.email;
      },
    );
    final passwordTextFieldFiender = find.byWidgetPredicate(
      (Widget widget) {
        return widget is TextField &&
            widget.decoration is InputDecoration &&
            (widget.decoration as InputDecoration).hintText ==
                CommonStrings.password;
      },
    );
    await tester.enterText(emailTextFieldFiender, 'emailtester@test.com');
    await tester.enterText(passwordTextFieldFiender, 'passwordTester.com');

    // Scroll to the bottom
    // await tester.fling(
    //   find.byType(SingleChildScrollView),
    //   const Offset(0, -200),
    //   3000,
    // );
    await tester.dragUntilVisible(
      find.byType(SingleChildScrollView),
      find.byKey(const Key(
          'AuthButtonText')), // Replace with the actual type of your scrollable content
      const Offset(
          0, 200), // Adjust the offset as needed for your scroll distance
    );
    await tester.pumpAndSettle();
    // Verify that the bottom is visible
    expect(find.byKey(const Key('AuthButtonText')), findsOneWidget);

    // Tap on the submit button
    await tester.tap(find.byKey(const Key('AuthButtonText')));
    await tester.pumpAndSettle();
    // // Verify that the login method was called on the AuthService
    // verify(mock.sigIn()).called(1);
  });
}
