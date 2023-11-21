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

  @override
  Future<bool> signIn() async {
    return true;
  }
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
  late CommonController mock;

  setUp(() {
    mock = MockCommonController();
    Get.put<CommonController>(mock);
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
  testWidgets('Verify tab switching', (WidgetTester tester) async {
    // Create the widget by telling the tester to build it.
    await tester.pumpWidget(createAuthDialog());

    await tester.tap(find.text('Create Account'));

    await tester.pump(const Duration(milliseconds: 300));
    await tester.pumpAndSettle();

    expect(find.text(CommonStrings.welcome), findsNothing);
    expect(find.text(CommonStrings.logoutSal), findsOneWidget);
  });

  testWidgets('Verify email and password input fields',
      (WidgetTester tester) async {
    // Create the widget by telling the tester to build it.
    await tester.pumpWidget(createAuthDialog());

    // Find the email and password input fields
    final emailTextFieldFinder = find.byWidgetPredicate(
      (Widget widget) =>
          widget is TextField &&
          widget.decoration is InputDecoration &&
          (widget.decoration as InputDecoration).hintText ==
              CommonStrings.email,
    );
    final passwordTextFieldFinder = find.byWidgetPredicate(
      (Widget widget) =>
          widget is TextField &&
          widget.decoration is InputDecoration &&
          (widget.decoration as InputDecoration).hintText ==
              CommonStrings.password,
    );

    // Verify that the email and password input fields are initially empty
    expect(tester.widget<TextField>(emailTextFieldFinder).controller!.text, '');
    expect(
        tester.widget<TextField>(passwordTextFieldFinder).controller!.text, '');

    // Enter text in the email and password input fields
    await tester.enterText(emailTextFieldFinder, 'emailtester@test.com');
    await tester.enterText(passwordTextFieldFinder, 'passwordTester.com');

    // Verify that the email and password input fields contain the entered text
    expect(tester.widget<TextField>(emailTextFieldFinder).controller!.text,
        'emailtester@test.com');
    expect(tester.widget<TextField>(passwordTextFieldFinder).controller!.text,
        'passwordTester.com');
  });

  testWidgets('Verify login form', (WidgetTester tester) async {
    //Arrange
    // when(mock.signIn()).thenAnswer((_) async => true);

    // Create the widget by telling the tester to build it.
    await tester.pumpWidget(createAuthDialog(commonController: mock));

    // Verify that the login tab is selected by default
    expect(find.widgetWithText(Tab, 'Log in'), findsOneWidget);

    // Find the email and password input fields
    final emailTextFieldFinder = find.byWidgetPredicate(
      (Widget widget) =>
          widget is TextField &&
          widget.decoration is InputDecoration &&
          (widget.decoration as InputDecoration).hintText ==
              CommonStrings.email,
    );
    final passwordTextFieldFinder = find.byWidgetPredicate(
      (Widget widget) =>
          widget is TextField &&
          widget.decoration is InputDecoration &&
          (widget.decoration as InputDecoration).hintText ==
              CommonStrings.password,
    );

    // Verify that the email and password input fields are initially empty
    expect(tester.widget<TextField>(emailTextFieldFinder).controller!.text, '');
    expect(
        tester.widget<TextField>(passwordTextFieldFinder).controller!.text, '');

    // Enter text in the email and password input fields
    await tester.enterText(emailTextFieldFinder, 'emailtester@test.com');
    await tester.pumpAndSettle();

    await tester.enterText(passwordTextFieldFinder, 'passwordTester.com');
    await tester.pumpAndSettle();

    // Verify that the email and password input fields contain the entered text
    expect(tester.widget<TextField>(emailTextFieldFinder).controller!.text,
        'emailtester@test.com');
    expect(tester.widget<TextField>(passwordTextFieldFinder).controller!.text,
        'passwordTester.com');

    final loginButtonFinder = find.byKey(const Key('AuthButton true'));
    // Scroll to the bottom
    await tester.ensureVisible(loginButtonFinder);
    await tester.pump();

    //Verify the Login button is visible
    expect(loginButtonFinder, findsOneWidget);

    // Tap the login button
    await tester.tap(loginButtonFinder);
    await tester.pumpAndSettle();

    // Verify that the signIn method is called
    verify(mock.signIn()).called(1);
  });
}
