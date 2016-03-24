//
//  ViewController.m
//  AuthMe
//
//  Created by Erika Bueno on 3/24/16.
//  Copyright © 2016 ErikaBueno. All rights reserved.
//

#import "ViewController.h"
#import "AuthModel.h"
#import "AuthService.h"
#import "AuthController.h"

@interface ViewController ()
@property (weak, nonatomic) IBOutlet UITextField *userNameField;
@property (weak, nonatomic) IBOutlet UITextField *userPasswordField;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
}

- (IBAction)authenticateUser:(id)sender {
    
    AuthModel *authModel = [[AuthModel alloc] init];
    authModel.userEmail = self.userNameField.text;
    authModel.userPassword = self.userPasswordField.text;
    authModel.applicationKey = @"00000000-0000-0000-0000-000000000000";
    authModel.tokenExpiration = [NSNumber numberWithInt:30];
    
    AuthController *authController = [[AuthController alloc] init];
    [authController authenticateUser:authModel block:^(NSError * _Nullable error) {
        if (error) {
            NSLog(@"Authentication error: %@", error.description);
        } else {
            NSLog(@"User Authenticated");
        }
    }];
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
