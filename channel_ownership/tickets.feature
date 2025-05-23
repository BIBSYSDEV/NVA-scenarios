Feature: Tickets are sent to curators at the channel owner

  Background:
    Given metadata registered on a claimed channel
    And the channel claim has an allow-all policy for registering metadata
    And publication instance type is part of channel scope

  Scenario: Ticket sent to Registrators institution
    Given a Registrator
    And Registrators institution owns the channel
    When metadata is registered
    Then a ticket is sent to curators at Registrators institution

  Scenario: Ticket sent to Channel owner, not Registrators institution
    Given a Registrator
    And Registrators institution does not own the channel
    When metadata is registered
    Then a ticket is sent to curators at the channel owner
    And a ticket is not sent to curators at Registrators institution

  Scenario: Ticket sent to Channel owner, not contributors institution
    Given a contributor not from the channel owner
    When metadata is registered
    Then a ticket is not sent to curators at contributors institution
    And a ticket is sent to curators at the channel owner

    Scenario: Tickets regarding student thesis should only be handled by student thesis curator
      Given a publication with a Degree-category
      When a publishing request is sent
      Then only student thesis curator can approve ticket