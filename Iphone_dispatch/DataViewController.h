//
//  DataViewController.h
//  iphone_dispatch
//
//  Created by daniel on 14.03.2018.
//  Copyright © 2018 code masterss. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface DataViewController : UIViewController

@property (strong, nonatomic) IBOutlet UILabel *dataLabel;
@property (strong, nonatomic) id dataObject;
@property (weak, atomic) IBOutlet UITextField *text1;


//-(instancetype)init;


@end

