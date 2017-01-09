//
//  Person.m
//  Demo
//
//  Created by Lee Bennett on 9/7/16.
//  Copyright © 2016 Boston Consulting Group Digital Ventures. All rights reserved.
//

#import "Person.h"

// Class extension: a place where you define PRIVATE properties
@interface Person ()

// PRIVATE properties behind the scenes generate PRIVATE instance variables (_school) and PRIVATE accessor methods (school, setSchool:)
@property (nonatomic, strong) NSString *school;

@end

@implementation Person{
    
    // Instance variables represent the PRIVATE internal data of your app, they name should begin with underscore
    NSString *_name;
    NSString *_lastName;
}

// Private accessor method (get) for _name
- (NSString *)name{
    return _name;
}

// Private accessor method (set) for _name
- (void)setName:(NSString *)name{
    _name = name;
}

// Implementation of method 'sayHello'
-(void)sayHello{
    NSLog(@"Hello, I'm a person");
}

// Implementation of method 'sayMyName'
- (void)sayMyName{
    
    // This NSLog uses a format string, which allows us to inject variables into a string with format specifiers like %@
    NSLog(@"My name is %@", _name);
}

// Private method, objects outside of your class cannot use it!
- (void)printMySchool{
    
    // To access properties, we use dot notation. "self" is a reference to the object that's been instantiated. In other programming languages, they use the word "this"
    NSLog(@"My school is %@", self.school);
}
@end











