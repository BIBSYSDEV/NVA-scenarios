Feature: Changing values in a NVI-candidate

    # @test
    Scenario Outline: Contributor changes from unidentified to identified
        Given a curator opens a Result that is a NVI-candidate with an unidentified contributor
        And the Result is "<Source>" registration
        And the Result is "<Collaboration>"
        When the curator changes a contributor from unidentified to identified
        And saves the changes
        Then the Result is a NVI-candidate

        Examples:
            | Source | Collaboration                      |
            | Manual | no Collaboration                   |
            | Import | no Collaboration                   |
            | Manual | NVI institution Collaboration      |
            | Import | NVI institution Collaboration      |
            | Manual | NVA institution Collaboration      |
            | Import | NVA institution Collaboration      |
            | Manual | external institution Collaboration |
            | Import | external institution Collaboration |

    # @test
    Scenario Outline: Category changes from non-scientific to scientific
        Given a curator opens a non-scientific Result that is a NVI-candidate
        And the Result is "<Source>" registration
        And the Result is "<Collaboration>"
        When the curator changes the Category from non-scientific to scientific
        And saves the changes
        Then the Result is a NVI-candidate

        Examples:
            | Source | Collaboration                      |
            | Manual | no Collaboration                   |
            | Import | no Collaboration                   |
            | Manual | NVI institution Collaboration      |
            | Import | NVI institution Collaboration      |
            | Manual | NVA institution Collaboration      |
            | Import | NVA institution Collaboration      |
            | Manual | external institution Collaboration |
            | Import | external institution Collaboration |

    # @test
    Scenario Outline: Category changes from scientific to non-scientific
        Given a curator opens a scientific Result that is a NVI-candidate
        And the Result is "<Source>" registration
        And the Result is "<Collaboration>"
        When the curator changes the Category from scientific to non-scientific
        And saves the changes
        Then the Result is not a NVI-candidate

        Examples:
            | Source | Collaboration                      |
            | Manual | no Collaboration                   |
            | Import | no Collaboration                   |
            | Manual | NVI institution Collaboration      |
            | Import | NVI institution Collaboration      |
            | Manual | NVA institution Collaboration      |
            | Import | NVA institution Collaboration      |
            | Manual | external institution Collaboration |
            | Import | external institution Collaboration |

    # @test
    Scenario Outline: Category changes from non-scientific to scientific, contributor changes from unidentified to identified
        Given a curator opens a non-scientific Result that is a NVI-candidate with unidentified contributor
        And the Result is "<Source>" registration
        And the Result is "<Collaboration>"
        When the curator changes the Category from non-scientific to scientific
        And the curator changes a contributor from unidentified to identified
        And saves the changes
        Then the Result is a NVI-candidate

        Examples:
            | Source | Collaboration                      |
            | Manual | no Collaboration                   |
            | Import | no Collaboration                   |
            | Manual | NVI institution Collaboration      |
            | Import | NVI institution Collaboration      |
            | Manual | NVA institution Collaboration      |
            | Import | NVA institution Collaboration      |
            | Manual | external institution Collaboration |
            | Import | external institution Collaboration |

    # @test
    Scenario Outline: Category changes from scientific to non-scientific, contributor changes from unidentified to identified
        Given a curator opens a scientific Result that is a NVI-candidate with unidentified contributor
        And the Result is "<Source>" registration
        And the Result is "<Collaboration>"
        When the curator changes the Category from scientific to non-scientific
        And the curator changes a contributor from unidentified to identified
        And saves the changes
        Then the Result is not a NVI-candidate

        Examples:
            | Source | Collaboration                      |
            | Manual | no Collaboration                   |
            | Import | no Collaboration                   |
            | Manual | NVI institution Collaboration      |
            | Import | NVI institution Collaboration      |
            | Manual | NVA institution Collaboration      |
            | Import | NVA institution Collaboration      |
            | Manual | external institution Collaboration |
            | Import | external institution Collaboration |
