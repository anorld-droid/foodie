import 'package:common/common.dart';
import 'package:domain/domain.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:get/get.dart';
import 'package:model/model.dart';
import 'package:wallet/src/strings.dart';
import 'package:wallet/src/widgets/top_up.dart';

/// Created by Patrice Mulindi email(mulindipatrice00@gmail.com) on 25.04.2023.
class WalletController extends GetxController with GetTickerProviderStateMixin {
  final RxBool hideContent = false.obs;
  final RxBool learnMore = true.obs;
  final RxBool eliteBenefitDetails = false.obs;
  final RxBool executiveBenefitDetails = false.obs;

  late final UserModelUseCase _user;
  late final AuthenticateUser _auth;
  late final SubscriptionUseCase _subscription;

  late AnimationController animationController;

  late final TextEditingController amountController;

  final Rx<Wallet?> wallet = Rx(null);
  final Rx<Subscription?> subscription = Rx(null);
  final RxString userID = ''.obs;
  final RxString timeStamp = ''.obs;
  final Rx<User?> user = Rx(null);

  var searching = true.obs;

  //Get the theme mode state of the app
  var brightness = SchedulerBinding.instance.window.platformBrightness;
  late bool isDarkMode;

  Rx<bool> isSubscriptionExpired = false.obs;

  @override
  void onInit() async {
    init();
    await loadData();
    super.onInit();
  }

  void init() {
    _user = UserModelUseCase();
    _auth = AuthenticateUser();
    _subscription = SubscriptionUseCase();
    amountController = TextEditingController();
    animationController =
        AnimationController(vsync: this, duration: const Duration(seconds: 1));
  }

  Future<void> loadData() async {
    animationController.repeat();
    final now = DateTime.now();
    if (_auth.isUserSignedIn()) {
      userID.value = formartUserID(_auth.getUserId()!);
      wallet.value = await _user.getWalletInfo(_auth.getUserId()!);
      isSubscriptionExpired.value = wallet.value!.validThru.isBefore(now);
      timeStamp.value = yearMonthFormatter.format(_auth.creationTime()!);
      user.value = await _user.get(_auth.getUserId()!);
    }
    var snap = await _subscription.get();
    snap.listen((event) {
      subscription.value = event.data();
    });
    await Future<void>.delayed(const Duration(milliseconds: 50));
    animationController.reset();
    searching.value = false;

    isDarkMode = Brightness.dark == brightness;
  }

  String formartUserID(String id) {
    String firstString = id.substring(0, 8);
    String lastString = id.substring(id.length - 8);
    String finalString =
        '${firstString.substring(0, 4)} ${firstString.substring(4, 8)} **** ${lastString.substring(0, 4)} ${lastString.substring(4, 8)} ';
    return finalString;
  }

  Future<void> subscribe(int amount, String type) async {
    await bottomSheet(Payment(
      amount: amount.toDouble(),
      onPaymentSuccesful: () async {
        DateTime now = DateTime.now().add(const Duration(days: 30));
        Wallet jsonWallet = Wallet(
          balance: amount.toDouble(),
          borrowed: wallet.value!.borrowed,
          creditLimit: wallet.value!.creditLimit,
          validThru: now,
        );
        _user.updateAccountType(userId: _auth.getUserId()!, accountType: type);
        _user.updateWalletInfo(userId: _auth.getUserId()!, wallet: jsonWallet);
        shortToast('Subscription successful');
      },
    ));
  }

  Future<void> topUpPayment() async {
    if (amountController.text.isNumericOnly) {
      await bottomSheet(Payment(
        amount: double.parse(amountController.text),
        onPaymentSuccesful: () async {
          Wallet jsonWallet = Wallet(
            balance: double.parse(amountController.text),
            borrowed: wallet.value!.borrowed,
            creditLimit: wallet.value!.creditLimit,
            validThru: wallet.value!.validThru,
          );
          _user.updateWalletInfo(
              userId: _auth.getUserId()!, wallet: jsonWallet);
          shortToast('Top up successful');
          Get.back<void>();
        },
      ));
    } else {
      shortToast('Invalid amount');
    }
  }

  void topUp() {
    showDialog<void>(
        context: Get.context!,
        builder: (_) {
          return const Center(child: Topup());
        });
  }

  Future<void> bottomSheet(Widget widget) async {
    await Get.bottomSheet<bool?>(
      widget,
      backgroundColor: Get.theme.colorScheme.background,
      clipBehavior: Clip.hardEdge,
      elevation: 4,
      barrierColor: Get.theme.colorScheme.primaryContainer,
      isScrollControlled: false,
    );
  }
}
