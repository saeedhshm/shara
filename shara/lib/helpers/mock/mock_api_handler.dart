import 'dart:async';
import 'package:shara/helpers/apis_urls/api_config.dart';
import 'package:shara/helpers/apis_urls/app_urls.dart';
import 'package:shara/helpers/mock/mock_data_provider.dart';

typedef JsonCallback = void Function(dynamic json);
typedef StatusCodeCallback = void Function(dynamic json, int statusCode);

class MockApiHandler {
  static void getData({
    required String url,
    Map<String, String>? header,
    Map<String, dynamic>? body,
    required Function callback,
  }) async {
    await Future<void>.delayed(
        Duration(milliseconds: ApiConfig.mockDelayMilliseconds));

    final json = _getMockResponse(url);

    if (json != null) {
      callback(json);
    } else {
      callback(null);
    }
  }

  static void sendData({
    required String url,
    dynamic body,
    Map<String, String>? header,
    required Function callback,
  }) async {
    await Future<void>.delayed(
        Duration(milliseconds: ApiConfig.mockDelayMilliseconds));

    final json = _getMockResponse(url);
    if (json != null) {
      callback(json, 200);
    } else {
      callback(null, 404);
    }
  }

  static dynamic _getMockResponse(String url) {
    if (url.contains(homePageUrl)) {
      return MockDataProvider.homeResponse;
    }
    if (url.contains(offersUrl) && _hasIdSuffix(url, offersUrl)) {
      final idStr = url.replaceAll(offersUrl, '').replaceAll('/', '');
      final id = int.tryParse(idStr) ?? 1;
      return MockDataProvider.offerDetailsResponse(id);
    }
    if (url.contains(offersUrl)) {
      return MockDataProvider.offersResponse;
    }
    if (url.contains(partnersUrl)) {
      return MockDataProvider.partnersResponse;
    }
    if (url.contains(membershipUrl) && _hasIdSuffix(url, membershipUrl)) {
      final idStr = url.replaceAll(membershipUrl, '').replaceAll('/', '');
      final id = int.tryParse(idStr) ?? 1;
      return MockDataProvider.membershipDetailsResponse(id);
    }
    if (url.contains(membershipUrl)) {
      return MockDataProvider.membershipsResponse;
    }
    if (url.contains(calcPointsUrl)) {
      return MockDataProvider.calcPointsResponse;
    }
    if (url.contains(allDiscountCouponsUrl)) {
      final pageMatch = RegExp(r'page=(\d+)').firstMatch(url);
      final page = pageMatch != null ? int.parse(pageMatch.group(1)!) : 1;
      return MockDataProvider.couponsResponse(page);
    }
    if (url.contains(myTransactionsUrl)) {
      return MockDataProvider.transactionsResponse;
    }
    if (url.contains(myCouponsUrl)) {
      return MockDataProvider.myCouponsResponse;
    }
    if (url.contains(promoCodesTypesUrl)) {
      return MockDataProvider.promoCodesTypesResponse;
    }
    if (url.contains(promoCodesUrl)) {
      final pageMatch = RegExp(r'page=(\d+)').firstMatch(url);
      final page = pageMatch != null ? int.parse(pageMatch.group(1)!) : 1;
      final categoryMatch = RegExp(r'category=(\d+)').firstMatch(url);
      final categoryId =
          categoryMatch != null ? int.parse(categoryMatch.group(1)!) : null;
      return MockDataProvider.promoCodesResponse(page, categoryId);
    }
    if (url.contains(buyPromoCodePayUrl)) {
      return MockDataProvider.buyPromoCodeResponse;
    }
    if (url.contains(innerTransferUrl)) {
      return MockDataProvider.innerTransferResponse;
    }
    if (url.contains(syncPhonesUrl)) {
      return MockDataProvider.syncPhonesResponse;
    }
    if (url.contains(urlPaymentGeneratorUrl)) {
      return MockDataProvider.paymentUrlResponse;
    }
    if (url.contains(profileDataUrl)) {
      return MockDataProvider.profileDataResponse;
    }
    if (url.contains(sendConfirmCodeUrl)) {
      return MockDataProvider.sendConfirmCodeResponse;
    }
    if (url.contains(validateConfirmCodeUrl)) {
      return MockDataProvider.validateConfirmCodeResponse;
    }
    if (url.contains(registerUrl)) {
      return MockDataProvider.registerResponse;
    }
    if (url.contains(loginUrl)) {
      return MockDataProvider.loginResponse;
    }
    if (url.contains(loginSendConfirmCodeUrl)) {
      return MockDataProvider.loginSendConfirmCodeResponse;
    }
    if (url.contains(forgetPasswordByPhoneUrl) ||
        url.contains(forgetPasswordByEmailUrl)) {
      return MockDataProvider.forgetPasswordResponse;
    }
    if (url.contains(resetPasswordUrl)) {
      return MockDataProvider.resetPasswordResponse;
    }
    if (url.contains(updateEmailUrl)) {
      return MockDataProvider.updateEmailResponse;
    }
    if (url.contains(updateProfileUrl) || url.contains(getProfileUrl)) {
      return MockDataProvider.updateProfileResponse;
    }
    if (url.contains(updatePasswordUrl)) {
      return MockDataProvider.updatePasswordResponse;
    }
    if (url.contains(sendMessageUrl)) {
      return MockDataProvider.sendMessageResponse;
    }

    return null;
  }

  static bool _hasIdSuffix(String url, String baseUrl) {
    final suffix = url.replaceAll(baseUrl, '');
    return suffix.isNotEmpty && suffix != '/';
  }
}
