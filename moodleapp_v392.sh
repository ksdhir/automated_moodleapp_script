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