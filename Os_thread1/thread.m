//
//  thread.m
//  Os_thread1
//
//  Created by daniel on 18.02.2018.
//  Copyright © 2018 code masterss. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "thread.h"
#import "limits.h"

dispatch_block_t SimpleBlock;
dispatch_block_t NotificationBlock;



@implementation  MyClass_thread





-(id)init{
    _seconds = 0;
    
    [self ShowSecondsDuringWaiting];
    
    
    _newtask = [[NSTask alloc] init];
    dispatch_group_t _MyGroup = dispatch_group_create();
    _MyQueue =  dispatch_queue_create("TestQueue", DISPATCH_QUEUE_SERIAL);
    
    
    
//    [_newtask setLaunchPath:@"/Applications/MacVim.app/Contents/bin/gvim"];
    [_newtask setLaunchPath:@"/Applications/Utilities/System Information.app/Contents/MacOS/System Information"];
//    [_newtask setLaunchPath:@"/usr/bin/vim"];
    [_newtask launch];

    dispatch_group_async(_MyGroup, _MyQueue, ^{
        NSLog(@"\n I am on MyQueue \n");
    });
    
    
    
    //here is an example of dispatch_block creation
    NotificationBlock = dispatch_block_create(DISPATCH_BLOCK_ASSIGN_CURRENT, ^{
        NSLog(@"\n finished \n\n");
        NSLog(@" queue %@ ",_MyQueue);

    });
    
    SimpleBlock = dispatch_block_create(DISPATCH_BLOCK_ASSIGN_CURRENT, ^{
        NSLog(@" I am on queue called %@",[NSString stringWithUTF8String:dispatch_queue_get_label(_MyQueue)]);
    });
    
    
    
    dispatch_time_t Time1;
    Time1 = dispatch_time(DISPATCH_TIME_NOW, (int64_t)((HOW_LONG_FIRST) * NSEC_PER_SEC));
    
    dispatch_after(Time1, _MyQueue, SimpleBlock);
    
    dispatch_block_notify(SimpleBlock, _MyQueue, NotificationBlock);
    
    dispatch_group_async(_MyGroup ,_MyQueue, ^{
        for(int64_t i=0; i< INTMAX_MAX;i++)
        {
            ;
        }
        NSLog(@"Finished very long One ");
        
    });
    
    
    Time1 = dispatch_time(DISPATCH_TIME_NOW, (int64_t)(3.0 * NSEC_PER_SEC));
    dispatch_after(Time1, _MyQueue, ^{
        NSLog(@" running ? %@",([_newtask isRunning] ? @"Run":@"Stopped "));

        
    });
    
    
    /* This is very important to prepare it differentyl than
     simply with async functionality
     */
    dispatch_group_enter(_MyGroup);
    
    NSLog(@" I am waiting...");
    [_newtask waitUntilExit];
    NSLog(@" I am waiting... 22");
    dispatch_group_leave( _MyGroup );
    
    dispatch_group_notify(_MyGroup, _MyQueue, ^{
        exit(0);
    });
    
    
    return self;
    
}
-(void)WriteSthg{
    
    
    NSLog(@"hello");
    
    [NSThread sleepUntilDate:[NSDate dateWithTimeIntervalSinceNow:(NSTimeInterval)HOW_LONG_SECOND]];
    NSLog(@"\n hello2 after %d s \n",HOW_LONG_SECOND);
    dispatch_after( dispatch_time(DISPATCH_TIME_NOW, (int64_t)(7 * NSEC_PER_SEC) )
                   , dispatch_get_main_queue(),
                   ^{
                       NSLog(@"hello2");
                       
                   });
}

-(void)ShowSecondsDuringWaiting{
    
    NSLog(@"now is %d seconds ",_seconds);
    
    
    if (self.seconds < HOW_LONG_SECOND)
    {
        _DelayTime = dispatch_time(DISPATCH_TIME_NOW, (int64_t)((DELAY_IN_SECONDS) * NSEC_PER_SEC));
        dispatch_after(_DelayTime, dispatch_get_main_queue(), ^{
            [self ShowSecondsDuringWaiting];
        });
        
        self.seconds += 1;
    }
    else
    {
        NSLog(@"\n finish \n ");
        
        NSLog(@" stoppped all ");
        
    }
}


@end

