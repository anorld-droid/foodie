import 'package:common/common.dart';
import 'package:domain/domain.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:model/model.dart';

/// Created by Patrice Mulindi email(mulindipatrice00@gmail.com) on 25.04.2023.
class WalletController extends GetxController {
  final RxBool hideContent = false.obs;
  final RxBool learnMore = true.obs;
  final RxBool eliteBenefitDetails = false.obs;
  final RxBool executiveBenefitDetails = false.obs;

  late final UserModelUseCase _user;
  late final AuthenticateUser _auth;
  late final SubscriptionUseCase _subscription;

  final Rx<Wallet?> wallet = Rx(null);
  final Rx<Subscription?> subscription = Rx(null);
  final RxString userID = ''.obs;
  final RxString timeStamp = ''.obs;
  final Rx<User?> user = Rx(null);

  @override
  void onInit() {
    init();
    super.onInit();
  }

  void init() {
    _user = UserModelUseCase();
    _auth = AuthenticateUser();
    _subscription = SubscriptionUseCase();
  }

  Future<void> loadData() async {
    if (_auth.isUserSignedIn()) {
      userID.value = formartUserID(_auth.getUserId()!);
      wallet.value = await _user.getWalletInfo(_auth.getUserId()!);
      timeStamp.value = yearMonthFormatter.format(_auth.creationTime()!);
      user.value = await _user.get(_auth.getUserId()!);
    }
    var snap = await _subscription.get();
    snap.listen((event) {
      subscription.value = event.data();
    });
  }

  String formartUserID(String id) {
    String firstString = id.substring(0, 8);
    String lastString = id.substring(id.length - 8);
    String finalString =
        '${firstString.substring(0, 4)} ${firstString.substring(4, 8)} **** ${lastString.substring(0, 4)} ${lastString.substring(4, 8)} ';
    return finalString;
  }

  Future<void> checkout(double amount) async {
    await bottomSheet(Payment(
      amount: amount,
      onPaymentSuccesful: () async {
        DateTime now = DateTime.now().add(const Duration(days: 30));
        Wallet jsonWallet = Wallet(
          balance: amount,
          borrowed: wallet.value!.borrowed,
          creditLimit: wallet.value!.creditLimit,
          validThru: now,
        );
        _user.updateWalletInfo(userId: _auth.getUserId()!, wallet: jsonWallet);
        shortToast('Subscription successful');
      },
    ));
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
