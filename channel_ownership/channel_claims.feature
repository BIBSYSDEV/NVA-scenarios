Feature: Channel claims

  Scenario: Claimed channel cannot be claimed
    When a channel is claimed by institution A
    Then the channel cannot be claimed by insitution B

  Scenario: App Admin can claim channel for any institution
    When App Admin claims a channel on behalf of institution A
    Then the channel is claimed by institution A

  Scenario: App Admin can abandon claim of a channel for any institution
    When an institution has a channel claim
    Then App Admin can abandon the channel claim

  Scenario: Only App Admin can claim a channel
    Given a user is not App Admin
    When they inspect an unclaimed channel
    Then they cannot claim it

  Scenario: Only App Admin can abandon claim of a channel
    Given a user is not App Admin
    When they inspect a claimed channel
    Then they cannot abandon the claim

  Scenario: View all channel claims
    When requesting all channel claims
    Then all channel claims are returned

  Scenario: Filter channel claims by institution
    When requesting all channel claims, with a filter by institution
    Then all channels claimed by that institution are returned