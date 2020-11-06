import 'dart:convert';

class ConnectionCredentials {
  final String username;
  final String password;
  final String domain;
  final String serverUrl;

  String get authorization =>
      'Basic ' + base64Encode(utf8.encode('$username@$domain:$password'));

  ConnectionCredentials(
      {this.username, this.password, this.domain, this.serverUrl});
}
