//
//  DemoSelector.m
//  ObjCExamples1
//
//  Created by Hoàng Thái on 12/13/15.
//  Copyright © 2015 HOANGTHAI. All rights reserved.
//

#import "DemoSelector.h"

@interface DemoSelector ()
@property (weak, nonatomic) IBOutlet UISlider *slider;

@end

@implementation DemoSelector

- (void)viewDidLoad {
    [super viewDidLoad];
    [self performSelector:@selector(hideSliders) withObject:nil afterDelay:3];
}
- (IBAction)onCrunchData:(id)sender {
    //[self performSelectorInBackground:@selector(doDataCrunch) withObject:nil];
    [self performSelectorOnMainThread:@selector(doDataCrunch) withObject:nil waitUntilDone:true];
    [self performSelectorOnMainThread:@selector(processData:) withObject:@{@"apple": @"táo", @"lemon": @"chanh"} waitUntilDone: true];
}

- (void) doDataCrunch {
    [NSThread sleepForTimeInterval:2];
}

- (void) hideSliders {
    self.slider.hidden = true;
}

- (void) processData: (NSDictionary*) data {
    for (NSString* key in [data allKeys]) {
        NSLog(@"%@ - %@", key, [data valueForKey:key]);
    }
}

@end
