build-android:
    flutter build appbundle

deploy-android: build-android
    cd android && fastlane deploy