echo -e "MoodleMobile App 3.9.2 build starting...\n"

appname=$1
platform=""

# check platform type
if [[ $2 = "ios" ]] || [[ $2 = "android" ]] || [[ $2 = "" ]]
then
    platform=$2
else
  echo "Invalid Platform: ${platform}"
  exit 1
fi


# check Firebase Config  files
if [[ ! -f google-services.json ]] || [[ ! -f GoogleService-Info.plist ]]
then
    echo -e "\e[1;31mError: Firebase Android and iOS config files not found!\n\e[0;0m"
    # exit 1
fi

# warn if keystore not found
if [[ ! -f my-release-key.keystore ]]
then
    #echo -e "\e[1;31mError: command not found\e[0;0m"
    echo -e "\e[33mWarning: my-release-key.keystore file Not Found!\e[0m\nYou may need it to generate .apk file\n"

fi

echo -e "\nInstalling packages..."
set -x

npm install

set +x

# check if cordova platforms exist and remove it
## ugly hack
if [ -d "./platforms" ]
then
    rm -rf ./platforms
    echo -e "\nPlaforms deleted!"
fi


set -x
# add Cordova Android and iOS platforms
echo -e "\nAdding Cordova Platforms..."

ionic cordova platform add android
ionic cordova resources android --force
ionic cordova platform add ios
ionic cordova resources ios --force

set +x

# move files

echo -e "\nCopying files among Platforms"

cp -v ./platforms/android/app/src/main/AndroidManifest.xml ./platform/ios/
cp -v ./platforms/ios/${appname}/*.plist ./platform/ios/
cp -v ./platforms/ios/${appname}/Resources/GoogleService-Info.plist ./platform/ios/


echo -e "\nBuilding using Platforms"

set -x

npm run setup
npm run ionic:build -- --prod

set +x

echo -e "\nReleasing build"

set -x

if [ platform = "" ]
then
    ionic cordova build android --release
    ionic cordova build ios --release
else
    ionic cordova build ${platform} --release
fi

set +x