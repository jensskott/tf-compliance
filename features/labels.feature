Feature: Label requirements

Scenario: Ensure all resources have labels
    Given I have resource that supports labels defined
    Then it must contain labels
    And its value must not be null

Scenario Outline: Ensure that specific labels are defined
    Given I have resource that supports labels defined
    When it has labels
    Then it must contain <labels>
    And its value must match the "<value>" regex

    Examples:
        | labels      | value                   |
        | team        | ^(team1\|team2\|team3)$ |
