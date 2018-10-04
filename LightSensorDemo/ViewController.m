//
//  ViewController.m
//  LightSensorDemo
//
//  Created by Mircea Popescu on 10/4/18.
//  Copyright © 2018 Mircea Popescu. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()
@property (weak, nonatomic) IBOutlet UIImageView *imageNeedle;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    NSNotificationCenter *center = [NSNotificationCenter defaultCenter];
    
    [center addObserver:self selector:@selector(react) name:UIScreenBrightnessDidChangeNotification object:nil];
}

- (void) react{
    
    double brightness = [[UIScreen mainScreen] brightness];
    
    CGAffineTransform rotate = CGAffineTransformMakeRotation((brightness * M_PI) - M_PI_2);
    
    self.imageNeedle.transform = rotate;
}


@end
