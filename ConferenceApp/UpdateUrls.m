//
//  UpdateUrls.m
//  ConferenceApp
//
//  Created by Students on 12/2/15.
//  Copyright (c) 2015 Students. All rights reserved.
//

#import "UpdateUrls.h"

@interface UpdateUrls()
@property (weak, nonatomic) IBOutlet UITextField *FormUrlField;
@property (weak, nonatomic) IBOutlet UITextField *TitleKeyField;
@property (weak, nonatomic) IBOutlet UITextField *FirstNameField;
@property (weak, nonatomic) IBOutlet UITextField *LastNameField;
@property (weak, nonatomic) IBOutlet UITextField *EmailField;
@property (weak, nonatomic) IBOutlet UITextField *AffiliationField;

@end

@implementation UpdateUrls
- (IBAction)OnSaveUrls:(id)sender {
    
    NSString *FormUrl = _FormUrlField.text;
    NSString *TitleKey = _TitleKeyField.text;
    NSString *FirstKey = _FirstNameField.text;
    NSString *Lastkey = _LastNameField.text;
    NSString *EmailKey = _EmailField.text;
    NSString *AffiliationKey = _AffiliationField.text;
    
    FormUrl = [FormUrl stringByReplacingOccurrencesOfString:@"viewform"
                                         withString:@"formResponse"];
    
    PFObject* obj = [PFObject objectWithoutDataWithClassName:@"Urls" objectId:@"OhZJIFMeJQ"];
    [obj setObject:FormUrl forKey:@"FormUrl"];
    [obj setObject:TitleKey forKey:@"Title"];
    [obj setObject:FirstKey forKey:@"FirstName"];
    [obj setObject:Lastkey forKey:@"LastName"];
    [obj setObject:EmailKey forKey:@"Email"];
    [obj setObject:AffiliationKey forKey:@"Affiliation"];
    //obj[@"ConferenceName"] = titleString;
    [obj saveInBackgroundWithBlock:^(BOOL succeeded , NSError *error){
        if(succeeded == YES)
        {
            UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Success" message:@"Your Form has been saved!" delegate:nil cancelButtonTitle:@"OK" otherButtonTitles: nil];
            [alert show];
        }
        else
        {
            UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Error" message:@"Your Form has not been saved!" delegate:nil cancelButtonTitle:@"OK" otherButtonTitles: nil];
            [alert show];
        }
        
    }];

    
    
}

@end
