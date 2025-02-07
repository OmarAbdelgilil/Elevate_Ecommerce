
class DataIntent {
  DataIntent._();


  static String? _driverId;
  static String? _driverName;

  static void pushDriverId(String user) {
    _driverId = user;
  }

  static String getDriverId() {
    return _driverId!;
  }

//----------------------------------------------------------------------------------------------------
  static void pushDriverName(String user) {
    _driverName = user;
  }

  static String getDriverName() {
    return _driverName!;
  }
}