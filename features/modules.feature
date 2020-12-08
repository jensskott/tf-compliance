Feature: Test if resources have modules

Scenario Outline: Check for modules
  Given I have <resource> defined
  Then Its value must not match the "<value>" regex

  Examples:
    | resource | value |
    | google_project_iam_member      | ^(module)+|