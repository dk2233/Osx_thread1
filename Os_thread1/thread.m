//
//  thread.m
//  Os_thread1
//
//  Created by daniel on 18.02.2018.
//  Copyright © 2018 code masterss. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "thread.h"

dispatch_block_t SimpleBlock;
dispatch_block_t NotificationBlock;



@implementation  MyClass_thread





-(id)init{
    
    _seconds = 0;
    //_DelayTime = dispatch_time(DISPATCH_TIME_NOW, (int64_t)(DELAY_IN_SECONDS * NSEC_PER_SEC));
    [self ShowSecondsDuringWaiting];
    [NSThread detachNewThreadSelector:@selector(WriteSthg) toTarget:self withObject:self];
    
    dispatch_queue_t MyQueue =  dispatch_queue_create("TestQueue", DISPATCH_QUEUE_CONCURRENT);

    dispatch_async(MyQueue, ^{
        
        NSLog(@"\n I am on MyQueue \n");
        
    });
    
    
    NotificationBlock = dispatch_block_create(DISPATCH_BLOCK_DETACHED, ^{
        
        NSLog(@"\n finished \n\n");
    });
    
    SimpleBlock = dispatch_block_create(DISPATCH_BLOCK_DETACHED, ^{
        
        NSLog(@" I am on queue called %@",[NSString stringWithUTF8String:dispatch_queue_get_label(MyQueue)]);
        
    });
    
    
    
    dispatch_time_t Time1;
    Time1 = dispatch_time(DISPATCH_TIME_NOW, (int64_t)((HOW_LONG_FIRST) * NSEC_PER_SEC));
    dispatch_after(Time1, MyQueue, SimpleBlock);
    
    
    dispatch_block_notify(SimpleBlock, MyQueue, NotificationBlock);

    return self;
    
}
-(void)WriteSthg{
    
    //NSAutoreleasePool *pool = [[NSAutoreleasePool alloc] init];
    NSLog(@"hello");
    
    [NSThread sleepUntilDate:[NSDate dateWithTimeIntervalSinceNow:(NSTimeInterval)HOW_LONG_SECOND]];
    NSLog(@"\n hello2 after %d s \n",HOW_LONG_SECOND);
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
    if (self.seconds < HOW_LONG_SECOND)
    {
    dispatch_after(_DelayTime, dispatch_get_main_queue(), ^{
        [self ShowSecondsDuringWaiting];
    });
        
    self.seconds += 1;
    }
}


@end

