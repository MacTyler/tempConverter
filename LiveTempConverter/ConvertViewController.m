//
//  ConvertViewController.m
//  LiveTempConverter
//
//  Created by Mac Tyler on 10/6/13.
//  Copyright (c) 2013 Mac Tyler. All rights reserved.
//

#import "ConvertViewController.h"

@interface ConvertViewController ()

@end

@implementation ConvertViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        self.title = @"Temperature Converter";
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    [self.cTextfield becomeFirstResponder];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}



#pragma mark - Public Methods
- (BOOL)textField:(UITextField *)textField shouldChangeCharactersInRange:(NSRange)range replacementString:(NSString *)string {
    
    // This line is the best thing ever, couldn't figure out what was wrong with the conversion til I found this
    // http://stackoverflow.com/questions/2198067/using-textfieldshouldchangecharactersinrange-how-do-i-get-the-text-including
    NSString * completeString = [textField.text stringByReplacingCharactersInRange:range withString:string];

    if (textField == self.cTextfield)  {
        NSLog(@"Switching to Celsius Input");
        float fahrenheitRatio = 9.0/5.0;
        float convertedF = (completeString.floatValue * fahrenheitRatio) + 32;
        
        self.fTextfield.text = [NSString stringWithFormat:@"%0.1f", convertedF];
    }
    if (textField == self.fTextfield)  {
        NSLog(@"Switching to Fahrenheit Input");
        float celsiusRatio = 5.0/9.0;
        float convertedC = (completeString.floatValue - 32) * celsiusRatio;
        
        self.cTextfield.text = [NSString stringWithFormat:@"%0.1f", convertedC];

    }
    return YES;
    
}











@end
