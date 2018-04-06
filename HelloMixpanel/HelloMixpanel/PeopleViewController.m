//
//  PeopleViewController.m
//  HelloMixpanel
//
//  Created by Zihe Jia on 4/4/18.
//  Copyright © 2018 Mixpanel. All rights reserved.
//
#import "PeopleViewController.h"


@interface PeopleViewController ()

@end

@implementation PeopleViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.trackActions = @{@"Set Properties": ^(void){[self testSetProperties];},
                          @"Set One Property": ^(void){[self testSetOneProperty];},
                          @"Set Properties Once": ^(void){[self testSetPropertiesOnce];},
                          @"Unset Properties": ^(void){[self testUnsetProperties];},
                          @"Incremet Properties": ^(void){[self testIncrementProperties];},
                          @"Increment Property": ^(void){[self testIncrementProperty];},
                          @"Append Properties": ^(void){[self testAppendProperties];},
                          @"Union Properties": ^(void){[self testUnionProperties];},
                          @"Track Charge w/o Properties": ^(void){[self testTrackChargeWithOutProperties];},
                          @"Track Charge w Properties": ^(void){[self testTrackChargeWithProperties];},
                          @"Clear Charges": ^(void){[self testClearCharges];},
                          @"Delete User": ^(void){[self testDeleteUsers];}
                          };
    [self.tableView reloadData];
}

- (void)testSetProperties
{
    NSString *eventTitle = @"Set Properties";
    NSDictionary *properties = @{@"a": @1,
                                @"b": @2.3,
                                @"c": @[@"4", @5],
                                @"d": [NSURL URLWithString:@"https://mixpanel.com"],
                                @"e": [NSNull null],
                                 @"f":  [NSDate date]};
    
    [self.mixpanel.people set:properties];
    [self presentLogMessage:[NSString stringWithFormat:@"Properties: %@", properties] title:eventTitle];
}

- (void)testSetOneProperty
{
    NSString *eventTitle = @"Set One Property";
    [self.mixpanel.people set:@"g" to:@"yo"];
    [self presentLogMessage:@"Property key: g, value: yo" title:eventTitle];
}

- (void)testSetPropertiesOnce
{
    NSString *eventTitle = @"Set Properties Once";
    NSDictionary *properties = @{@"h": @"just once"};
    
    [self.mixpanel.people setOnce:properties];
    [self presentLogMessage:[NSString stringWithFormat:@"Properties: %@", properties] title:eventTitle];
}

- (void)testUnsetProperties
{
    NSString *eventTitle = @"Unset Properties";
    NSArray *keys = @[@"a", @"b"];
    
    [self.mixpanel.people unset:keys];
    [self presentLogMessage:[NSString stringWithFormat:@"Properties: %@", keys] title:eventTitle];
}

- (void)testIncrementProperties
{
    NSString *eventTitle = @"Increment Properties";
    NSDictionary *properties = @{@"a": @1.2, @"b": @3};
    
    [self.mixpanel.people increment:properties];
    [self presentLogMessage:[NSString stringWithFormat:@"Increment Properties: %@", properties] title:eventTitle];
}

- (void)testIncrementProperty
{
    NSString *eventTitle = @"Increment Property";
    [self.mixpanel.people increment:@"b" by:@2.3];
    [self presentLogMessage:@"Property key: b, value increment: 2.3" title:eventTitle];
}

- (void)testAppendProperties
{
    NSString *eventTitle = @"Append Properties";
    NSDictionary *properties = @{@"c": @"hello", @"d": @"goodbye"};
    
    [self.mixpanel.people append:properties];
    [self presentLogMessage:[NSString stringWithFormat:@"Properties: %@", properties] title:eventTitle];
}

- (void)testUnionProperties
{
    NSString *eventTitle = @"Union Properties";
    NSDictionary *properties = @{@"c": @[@"goodbye", @"hi"], @"d": @"hello"};
    
    [self.mixpanel.people union:properties];
    [self presentLogMessage:[NSString stringWithFormat:@"Properties: %@", properties] title:eventTitle];
}

- (void)testTrackChargeWithOutProperties
{
    NSString *eventTitle = @"Track Charge";
    [self.mixpanel.people trackCharge:@20.5];
    [self presentLogMessage:@"Amount: 20.5" title:eventTitle];
}

- (void)testTrackChargeWithProperties
{
    NSString *eventTitle = @"Track Charge With Properties";
    NSDictionary *properties = @{@"sandwich": @1};
    [self.mixpanel.people trackCharge:@12.8 withProperties:properties];
    [self presentLogMessage:[NSString stringWithFormat:@"Amount: 12.8, Properties: %@", properties] title:eventTitle];
}

- (void)testClearCharges
{
    NSString *eventTitle = @"Clear Charges";
    [self.mixpanel.people clearCharges];
    [self presentLogMessage:@"Cleared Charges" title:eventTitle];
}

- (void)testDeleteUsers
{
    NSString *eventTitle = @"Delete User";
    [self.mixpanel.people deleteUser];
    [self presentLogMessage:@"Deleted User" title:eventTitle];
}

@end
