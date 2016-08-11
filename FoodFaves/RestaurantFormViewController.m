//
//  RestaurantFormViewController.m
//  FoodFaves
//
//  Created by Gregory Weiss on 8/10/16.
//  Copyright © 2016 Gregory Weiss. All rights reserved.
//

#import "RestaurantFormViewController.h"
#import "Restaurant.h"
#import "AppDelegate.h"
#import <CoreData/CoreData.h>

@interface RestaurantFormViewController ()  <UITextViewDelegate>

//@property(strong, nonatomic) NSMutableArray *goodRestaurants;
//@property(strong, nonatomic) NSManagedObjectContext *moc;

@property (strong, nonatomic) Restaurant *aRestaurant;

@end

@implementation RestaurantFormViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    //self.title = @"Spell it with me";
    self.goodRestaurants = [[NSMutableArray alloc] init];
    AppDelegate *appDelegate = [UIApplication sharedApplication].delegate;
    self.moc = appDelegate.managedObjectContext;
    
    // This block will fetch our counter objects from Core Data and load them in the tableView
    NSFetchRequest *fetchRequest = [NSFetchRequest fetchRequestWithEntityName:NSStringFromClass([Restaurant class])];
    NSError *error = nil;
    NSArray *restaurantsFromCoreData = [self.moc executeFetchRequest:fetchRequest error:&error];
    if (error)
    {
        NSLog(@"Could not fetch from moc: %@", [error localizedDescription]);
    }
    else
    {
        [self.goodRestaurants addObjectsFromArray:restaurantsFromCoreData];
    }
    if (self.goodRestaurants.count != 0)
        {
        
        self.aRestaurant = self.goodRestaurants[0];
        if (self.aRestaurant.restaurantName != nil)
        //[self configureAnnotations];
            {
        NSLog(@"%@ restName", self.aRestaurant.restaurantName);
        NSLog(@"%@ restNotes", self.aRestaurant.restaurantNotes);
        NSLog(@"%hd restRating", self.aRestaurant.restaurantRating);
            }
        }
    else if (self.goodRestaurants.count > 1)
    {
        
        self.aRestaurant = self.goodRestaurants[1];
        //[self configureAnnotations];
        NSLog(@"%@ restName", self.aRestaurant.restaurantName);
        NSLog(@"%@ restNotes", self.aRestaurant.restaurantNotes);
        NSLog(@"%hd restRating", self.aRestaurant.restaurantRating);
        
    }
    else if (self.goodRestaurants.count > 2)
    {
        
        self.aRestaurant = self.goodRestaurants[2];
        //[self configureAnnotations];
        NSLog(@"%@ restName", self.aRestaurant.restaurantName);
        NSLog(@"%@ restNotes", self.aRestaurant.restaurantNotes);
        NSLog(@"%hd restRating", self.aRestaurant.restaurantRating);
    }

//    for (Restaurant *i in self.goodRestaurants)
//    {
//        NSString *temp = i.restaurantName;
//        NSLog(temp);
//    }

    
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

- (BOOL)textFieldShouldReturn:(UITextField *)textField
{
    BOOL rc = NO;
    if (![textField.text isEqualToString:@""])
        
    {
//        if (textField == self.nameTextField)
//        {
//            [self.nameTextField becomeFirstResponder];
//        }
        
//        UIView *contentView = [textField superview];
//        ToDoCell *cell = (ToDoCell *)[contentView superview];
//        NSIndexPath *indexPath = [self.tableView indexPathForCell:cell];
//        ToDoItem *aToDoItem = self.toDoItems[indexPath.row];
        self.aRestaurant.restaurantName = textField.text;
        [textField resignFirstResponder];
        
        [self saveContext];
    }
    
    return rc;  // rc stands for ReturnCode
}


-(void)textViewDidChange:(UITextView *)textView
{
    [textView becomeFirstResponder];
   // BOOL rc = NO;
    if (![textView.text isEqualToString:@""])
    {
        //        UIView *contentView = [textField superview];
        //        ToDoCell *cell = (ToDoCell *)[contentView superview];
        //        NSIndexPath *indexPath = [self.tableView indexPathForCell:cell];
        //        ToDoItem *aToDoItem = self.toDoItems[indexPath.row];
        self.aRestaurant.restaurantNotes = textView.text;
        //[textField resignFirstResponder];
        
        [self saveContext];
    }
    
   // return rc;  // rc stands for ReturnCode
}


- (IBAction)doneWithTextViewTapped:(UIButton *)sender
{
    //self.aRestaurant.restaurantNotes = self.commentsTextView.text;
    [self.commentsTextView resignFirstResponder];
    [self saveContext];
}


#pragma mark - Action Handler

-(IBAction)stepperValueChanged:(UIStepper *)sender
{
   // UIView *contentView = [sender superview];
   // SpellCell *cell = (SpellCell *)[contentView superview];
   // NSIndexPath *indexPath = [self.tableView indexPathForCell:cell];
  //  Counter *aCounter = self.counters[indexPath.row];
    self.aRestaurant.restaurantRating = sender.value;
    self.ratingLabel.text = [NSString stringWithFormat:@"%g", sender.value];
   // cell.spellCountLabel.text = [NSString stringWithFormat:@"%g", sender.value];
    
    [self saveContext];
}


- (IBAction)addNewRestaurantButton:(UIButton *)sender
{
    self.coverUpUIView.backgroundColor = [UIColor clearColor];
    
    Restaurant *aRestaurant = [NSEntityDescription insertNewObjectForEntityForName: NSStringFromClass([Restaurant class]) inManagedObjectContext:self.moc];
    [self.goodRestaurants addObject:aRestaurant];
    [self saveContext];
   // [self.tableView reloadData];
    
    
}

- (IBAction)doneButtonTapped:(UIButton *)sender
{
   // [self saveContext];
    self.coverUpUIView.backgroundColor = [UIColor darkGrayColor];
    self.nameTextField.text = @"";
    self.commentsTextView.text = @"";
    self.ratingLabel.text = @"0";
    self.ratingStepper.value = 0;

}

#pragma mark - misc

- (void)saveContext
{
    NSError *error = nil;
    [self.moc save:&error];
    if (error)
    {
        NSLog(@"Error saving moc: %@", [error localizedDescription]);
    }
    
}


@end
