# Appium Workshop Windows

###Install Appium Dependencies
* Follow instruction [here](https://github.com/isonic1/appium-workshop/blob/master/windows/Appium%20Windows%20Installation%20Instructions.md)

###Clone or download this repo.
* Unzip the repo if you downloaded it.
* Then move the **windows** folder to `C:\Users\your_user_name\appium-workshop`

###Install Ruby Gems Dependencies
* Goto `cd C:\Users\your_user_name\windows`
* Run `C:\> bundle install`

###Run the sample test
* Double click the Appium icon on the desktop.
* Click the Play/Start button.
* Open CMD and run `C:\> emulator -avd EM1` and wait for the emulator to fully start up.
* Open another CMD and goto `cd C:\Users\your_user_name\windows`
* Run `C:\> ruby test-appium.rb`
* Verify the test script completed and no failues are displayed.