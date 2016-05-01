//
//  InterfaceController.m
//  IntroducaoAnimacao-ObjC WatchKit Extension
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

    // Configure interface objects here.
}

- (void)willActivate {
    // This method is called when watch view controller is about to be visible to user
    [super willActivate];
    
    [self.labelNome setAlpha:0];
    
    [self animateWithDuration:2 animations:^{
        [self.grupo setHeight:0];
        [self.labelNome setAlpha:1];
        [self.labelNome setText:@"Ola Luis Filipe"];
    }];
}

- (void)didDeactivate {
    // This method is called when watch view controller is no longer visible
    [super didDeactivate];
}
- (IBAction)mudarTexto {
    
    [self animateWithDuration:2 animations:^{
        [self.grupo setHeight:100];
        [self.labelNome setText:@"novo texto"];
    }];
}

@end



