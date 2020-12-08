Feature: Test if resources have modules

Scenario Outline: Check for modules
  Given I have <resource> defined
  Then The scenario should fail

  Examples:
    | resource |
    | google_project_iam_member      |