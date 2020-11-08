import 'package:xml/xml.dart';

class Room {
  String name;
  String emailAddress;
  String routingType;
  String mailboxType;

  Room();

  /// Extracts an Room from a XML [element]
  Room.fromXml(XmlElement element) {
    var innerElement = element.getElement('t:Id');
    name = innerElement.getElement('t:Name').text;
    emailAddress = innerElement.getElement('t:EmailAddress').text;
    routingType = innerElement.getElement('t:RoutingType').text;
    mailboxType = innerElement.getElement('t:MailboxType').text;
  }
}
