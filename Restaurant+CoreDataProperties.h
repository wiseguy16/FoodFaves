//
//  Restaurant+CoreDataProperties.h
//  FoodFaves
//
//  Created by Gregory Weiss on 8/10/16.
//  Copyright © 2016 Gregory Weiss. All rights reserved.
//
//  Choose "Create NSManagedObject Subclass…" from the Core Data editor menu
//  to delete and recreate this implementation file for your updated model.
//

#import "Restaurant.h"

NS_ASSUME_NONNULL_BEGIN

@interface Restaurant (CoreDataProperties)

@property (nullable, nonatomic, retain) NSString *restaurantName;
@property (nullable, nonatomic, retain) NSString *restaurantNotes;
@property (nullable, nonatomic, retain) NSString *restaurantMisc1;
@property (nullable, nonatomic, retain) NSString *restaurantMisc2;
@property (nonatomic) int16_t restaurantRating;
@property (nonatomic) double restaurantLat;
@property (nonatomic) double restaurantLong;

@end

NS_ASSUME_NONNULL_END
