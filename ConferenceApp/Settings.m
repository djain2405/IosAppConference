//
//  Settings.m
//  ConferenceApp
//
//  Created by Students on 10/26/15.
//  Copyright (c) 2015 Students. All rights reserved.
//

#import "Settings.h"
@interface Settings ()
@property (weak, nonatomic) IBOutlet UITextField *TitleField;

@end
@implementation Settings

- (IBAction)OnSave:(id)sender {
    
    NSString *titleString = _TitleField.text;
    
    PFObject* obj = [PFObject objectWithClassName:@"Conference"];
    obj[@"ConferenceName"] = titleString;
    [obj saveInBackgroundWithBlock:^(BOOL succeeded , NSError *error){
        if(succeeded == YES)
        {
            UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Success" message:@"Your Title has been saved!" delegate:nil cancelButtonTitle:@"OK" otherButtonTitles: nil];
            [alert show];
        }
        else
        {
            UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Error" message:@"Your Title has not been saved!" delegate:nil cancelButtonTitle:@"OK" otherButtonTitles: nil];
            [alert show];
        }
        
    }];
    
}

@end
