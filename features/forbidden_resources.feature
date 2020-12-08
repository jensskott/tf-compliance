Feature: Test for forbidden resource

Scenario Outline: Check for resource that is not allowed to be created
  Given I have <resource> defined
  Then The scenario should fail

  Examples:
    | resource                        |
    | google_project_iam_policy       |