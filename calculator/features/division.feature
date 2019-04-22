# language: en
Feature: Division

  Scenario Outline: Dividing two numbers
    Given the input is "<input>"
    When the calculator is run
    Then the output is "<output>"

    Examples:
    | input | output  |
    | 2/2   | 1       |
    | 98/2  | 49      |