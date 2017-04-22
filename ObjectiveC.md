

![](https://ga-dash.s3.amazonaws.com/production/assets/logo-9f88ae6c9c3871690e33280fcf557f33.png)

Objective-C
===============
---

Week 10 - Day 3 

By: Eric Giannini 

---


# CONNECTION TO LONG-TERM OBJECTIVE

Objective-C is a language that powers over a million apps on the App Store. 

# LEARNING OBJECTIVES

* **Discuss** Objective-C 

* **Compare** Objective-C to Swift 

* **Explore** Objective-C 

* **Build** an Objective-C app

## STUDENT PRE-WORK

Students should know:

* Xcode
* Swift

# What is Objective-C?

Objective-C is a strict superset of the C language. Everything that is in C, is in Objective-C; but nothing that is in Objective-C is in C. C is 40 years old. 

# Objective-C has no: 

* type inference 
* operator overloading
* protocol extensions
* string interpolation
* namespaces
* tuples
* optionals (i.e., a message to a nil object, nothing happens) 
* `.playgrounds`
* `guard` or `defer`.
* closed and half-open ranges
* `enum`
* exhaustive `switch` blocks 


# Objective-C has:   

1. header `.h` & implementation `.m` files 
2. methods for instance properties (i.e., `[UIColor blueColor];`
3. an NS prefix to Objective-C classes (i.e., `NSUserDefaults`, `NSFileManager`, `NSNotificationCenter`, and `NSUUID`
4. globalized properties as opposed to namespace: `NSTextAlignment.left` in Swift; `NSTextAlignmentLeft`
5. Whereas in Swift, a nil completion handler may be left out; in Objective-C, the completion handler cannot. 
6. has a main function

```
#import <Foundation/Foundation.h>
int main(int argc, const char * argv[]) {
   @autoreleasepool {
      // insert code here...
      NSLog(@"Hello, World!");
   }
return 0; }

```



# basics of Objective-C syntax 

Whereas methods are called through dot syntax in Swift, Objective-C operates through block syntax: 

- `[Class method: argument];`
- `[instanceVariable method: argument];` 

Here is a common example: 

- Swift: `dismiss(animated: true)`
- Objective-C: `[self dismissViewControllerAnimated:true completion:nil];`

## nesting 

```NSArray *array = [[NSArray alloc] init]; ```

array is a class and not a struct.  in swift, it is a struct. Swift can be seen as value oriented while objC is reference oriented. The objC object is like a pointer.


# Collections 

## NSArray 

```NSArray *array = @[@"stringOne", @"stringTwo"];```

• `count`: return the number of items in an array.
• `indexOfObject`: returns the location of an item in an array.
• `objectAtIndex:` returns the object at a location in an array, which is the counterpart to `indexOfObject:`

## Independent practice 10 mins
1. make message sends to `array`
2. run each of these methods on NSArray 


## NSMutableArray 

`@` designates an object as Objective-C. 

```NSMutalbeArray *array = @[@"stringOne", @"stringOne"];```

• addObjectsFromArray
• insertObject:atIndex 
• removeObject
• removeObjectAtIndex
• removeAllObjects 


## NSDictionary 

```
NSDictionary *dictionary = @{
   @"key1": @"value1",
   @"key2": @"value2",
   @"key3": @"value3"
};
```

```
NSDictionary *ships = [NSDictionary
dictionaryWithObjectsAndKeys: 
	@"key1": @"value1",
   @"key2": @"value2",
   @"key3": @"value3", 
   nil];
```

## Independent Practice 7 mins
1. Apply what you learned from arrays to manipulate an NSDictionary/NSMutableDictionary 
2. add values for keys 
3. remove values for keys

# NSLog

`NSLog(@"Hello, World!");`

## a print statement with variable
- The format specifier `%@` returns on any Objective-C object

``` 
NSString *string = @"World";  
NSLog(@"Hello, %@", string); 
```
There can be multiple format specificers:

```
NSString *device = @"iPhone";
NSString *model = @"6";
int year = 2016;
NSString *message = [NSString stringWithFormat:@"That's a %@ %@ from %d!", make, model, year];
NSLog(@"%@", message);
```

There are multiple other format specifiers: 

[format specificers](https://developer.apple.com/library/content/documentation/Cocoa/Conceptual/Strings/Articles/formatSpecifiers.html)

```NSLog(@"The current time is %02d:%02d", 10, 4);```


# Independent Practice 15 Mins

1. Print out an integer, double, float, etc... with `NSLog`
2. Print out the result of a message send to an instance of a class 


# conditions 
```
int i = 10;
if (i == 10) {
   NSLog(@"Hello, World!");
}
```

# booleans 
YES & NO

#loops 
## C-style for loops 


```
	NSArray *arrayOfLabels = [[NSArray alloc] initWithObjects:_nameLabel, _numberLabel, _informationLabel, nil];
    for (int i = 1; i <= [arrayOfLabels count]; i++)
    {
        UILabel *labelToBeAdded = [arrayOfLabels objectAtIndex:(i - 1)];
        [self.contentView addSubview:labelToBeAdded];
        
    }
```
## for in loops 

``` 
NSArray *arrayOfLabels = [[NSArray alloc] initWithObjects:_nameLabel, _numberLabel, _informationLabel, nil]; 
    for (UILabel *label in arrayOfLabels) {
        [self.contentView addSubview:label];
    }
```    
```
for (NSString *key in ships) {
   NSLog(@"The ship %@ features in %@", key, ships[key]);
}
```

# properties, functions, methods  

## properties 
```#import <UIKit/UIKit.h>.```
```#import "MyClass.h"```

properties are added like so:

```
@property NSString *itemName;
@property BOOL completed;
@property (readonly) NSDate *creationDate;
```
Often times properties will specify `(weak, nonatomic)` as in the following: 

```@property (weak, nonatomic) IBOutlet UITextField *textField;```

Nonatomic

nonatomic is for multi threading. If the attribute is nonatomic, then any other thread may access it. 

Copy

copy is required when the object is mutable. You will need to release the object when you are finished with it because you are retaining the copy.

Assign

Assign is the opposite of copy. It returns a reference to the actual data. Typically you use this attribute with primitives (i.e., BOOL, int, etc...)

Retain

retain is required when the attribute is a pointer to an object. It facilitates the retain count. 

Strong

strong is a replacement for the retain attribute, as part of Objective-C Automated Reference Counting (ARC). In non-ARC code it's just a synonym for retain.

Weak

weak is similar to strong except that it won't increase the reference count by 1. It holds a reference to the object. If the object's reference count drops to 0, it will be deallocated from memory.

##functions 

functions are declared with a hyphen & the output type: 

```
- (void)loadInitialData { }
```
```
 - (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender { }
```

```
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section { }
```

## methods 
methods with a parameter list require the class be declared before the argument label: 

```
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath { }
```
    
  
 
# iOS TableView application  

## developer enabled

1. Create a single view Xcode project. 
2. Add a class called `ToDoItem`
3. In the header file for `ToDoItem` add the following properities: 
``` 
@property NSString *itemName; 
@property BOOL completed;  @property (readonly) NSDate *creationDate;
```
4. Configure `Main.storyboard` with an instance of UILabel, a BarButtonItem to the right hand corner with a system type for adding, & an instance UITableView; control drag to create reference outlets for each of these properties in the ViewController class. Configure dataSource & delegate. 

5. Create an array. 
6. Create a function that will initialize three items like so:

```
	 ToDoItem *item1 = [[ToDoItem alloc] init];
    item1.itemName = @"Create a web app";
    [self.toDoItems addObject:item1];
```

7. Configure the action for the rightBarButtonItem so that a new item from the textField appends itself to the array when pressing the plus sign. 

``` 
if (self.textField.text != nil) {
		self.toDoItem = [[ToDoItem alloc] init];
        self.toDoItem.itemName = self.textField.text;
        self.toDoItem.completed = NO;
        [self.toDoItems addObject:item];
        [self.tableView reloadData];
    }
```

# Pair Programming 10 Mins
1. Configure the UITableView in pairs. 
2. Build & run the app. 

# CONCLUSION (5 mins)

## CHECK-FOR-UNDERSTANDING: WRITE-SHARE

*What is Objective-C?*

## TAKEAWAYS

* Objective-C differs but with similarities to Swift 
* Objective-C utilizes message sends, depends heavily upon classes / objects, maintains methods similar, if not identical to, Swift methods, etc...  

## Further Reading 

-[Apple's Documentation on Objective-C]()
