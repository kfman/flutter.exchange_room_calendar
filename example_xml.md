# Example requests and responses


## Get room lists

```xml
<?xml version="1.0" encoding="utf-8"?>
<soap:Envelope xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" xmlns:soap="http://schemas.xmlsoap.org/soap/envelope/">
 <soap:Header>
  <t:RequestServerVersion Version="Exchange2010" xmlns:t="http://schemas.microsoft.com/exchange/services/2006/types" />
 </soap:Header>
 <soap:Body>
  <m:GetRoomLists xmlns:m="http://schemas.microsoft.com/exchange/services/2006/messages" />
 </soap:Body>
</soap:Envelope>
```

```xml
<?xml version="1.0" encoding="utf-8"?>
<s:Envelope
  xmlns:s="http://schemas.xmlsoap.org/soap/envelope/">
  <s:Header>
    <h:ServerVersionInfo MajorVersion="15" MinorVersion="0" MajorBuildNumber="1497" MinorBuildNumber="7" Version="V2_23"
      xmlns:h="http://schemas.microsoft.com/exchange/services/2006/types"
      xmlns="http://schemas.microsoft.com/exchange/services/2006/types"
      xmlns:xsd="http://www.w3.org/2001/XMLSchema"
      xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance"/>
    </s:Header>
    <s:Body
      xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance"
      xmlns:xsd="http://www.w3.org/2001/XMLSchema">
      <m:GetRoomListsResponse ResponseClass="Success"
        xmlns:m="http://schemas.microsoft.com/exchange/services/2006/messages"
        xmlns:t="http://schemas.microsoft.com/exchange/services/2006/types">
        <m:ResponseCode>NoError</m:ResponseCode>
        <m:RoomLists>
          <t:Address>
            <t:Name>Meetingrooms</t:Name>
            <t:EmailAddress>rooms@mydomain.com</t:EmailAddress>
            <t:RoutingType>SMTP</t:RoutingType>
            <t:MailboxType>PublicDL</t:MailboxType>
          </t:Address>
        </m:RoomLists>
      </m:GetRoomListsResponse>
    </s:Body>
  </s:Envelope>
```

## Get rooms by list

```xml
<?xml version="1.0" encoding="utf-8"?>
<soap:Envelope
	xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance"
	xmlns:soap="http://schemas.xmlsoap.org/soap/envelope/"
	xmlns:t="http://schemas.microsoft.com/exchange/services/2006/types">
	<soap:Header>
		<t:RequestServerVersion Version="Exchange2010"
			xmlns:t="http://schemas.microsoft.com/exchange/services/2006/types" />
		</soap:Header>
		<soap:Body>
			<m:GetRooms
				xmlns:m="http://schemas.microsoft.com/exchange/services/2006/messages">
				<m:RoomList>
					<t:EmailAddress>rooms@mydomain.com</t:EmailAddress>
				</m:RoomList>
			</m:GetRooms>
		</soap:Body>
	</soap:Envelope>
```

```xml
<?xml version="1.0" encoding="utf-8"?>
<s:Envelope
  xmlns:s="http://schemas.xmlsoap.org/soap/envelope/">
  <s:Header>
    <h:ServerVersionInfo MajorVersion="15" MinorVersion="0" MajorBuildNumber="1497" MinorBuildNumber="7" Version="V2_23"
      xmlns:h="http://schemas.microsoft.com/exchange/services/2006/types"
      xmlns="http://schemas.microsoft.com/exchange/services/2006/types"
      xmlns:xsd="http://www.w3.org/2001/XMLSchema"
      xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance"/>
    </s:Header>
    <s:Body
      xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance"
      xmlns:xsd="http://www.w3.org/2001/XMLSchema">
      <m:GetRoomsResponse ResponseClass="Success"
        xmlns:m="http://schemas.microsoft.com/exchange/services/2006/messages"
        xmlns:t="http://schemas.microsoft.com/exchange/services/2006/types">
        <m:ResponseCode>NoError</m:ResponseCode>
        <m:Rooms>
          <t:Room>
            <t:Id>
              <t:Name>Conference</t:Name>
              <t:EmailAddress>conference@mydomain.com</t:EmailAddress>
              <t:RoutingType>SMTP</t:RoutingType>
              <t:MailboxType>Mailbox</t:MailboxType>
            </t:Id>
          </t:Room>
          <t:Room>
            <t:Id>
              <t:Name>Meeting</t:Name>
              <t:EmailAddress>meeting@mydomain.com</t:EmailAddress>
              <t:RoutingType>SMTP</t:RoutingType>
              <t:MailboxType>Mailbox</t:MailboxType>
            </t:Id>
          </t:Room>
          <t:Room>
            <t:Id>
              <t:Name>Hollywood</t:Name>
              <t:EmailAddress>hollywood@mydomain.com</t:EmailAddress>
              <t:RoutingType>SMTP</t:RoutingType>
              <t:MailboxType>Mailbox</t:MailboxType>
            </t:Id>
          </t:Room>
          <t:Room>
            <t:Id>
              <t:Name>Canada</t:Name>
              <t:EmailAddress>canada@mydomain.com</t:EmailAddress>
              <t:RoutingType>SMTP</t:RoutingType>
              <t:MailboxType>Mailbox</t:MailboxType>
            </t:Id>
          </t:Room>
        </m:Rooms>
      </m:GetRoomsResponse>
    </s:Body>
  </s:Envelope>
```

