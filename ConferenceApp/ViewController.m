//
//  ViewController.m
//  ConferenceApp
//
//  Created by Students on 10/14/15.
//  Copyright (c) 2015 Students. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()
@property (weak, nonatomic) IBOutlet UITextField *FirstNameTextField;
@property (weak, nonatomic) IBOutlet UITextField *LastNameTextField;
@property (weak, nonatomic) IBOutlet UITextField *EmailTextField;
@property (weak, nonatomic) IBOutlet UILabel *Title;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    PFQuery *query = [PFQuery queryWithClassName:@"Conference"];
    PFObject *obj = [query getObjectWithId:@"vebdsnsQhr"];
    _Title.text = [obj objectForKey:@"ConferenceName"];
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
- (NSString *)urlencode:(NSString *)input {
    const char *input_c = [input cStringUsingEncoding:NSUTF8StringEncoding];
    NSMutableString *result = [NSMutableString new];
    for (NSInteger i = 0, len = strlen(input_c); i < len; i++) {
        unsigned char c = input_c[i];
        if (
            (c >= '0' && c <= '9')
            || (c >= 'A' && c <= 'Z')
            || (c >= 'a' && c <= 'z')
            || c == '-' || c == '.' || c == '_' || c == '~'
            ) {
            [result appendFormat:@"%c", c];
        }
        else {
            [result appendFormat:@"%%%02X", c];
        }
    }
    return result;
}

- (void)send_url_encoded_http_post_request:(NSString *)url_str vars:(NSDictionary *)vars {
    NSMutableString *vars_str = [NSMutableString new];
    if (vars != nil && vars.count > 0) {
        BOOL first = YES;
        for (NSString *key in vars) {
            if (!first) {
                [vars_str appendString:@"&"];
            }
            first = NO;
            
            [vars_str appendString:[self urlencode:key]];
            [vars_str appendString:@"="];
            [vars_str appendString:[self urlencode:[vars valueForKey:key]]];
        }
    }
    
    NSURL *url = [NSURL URLWithString:url_str];
    NSMutableURLRequest *request = [[NSMutableURLRequest alloc] initWithURL:url];
    [request setHTTPMethod:@"POST"];
    [request setHTTPShouldHandleCookies:NO];
    //    [request setValue:@"Agent name goes here" forHTTPHeaderField:@"User-Agent"];
    [request setHTTPBody:[vars_str dataUsingEncoding:NSUTF8StringEncoding]];
    [NSURLConnection connectionWithRequest:request delegate:self];
}

- (void)send_http_get_request:(NSString *)url_str {
    NSURL *url = [NSURL URLWithString:url_str];
    NSURLRequest *request = [[NSURLRequest alloc] initWithURL:url];
    [NSURLConnection connectionWithRequest:request delegate:self];
    
    //[detailWebView loadRequest:requestObj]
    
    //[[UIApplication sharedApplication] openURL:url];
}
- (IBAction)OnClick:(id)sender {
    
    NSString *firstName = _FirstNameTextField.text;
    NSString *lastName = _LastNameTextField.text;
    NSString *email = _EmailTextField.text;
    NSString *conferenceTitle = _Title.text;
    
    NSString *url_str = @"https://docs.google.com/a/ncsu.edu/forms/d/1F9eTOqbkORAwVRiX5IWwAJB-cl-g59jmWvKhwP1PWME/formResponse";
   // NSString *url_str = @"https://docs.google.com/a/ncsu.edu/forms/d/1uCBhYFReAWbEmLD6LfQCoytnj-bkJueWGNLeTvdz1TI/formResponse";
    
    NSMutableDictionary *vars = [NSMutableDictionary new];
    //[vars setObject:firstName forKey:@"entry.365165179"];
    [vars setObject:conferenceTitle forKey:@"entry.395481797"];
    [vars setObject:firstName forKey:@"entry.773487746"];
    //[vars setObject:lastName forKey:@"entry.364263865"];
    [vars setObject:lastName forKey:@"entry.1046609313"];
    [vars setObject:email forKey:@"entry.1210214913"];
    
    [self send_url_encoded_http_post_request:url_str vars:vars];}

@end
