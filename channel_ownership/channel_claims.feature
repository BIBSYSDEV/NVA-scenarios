Feature: Channel claims

  Scenario: Already claimed channel cannot be claimed
    When a channel is claimed by institution A
    Then the channel cannot be claimed by insitution B

  Scenario: Editor can claim a channel for their institution
    When an Editor claims a channel
    Then the channel is owned by the Editors institution

  Scenario: Editor can abandon claim of a channel for their institution
    When an Editor at institution A claims a channel
    Then an Editor at institution A can abandon the channel claim

  Scenario: Editor cannot abandon claim of a channel owned by another institution
    When an Editor at institution A claims a channel
    Then an Editor at institution B cannot abandon the channel claim

  Scenario: Non-editor cannot claim a channel
    When a user is not Editor
    Then they cannot claim a channel

  Scenario: Non-editor cannot abandon claim of a channel
    When a user is not Editor
    Then they cannot abandon a channel claim

  Scenario: View all channel claims
    When requesting all channel claims
    Then all channel claims are returned

  Scenario: Filter channel claims by institution
    When requesting all channel claims, with a filter by institution
    Then all channels claimed by that institution are returned