//
//  InterfaceController.h
//  IndroductionAnimation2-ObjC WatchKit Extension
//
//  Created by Luís Resende on 19/02/16.
//  Copyright © 2016 Luis Resende. All rights reserved.
//

#import <WatchKit/WatchKit.h>
#import <Foundation/Foundation.h>

@interface InterfaceController : WKInterfaceController
@property (unsafe_unretained, nonatomic) IBOutlet WKInterfaceGroup *group;
@property (unsafe_unretained, nonatomic) IBOutlet WKInterfaceImage *image;

@end
