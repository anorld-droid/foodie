import 'package:common/common.dart';
import 'package:domain/domain.dart';
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
  final Rx<Subscription?> benefits = Rx(null);
  final RxString userID = ''.obs;
  final RxString timeStamp = ''.obs;
  final RxString username = ''.obs;

  @override
  void onInit() {
    _user = UserModelUseCase();
    _auth = AuthenticateUser();
    _subscription = SubscriptionUseCase();
    super.onInit();
  }

  Future<void> loadData() async {
    if (_auth.isUserSignedIn()) {
      userID.value = formartUserID(_auth.getUserId()!);
      wallet.value = await _user.getWalletInfo(_auth.getUserId()!);
      timeStamp.value = yearMonthFormatter.format(_auth.creationTime()!);
      var userSnap = await _user.get(_auth.getUserId()!);
      username.value = userSnap!.username;
    }
    var snap = await _subscription.get();
    snap.listen((event) {
      benefits.value = event.data();
    });
  }

  String formartUserID(String id) {
    String firstString = id.substring(0, 8);
    String lastString = id.substring(id.length - 8);
    String finalString =
        '${firstString.substring(0, 4)} ${firstString.substring(4, 8)} **** ${lastString.substring(0, 4)} ${lastString.substring(4, 8)} ';
    return finalString;
  }

  void pay() {}
}
