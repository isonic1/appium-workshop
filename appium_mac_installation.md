#Appium Mac Installation

###Install Xcode or Upgrade to 7.3
* Goto the Mac Appstore and search for Xcode and click the Get button.
* After installation, install the Commandline Tools.
* Open a terminal and run `$ xcode-select --install`

####Install Homebrew
 * Open a terminal and run `$ /usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
`
* See additional install instructions [here](https://github.com/Homebrew/brew/blob/master/share/doc/homebrew/Installation.md#installation) for further details.
* Test install by running `$ brew --version`. You should see something like Homebrew 0.9.5 (git revision 39da; last commit 2016-03-22).

###Install JAVA 
* Open a terminal and check java version: `$ java -version`
	* If the version is less than 1.8 or the command is not recognized you need to install java.
	* If the version is 1.8 or greater then go to Ruby install.
* Download and install [here](http://download.oracle.com/otn-pub/java/jdk/8u91-b14/jdk-8u91-macosx-x64.dmg)

###Install Ruby
* Open a terminal and check ruby version: `$ ruby -v`
	* If the version is less than 2.2 or the command is not recognized you need to install ruby.
	* run `$ \curl -sSL https://get.rvm.io | bash -s stable --ruby` in terminal. This will install RVM (Ruby Version Manager) and install the latest Ruby version.
	* Run `$ rvm list` and see which ruby version was installed. Not the version number for next step.
	* Run `rvm --default use 2.2.?` to set the version as default. e.g. 2.2.4 instead of 2.2.?

###Install Node (We need this for paralleization)
* Open a terminal and run `$ brew install node`.
* Test install by running `$ npm --version`. Verify version 3.7.3 or greater is returned.

###Install Android SDK
* Click [here](https://dl.google.com/android/android-sdk_r24.4.1-windows.zip) to download and unzip.
* Move the `android-sdk-macosx` from ~\Downloads to a better place. e.g. /Users/justin/Library/android-sdk-macosx/sdk
* Make note of where you moved it! You will need this later. 

###Add Environment Variables
* Determine which shell you use. Open a terminal and run `$ echo $SHELL`.
* Based on your shell, you need to edit your profile. e.g. `$ vi ~/.bash_profile or ~/.profile or ~/.zshrc`.
* Add the following variables.
	* export ANDROID_HOME=/Users/**your-user-name**/Library/android-sdk-macosx/sdk
	* export JAVA_HOME=$(/usr/libexec/java_home)
	* Add the Android sdk paths to your existing PATH=$PATH variable. e.g. :/Users/**your-user-name**/Library/android-sdk-macosx/sdk/tools:/Users/**your-user-name**/Library/android-sdk-macosx/sdk/platform-tools:/Users/**your-user-name**/Library/android-sdk-macosx/sdk/build-tools:
* Save profile. `Press shift + :` type `wq!` and press enter.

###Test Environment Variables
* Run `$ java -version` in CMD. You should see something close to this `java version "1.8.0_92"` returned.
* Run `$ ruby -v` in CMD. You should see something close to this `ruby 2.2.4p230 (2015-12-16 revision 53155)`.
* Run `$ adb` in CMD. You should see this `Android Debug Bridge version 1.0.32` and additional menu options.
* Run `$ emulator -help`. You should see menu options for android emulator manager.
* If any of the above is not working check to make sure the install locations are correct and reflected correctly in the path environment variable.

###Update Android SDK 
* Run `$ android sdk` in terminal.
* Install or update by selecting everything you see marked as installed [here](https://dl.dropboxusercontent.com/u/210767372/SDK%20Manager%201.PNG) and [here](https://dl.dropboxusercontent.com/u/210767372/SDK%20Manager%202.PNG) for API Level 23 and more.
* Note: You do not need the Android N (API 23, N preview) so uncheck it if it's selected.
* Click the Install .. packages...
* Accept the license for each package and then click the Install button.

###Create Android Emulator
* Install the Intel HAXM Accellerator software [here](https://software.intel.com/en-us/android/articles/intel-hardware-accelerated-execution-manager-end-user-license-agreement-macosx)
* Run `$ android avd` in terminal.
* Click Create...
* Set AVD Name: EM1
* Select Device: Nexus S(4.0", 480 x 800:hdpi)
* Select Target: Android 6.0 API Level 23
* Select CPU/ABI: Intel Atom (x86)
* Select Skin: Skin with dynamic hardware controls
* Select Emulation Options: Use Host GPU
* The setup should look like [this](https://dl.dropboxusercontent.com/u/210767372/emulator%20setup.PNG).
* Click OK
* Highlight EM1 in AVD menu and click Start and then Launch.
	* Verify avd output on startup includes:
	* Hax is enabled
	* HAX is working and emulator runs in fast virt mode.
	* Verify emulator fully starts and you see the android home/desktop screen.

###Install Appium IDE
* Download and install Appium IDE [here](https://bitbucket.org/appium/appium.app/downloads/appium-1.4.13.dmg)

###Install Appium via NPM
* Run `$ npm install -g appium-doctor`
* Run `$ appium-doctor` (checks setup is correct on machine)
	*  	Verify "info AppiumDoctor Everything looks good, bye!" is displayed.
	* If there are things missing please go back to the install instructions or environment variable setup.
* Run `$ npm install -g appium`
	* Verify appium installed correctly by doing `C:\> appium -v`
	
###Install Sublime (We should all use same editor)
* Download and install [here](https://download.sublimetext.com/Sublime%20Text%20Build%203114.dmg)

###Install Allure Report Framework
* Open terminal and run:
	* `$ brew tap qatools/formulas`
	* `$ brew install allure-commandline`
