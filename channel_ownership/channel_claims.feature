Feature: Channel claims

  Scenario: No one can claim an already claimed channel
    Given any user
    And a claimed channel
    When the user claims the channel
    Then they are denied

  Scenario: Editor can claim a channel for their own institution
    Given a user logged in as Editor
    And an unclaimed channel
    When the user claims the channel
    Then the channel is claimed by the users institution

  Scenario: Editor can abandon claim of a channel for their own institution
    Given a user logge in as Editor
    And a channel claimed by their institution
    When the channel claim us abandoned by the user
    Then the channel is unclaimed

  Scenario: Editor cannot claim a channel on behalf of another institution
    Given a user logge in as Editor
    And an unclaimed channel
    When the user claims the channel on behalf of another institution
    Then they are denied
    And the channel is still unclaimed

  Scenario: Editor cannot abandon claim of a channel on behalf of another institution
    Given a user logge in as Editor
    And a channel claimed by another institution
    When the channel claim us abandoned by the user
    Then they are denied
    And the channel is still claimed by the other institution

  Scenario: Non-editor cannot claim a channel
    Given a user not logged in as Editor
    And an unclaimed channel
    When the user claims the channel
    Then they are denied
    And the channel is still unclaimed

  Scenario: Non-editor cannot abandon claim of a channel
    Given a user not logged in as Editor
    And a claimed channel
    When the channel claim is abandoned by the user
    Then they are denied
    And the channel is still claimed

  Scenario: Logged in user can view all channel claims
    Given a logged in user
    When they request all channel claims
    Then all channel claims are returned

  Scenario: Anonymous user cannot view channel claims
    Given an anonumous user
    When they request all channel claims
    Then no channel claims are returned

  Scenario: Logged in user can filter channels claimed by institution
    Given a logged in user
    When they request all channel claims filtered by an institution
    Then all channels claimed by that institution are returned

  Scenario: No one can view channels not claimed
    Given any user
    When they request all channels not claimed
    Then they are denied