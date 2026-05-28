import 'api_config.dart';
import 'api.dart' as real;
import '../mock/mock_api_handler.dart' as mock;

class ApiHandler {
  static void getData({
    required String url,
    Map<String, String>? header,
    Map<String, dynamic>? body,
    required Function callback,
  }) {
    if (ApiConfig.useMock) {
      mock.MockApiHandler.getData(
        url: url,
        header: header,
        body: body,
        callback: callback,
      );
    } else {
      real.AppApiHandler.getData(
        url: url,
        header: header,
        body: body,
        callback: callback,
      );
    }
  }

  static void sendData({
    required String url,
    required dynamic body,
    Map<String, String>? header,
    required Function callback,
  }) {
    if (ApiConfig.useMock) {
      mock.MockApiHandler.sendData(
        url: url,
        body: body,
        header: header,
        callback: callback,
      );
    } else {
      real.AppApiHandler.sendData(
        url: url,
        body: body,
        header: header,
        callback: callback,
      );
    }
  }
}
