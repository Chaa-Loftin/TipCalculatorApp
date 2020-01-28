# TipCalculatorApp

This is the third IOS application that I have built.  The first two apps used static, non responsive themes
and elements.  I created this application with two goals in mind: To create an application that incorporated 
the use of responsive elements through the use of constraints, auto layout, stack views, etc. The second was
to develop an application that utilized switch components, segmented controllers, and  a keyboard with a button. 

Upon opening the application the primary theme will be set to "light". This can be changed by flipping the
switch component that is located on the header view.  The user will enter a bill amount into the text field.
I have purposely developed this applcation with constraints on which data types can be inserted into the 
text field.  Only number values can be inserted into the text field, which will be subesequently converted
into double values automatically. 

The tip percentage is determined by the user.  The segmented control element cannot be changed until the user 
has inserted the correct data type into the text field.  Once the correctness of the data type has been determined,
the user can then select one of three tip percentages.  

Also, when clicking on the text field box labeled "bill amount", one will notice that a keyboard will open up
and this keyboard will also have a button on top of it labeled as "calculate". This button converts the double
value that was inserted into the text field into a tip percentage.  The tip amount is then determined by
an internal function that uses the pre-selected tip percentage.  The keyboard drops down into a hidden
view whenever the calculate button is pressed as well.

The tip amount and total bill amount are displayed in the output card view towards the bottom of the root view.
If the user feels the need to start from scratch, he or she can press the "reset button".  Which will reset 
all of the textfield and label values that display any number based information!