## Get Folder by email address

```xml
<?xml version="1.0" encoding="utf-8"?>
<soap:Envelope
	xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance"
	xmlns:soap="http://schemas.xmlsoap.org/soap/envelope/"
	xmlns:t="http://schemas.microsoft.com/exchange/services/2006/types">
	<soap:Header>
		<t:RequestServerVersion Version="Exchange2010"
			xmlns:t="http://schemas.microsoft.com/exchange/services/2006/types" />
		</soap:Header>
  <soap:Body>
    <GetFolder xmlns="http://schemas.microsoft.com/exchange/services/2006/messages"
               xmlns:t="http://schemas.microsoft.com/exchange/services/2006/types">
      <FolderShape>
        <t:BaseShape>Default</t:BaseShape>
      </FolderShape>
      <FolderIds>
        <t:DistinguishedFolderId Id="calendar">
				<t:Mailbox>
					<t:EmailAddress>conference@mydomain.com</t:EmailAddress>
						</t:Mailbox>
				</t:DistinguishedFolderId>
      </FolderIds>
    </GetFolder>
  </soap:Body>
</soap:Envelope>
```

```xml
<?xml version="1.0" encoding="utf-8"?>
<s:Envelope
  xmlns:s="http://schemas.xmlsoap.org/soap/envelope/">
  <s:Header>
    <h:ServerVersionInfo MajorVersion="15" MinorVersion="0" MajorBuildNumber="1497" MinorBuildNumber="7" Version="V2_23"
      xmlns:h="http://schemas.microsoft.com/exchange/services/2006/types"
      xmlns="http://schemas.microsoft.com/exchange/services/2006/types"
      xmlns:xsd="http://www.w3.org/2001/XMLSchema"
      xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance"/>
    </s:Header>
    <s:Body
      xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance"
      xmlns:xsd="http://www.w3.org/2001/XMLSchema">
      <m:GetFolderResponse
        xmlns:m="http://schemas.microsoft.com/exchange/services/2006/messages"
        xmlns:t="http://schemas.microsoft.com/exchange/services/2006/types">
        <m:ResponseMessages>
          <m:GetFolderResponseMessage ResponseClass="Success">
            <m:ResponseCode>NoError</m:ResponseCode>
            <m:Folders>
              <t:CalendarFolder>
                <t:FolderId Id="AQMkAGJl" ChangeKey="AgAAABY"/>
                <t:DisplayName>Calendar</t:DisplayName>
                <t:TotalCount>325</t:TotalCount>
                <t:ChildFolderCount>0</t:ChildFolderCount>
              </t:CalendarFolder>
            </m:Folders>
          </m:GetFolderResponseMessage>
        </m:ResponseMessages>
      </m:GetFolderResponse>
    </s:Body>
  </s:Envelope>
```

## Get Appointments from folder

