//
//  thread.m
//  Os_thread1
//
//  Created by daniel on 18.02.2018.
//  Copyright © 2018 code masterss. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "thread.h"


@implementation  MyClass_thread


-(id)init{
    
    _seconds = 0;
    //_DelayTime = dispatch_time(DISPATCH_TIME_NOW, (int64_t)(DELAY_IN_SECONDS * NSEC_PER_SEC));
    [self ShowSecondsDuringWaiting];
    [NSThread detachNewThreadSelector:@selector(WriteSthg) toTarget:self withObject:self];
    

    return self;
    
}
-(void)WriteSthg{
    
    //NSAutoreleasePool *pool = [[NSAutoreleasePool alloc] init];
    NSLog(@"hello");
    
    [NSThread sleepUntilDate:[NSDate dateWithTimeIntervalSinceNow:(NSTimeInterval)7.0]];
    NSLog(@"hello2 after 7 s");
//    dispatch_after( dispatch_time(DISPATCH_TIME_NOW, (int64_t)(7 * NSEC_PER_SEC) )
//                   , dispatch_get_main_queue(),
//                   ^{
//                       NSLog(@"hello2");
//                       
//                   });
    
    //[NSThread exit];
    //[pool realese];
}

-(void)ShowSecondsDuringWaiting{
    
    NSLog(@"now is %d seconds ",_seconds);
    _DelayTime = dispatch_time(DISPATCH_TIME_NOW, (int64_t)((DELAY_IN_SECONDS) * NSEC_PER_SEC));
    //NSLog(@"%lld",_DelayTime);
    dispatch_after(_DelayTime, dispatch_get_main_queue(), ^{
        [self ShowSecondsDuringWaiting];
    });
    self.seconds += 1;
}


@end

