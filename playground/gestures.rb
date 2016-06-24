long press:
location = id("Gesture Action Pad").location.to_h
location.merge!(fingers: 1, duration: 2000)
Appium::TouchAction.new.long_press(button).release.perform

a tap:
location = id("Gesture Action Pad").location.to_h
Appium::TouchAction.new.tap(location).release.perform

Swipe Up:
start = id("Gesture Action Pad").location.to_h
finish = text("Gestures").location.to_h
Appium::TouchAction.new.press(start).wait(200).move_to(finish).release.perform

Swipe Left:
start = text("Submit Button").location.to_h
finish = text("Gestures").location.to_h
Appium::TouchAction.new.press(start).wait(200).move_to(finish).release.perform

Swipe Down:
Move to Pull To Refresh tab:
start = text("Pull To Refresh").location.to_h
start[:y] = start[:y] + 100
finish = id("com.amazonaws.devicefarm.android.referenceapp:id/input_refresh_display").location.to_h
Appium::TouchAction.new.press(start).wait(2000).move_to(finish).release.perform