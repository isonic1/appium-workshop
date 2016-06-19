module Helpers
  class << self

    def kill_adb_pid pid
      if OS.mac?
        `kill #{pid} >> /dev/null 2>&1`
      elsif OS.windows?
        system("taskkill /f /pid #{pid} > NUL")
      end
    end

    def recording_setup udid
      if OS.mac?
        %x(adb -s #{udid} shell 'mkdir /sdcard/recordings' >> /dev/null 2>&1)
        spawn "adb -s #{udid} shell rm /sdcard/recordings/*  >> /dev/null 2>&1"
      elsif OS.windows?
        %x(adb -s #{udid} shell mkdir /sdcard/recordings > NUL)
        spawn "adb -s #{udid} shell rm /sdcard/recordings/* > NUL"
      end
    end

    def start_video_record udid
      if udid.include? "emulator"
        puts "\nNot video recording. Cannot video record on #{udid} emulator!\n\n"
        return
      else
        recording_setup udid
        puts "\nRecording! You have a maximum of 180 seconds record time...\n"
        if OS.mac?
          pid = spawn "adb -s #{udid} shell screenrecord --size 720x1280 /sdcard/recordings/video-#{udid}.mp4", :out=> "/dev/null"
        elsif OS.windows?
          pid = spawn "adb -s #{udid} shell screenrecord --size 720x1280 /sdcard/recordings/video-#{udid}.mp4"
        end
        ENV["VIDEO_PID"] = pid.to_s
      end
    end

    def stop_video_record udid
      return if udid.include? "emulator"
      kill_adb_pid ENV["VIDEO_PID"]
      sleep 5 #delay for video to complete processing on device...
      if OS.mac?
        spawn "adb -s #{udid} pull /sdcard/recordings/video-#{udid}.mp4 #{ENV["PROJECT_DIR"]}/output"
      elsif OS.windows?
        spawn "adb -s #{udid} pull /sdcard/recordings/video-#{udid}.mp4 #{ENV["PROJECT_DIR"]}/output > NUL"
      end
    end

    def start_logcat udid
      pid = spawn("adb -s #{udid} logcat -v long", :out=>"#{ENV["PROJECT_DIR"]}/output/logcat-#{udid}.log")
      ENV["LOGCAT_PID"] = pid.to_s
    end

    def stop_logcat
      kill_adb_pid ENV["LOGCAT_PID"]
    end
  end
end

module Kernel
  def helper
    Helpers
  end
end