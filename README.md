## Introduction
SimpleBanner-iOS provides a basic example of how to use the CommuteStream SDK for iOS apps.

## Requirements:
- iOS SDK 7.1 or higher
- Google AdMob Ads SDK for iOS
- CommuteStream SDK for iOS
- Working AdMob Ad ID
- Xcode 5.0

## Getting started with SimpleBanner in Xcode

#### Download or clone SimpleBanner from GitHub.
1. https://github.com/CommuteStream/SimpleBanner-iOS
2. Double-click the SimpleBanner.xcodeproj file

#### Make sure you're compiling against at least iOS 7.1 SDK and a Deployment Target of at least 6.0 
1. Click on the SimpleBanner Project Icon in Project Navigator
2. Select the SimpleBanner Target
3. Under General set your Deployment Target to at least 6.0
4. Under Build Settings set your Base SDK to 'Latest 7.1 iOS (7.1)'

#### Add the Google AdMob SDK.
1. Download the latest Google Ad Mobs SDK
2. Add the files to your project

#### Add the CommuteStream Static Library to the project.
1. Download the Static Library files from http://commutestream.com/downloads/iOS_CommuteStream_SDK.zip
2. Add the 'include' folder and the 'libCommuteStream.a' file to the project

#### Set your Header Search Paths
1. Select the SimpleBanner target
2. In Build Settings, go to Header Search Paths and add '$SOURCE_ROOT/include'

#### Set your Other Linker Flags
1. Also in your target's Build Settings, go to Other Linker Flags and add '-ObjC'
 
#### Insert your AdMob Ad Unit ID into the application.
1. Log into the AdMob interface (https://apps.admob.com/).
2. Setup a new **+ New ad unit** or find an Ad Unit ID that you already have setup.
3. In CSViewController.m, replace "INSERT_YOUR_ADMOB_AD_UNIT_ID_HERE" with the valid Ad unit ID.

#### Add CommuteStream as an AdMob ad network
1. Go to http://commutestream.com/publisherinterface/app. After signing in you will be provided with a CommuteStream Ad Unit ID. Leave the browser window open, as we will need this ID in step 8 below.
2. Log into the AdMob interface (https://apps.admob.com/).
3. Click on **Monetize** tab of main menu. 
4. Click on **All apps** in left column, then select the app that contains the ad unit you are using.
5. On the right side of the screen click **Edit mediation** link next to the ad unit you are using.
6. Click **+ New ad network**
7. Click **+ Custom Event**, then enter the following in the three fields that pop up, and click Continue:

        Class Name: CSCustomBanner
        Label: CommuteStream
        Parameter: <Your Ad Unit ID obtained in step 1>
        
8. Adjust the Default eCPM for CommuteStream to be the largest amount. Since we pay you the most you will want our ads to have first priority.


