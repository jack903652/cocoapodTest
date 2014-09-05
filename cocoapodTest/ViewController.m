//
//  ViewController.m
//  cocoapodTest
//
//  Created by chengang on 14-9-3.
//  Copyright (c) 2014年 ___FULLUSERNAME___. All rights reserved.
//

#import "ViewController.h"
#import "MTStatusBarOverlay.h"
#import <CoreLocation/CoreLocation.h>
@interface ViewController ()<MTStatusBarOverlayDelegate,CLLocationManagerDelegate>
@property(nonatomic,retain)CLLocationManager *locationManager;
@end

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    
    _locationManager =[[CLLocationManager alloc] init];
    
    _locationManager.delegate = self;
//    locationManager.distanceFilter = 200;
    _locationManager.desiredAccuracy = kCLLocationAccuracyBest;
    
    [_locationManager startUpdatingLocation];

    BOOL x =[CLLocationManager locationServicesEnabled];
    NSLog(@"%d",x);
    /*self.locationManager.delegate = self;
     self.locationManager.distanceFilter = 200;
     locationManager.desiredAccuracy = kCLLocationAccuracyBest;
     [self.locationManager startUpdatingLocation];*/
    
//    MTStatusBarOverlay *overlay = [MTStatusBarOverlay sharedInstance];
//    overlay.animation = MTStatusBarOverlayAnimationFallDown;  // MTStatusBarOverlayAnimationShrink
//    overlay.detailViewMode = MTDetailViewModeCustom;         // enable automatic history-tracking and show in detail-view
//    overlay.hidesActivity =YES;
//    overlay.delegate = self;
//    overlay.detailView.frame =CGRectMake(0, 0, 60, 20);
//    overlay.finishedLabel.frame =CGRectMake(0, 0, 60, 20);
//    overlay.progress = 0.0;
//    [overlay postMessage:@"Following @myell0w on Twitter…"];
//    overlay.progress = 0.1;
//
//    // ...
//    [overlay postMessage:@"Following myell0w on Github…" animated:NO];
//    overlay.progress = 0.5;
//    // ...
//    [overlay postImmediateFinishMessage:@"Following was a good idea!" duration:2 animated:YES];
//    overlay.progress = 1.0;
//	// Do any additional setup after loading the view, typically from a nib.
//    NSArray *familyNames = [UIFont familyNames];
//    
//    for( NSString *familyName in familyNames ){
//        
//        printf( "\nFamily: %s \n\n", [familyName UTF8String] );
//        
//        NSArray *fontNames = [UIFont fontNamesForFamilyName:familyName];
//        
//        for( NSString *fontName in fontNames ){
//            
//            printf( "tFont: %s \n", [fontName UTF8String] );
//            
//        }
//        
//    }
//    
//    UILabel *l =[[UILabel alloc] initWithFrame:CGRectMake(0, 90, 320, 30)];
//    l.textColor =[UIColor blackColor];
//    l.font =[UIFont fontWithName:@"MicrosoftYaHei" size:16];
//    l.text =@"微软雅黑";
//    [self.view addSubview:l];
    
}
- (void)locationManager:(CLLocationManager *)manager
	 didUpdateLocations:(NSArray *)locations{
    [manager stopUpdatingLocation];
    NSLog(@"%@",locations);
    CLGeocoder *geo =[[CLGeocoder alloc] init];
    [geo reverseGeocodeLocation:locations[0] completionHandler:^(NSArray *placemarks, NSError *error) {
        NSLog(@"%@",placemarks);
        CLPlacemark *placeMark =[placemarks firstObject];
        NSLog(@"%@",placeMark.administrativeArea);
    }];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    

    // Dispose of any resources that can be recreated.
}
- (void)statusBarOverlayDidRecognizeGesture:(UIGestureRecognizer *)gestureRecognizer{
    
}
@end
