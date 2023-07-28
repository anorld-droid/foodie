
import 'package:network/network.dart';

/// Created by Patrice Mulindi email(mulindipatrice00@gmail.com) on 08.04.2023.
class CloudFunctionsNetworkDataSource {
  final FCloudFunctions _cloudFunctions = FCloudFunctions();

  Future<List<String>> get(
    String docPath,
  ) async {
    return await _cloudFunctions.get(docPath);
  }
}
