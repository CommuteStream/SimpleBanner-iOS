//
//  CSViewController.h
//  SimpleBanner
//
//  Created by David Rogers on 4/28/14.
//  Copyright (c) 2014 CommuteStream. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "GADBannerView.h"
#import <CoreLocation/CoreLocation.h>

//Import CommuteStream SDK
#import "CommuteStream.h"

@interface CSViewController : UIViewController <CLLocationManagerDelegate> {
    GADBannerView *bannerView_;
    CLLocationManager *locationManager;
    CLLocation *currentLocation;
}

@end
