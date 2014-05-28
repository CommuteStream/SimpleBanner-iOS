//
//  CSViewController.m
//  SimpleBanner
//
//  Created by David Rogers on 4/28/14.
//  Copyright (c) 2014 CommuteStream. All rights reserved.
//

#import "CSViewController.h"

/* The CommuteStream ad network is specifically designed for apps that
 * are used in an around mass transit systems. This, of course is not
 * a transit app, and serves only as a basic example of how CommuteStream
 * ties in with AdMod to serve ads.
 */

@interface CSViewController ()

@end

@implementation CSViewController



- (void)viewDidLoad
{
    [super viewDidLoad];
    
    // Creates the AdMob Request
    GADRequest *myRequest = [GADRequest request];
    
    // Set up the location manager to send location info to both AdMob and CommuteStream.
    // Only use this if your users are using their GPS for a feature of your app
    locationManager = [[CLLocationManager alloc ] init];
    [locationManager setDesiredAccuracy:kCLLocationAccuracyBest];
    [locationManager setDelegate:self];
    [locationManager startUpdatingLocation];
    
    
    // Make sure the device returned a location
    if (currentLocation) {
        
        // Send location info to AdMob
        [myRequest setLocationWithLatitude:locationManager.location.coordinate.latitude longitude:locationManager.location.coordinate.longitude accuracy:locationManager.location.horizontalAccuracy];
        
        // Send location info to CommuteStream as well
        [[CommuteStream open] setLocation:currentLocation];
    }
    
    
    // These calls tell CommuteStream that the user just tracked the Addison Red Line
    // stop and received an alert for Red line service. Sending us this info helps us
    // serve ads that are highly relevant to the rider's commute.
    [[CommuteStream open] trackingDisplayed:@"CTA" routeID:@"Red" stopID:@"41420"];
    [[CommuteStream open] alertDisplayed:@"CTA" routeID:@"Red" stopID:nil];
    
    
    // Creates a button that, when pushed, tells CommuteStream that you have added the
    // Chicago Brown Line stop to your list of favorite stops. This information will
    // now help us serve more relavant ads.
    UIButton *addFavoriteBtn = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    [addFavoriteBtn setTitle:@"Add Favorite" forState:UIControlStateNormal];
    addFavoriteBtn.frame = CGRectMake(0, 250, 200, 29);
    [addFavoriteBtn addTarget:self action:@selector(addFavorite:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:addFavoriteBtn];
    
    
    // Create a view of the standard size at the top of the screen.
    // Available AdSize constants are explained in GADAdSize.h.
    bannerView_ = [[GADBannerView alloc] initWithAdSize:kGADAdSizeBanner];
    
    
    // Specify the ad unit ID. Set this up at Admob.com
    bannerView_.adUnitID = @"INSERT_YOUR_ADMOB_AD_UNIT_ID_HERE";
    
    
    // Let the runtime know which UIViewController to restore after taking
    // the user wherever the ad goes and add it to the view hierarchy.
    bannerView_.rootViewController = self;
    
    // Position the banner in your view
    [bannerView_ setFrame:CGRectMake(0, 50, bannerView_.frame.size.width, bannerView_.frame.size.height)];
    [self.view addSubview:bannerView_];
    
    
    
    // Make the request for a test ad. Put in an identifier for
    // the simulator as well as any devices you want to receive test ads.
    // Initiate a generic request to load it with an ad.
    [bannerView_  loadRequest:myRequest];
    
   }

// Tells CommuteStream that the user added the Chicago Brown Line stops to their favorites
-(void)addFavorite:(id)sender {
    
    [[CommuteStream open] favoriteAdded:@"cta" routeID:@"Brn" stopID:@"40710"];
}


// Delagate method for getting phone's location
- (void)locationManager:(CLLocationManager *)manager didUpdateToLocation:(CLLocation *)newLocation fromLocation:(CLLocation *)oldLocation {
    
    currentLocation = newLocation;
    
    
}

//Delegate for failure to get phone's location
- (void)locationManager:(CLLocationManager *)manager didFailWithError:(NSError *)error {
    
}


- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
