//
//  RestaurantFormViewController.h
//  FoodFaves
//
//  Created by Gregory Weiss on 8/10/16.
//  Copyright © 2016 Gregory Weiss. All rights reserved.
//

#import <UIKit/UIKit.h>



@interface RestaurantFormViewController : UIViewController

@property (weak, nonatomic) IBOutlet UITextField *nameTextField;
@property (weak, nonatomic) IBOutlet UITextView *commentsTextView;
@property (weak, nonatomic) IBOutlet UIStepper *ratingStepper;
@property (weak, nonatomic) IBOutlet UILabel *ratingLabel;
@property (weak, nonatomic) IBOutlet UILabel *latLabel;
@property (weak, nonatomic) IBOutlet UILabel *longLabel;
@property (weak, nonatomic) IBOutlet UIView *coverUpUIView;


@end
