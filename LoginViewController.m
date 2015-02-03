
//
//  LoginViewController.m
//  SignInWithParse
//
//  Created by Nick Reeder on 1/30/15.
//  Copyright (c) 2015 Nick Reeder. All rights reserved.
//

#import "LoginViewController.h"
#import <Parse/Parse.h>

@interface LoginViewController ()

@end

@implementation LoginViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
}

-(void)viewDidAppear:(BOOL)animated{
    UIViewController *vc = [[UIStoryboard storyboardWithName:@"Main" bundle:nil]instantiateViewControllerWithIdentifier:@"MainScreen"];
    
    PFUser *currentUser = [PFUser currentUser];
    if (currentUser) {
        // go straight to the app!
        [self presentViewController:vc animated:NO completion:^{
            
        }];

    }

}
- (IBAction)logInPressed:(id)sender {
    
    
    [PFUser logInWithUsernameInBackground:self.userTextField.text password:self.passwordTextField.text block:^(PFUser *user, NSError *error) {
        if (user) {
            
            //[[NSUserDefaults standardUserDefaults] setBool:YES forKey:@"isLoggedIn"];
            [self performSegueWithIdentifier:@"LoginSuccessful" sender:self];
            
        } else {
            NSLog(@"%@", error);
            UIAlertController *alert = [UIAlertController alertControllerWithTitle:@"Error" message:@"Account not found. Please sign up." preferredStyle:UIAlertControllerStyleAlert];
            UIAlertAction *action = [UIAlertAction actionWithTitle:@"OK" style:UIAlertActionStyleCancel handler:^(UIAlertAction *action) {
                [self performSegueWithIdentifier:@"SignUp" sender:self];
                }];
            
            [alert addAction:action];
            [self presentViewController:alert animated:YES completion:^{
                
            }];
            
        }
        //Don't delete. End of completion block.
    }];
}

- (BOOL)textFieldShouldReturn:(UITextField *)textField {
    
    [self.userTextField resignFirstResponder];
    [self.passwordTextField resignFirstResponder];
    
    return NO;
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
