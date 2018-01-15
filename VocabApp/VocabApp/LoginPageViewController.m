//
//  LoginPageViewController.m
//  VocabApp
//
//  Created by Jack Wong on 2018/01/15.
//  Copyright © 2018 Jack. All rights reserved.
//

#import "LoginPageViewController.h"

@interface LoginPageViewController ()
@property (strong, nonatomic) IBOutlet UIImageView *bannerImageView;
@property (strong, nonatomic) IBOutlet UITextField *IDTextField;
@property (strong, nonatomic) IBOutlet UITextField *passwordTextField;
@property (nonatomic) BOOL isSignIn;

@end

@implementation LoginPageViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.isSignIn = YES;
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)loginBtn:(id)sender {
    
    NSString *emailAddress = self.IDTextField.text;
    NSString *password = self.passwordTextField.text;
    
    if (self.isSignIn == YES){
        [[FIRAuth auth] signInWithEmail:emailAddress password:password completion:^(FIRUser *user, NSError *error){
            if ([FIRAuth auth].currentUser){
                
            } else {
                
            }
        }];
    } else {
        [[FIRAuth auth] createUserWithEmail:emailAddress password:password completion:^(FIRUser * user, NSError *error) {
            NSLog(@"%@ is created", user);
        }];
    }
    
    
}


@end
