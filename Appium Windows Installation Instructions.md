# Appium Windows Installation

### Get Processor & CPU type.
* Goto Control Panel\System and Security\System
* Processor: Intel or AMD
* System type: 64-bit x64-based or 32-bit x86-based

***If you have AMD chipped PC***
* Follow the instructions [here](https://docs.genymotion.com/Content/01_Get_Started/Installation.htm) to install Genymotion emulator. Choose either 64-bit or 32-bit.
* Or... bring your own android device to the workshop and a micro-usb cable.

### Install JAVA JDK 8 (Java SE Development Kit)
* Open CMD and check java version: `c:\> java -version`
	* If the version is less than 1.8 or the command is not recognized you need to install java.
	* If the version is 1.8 or greater then go to Ruby install.
* Click [here](http://www.oracle.com/technetwork/java/javase/downloads/jdk8-downloads-2133151.html)
* Select the Accept License Agreement radio button.
* Click the "jdk-8u144-windows-x64.exe" link for 64-bit machine.
* Click the "jdk-8u144-windows-i586.exe" link for 32-bit machine. 
* Make note of the installation/destination path! You will need this later. e.g. `C:\Program Files\Java\jdk1.8.0_92`

### Install Ruby
* Open CMD and check ruby version: `c:\> ruby -v`
	* If the version is less than 2.2 or the command is not recognized you need to install ruby.
	* If the version is 2.2 or greater then go to Node install.
* Download and install [64-bit](http://dl.bintray.com/oneclick/rubyinstaller/rubyinstaller-2.2.4-x64.exe) or [32-bit](http://dl.bintray.com/oneclick/rubyinstaller/rubyinstaller-2.2.4.exe)
* Make note of the installation/destination path! You will need this later. e.g. `c:\Ruby22-x64\bin`

### Install Node (We need this for paralleization)
* Download and install [64-bit](https://nodejs.org/dist/v8.5.0/node-v8.5.0-x64.msi) or [32-bit](https://nodejs.org/dist/v8.5.0/node-v8.5.0-x86.msi)
* Make note of the **NPM** installation/destination path! You will need this later. e.g. C:\Users\yourUser\AppData\Roaming\npm

### Install Android Studio
* Click [here](https://developer.android.com/studio/index.html#win-bundle) to download Android Studio.
* Check the Terms and Conditions checkbox and then click the DOWNLOAD ANDROID STUDIO FOR WINDOWS button.
* Then select the RUN button to start the installation after download.
* Select Yes to allow this app to makes changes to your device.
* Click the Next button.
* On the Choose Components dialog make sure Android SDK and Android Virtual Device is checked.
* Click the Next button on the Choose Components dialog.
* Click the "I Agree" button on the License Agreement.
* Set the Android Studio path to: `C:\Program Files\Android\Android Studio`. This should be the default location.
* Set the Android SDK path location to: `C:\Users\yourUser\AppData\Local\Android\sdk`. This should be the default location.
* Set Android Studio for the name of the Start Menu Folder.
* Click the Install button. This will take a while...
* Click the Next button.
* Click the Finish button to start Android Studio.

### Install Android 6.0 SDK 23
* In Android Studio Welcome dialog.
* Click the Configure button. It's on the lower right side of the Android Studio welcome dialog.
* click SDK Manager in the configuration dropdown.
* Select Android 6.0 (Marshmallow) SDK.
   * Why Android 6.0? It's the most common SDK version used throughout the world and is a good starting point until you get more comfortable with mobile automation. See [here](https://www.appbrain.com/stats/top-android-sdk-versions)!
* Click the "Show Package Details" checkbox on lower right.
* Check (or make sure they are checked) the following SDK dependencies to install:
   * Android SDK Platform 23
   * Sources for Android 23
   * Intel x86 Atom System Image.
   * Intel x86 Atom_64 System Image.
   * Google API's Intel x86 Atom System Image
   * Google API's Intel X86 Atom_64 System Image
* Click the OK button
* Click the OK button in Confirm Change dialog.
* On the next screen click the Accept radio button on the License Agreement.
* Click the Next button to install SDK 23 components. This will take a while...
* Click the Finish button.

### Add Environment Variables
* Goto Control Panel\System and Security\System > Advanced system > Edit Variables...
* Under "User variables for **your_user_name**"
* Highlight the Path variable.
	* Click Edit > New
	* Add path for sdk\tools. e.g. C:\Users\youUser\AppData\Local\Android\sdk\tools (change this to your sdk path)
	* Click OK
	* Add path for sdk\platform-tools. e.g. C:\Users\youUser\AppData\Local\Android\sdk\platform-tools (change this to your sdk path)
	* Click OK
	* Add path for ruby location. e.g. c:\Ruby22-x64\bin
	* Click OK
	* App path for node NPM locaton. e.g. C:\Users\youUser\AppData\Roaming\npm
	* Click OK
* Add ANDROID_HOME variable.
	* Click the New... button.
	* Set name: ANDROID_HOME
	* Set value: C:\Users\youUser\AppData\Local\Android\sdk (change this to your sdk path)
	* Click OK
* Add JAVA_HOME variable.
	* Click the New... button.
	* Set name: JAVA_HOME
	* Set value: C:\Program Files\Java\jdk1.8.0_92
	* Click OK
* See example [here](https://www.dropbox.com/s/i9bncj8rni886mb/Environment%20Variables.PNG?dl=0) for environment variable.
* See example [here](https://www.dropbox.com/s/4nmzg085h907ub3/User%20Path%20Env%20Variables.PNG?dl=0) for Path variables.
* Close all CMD's and **RESTART PC!**

### Test Environment Variables
* Run `C:\> java -version` in CMD. You should see something close to this `java version "1.8.0_144"` or greater returned.
* Run `C:\> ruby -v` in CMD. You should see something close to this `ruby 2.2.4` or greater.
* Run `c:\> emulator -help`. You should see menu options for android emulator manager.
* Run `c:\> npm`. You should see the npm menu options.
* If any of the above is not working check to make sure the install locations are correct and reflected correctly in the path environment variable.

### Install Ruby Development Kit
* Download and install [32-bit](http://dl.bintray.com/oneclick/rubyinstaller/DevKit-mingw64-32-4.7.2-20130224-1151-sfx.exe) or [64-bit](http://dl.bintray.com/oneclick/rubyinstaller/DevKit-mingw64-64-4.7.2-20130224-1432-sfx.exe)
* Extract the files to `c:\ruby-dev-kit`.
* Open CMD and goto `cd c:\ruby-dev-kit`
* Run `ruby dk.rb init`
* Run `ruby dk.rb install`
* Test the installation by running `gem install json --platform=ruby --source http://rubygems.org` in CMD. You should see "1 gem installed" if all goes well.
* Find more Devkit installation information [here](https://github.com/oneclick/rubyinstaller/wiki/Development-Kit).

### Update Android SDK
* Run `c:\> android sdk` in CMD.
* Install or update by selecting everything you see marked as installed [here](https://dl.dropboxusercontent.com/u/210767372/SDK%20Manager%201.PNG) and [here](https://dl.dropboxusercontent.com/u/210767372/SDK%20Manager%202.PNG) for API Level 23.
* Note: We are using ***API Level 23*** for this workshop!
* Click the Install .. packages...
* Accept the license for each package and then click the Install button.

### Verify Platform-tools are installed
* Run `c:\> adb` in CMD. You should see this `Android Debug Bridge version 1.0.32` and additional menu options.

### Create Android Emulator
* Run `android create avd -n EM1 -k "system-images;android-23;google_apis;x86"` in CMD.
* Enter NO to not create a custom hardware profile.

### Run Emulator
* Run the emulator: `emulator -avd EM1`
* Note: You might see an error like this "[7264]:ERROR:./android/qt/qt_setup.cpp:28:Qt library not found at ..\emulator\lib64\qt\lib". It's a known problem with the latest Android SDK. There are two ways to get around this. 
   * 1. Open a powershell terminal and run the command in there. 
   * 2. Run it from the sdk/tools directory. e.g. cd C:\Users\yourUser\AppData\Local\Android\sdk and then `emulator -avd EM1`
* Verify avd output on startup includes:
   * Hax is enabled
   * HAX is working and emulator runs in fast virt mode.
* Verify emulator fully starts and you see the android home/desktop screen.
* Note: Emulator can also be created via the AVD Manager IDE inside of Android Studio. However, you would need to create a new project or import one to see this menu option.

### Install Appium Desktop
* Download, unzip and install [here](https://github.com/appium/appium-desktop/releases/download/v1.2.1/appium-desktop-Setup-1.2.1.exe)
* Make note of the installation/destination path. e.g. C:\Program Files (x86)\Appium
* Create desktop icon.

### Install Appium Doctor via NPM
* Run `C:\> npm install -g appium-doctor`
* Run `C:\> appium-doctor` (checks setup is correct on machine)
	*  	Verify "info AppiumDoctor Everything looks good, bye!" is displayed.
	* If there are things missing please go back to the install instructions or environment variable setup.

### Install Appium via NPM
* Run `C:\> npm install -g appium`
	* Verify appium installed correctly by doing `C:\> appium -v`
* Note: You might get an error when install appium with NPM. If so, open a powershell window as administrator. e.g. search for powershell in start menu, then right click powershell and select run as administrator.
	* In powershell run: `Set-ExecutionPolicy Unrestricted -Scope CurrentUser -Force`
	* Run: `npm install -g npm-windows-upgrade`
	* Run: `npm-windows-upgrade`
	* Run: `npm install -g appium`
* Note: Your machine might complain that the PYTHON environment variable is missing. Not sure why this occurs, though. However, the Appium binary is still installed and should not intefer with our use.

### Install Sublime (We should all use same editor)
* Download and install [64-bit](https://download.sublimetext.com/Sublime%20Text%20Build%

### Install Allure Report Framework
* Download and unzip allure [here](https://github.com/allure-framework/allure1/releases/download/allure-core-1.5.0/allure-commandline.zip)
* Create a allure directory. Run `mkdir C:\allure`
* Move all allure folders/files from Downloads to C:\allure.
* Add environment variable for allure.
	* Goto Control Panel\System and Security\System > Advanced system > Edit Variables...
	* Under "User variables for **your_user_name**"
	* Highlight the Path variable.
	* Click Edit > New
	* Add path for allure executables. e.g. C:\allure\bin
	* Click OK
* Close shell windows and open a new one.
* Test allure works. Run `C:\ allure` in shell. You should get allure menu options returned.
* Click [here](http://wiki.qatools.ru/display/AL/Allure+Commandline) for more install information.

