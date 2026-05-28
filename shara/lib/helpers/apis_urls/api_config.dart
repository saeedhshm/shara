class ApiConfig {
  static bool _useMock = true;

  static bool get useMock => _useMock;

  static void enableMock() => _useMock = true;
  static void enableReal() => _useMock = false;

  static const int mockDelayMilliseconds = 800;
}
