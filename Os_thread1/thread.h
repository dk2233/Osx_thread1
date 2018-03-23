//
//  thread.h
//  Os_thread1
//
//  Created by daniel on 18.02.2018.
//  Copyright © 2018 code masterss. All rights reserved.
//

#ifndef thread_h
#define thread_h

#import <Foundation/Foundation.h>
#import "limits.h"
//#import

#define DELAY_IN_SECONDS   1
#define HOW_LONG_FIRST      5
#define HOW_LONG_SECOND      10


@interface MyClass_thread : NSObject

@property  int seconds;
@property  dispatch_time_t DelayTime;
@property  dispatch_queue_t MyQueue;
@property  dispatch_group_t MyGroup;


-(id)init;
-(void)WriteSthg;
-(void)ShowSecondsDuringWaiting;

@end




@interface MyClass_thread_ios : NSObject

@property  int seconds;
@property  dispatch_time_t DelayTime;
@property  dispatch_queue_t MyQueue;
@property  dispatch_group_t MyGroup;


-(id)init;
@end


#endif /* thread_h */
