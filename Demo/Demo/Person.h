//
//  Person.h
//  Demo
//
//  Created by Lee Bennett on 9/7/16.
//  Copyright © 2016 Boston Consulting Group Digital Ventures. All rights reserved.
//

#import <Foundation/Foundation.h>

// Properties and methods in the interface are VISIBLE to other objects using this class
// Person inherits from NSObject, which passes onto it essential methods like "alloc" and "init"
@interface Person : NSObject

// PUBLIC properties behind the scenes generate PRIVATE instance variables (_age) and PUBLIC accessor methods (age, setAge:)
@property int age;

// Objects properties require the attributes "nonatomic" (non-thread safe) and "strong" (strong reference for memory mangement)
@property (nonatomic, strong) NSString *favoriteColor;

// PUBLIC method signatures
- (void)sayHello;
- (void)sayMyName;

// PUBLIC accessor methods
- (NSString *)name;
- (void)setName:(NSString *)name;

@end
