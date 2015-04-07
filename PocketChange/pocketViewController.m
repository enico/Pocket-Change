//
//  pocketViewController.m
//  PocketChange
//
//  Created by Erica Nico on 4/1/14.
//  Copyright (c) 2014 Appinnovative. All rights reserved.
//

#import "pocketViewController.h"
#import <RevMobAds/RevMobAds.h>


@interface pocketViewController ()

@end

@implementation pocketViewController

{
    NSArray *stockInfo;
}
@synthesize stockQuantity,costBasis,pricePS,ratePercentage,sellStock;

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    [[RevMobAds session] showBanner];
   
    
  
}




- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

- (IBAction)calculatePrice:(id)sender {
    if (stockQuantity.text.length  < 1 || costBasis.text.length <1) {
        UIAlertView *view = [[UIAlertView alloc]initWithTitle:@"Field Empty" message:@"Please enter Stock Quantity or a Cost Basis." delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil];
        
        [view show];
    }else if
    
        (stockQuantity.text.length  > 7 || costBasis.text.length > 7 || ratePercentage.text.length > 3 || [self.ratePercentage.text intValue] > 100) {
        UIAlertView *view = [[UIAlertView alloc]initWithTitle:@"Number" message:@"Please enter an appropriate number, for percentages enter a number between 1-100. " delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil];
        
        [view show];
    
        
  
    }else{
    NSString *stockText = stockQuantity.text;
    float stocktQuan = [stockText intValue];
    
    float x = stocktQuan;
    
    NSString *percentText = ratePercentage.text;
    float percentRate = [percentText intValue];
    
    
    NSString *basisText = costBasis.text;
    float costBase = [basisText intValue];
  
    float y = costBase;
    float result = 0;
    float king = percentRate;
    float percentResult = 0;
    
     

      result =  y / x;
    
    percentResult = result * (king / 100) + result;
    
    

 
  NSLog(@"[SW] %0.1f",result);
    NSLog(@"%0.1f",percentRate);
    
   self.sellStock.text = [NSString stringWithFormat:@"%0.2f",percentResult];
    self.pricePS.text = [NSString stringWithFormat:@"%0.2f",result];
   
    
            }
    
}


- (BOOL)textFieldShouldReturn:(UITextField *)textField {
    //dismissing the keyboard, also remember to set the delegate on each text field
    [stockQuantity resignFirstResponder];
    [costBasis resignFirstResponder];
    [ratePercentage resignFirstResponder];
   // [UIView beginAnimations:nil context:NULL];     [UIView setAnimationDuration:0.35f];          CGRect frame = self.view.frame;     frame.origin.y = -100;     [self.view setFrame:frame];          [UIView commitAnimations];
  
        

    return NO;
}

- (void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event {
    
    [stockQuantity resignFirstResponder];
    [costBasis resignFirstResponder];
    [ratePercentage resignFirstResponder];
    
    
}


- (IBAction)reset:(id)sender {
   // result = 0
    sellStock.text = [NSString stringWithFormat:@"0"];
    pricePS.text = [NSString stringWithFormat:@"0"];
    stockQuantity.text = @"0";
    costBasis.text = @"0";
    ratePercentage.text = @"0";
    [[RevMobAds session] showBanner];
    
    
    
}

- (IBAction)infoButton:(id)sender {
    
    UIAlertView *alert = [[UIAlertView alloc]initWithTitle:@"Help" message:@"Thank you for trying Pocket Coins. Pocket Coins is a simple app to be used to quickly determine a price to sell your stock. Pocket Coins takes your ideal rate of return and calculates a suggested sale point. COST Basis-Enter the total cost paid for your stock, which should include commission, QUANTITY-Enter the total quantity of stock. RETRUN Percent-Enter the return percentage you would like to see from selling your stock. Once you have the sell point, remember to set an alert on your trading platform. PPS-This estimates the amount you paid per share with commission. For Help contact Appinnovative, support@appinnovative.com" delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil, nil];
    [alert show];
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{

    // Return the number of sections.
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{

 
    return [stockInfo count];
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *simpleStockInfo = @"StockInfo";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"simpleStockInfo"];
    if (cell == nil) {
        cell = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:simpleStockInfo];
    }
    cell.textLabel.text = [stockInfo objectAtIndex:indexPath.row];
    return cell;
}

-(void)textFieldDidBeginEditing:(UITextField *)textField
{
    [self animateTextField:textField up:YES];
     [[RevMobAds session] hideBanner];
}

- (void)textFieldDidEndEditing:(UITextField *)textField
{
    [self animateTextField:textField up:NO];
   // const int movementDistance = 130;
}

-(void)animateTextField:(UITextField*)textField up:(BOOL)up
{
    const int movementDistance = -130; // tweak as needed
    const float movementDuration = 0.3f; // tweak as needed
    
    int movement = (up ? movementDistance : -movementDistance);
    
    [UIView beginAnimations: @"animateTextField" context: nil];
    [UIView setAnimationBeginsFromCurrentState: YES];
    [UIView setAnimationDuration: movementDuration];
    self.view.frame = CGRectOffset(self.view.frame, 0, movement);
    [UIView commitAnimations];
}

@end
