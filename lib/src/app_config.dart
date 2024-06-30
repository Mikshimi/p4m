/*The intention was for storing data from the app to user device
with storage services. depending on the device, a specific storage service 
would be used with the correct format.*/
class AppConfig {
  static const String libraryExtension = 'txt';
  static const String webExtension = 'json';
  static const String mobileExtension = 'msgpack';
}
