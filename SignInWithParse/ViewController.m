//
//  ViewController.m
//  SignInWithParse
//
//  Created by Nick Reeder on 1/29/15.
//  Copyright (c) 2015 Nick Reeder. All rights reserved.
//

#import "ViewController.h"
#import <Parse/Parse.h>

@interface ViewController ()

@end

@implementation ViewController

- (IBAction)signOut:(id)sender {
    

    [PFUser logOut];
    
    
    UIViewController *viewcontroller = [[UIStoryboard storyboardWithName:@"Main" bundle:nil]instantiateViewControllerWithIdentifier:@"LogInScreen"];
    [self presentViewController:viewcontroller animated:YES completion:^{
        
    }];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
