# automated_moodleapp_script
### Instructions
Run the script after installing all the dependencies and making necessary changes to build your custom moodle app.
The script installs ionic-cordova platforms (iOS and Android) and uses them to release builds.

The following commands shows examples:
``` sh
# builds android application (requires Android Studio)
$ ./moodleapp_v392.sh "appname" android

# builds ios application (requires XCode/MacOS)
$ ./moodleapp_v392.sh "appname" ios

# builds both android and ios application (requires XCode/MacOS)
$ ./moodleapp_v392.sh "appname"
```
After the builds are released you may follow necessary steps in order to generate **.apk** or **upload your iOS build** to Apple App developer account using XCode as shown here: https://ionicframework.com/docs/v1/guide/publishing.html
