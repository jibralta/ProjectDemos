# How To: Permissions

+ Permissions allow us to access the user's sensitive data. (Location, Photos, Contacts, etc.)

## Photo Library 

+ Add the `Photos.framework` to your project
	+ Click on your project -> Target -> Linked Frameworks & Libraries -> plus button
	+ Search and then add the `Photos.framework`
+ Import the Photos framework into the file you want to use it
	+ `import Photos`
+ Add the key `Privacy - Photo Library Usage Description` to your `Info.plist`
+ Check permission using `PHPhotoLibrary.authorizationStatus()`
+ Request permission using `PHPhotoLibrary.requestAuthorization(handler: (PHAuthorizationStatus) -> Void)`

**Example:**

```swift
  func getPermissionForPhotoLibrary() {
    PHPhotoLibrary.requestAuthorization { (authorizationStatus) in
      switch authorizationStatus {
      case .authorized:
        print("authorized")
      case .denied:
        print("denied")
      case .notDetermined:
        print("not determined")
      case .restricted:
        print("resticted")
      }
    }  
  }
```  

## Location

+ Add the `CoreLocation.framework` to your project
	+ Project -> Target -> Linked Frameworks & Libraries -> Plus Button
	+ Search and Add CoreLocation
+  Import Core Location into the file you want to use the framework
	+ `import CoreLocation`
+ Add either of the following keys to your `Info.plist`. The one you choose should depend on how you want to use the user's location
	+ `Privacy - Location Always Usage Description`
	+ `Privacy - Location When In Use Usage Description`
+ Create a locationManager to manage getting the user's location
	+ `let locationManager = CLLocationManager()`

> **Note:** When a location manager is discarded because its scope ends, its permission requests are cut short. Therefore, locationManager should be a *property* of your View Controller (Or whatever class you're using location in!) 

+ Request permission using:
	+ `locationManager.requestAlwaysAuthorization()`
	+ `locationManager.requestWhenInUseAuthorization()` 

+ Receive the location by implementing the delegate `CLLocationManagerDelegate`

## Contacts
+ Add the `Contacts.framework` to your project 
+ Go to info.plist and add "Privacy - Contacts Usage Description"
+ Import Contacts into the ViewController
+ Create variable 

```swift
let contactManager = CNContactStore()  
```
+ Create authorizeContactsPermission()


```swift
func authorizeContactsPermission() {
        
        contactManager.requestAccess(for: .contacts) { (bool, error) in
            guard error == nil else {return}
            if bool {
                print("contacts authorized")
            }
            else {
                print(" contacts denied")
            }
        }
    }
```
+ In viewDidLoad, call authorizeContactsPermission()


## Calendars


## Reminders

