//
//  ViewController.m
//  高德地图
//
//  Created by zhanghong on 16/3/4.
//  Copyright © 2016年 zhanghong. All rights reserved.
//

#import "ViewController.h"
//#import <MAMapKit/MAMapKit.h>
#import "UIView+FLKAutoLayout.h"
#import <CoreLocation/CoreLocation.h>
#import <MapKit/MapKit.h>

@interface ViewController ()<MKMapViewDelegate>

@property (nonatomic ,weak) MKMapView *mapView;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    [self registerMapKey];
    
    [self setUpMapView];
    
    [self addAnnotations];
}

- (void)viewDidAppear:(BOOL)animated{
    
    //[self.mapView showAnnotations:@[[self.mapView userLocation]] animated:NO];
}

- (void)registerMapKey{
    
//    [MAMapServices sharedServices].apiKey = @"04247ddcac4bb41aeb477db3d8e46b44";
}

- (void)setUpMapView{
    
    MKMapView *mapView = [[MKMapView alloc] init];
    
    mapView.delegate = self;
    mapView.showsUserLocation = YES;
    mapView.userTrackingMode = MKUserTrackingModeFollow;
    
    [self.view addSubview:mapView];
    self.mapView = mapView;
    
    [mapView alignTop:@"0" leading:@"0" bottom:@"0" trailing:@"0" toView:self.view];
}

- (void)addAnnotations{
    
    MKPointAnnotation *annotation = [[MKPointAnnotation alloc] init];
    annotation.coordinate = CLLocationCoordinate2DMake(39.989631, 116.481018);
    annotation.title = @"";
//    annotation.subtitle = @"hong";
    
    [self.mapView addAnnotation:annotation];
}

#pragma mark - MAMapViewDelegate

// 返回大头针点击后的视图
- (MKAnnotationView *)mapView:(MKMapView *)mapView viewForAnnotation:(id<MKAnnotation>)annotation{
    
    static NSString *pointId = @"pointId";
    
    if ([annotation isKindOfClass:[MKPointAnnotation class]]) {
        
        MKPinAnnotationView *annotationView = (MKPinAnnotationView *)[self.mapView dequeueReusableAnnotationViewWithIdentifier:pointId];
        if (annotationView == nil) {
            
            annotationView = [[MKPinAnnotationView alloc] initWithAnnotation:annotation reuseIdentifier:pointId];
        }
        annotationView.canShowCallout = YES;
        annotationView.draggable = YES;
//        annotationView.animatesDrop = YES;
//        annotationView.pinColor = MAPinAnnotationColorRed;
        
//        UIView *leftView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 50, 30)];
//        leftView.backgroundColor = [UIColor greenColor];
//        annotationView.leftCalloutAccessoryView = leftView;
//        
//        UIView *rightView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 50, 30)];
//        rightView.backgroundColor = [UIColor blueColor];
//        annotationView.rightCalloutAccessoryView = rightView;
        
        return annotationView;
    }
    
    return nil;
}
@end
