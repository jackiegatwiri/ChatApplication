import 'dart:io';

class Socket{
  static String _serverIp = 
  Platform.isIOS ? 'http://localhost' : 'http://10.0.2.2';
  static const int SERVER_PORT = 6000;
  static String _connectUrl = '$_serverIp;$SERVER_PORT';

  

}