import 'package:xml/xml.dart';

/// An [Appointment] from an exchange calendar
class Appointment {
  /// [id] is used internally in exchange, value is stored for future features
  String? id;

  /// [changeKey] is used internally in exchange, value is stored for future features
  String? changeKey;

  /// The [subject] of the appointment
  String? subject;

  /// [start] time of the appointment
  DateTime? start;

  /// [end] time of the appointment
  DateTime? end;

  /// Name of the [organizer]
  String? organizer;

  Appointment(
      {this.subject,
      this.organizer,
      this.start,
      this.end,
      this.id,
      this.changeKey});

  /// Extracts Appointment from an __t:CalendarItem__ XML [element]
  Appointment.fromXml(XmlElement element) {
    id = element.getElement('t:ItemId')!.getAttribute('Id');
    changeKey = element.getElement('t:ItemId')!.getAttribute('ChangeKey');

    subject = element.getElement('t:Subject')!.text;
    start = DateTime.parse(element.getElement('t:Start')!.text);
    end = DateTime.parse(element.getElement('t:End')!.text);
    organizer = element
        .getElement('t:Organizer')!
        .getElement('t:Mailbox')!
        .getElement('t:Name')!
        .text;
  }

  /// Extracts list of Appointments from an __t:Items__ [element]
  static List<Appointment> getAppointmentList(XmlElement element) => element
      .findAllElements('t:CalendarItem')
      .map((e) => Appointment.fromXml(e))
      .toList();
}
