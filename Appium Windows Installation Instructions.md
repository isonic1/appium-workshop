#Appium Windows Installation

###Get Processor & CPU type.
* Goto Control Panel\System and Security\System
* Processor: Intel or AMD
* System type: 64-bit x64-based or 32-bit x86-based

###Install JAVA
* Open CMD and check java version: `c:\> java -version`
	* If the version is less than 1.8 or the command is not recognized you need to install java.
	* If the version is 1.8 or greater then go to Ruby install.
* Download and install [64-bit](http://download.oracle.com/otn-pub/java/jdk/8u91-b15/jdk-8u91-windows-x64.exe) or [32-bit](http://download.oracle.com/otn-pub/java/jdk/8u91-b15/jdk-8u91-windows-i586.exe)
* Make note of the installation/destination path! You will need this later. e.g. `C:\Program Files\Java\jdk1.8.0_92\bin`

###Install Ruby
* Open CMD and check ruby version: `c:\> ruby -v`
	* If the version is less than 2.2 or the command is not recognized you need to install ruby.
	* If the version is 2.2 or greater then go to Node install.
* Download and install [64-bit](http://dl.bintray.com/oneclick/rubyinstaller/rubyinstaller-2.2.4-x64.exe) or [32-bit](http://dl.bintray.com/oneclick/rubyinstaller/rubyinstaller-2.2.4.exe)
* Make note of the installation/destination path! You will need this later. e.g. `c:\Ruby22-x64\bin`

###Install Node (We need this for paralleization)
* Download and install [64-bit](https://nodejs.org/dist/v4.4.5/node-v4.4.5-x64.msi) or [32-bit](https://nodejs.org/dist/v4.4.5/node-v4.4.5-x86.msi)
* Make note of the **NPM** installation/destination path! You will need this later. e.g. C:\Users\justin\AppData\Roaming\npm

###Install Android SDK
* Click [here](https://dl.google.com/android/installer_r24.4.1-windows.exe) to install SDK.
* Make note of the installation/destination path! You will need this later. e.g. `C:\Users\justin\AppData\Local\Android\sdk`

###Add Environment Variables
* Goto Control Panel\System and Security\System > Advanced system > Edit Variables...
* Under "User variables for **your_user_name**"
* Highlight the Path variable.
	* Click Edit > New
	* Add path for sdk\tools. e.g. C:\Users\justin\AppData\Local\Android\sdk\tools
	* Click OK
	* Add path for sdk\platform-tools. e.g. C:\Users\justin\AppData\Local\Android\sdk\platform-tools
	* Click OK
	* Add path for ruby location. e.g. c:\Ruby22-x64\bin
	* Click OK
	* App path for node NPM locaton. e.g. C:\Users\justin\AppData\Roaming\npm
	* Click OK
* Add ANDROID_HOME variable.
	* Click the New... button.
	* Set name: ANDROID_HOME
	* Set value: C:\Users\justin\AppData\Local\Android\sdk (change this to your sdk path)
	* Click OK
* Add JAVA_HOME variable.
	* Click the New... button.
	* Set name: JAVA_HOME
	* Set value: C:\Program Files\Java\jdk1.8.0_92
	* Click OK
* See example [here](https://dl.dropboxusercontent.com/u/210767372/Environment%20Variables.PNG) for environment variable.
* See example [here](https://dl.dropboxusercontent.com/u/210767372/User%20Path%20Env%20Variables.PNG) for Path variables.
* Close all CMD's and **RESTART PC!**

###Test Environment Variables
* Run `C:\> java -version` in CMD. You should see something close to this `java version "1.8.0_92"` returned.
* Run `C:\> ruby -v` in CMD. You should see something close to this `ruby 2.2.4p230 (2015-12-16 revision 53155)`.
* Run `c:\> emulator -help`. You should see menu options for android emulator manager.
* Run `c:\> npm`. You should see the npm menu options.
* If any of the above is not working check to make sure the install locations are correct and reflected correctly in the path environment variable.

###Install Ruby Development Kit
* Download and install [32-bit](http://dl.bintray.com/oneclick/rubyinstaller/DevKit-mingw64-32-4.7.2-20130224-1151-sfx.exe) or [64-bit](http://dl.bintray.com/oneclick/rubyinstaller/DevKit-mingw64-64-4.7.2-20130224-1432-sfx.exe)
* Extract the files to `c:\ruby-dev-kit`.
* Open CMD and goto `cd c:\ruby-dev-kit`
* Run `ruby dk.rb init`
* Run `ruby dk.rb install`
* Test the installation by running `gem install json --platform=ruby` in CMD. You should see "1 gem installed" if all goes well.
* Find more Devkit installation information [here](https://github.com/oneclick/rubyinstaller/wiki/Development-Kit).

###Update Android SDK
* Run `c:\> android sdk` in CMD.
* Install or update by selecting everything you see marked as installed [here](https://dl.dropboxusercontent.com/u/210767372/SDK%20Manager%201.PNG) and [here](https://dl.dropboxusercontent.com/u/210767372/SDK%20Manager%202.PNG) for API Level 23 and more.
* Click the Install .. packages...
* Accept the license for each package and then click the Install button.

###Verify Platform-tools are installed
* Run `c:\> adb` in CMD. You should see this `Android Debug Bridge version 1.0.32` and additional menu options.

###Create Android Emulator
* For Intel PC's.
	* Open File Explorer and Goto (path to sdk)\sdk\extras\intel\Hardware_Accelerated_Execution_Manager
	* Double click the intelhaxm-android.exe file and install.
* Run `c:\> android avd` in CMD.
* Click Create...
* Set AVD Name: EM1
* Select Device: Nexus S(4.0", 480 x 800:hdpi)
* Select Target: Android 6.0 API Level 23
* For Intel PC's.
	* Select CPU/ABI: Intel Atom (x86)
* For AMD PC's.
	* Select CPU/ABI: ARM (armeabi-v7a)
* Select Skin: Skin with dynamic hardware controls
* Select Emulation Options: Use Host GPU
* The setup should look like [this](https://dl.dropboxusercontent.com/u/210767372/emulator%20setup.PNG) for Intel computers.
* The setup should look like [this](https://dl.dropboxusercontent.com/u/210767372/emulator%20setup%20amd.PNG) for AMD computers.
* Click OK
* Highlight EM1 in AVD menu and click Start and then Launch.
* For Intel PC's.
	* Verify avd output on startup includes:
	* Hax is enabled
	* HAX is working and emulator runs in fast virt mode.
	* Verify emulator fully starts and you see the android home/desktop screen.

###Install Appium IDE
* Download, unzip and install [here](https://bitbucket.org/appium/appium.app/downloads/AppiumForWindows.zip)
* Make note of the installation/destination path. e.g. C:\Program Files (x86)\Appium
* Create desktop icon.

###Install Appium via NPM
* Run `C:\> npm install -g appium-doctor`
* Run `C:\> appium-doctor` (checks setup is correct on machine)
	*  	Verify "info AppiumDoctor Everything looks good, bye!" is displayed.
	* If there are things missing please go back to the install instructions or environment variable setup.
* Run `C:\> npm install -g appium`
	* Verify appium installed correctly by doing `C:\> appium -v`

###Install Sublime (We should all use same editor)
* Download and install [64-bit](https://download.sublimetext.com/Sublime%20Text%20Build%203114%20x64%20Setup.exe) or [32-bit](https://download.sublimetext.com/Sublime%20Text%20Build%203114%20Setup.exe)

###Install Allure Report Framework
* Download and unzip allure [here](https://github.com/allure-framework/allure-core/releases/download/allure-core-1.4.23/allure-commandline.zip)
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

