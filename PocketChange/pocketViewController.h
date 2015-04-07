//
//  pocketViewController.h
//  PocketChange
//
//  Created by Erica Nico on 4/1/14.
//  Copyright (c) 2014 Appinnovative. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <RevMobAds/RevMobAds.h>


@interface pocketViewController : UIViewController<UITextFieldDelegate,UITableViewDelegate,UITableViewDataSource,RevMobAdsDelegate>

@property (weak, nonatomic) IBOutlet UITextField *stockQuantity;
@property (weak, nonatomic) IBOutlet UITextField *costBasis;

@property (weak, nonatomic) IBOutlet UITextField *ratePercentage;

- (IBAction)calculatePrice:(id)sender;

@property (weak, nonatomic) IBOutlet UILabel *sellStock;
@property (weak, nonatomic) IBOutlet UILabel *pricePS;
- (IBAction)reset:(id)sender;
- (IBAction)infoButton:(id)sender;


@end
