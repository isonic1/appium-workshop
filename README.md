# Appium Workshop

### Clone or download this repo.
* Unzip the repo if you downloaded it.
* Move the project to `C:\Users\**your_user_name**\appium-workshop` for windows.
* Move the project to `~/appium-workshop` for mac.

### Install Appium Workshop Dependencies
* Follow instruction [here](https://github.com/isonic1/appium-workshop/blob/master/Appium%20Windows%20Installation%20Instructions.md) for Windows.
* Follow instruction [here](https://github.com/isonic1/appium-workshop/blob/master/Appium%20Mac%20Installation%20Instructions.md) for mac.

### Install Ruby Gems Dependencies
* Open a terminal or shell window.
* Goto `cd appium-workshop`
* Install bundler `gem install bundler`
* Run: `bundle install`

### Run the sample test
* Double click the Appium Desktop icon on windows desktop or run from applications folder for mac.
* Click the Start Server button. You should see a "The server is running" message in green. 
* Start your EM1 android emulator you created in the setup.
   * In terminal, run: `$ $ANDROID_HOME/tools/emulator -avd EM1`
* Open another CMD or terminal and goto `cd C:\Users\your_user_name\appium-workshop\example` or `cd ~/appium-workshop/example`.
* Then run `$ rspec --format documentation test-appium.rb`
* You should see "1 example, 0 failures" if everything worked correctly.
* Validate Allure report:
   * In the example dir, run: `$ allure report generate output/allure`
   * `$ allure report open`
   * A browser should open automatically with the Allure report of the last test run.
   * Close the browser and CTRL-C to exit out of allure server.

### Workshop Slides
* Open the interactive workshop slides [here](http://slides.com/justinison/deck-2)