[CalenderItem](https://docs.microsoft.com/de-de/exchange/client-developer/web-service-reference/calendaritem)


```xml
<?xml version="1.0" encoding="utf-8"?>
<soap:Envelope 
	xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" 
  xmlns:soap="http://schemas.xmlsoap.org/soap/envelope/"			
  xmlns:m="http://schemas.microsoft.com/exchange/services/2006/messages"
  xmlns:t="http://schemas.microsoft.com/exchange/services/2006/types">
  <soap:Header>
		<t:RequestServerVersion Version="Exchange2010"
			xmlns:t="http://schemas.microsoft.com/exchange/services/2006/types" />
  </soap:Header>
  <soap:Body>
    <m:FindItem Traversal="Shallow">
      <m:ItemShape>
        <t:BaseShape>IdOnly</t:BaseShape>
        <t:AdditionalProperties>
          <t:FieldURI FieldURI="item:Subject" />
          <t:FieldURI FieldURI="calendar:Organizer" />
          <t:FieldURI FieldURI="calendar:Start" />
          <t:FieldURI FieldURI="calendar:End" />
        </t:AdditionalProperties>
      </m:ItemShape>
      <m:CalendarView MaxEntriesReturned="150" StartDate="2020-10-21T17:30:24.127Z" EndDate="2021-09-20T17:30:24.127Z" />
      <m:ParentFolderIds>
        <t:FolderId Id="AQMkAG" ChangeKey="AgAAAB" />
      </m:ParentFolderIds>
    </m:FindItem>
  </soap:Body></soap:Envelope>
```

```xml
<?xml version="1.0" encoding="utf-8"?>
<s:Envelope
  xmlns:s="http://schemas.xmlsoap.org/soap/envelope/">
  <s:Header>
    <h:ServerVersionInfo MajorVersion="15" MinorVersion="0" MajorBuildNumber="1497" MinorBuildNumber="7" Version="V2_23"
      xmlns:h="http://schemas.microsoft.com/exchange/services/2006/types"
      xmlns="http://schemas.microsoft.com/exchange/services/2006/types"
      xmlns:xsd="http://www.w3.org/2001/XMLSchema"
      xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance"/>
    </s:Header>
    <s:Body
      xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance"
      xmlns:xsd="http://www.w3.org/2001/XMLSchema">
      <m:FindItemResponse
        xmlns:m="http://schemas.microsoft.com/exchange/services/2006/messages"
        xmlns:t="http://schemas.microsoft.com/exchange/services/2006/types">
        <m:ResponseMessages>
          <m:FindItemResponseMessage ResponseClass="Success">
            <m:ResponseCode>NoError</m:ResponseCode>
            <m:RootFolder TotalItemsInView="4" IncludesLastItemInRange="true">
              <t:Items>
                <t:CalendarItem>
                  <t:ItemId Id="AAMkAGJ" ChangeKey="DwAAA"/>
                  <t:Subject>Meeting Customer 1</t:Subject>
                  <t:Start>2020-10-26T12:00:00Z</t:Start>
                  <t:End>2020-10-26T12:45:00Z</t:End>
                  <t:Organizer>
                    <t:Mailbox>
                      <t:Name>Organizer</t:Name>
                      <t:EmailAddress>/O=FIRST ORGANIZATION/OU=EXCHANGE ADMINISTR...E</t:EmailAddress>
                      <t:RoutingType>EX</t:RoutingType>
                      <t:MailboxType>OneOff</t:MailboxType>
                    </t:Mailbox>
                  </t:Organizer>
                </t:CalendarItem>
                <t:CalendarItem>
                  <t:ItemId Id="AAMkAGJl" ChangeKey="DwAAA"/>
                  <t:Subject>Catering</t:Subject>
                  <t:Start>2020-11-06T09:00:00Z</t:Start>
                  <t:End>2020-11-06T09:30:00Z</t:End>
                  <t:Organizer>
                    <t:Mailbox>
                      <t:Name>Chef</t:Name>
                      <t:EmailAddress>/O=FIRST ORGANIZATION/OU=EXCHANGE ADM...R</t:EmailAddress>
                      <t:RoutingType>EX</t:RoutingType>
                      <t:MailboxType>OneOff</t:MailboxType>
                    </t:Mailbox>
                  </t:Organizer>
                </t:CalendarItem>
                <t:CalendarItem>
                  <t:ItemId Id="AAMk" ChangeKey="DwAAA"/>
                  <t:Subject>Coffee supplier</t:Subject>
                  <t:Start>2020-11-09T09:00:00Z</t:Start>
                  <t:End>2020-11-09T09:30:00Z</t:End>
                  <t:Organizer>
                    <t:Mailbox>
                      <t:Name>CEO</t:Name>
                      <t:EmailAddress>/O=FIRST ORGANIZATION/OU=EXCHANGE ADMI...R</t:EmailAddress>
                      <t:RoutingType>EX</t:RoutingType>
                      <t:MailboxType>OneOff</t:MailboxType>
                    </t:Mailbox>
                  </t:Organizer>
                </t:CalendarItem>
                <t:CalendarItem>
                  <t:ItemId Id="AAMkA" ChangeKey="DwAAA"/>
                  <t:Subject>Insurance</t:Subject>
                  <t:Start>2020-11-13T09:00:00Z</t:Start>
                  <t:End>2020-11-13T10:00:00Z</t:End>
                  <t:Organizer>
                    <t:Mailbox>
                      <t:Name>Sarah Fischer</t:Name>
                      <t:EmailAddress>/O=FIRST ORGANIZATION/OU=EXCHANGE ADMINIST...R</t:EmailAddress>
                      <t:RoutingType>EX</t:RoutingType>
                      <t:MailboxType>OneOff</t:MailboxType>
                    </t:Mailbox>
                  </t:Organizer>
                </t:CalendarItem>
              </t:Items>
            </m:RootFolder>
          </m:FindItemResponseMessage>
        </m:ResponseMessages>
      </m:FindItemResponse>
    </s:Body>
  </s:Envelope>
```
