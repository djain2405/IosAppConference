//
//  UpdateLoginDetails.m
//  ConferenceApp
//
//  Created by Students on 12/1/15.
//  Copyright (c) 2015 Students. All rights reserved.
//

#import "UpdateLoginDetails.h"

@interface UpdateLoginDetails()
@property (weak, nonatomic) IBOutlet UITextField *UsernameTextField;
@property (weak, nonatomic) IBOutlet UITextField *PasswordTextField;

@end
@implementation UpdateLoginDetails
- (IBAction)UpdatePassword:(id)sender {
    
    NSString *username = _UsernameTextField.text;
    NSString *password = _PasswordTextField.text;
    
    [PFUser currentUser].username = username;
    [PFUser currentUser].password = password;
    [[PFUser currentUser] saveInBackground];
    UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Success" message:@"Successfully updated!" delegate:nil cancelButtonTitle:@"OK" otherButtonTitles: nil];
    [alert show];
}

@end
