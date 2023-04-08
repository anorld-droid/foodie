import 'package:cloud_functions/cloud_functions.dart';
import 'package:network/src/constants.dart';

/// Created by Patrice Mulindi email(mulindipatrice00@gmail.com) on 08.04.2023.
class FCloudFunctions {
  FirebaseFunctions functions = FirebaseFunctions.instance;

  //Get results from cloud function
  Future<List<String>> get(String docPath) async {
    HttpsCallable callable =
        functions.httpsCallable(Constants.getSubCollections);
    dynamic result = await callable.call<dynamic>(<String, dynamic>{
      'docPath': docPath,
    });
    var data = result.data['collections'] as List;
    return data.map((e) => e as String).toList();
  }
}
