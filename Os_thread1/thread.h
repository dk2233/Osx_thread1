//
//  thread.h
//  Os_thread1
//
//  Created by daniel on 18.02.2018.
//  Copyright © 2018 code masterss. All rights reserved.
//

#ifndef thread_h
#define thread_h


#define DELAY_IN_SECONDS   1


@interface MyClass_thread : NSObject

@property  int seconds;
@property  dispatch_time_t DelayTime;
-(id)init;
-(void)WriteSthg;
-(void)ShowSecondsDuringWaiting;

@end


#endif /* thread_h */
