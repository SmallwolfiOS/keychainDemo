//
//  ViewController.m
//  keychainDemo
//
//  Created by Jason on 16/4/22.
//  Copyright © 2016年 Jason. All rights reserved.
//

#import "ViewController.h"
#import "HPKeychain.h"


NSString * const KEY_USERNAME_PASSWORD = @"com.company.app.usernamepassword";
NSString * const KEY_USERNAME = @"com.company.app.username";
NSString * const KEY_PASSWORD = @"com.company.app.password";


@interface ViewController ()
@property (weak, nonatomic) IBOutlet UITextField *nameTextfield;
@property (weak, nonatomic) IBOutlet UITextField *passwordTextField;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    NSMutableDictionary *usernamepasswordKVPairs = (NSMutableDictionary *)[HPKeychain load:KEY_USERNAME_PASSWORD];
    _nameTextfield.text = [usernamepasswordKVPairs objectForKey:KEY_USERNAME];
    _passwordTextField.text = [usernamepasswordKVPairs objectForKey:KEY_PASSWORD];
}
- (IBAction)saveAction:(UIButton *)sender {
    
    NSMutableDictionary *usernamepasswordKVPairs = [NSMutableDictionary dictionary];
    [usernamepasswordKVPairs setObject:_nameTextfield.text forKey:KEY_USERNAME];
    [usernamepasswordKVPairs setObject:_passwordTextField.text forKey:KEY_PASSWORD];
    [HPKeychain save:KEY_USERNAME_PASSWORD data:usernamepasswordKVPairs];
    
    
    UIAlertController * alert = [UIAlertController alertControllerWithTitle:@"提示" message:@"保存成功" preferredStyle:UIAlertControllerStyleAlert];
    UIAlertAction * action = [UIAlertAction actionWithTitle:@"我知道了" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
        NSLog(@"点击了确认");
    }];
    [alert addAction:action];
    [self presentViewController:alert animated:YES completion:nil];
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
