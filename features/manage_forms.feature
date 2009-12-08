Feature: Manage Forms
  In order to make this site useful
  A user should be able to manage some forms
  
  Scenario: Forms list
    Given I am logged in
    And I have forms titled Contact, Estimate
    When I go to the list of forms
    Then I should see "Contact"
    And I should see "Estimate"
    
  Scenario: New form link from form list works
    Given I am logged in
    When I go to the list of forms
    Then I should see "New Form"
    
  Scenario: User creates a form successfully
    Given I am logged in
    When I go to the new form page
    And I fill in "Name" with "Feedback"
    And I press "Create Form"
    Then I should see "The form Feedback was created successfully."
    
  Scenario: User tries to create duplicate named forms
    Given I am logged in
    When I have a form titled Contact
    And I go to the new form page
    And I fill in "Name" with "Contact"
    And I press "Create Form"
    Then I should see "You already have a form named Contact."
    
  Scenario: User gives the form a new name
    Given I am logged in
    And I have a form titled Contact
    When I open the form titled Contact
    And I follow "Edit this form"
    And I fill in "Name" with "Estimate"
    And I press "Update Form"
    Then I should see "Successfully updated form."
    
  Scenario: User tries to rename a form to a name that already exists
    Given I am logged in
    And I have forms titled Contact, Estimate
    When I open the form titled Contact
    And I follow "Edit this form"
    And I fill in "Name" with "Estimate"
    And I press "Update Form"
    Then I should see "You already have a form named Estimate."  
  
  @selenium
  Scenario: User destroys a form successfully
    Given I am logged in
    And I have forms titled Contact, Estimate
    When I go to the list of forms
    And I follow "Contact"
    And I follow "Delete this form"
    And I press "Ok"
    Then I should see "The form Contact was successfully deleted."