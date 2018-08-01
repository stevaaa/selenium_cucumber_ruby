Feature: Division
	In order to avoid silly mistakes
	Cashiers must be able to calculate a fraction

	Scenario Outline: divide two numbers
		Given I have entered <input_1> into the calculator
		And I have entered <input_2> into the calculator
		When I press <button>
		Then the result should be <output> on the screen

		Examples:
		|	input_1	|	input_2	|	button	|	output	|
		|	20		|	30		|	divide	|	0.6666666666666666		|