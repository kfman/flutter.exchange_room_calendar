# exchange_rooms

A flutter package to get appointments from a room on Exchange Server 2010+.

The package uses the EWS Api. To get the appointments use the following code:

```dart
  final rooms = ExchangeRooms(
    credentials: CConnectionCredentials(
                        username: 'username',
                        password: 'TopSecretExchangePassword',
                        domain: 'domain.local',
                        serverUrl: 'https://mail.domain.com/EWS/Exchange.asmx')
  );

      var appointments = await rooms.getAppointmentsByRoomName('roomName',
      count: 2, from: DateTime(2020,11,06), to: DateTime(2020,11,14));
```

