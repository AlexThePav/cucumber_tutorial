Feature: Addition

  Scenario Outline: Adding two numbers
    Given the input is "<input>"
    When the calculator is run
    Then the output is "<output>"

    Examples:
    | input | output  |
    | 2+2   | 4       |
    | 98+1  | 99      |