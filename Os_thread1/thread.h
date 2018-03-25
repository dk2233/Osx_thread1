//
//  thread.h
//  Os_thread1
//
//  Created by daniel on 18.02.2018.
//  Copyright © 2018 code masterss. All rights reserved.
//

#ifndef thread_h
#define thread_h
#include <TargetConditionals.h>

#define DELAY_IN_SECONDS   1
#define HOW_LONG_FIRST      5
#define HOW_LONG_SECOND      10
//#define TARGET_OS_OSX (!(TARGET_OS_IOS || TARGET_OS_TV || TARGET_OS_WATCH))

@interface MyClass_thread : NSObject

@property  int seconds;
@property  dispatch_time_t DelayTime;
@property  dispatch_queue_t MyQueue;
#if TARGET_OS_OSX && !defined(TARGET_OS_IPHONE)
@property  NSTask *newtask;
#endif
@property  dispatch_group_t MyGroup;


-(id)init;
-(void)WriteSthg;
-(void)ShowSecondsDuringWaiting;

@end


#endif /* thread_h */
