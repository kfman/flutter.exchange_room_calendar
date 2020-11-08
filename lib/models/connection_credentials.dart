import 'dart:convert';

/// Credentials to access the Exchange server
class ConnectionCredentials {
  final String username;
  final String password;
  final String domain;
  final String serverUrl;

  String get authorization =>
      'Basic ' + base64Encode(utf8.encode('$username@$domain:$password'));

  /// [username] with access to the rooms calendar and its [password]
  /// using the [domain] e.d. __mydomain.local__ on the server
  /// with the [serverUrl] ending on __/EWS/Exchange.asmx__
  ConnectionCredentials(
      {this.username, this.password, this.domain, this.serverUrl});
}
