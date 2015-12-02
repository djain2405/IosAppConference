//
//  LoginAdmin.m
//  ConferenceApp
//
//  Created by Students on 10/27/15.
//  Copyright (c) 2015 Students. All rights reserved.
//

#import "LoginAdmin.h"

@interface LoginAdmin()
@property (weak, nonatomic) IBOutlet UITextField *AdminUserName;
@property (weak, nonatomic) IBOutlet UITextField *AdminPassword;


@end
@implementation LoginAdmin
- (IBAction)UpdatePassword:(id)sender {
    
    
}
- (IBAction)OnLogin:(id)sender {
    NSString *username = _AdminUserName.text;
    NSString *password = _AdminPassword.text;
    
    [PFUser logInWithUsernameInBackground:username password:password
                                    block:^(PFUser *user, NSError *error) {
                                        if (user) {
                                            UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Success" message:@"Successful Login!" delegate:nil cancelButtonTitle:@"OK" otherButtonTitles: nil];
                                            [alert show];
                                            [self performSegueWithIdentifier:@"LoginSegue" sender: self];
                                        } else {
                                            UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Error" message:@"Error Login in!" delegate:nil cancelButtonTitle:@"OK" otherButtonTitles: nil];
                                            [alert show];
                                        }
                                    }];
}

@end
