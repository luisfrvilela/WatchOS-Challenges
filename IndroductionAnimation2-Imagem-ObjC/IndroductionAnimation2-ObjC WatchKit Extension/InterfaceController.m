//
//  InterfaceController.m
//  IndroductionAnimation2-ObjC WatchKit Extension
//
//  Created by Luís Resende on 19/02/16.
//  Copyright © 2016 Luis Resende. All rights reserved.
//

#import "InterfaceController.h"


@interface InterfaceController()

@end


@implementation InterfaceController

- (void)awakeWithContext:(id)context {
    [super awakeWithContext:context];
    
    [self.image setImageNamed:@"roda-"];
    [self.image startAnimatingWithImagesInRange:NSMakeRange(0, 5) duration:0.3 repeatCount:2];
    [self animateWithDuration:2 animations:^{
        [self.group setHeight:0];
        [self.image startAnimating];
    }];
    
    double delay = dispatch_time(DISPATCH_TIME_NOW, (int64_t)(2 * NSEC_PER_SEC));
    
    dispatch_after(delay, dispatch_get_main_queue(), ^{
        [self animateWithDuration:0.8 animations:^{
            [self.image setHeight:0];
            [self.image stopAnimating];
        }];
    });
    // Configure interface objects here.
}

- (void)willActivate {
    // This method is called when watch view controller is about to be visible to user
    [super willActivate];
}

- (void)didDeactivate {
    // This method is called when watch view controller is no longer visible
    [super didDeactivate];
}

@end



