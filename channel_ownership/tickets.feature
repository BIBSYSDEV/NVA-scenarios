Feature: Tickets are sent to and handled by the channel owner

  Scenario: Channel owner is receiver of file approval tickets
    Given a publication
    And the publication has a claimed channel as publisher
    And the publication is within channel claim scope
    When a file approval ticket is created
    Then the channel owner receives the ticket

  Scenario: Channel owner approves file approval tickets
    Given a publication
    And the publication has a claimed channel as publisher
    And the publication is within channel claim scope
    When a file approval ticket is created
    Then the channel owner can approve the ticket

    Scenario: Ticket cannot be transferred to another institution when channel is claimed
      Given a publication
      And the publication has a claimed channel as publisher
      And the publication is within channel claim scope
      When a user transfers the ticket
      Then the they are denied