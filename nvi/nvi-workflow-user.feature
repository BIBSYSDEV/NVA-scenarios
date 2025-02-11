Feature: NVI workflow - user


    # @test
    Scenario Outline: Publication NVI status - user
        Given a Curator views the NVI-tasklist
        When a Publication is a "<Category>"
        And the Publication has status "<PublicationStatus>"
        And the Publication is collaborating with "<IsCollaboration>"
        And the Publication is "<TypeOfRegistration>"
        Then the Publication has NVI status "<IsNviPublication>"

        Examples:
            | Category           | PublicationStatus | IsCollaboration      | TypeOfRegistration  | IsNviPublication    |
            | Scientific Article | Published         | No one               | Manual Registration | NVI Publication     |
            | Scientific Article | Published         | No one               | Import              | NVI Publication     |
            | Scientific Article | Draft             | No one               | Manual Registration | Not NVI Publication |
            | Scientific Article | Unpublished       | No one               | Manual Registration | Not NVI Publication |
            | Scientific Article | Unpublished       | No one               | Import              | Not NVI Publication |
            | Scientific Article | Published         | NVI-institution      | Manual Registration | NVI Publication     |
            | Scientific Article | Published         | NVI-institution      | Import              | NVI Publication     |
            | Scientific Article | Draft             | NVI-institution      | Manual Registration | Not NVI Publication |
            | Scientific Article | Unpublished       | NVI-institution      | Manual Registration | Not NVI Publication |
            | Scientific Article | Unpublished       | NVI-institution      | Import              | Not NVI Publication |
            | Scientific Article | Published         | NVA-institution      | Manual Registration | NVI Publication     |
            | Scientific Article | Published         | NVA-institution      | Import              | NVI Publication     |
            | Scientific Article | Draft             | NVA-institution      | Manual Registration | Not NVI Publication |
            | Scientific Article | Unpublished       | NVA-institution      | Manual Registration | Not NVI Publication |
            | Scientific Article | Unpublished       | NVA-institution      | Import              | Not NVI Publication |
            | Scientific Article | Published         | external institution | Manual Registration | NVI Publication     |
            | Scientific Article | Published         | external institution | Import              | NVI Publication     |
            | Scientific Article | Draft             | external institution | Manual Registration | Not NVI Publication |
            | Scientific Article | Unpublished       | external institution | Manual Registration | Not NVI Publication |
            | Scientific Article | Unpublished       | external institution | Import              | Not NVI Publication |
