# Appium Windows Installation

### Get Processor & CPU type.
* Goto Control Panel\System and Security\System
* Processor: Intel or AMD
* System type: 64-bit x64-based or 32-bit x86-based

***If you have AMD chipped PC***
* Follow the instructions [here](https://docs.genymotion.com/Content/01_Get_Started/Installation.htm) to install Genymotion emulator. Choose either 64-bit or 32-bit.
* Or... bring your own android device to the workshop and a micro-usb cable.

### Powershell
* Note: We will be using powershell running as an administrator exclusively.
   * You can run it by searching for it in the apps or the search bar. 

### Install Chocolatay
* Open a Powershell terminal
   * Search for powershell in windows.
   * Right click powershell icon and select run as administrator.
   * In powershell terminal, run: `Set-ExecutionPolicy AllSigned; iex ((New-Object System.Net.WebClient).DownloadString('https://chocolatey.org/install.ps1'))`
   * See [here](https://chocolatey.org/install) for more install instructions.
* Or if chocolatay is already installed, update to the latest by running: `choco install chocolatey`
* Close powershell terminal.

### Install JAVA JDK8 
* Open Powershell as Administrator and check java version: `c:\> java -version`
	* If the version is less than 1.8 or the command is not recognized you need to install java.
	* Open a powershell terminal as administrator and run: `choco install jdk8 --force`
   * Accept all prompts with Yes.
* Close powershell terminal.
* Note: You may need to remove `C:\ProgramData\Oracle\Java\javapath` from your PATH variable.
* Note: The version of Java that is installed. The most recent as of today is jdk1.8.0_144. You will need this when adding the JAVA_HOME variable.

### Install Ruby
* Open Powershell as administrator and check ruby version: `c:\> ruby -v`
	* If the version is less than 2.3 or the command is not recognized you need to install ruby.
	* If the version is 2.3 or greater then go to Node install.
* Install Ruby with chocolatey, run: `choco install ruby`
   * Accept all prompts with Yes.
* Close powershell terminal.
   
### Install Ruby DevKit
* Open Powershell as administrator.
* In shell, run: `choco install ruby2.devkit`
* Accept all prompts with Yes.
* Close powershell terminal.

### Install Node (We need this for paralleization)
* Open Powershell as administrator.
* In shell, run: `choco install nodejs`
* Accept all prompts with Yes.
* Validate install by running: `node -v`. Should see v0.12.9 or greater.
* Validate NPM is installed by running: `npm -v`. Should see 1.4.6 or greater.
* Close powershell terminal.

### Install Android Studio
* Open Powershell as administrator.
* In shell, run: `choco install androidstudio`
* Close powershell terminal.

### Finish Android Studio setup
* Search for Android Studio in your apps and double click the icon.
* Select "I do not have a previous version of studio or I do not want to import my settings" and click OK button.
* Click Next.
* Select Standard Installation and click the Next button.
* Click the Finish button.
   * This will start downloading remaining Android 8.0 components. This will take a while...
* Accept popup dialog to allow changes to your device.
* Click the Finish button.

### Install Android 6.0 SDK 23
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
* Add ANDROID_HOME variable.
	* Click the New... button.
	* Set name: ANDROID_HOME
	* Set value: C:\Android\android-sdk
	* Click OK
* Add JAVA_HOME variable.
	* Click the New... button.
	* Set name: JAVA_HOME
	* Set value: C:\Program Files\Java\jdk1.8.0_144
	* Click OK
* Close all shell windows and **RESTART PC!**

### Test Environment Variables
* Open a powershell terminal as administrator.
* Run `java -version` in CMD. You should see something close to this `java version "1.8.0_92"` returned.
* Run `ruby -v` in CMD. You should see something close to this `ruby 2.4.1p111` or greater.
* Run `emulator -help`. You should see menu options for android emulator manager.
* Run `npm`. You should see the npm menu options.
* Run `adb` in CMD. You should see this `Android Debug Bridge version 1.0.39` and additional menu options.
* If any of the above is not working check to make sure the install locations are correct and reflected correctly in the path environment variable.

### Create Android Emulator
* Open a powershell window and run as administrator.
* Run `android create avd -n EM1 -k "system-images;android-23;google_apis;x86"`
* Enter NO to not create a custom hardware profile.
* Run the emulator: `emulator -avd EM1`
	* Verify avd output on startup includes:
	* Hax is enabled
	* HAX is working and emulator runs in fast virt mode.
	* Verify emulator fully starts and you see the android home/desktop screen.
* Note: Emulator can also be created via the AVD Manager IDE inside of Android Studio. However, you would need to create a new project or import one to see this menu option.

### Install Appium Desktop
* Download, unzip and install [here](https://github.com/appium/appium-desktop/releases/download/v1.2.1/appium-desktop-Setup-1.2.1.exe)
* Make note of the installation/destination path. e.g. C:\Program Files (x86)\Appium
* Create desktop icon.

### Install Appium Doctor
* Open a powershell terminal
* Run `npm install -g appium-doctor`
* Run `appium-doctor` (checks setup is correct on machine)
	*  	Verify "info AppiumDoctor Everything looks good, bye!" is displayed.
	* If there are things missing please go back to the install instructions or environment variable setup.

### Install Appium via NPM
* Open a powershell terminal.
* Run `npm install -g appium`
	* Verify appium installed correctly by doing `appium -v`. You should see version 1.6.5 or greater.
* Note: You might get an error when install appium with NPM. If so, open a powershell window as administrator. e.g. search for powershell in start menu, then right click powershell and select run as administrator.
	* In powershell run: `Set-ExecutionPolicy Unrestricted -Scope CurrentUser -Force`
	* Run: `npm install -g npm-windows-upgrade`
	* Run: `npm-windows-upgrade`
	* Run: `npm install -g appium`
* Note: Your machine might complain that the PYTHON environment variable is missing. Not sure why this occurs but could be related to WinAppDriver addition to appium. However, Appium Node is still installed and should not intefer with our use.

### Install Sublime (We should all use same editor)
* Download and install [64-bit](https://download.sublimetext.com/Sublime%20Text%20Build%203143%20x64%20Setup.exe) or [32-bit](https://download.sublimetext.com/Sublime%20Text%20Build%203143%20Setup.exe)

### Install Allure Report Framework
* Open a powershell terminal. 
* Run: `npm install -g allure-commandline --save-dev`
* Test allure works. Run: `allure` in shell. You should get allure menu options returned.
* Click [here](http://wiki.qatools.ru/display/AL/Allure+Commandline) for more install information.

