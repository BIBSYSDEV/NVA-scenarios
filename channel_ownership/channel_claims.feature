Feature: Channel claims

  Scenario: No one can claim an already claimed channel
    Given any user
    And a claimed channel
    When the user claims the channel
    Then the channel is still unclaimed

  Scenario: Editor can claim a channel for their own institution
    Given a user logged in as Editor
    And an unclaimed channel
    When the user claims the channel
    Then the channel is claimed by the users institution

  Scenario: Editor can abandon claim of a channel for their own institution
    Given a user logged in as Editor
    And a channel claimed by their institution
    When the channel claim is abandoned by the user
    Then the channel is unclaimed

  Scenario: Editor cannot claim a channel on behalf of another institution
    Given a user logged in as Editor
    And an unclaimed channel
    When the user claims the channel on behalf of another institution
    Then the channel is still unclaimed

  Scenario: Editor cannot abandon claim of a channel on behalf of another institution
    Given a user logged in as Editor
    And a channel claimed by another institution
    When the channel claim is abandoned by the user
    Then the channel is still claimed by the other institution

  Scenario: Non-editor cannot claim a channel
    Given a user not logged in as Editor
    And an unclaimed channel
    When the user claims the channel
    Then the channel is still unclaimed

  Scenario: Non-editor cannot abandon claim of a channel
    Given a user not logged in as Editor
    And a claimed channel
    When the channel claim is abandoned by the user
    Then the channel is still claimed

  Scenario: View all channel claims
    When requesting all channel claims
    Then all channel claims are returned

  Scenario: Filter channel claims by institution
    When requesting all channel claims, with a filter by institution
    Then all channels claimed by that institution are returned