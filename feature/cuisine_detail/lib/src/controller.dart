import 'package:common/common.dart';
import 'package:cuisine_detail/src/widgets/log_in_dialog.dart';
import 'package:domain/domain.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:model/model.dart';

/// Created by Patrice Mulindi email(mulindipatrice00@gmail.com) on 16.01.2023.
class Controller extends GetxController with GetTickerProviderStateMixin {
  late final AuthenticateUser _authenticateUser;
  late final UserModelUseCase _userModelUseCase;
  late final CartItemsUseCase _cartItemsUseCase;

  late final TextEditingController quantityController;

  late final TabController tabController;

  late AnimationController animationController;

  late final TextEditingController emailController;
  late final TextEditingController passwordController;

  final Rx<bool> seeMore = false.obs;
  late final Rx<double> sellingPrice = 0.0.obs;
  final Rx<int> qty = 1.obs;

  var searching = false.obs;

  late OnboardingStatus _onboardingStatus;

  @override
  void onReady() {
    super.onReady();
    _authenticateUser = Get.find();
    _cartItemsUseCase = CartItemsUseCase();
    _userModelUseCase = UserModelUseCase();

    tabController = TabController(length: 2, vsync: this);

    emailController = TextEditingController();
    passwordController = TextEditingController();

    animationController =
        AnimationController(vsync: this, duration: const Duration(seconds: 1));
  }

  void incrementQty(double basicPrice) {
    qty.value++;
    sellingPrice.value = basicPrice * qty.value;
  }

  void decrementQty(double basicPrice) {
    if (qty.value > 1.0) {
      qty.value--;
      sellingPrice.value = basicPrice * qty.value;
    }
  }

  void resetSellingPrice() {
    sellingPrice.value = 0;
  }

  Future<void> addToCart(CuisineItem cuisineItem) async {
    if (_authenticateUser.isUserSignedIn()) {
      _cartItemsUseCase.upload(
        docPath: _authenticateUser.getUserId()!,
        cartItem: cuisineItem.asCartItem(qty.value),
      );
      shortToast('Added to cart');
    } else {
      await showAuthDialog(Get.context!);
      addToCart(cuisineItem);
    }
  }

  Future<void> showAuthDialog(BuildContext context) async {
    showDialog<Widget>(
        context: context,
        barrierDismissible: false,
        barrierLabel:
            MaterialLocalizations.of(context).modalBarrierDismissLabel,
        barrierColor: Colors.black87,
        builder: (BuildContext buildContext) {
          return const AuthDialog();
        });
  }

  Future<void> sigIn() async {
    searching.value = true;
    animationController.repeat();
    String message = '';
    final authInputs = await validInputs();
    if (authInputs.isNotEmpty) {
      message = await _authenticateUser.signInWithEmailPassword(
          emailAddress: authInputs['email']!,
          password: authInputs['password']!);
      shortToast(message);
    }
    if (message.isNotEmpty) {
      shortToast(message);
    }
    searching.value = false;
    animationController.reset();
  }

  Future<void> createAccount() async {
    searching.value = true;
    animationController.repeat();
    var message = '';
    final authInputs = await validInputs();
    if (authInputs.isNotEmpty) {
      message = await _authenticateUser.createAccount(
          emailAddress: authInputs['email']!,
          password: authInputs['password']!);
      if (message == 'Account created successfully') {
        await _uploadUserInfo(_authenticateUser.getUserName() ?? 'Anonymous');
        await _onboardingStatus.update(true);
      }
    }
    if (message.isNotEmpty) {
      shortToast(message);
    }
    searching.value = false;
    animationController.reset();
  }

  Future<void> _uploadUserInfo(String username) async {
    var message = 'Sign up failed, please try again';
    String? uid = _authenticateUser.getUserId();
    final User user =
        User(uid: uid!, photoUrl: null, username: username, shippingInfo: null);
    _userModelUseCase.upload(uid, user);
    message = 'Account created successfully';

    shortToast(message);
  }

  Future<Map<String, String>> validInputs() async {
    final emailAddress = emailController.text;
    final password = passwordController.text;
    var message = '';
    Map<String, String> authInputs = {};
    if (!(emailAddress.isEmail) && emailAddress.isEmpty) {
      message = 'Invalid email address';
    } else if (password.isEmpty) {
      message = 'Invalid password.';
    } else {
      authInputs = {'email': emailAddress, 'password': password};
    }
    if (message.isNotEmpty) {
      shortToast(message);
    }
    return authInputs;
  }
}
