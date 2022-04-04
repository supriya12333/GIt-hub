Feature: My Feature
@combine
Scenario: Combine
Given I assign "CAT" to variable "M1" 
And I assign "Training" To variable "M2"
Then I assign variable "res" by combining $M1 $M2
And I echo $res

@Test 
Scenario:
Given I assign "50" to variable "N1" 
And I assign "60" to variable "N2"
If I verify number "N1" is greater than "N2"
Then  I echo $N1
Else I echo $N2
Endif


@if 
Scenario:
Given I assign "80" to variable "n1"
And I assign "70" to variable "n2" 
If I verify number "n1" is less than "n2"
Then I echo "n1 is greater"
Else I echo "n2 is less than"
Endif


@compare
Scenario:
Given I assign "CAT" to variable "var1"
And I assign "cat" to variable "var2"
And I assign "Main" to variable "var3"
And I verify text $var1 is equal to $var2 ignoring case 
And I echo $var1 $var2
And I verify text $var1 is  equal to $var3
And I echo  $var1 $var3

@scenariooutline
Scenario Outline:
Examples:
|p1|p2|
|10|20|
|30|40|
|60|50|

If I verify number <p1> is less than or equal to <p2>
Then I echo "p1 is less"
Else I echo "p1 is greater"
EndIf

@while
Scenario:
Given I assign 15 to variable "var1"
While I verify number $var1 is greater than 20
And I echo $var1
And I increase variable "var1" by 1
And I echo $v1
EndWhile


@list
Scenario:
Given I create list "fruits"
If I verify list "fruits" is empty
Then I echo "list is empty"
EndIf
And I append element "Apple" to list "fruits"
And I prepend element "Mango" to list "fruits"
And I append element "banana" to list "fruits"
And I echo $fruits


@csv
Scenario:
Given I "write to file"
Once i create file "Datasets\file.csv"
Then I append "training" to end of file "Datasets\file.csv"

@write
Scenario:
Given I "write to file"
Given I assign "Datasets\file1.csv" to variable "filepath"
If I verify file "filepath" exists
Then I echo "filepath is presents"
else I create file "filepath"
Endif
Then I append "100" to end of file "filepath"
Then I append "29" to end of file "filepath"


@scenario
Scenario Outline:
Examples:
|P1|p2|
|20|30|
|40|50|

If I verify number <P1> is greater than <p2>
Then I echo "P1 is greater"
And I echo 
Else I echo "p2 is lesser"
EndIf

@combine
Scenario:
Given I assign "CAT" to variable "M1"
And I assign "Training" to variable "M2"
Then I assign variable "res" by combining $M1 $M2
And I echo $res
