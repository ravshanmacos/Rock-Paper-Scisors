# Rock Paper Scisors

![](https://github.com/ravshanmacos/Rock-Paper-Scisors/blob/main/Rock-Paper-Scisors/Resources/RockPaperScisors.png)

## Short Description about app

### UIKit Part

In this simple game app, I spent more time on Storyboard positioning elements and designing it. With help of UIButton, I could get style I want like placing image 
inside and changing border and it's color. Actually I created 3 UIViewController with almost same UI principles. Creating 2 view controller can be a little bit 
chalenging because of dynamically changing 3 buttons according to user selection and its delay.


### Logic Part

First of all, in the main view controller I created IBOutlets of UI Buttons, and then I created circle shapes in the storyboard using UIButtons. When user taps one of these buttons, "performSegue" method is triggered and changes current view with passing chosen button's data. 
In the Result View Controller, app also chooses it's button randomly. I used Swift "scheduledTimer" functionality in order app to work more natural. 
When user wins, result is saved into "UserDefaults" in order to keep percictancy of data.  

