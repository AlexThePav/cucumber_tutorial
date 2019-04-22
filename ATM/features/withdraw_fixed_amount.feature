Feature: Withdraw Fixed Amount
  
  The "Withdraw Cash" menu contains several fixed amounts to
  speed up transactions for users.

  Scenario: Successful login with PIN
    Then I should see the main menu
      
  Scenario Outline: Withdraw fixed amount
    # Given I have authenticated with the correct PIN
    Given I have <Balance> in my account
    When I choose to withdraw the fixed amount of <Withdrawal>
    Then I should <Outcome>
    And the balance of my account should be <Remaining>
    
    Examples: Successful withdrawal
    | Balance | Withdrawal | Remaining | Outcome                |
    | $500    | $50        | $450      | receive $50 cash       |
    | $500    | $200       | $300      | receive $200 cash      |

    Examples: Attempt to withdraw too much
    | Balance | Withdrawal | Remaining | Outcome                |
    | $100    | $200       | $100      | see an error message   |
    | $0      | $50        | $0        | see an error message   |