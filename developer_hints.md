#######################################################
#######           Flutter commands              #######
#######################################################

/// Analyze dependencies to find which ones can be upgraded.
/// This runs the "pub" tool in a Flutter context.
# flutter pub outdated -h

/// Update with compatible dependencies
# flutter pub upgrade

/// Update with potentially breaking changes
# flutter pub upgrade --major-versions

/// Update specific package
# dart pub upgrade <package_name>

#######################################################
#######             iOS Issues                  #######
#######################################################

// The sandbox is not in sync with the Podfile.lock. Run 'pod install' or update your CocoaPods installation.

# remove old pod
# re-install


#######################################################
#######           Build Runner Command          #######
#######################################################
 
 # flutter pub run build_runner build --delete-conflicting-outputs

#######################################################
#######                App Info                 #######
#######################################################

## App Bundles :

         ** IOS **                   |          ** Android **
 ------------------------------------------------------------------
      com.moltaqa.base_app            |     com.moltaqa.base_app


## BUILD APK && IPA: 
 - For IOS :
    flutter build ipa

 - For Android :
    flutter build apk --release

 - For Android [Build App Bundle] :
    flutter build appbundle


#######################################################
#######                   SHA1                  #######
#######################################################

- open gradlew in terminal
- write command [./gradlew signingReport]


#######################################################
#######             Flutter Fire                #######
#######################################################

## Flutter Fire Config Path [export PATH="$PATH":"$HOME/.pub-cache/bin"]
## Flutter Fire Apps Configs:
    firebase login
    dart pub global activate flutterfire_cli
    export PATH="$PATH":"$HOME/.pub-cache/bin"
    
    flutterfire config \
    --project=sahet-altahdi \

