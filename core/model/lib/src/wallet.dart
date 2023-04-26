import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:model/src/constants.dart';

/// Created by Patrice Mulindi email(mulindipatrice00@gmail.com) on 26.04.2023.
class Wallet {
  final double balance;
  final double borrowed;
  final double creditLimit;
  final Map<String, String> executiveBenefits;
  final Map<String, String> eliteBenefits;
  final DateTime validThru;

  Wallet({
    required this.balance,
    required this.borrowed,
    required this.creditLimit,
    required this.executiveBenefits,
    required this.eliteBenefits,
    required this.validThru,
  });

  Map<String, dynamic> toFirestore() => {
        Constants.balance: balance,
        Constants.borrowed: borrowed,
        Constants.creditLimit: creditLimit,
        Constants.executiveBenefits: executiveBenefits,
        Constants.eliteBenefits: eliteBenefits,
        Constants.validThru: Timestamp.fromDate(validThru)
      };

  factory Wallet.fromFirestore(
    DocumentSnapshot<Map<String, dynamic>> snap,
    SnapshotOptions? options,
  ) {
    var snapshot = snap.data();
    var executiveBenefits =
        snapshot?[Constants.executiveBenefits] as Map<String, dynamic>;
    var eliteBenefits =
        snapshot?[Constants.eliteBenefits] as Map<String, dynamic>;
    Timestamp validThru = snapshot?[Constants.validThru] as Timestamp;
    return Wallet(
        balance: snapshot?[Constants.balance] as double,
        borrowed: snapshot?[Constants.borrowed] as double,
        creditLimit: snapshot?[Constants.creditLimit] as double,
        executiveBenefits: executiveBenefits
            .map((key, value) => MapEntry(key, value as String)),
        eliteBenefits:
            eliteBenefits.map((key, value) => MapEntry(key, value as String)),
        validThru: validThru.toDate());
  }
}
