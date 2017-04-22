

![](https://ga-dash.s3.amazonaws.com/production/assets/logo-9f88ae6c9c3871690e33280fcf557f33.png)

MapKit
===============
---

Week 10 - Day 2 

By: Eric Giannini 

---


# CONNECTION TO LONG-TERM OBJECTIVE

MapKit is one of the last objects in the object library; MapKit gives us access to an interactive map. 

# LEARNING OBJECTIVES

* **Discuss** MapKit

* **Implement** a MapKit

## STUDENT PRE-WORK

Students should know:

* Xcode
* Swift  

# MapKit

What is MapKit? What can you do with MapKit? What are its properties? What are its methods? Is MapKit a viable option in comparison with GoogleMaps? Which is better / worse? In which respect? 

# MapKit 

1. Create a single view Xcode project. 
2. Import `MapKit` into `ViewController`
3. Add `viewWillAppear` to `ViewController`
4. In `viewWillAppear` create an instance of `MKMapView()`.
5. Configure its frame. If you use CGRect, pass constants to each of the arguments in the method's parameter list; alternatively, you may use: `self.view.bounds`. 
6. Set the `.mapType` property to whichever you would like. 
7. Set the `.isZoomEnabled` property to true. 
8. Set the `.isScrollEnabled` property to true
9. Set the `.center` property to `view.center`
10. Finally add `mapView` as a Subview to view. 


> Note: It is not a best practice to pass literals into CGRect(); the best practice is to pass constants. 

# Independent Practice 15 Mins

1. Add a MapView to your project. 
2. Toggle the different types of `.mapType`s 

# Locations 
1. Set `self.mapView.delegate =  self` & `self.mapView.showsUserLocation = true`
2. Update the `Info.plist` to display a message for Privacy - Location Usage Always Description.
3. Add `CLLocationManagerDelegate` to 
4. Create an instance of `CLLocationManager` called `locationManager`
5. Set the `.delegate` property to self in `viewDidload`. 
6. In `viewDidLoad` request permission to display the user's location: 
```        
        if(locationManager.responds(to: #selector(CLLocationManager.requestAlwaysAuthorization))) {
            locationManager.requestAlwaysAuthorization()
            //locationManager.requestWhenInUseAuthorization()
        }
```      
  
 
# Pin & Annotations 

## developer enabled

1. `import CoreLocation`
2. `CLLocationManagerDelegate` in extension or in class's declaration. 
3. Add a custom class to your project called "City" as a subclass of `NSObject` & `MKAnnotation`.
4. Add changeable properties called `cName`, `cCoordinates` of type `CLLocationCoordinate2D`, `cInfo`. 
5. Program the class' initialization.
6. Instantiate instances of cities. 
7. In `viewDidLoad()` add these annotations to `mapView`. You may have to change the scope of mapView's declaration. 

# Pair Programming 10 Mins

1. add a gesture recognizer to the mapView 
2. enable a user to add a pin
3. figure out how to delete the pin

## user enabled 

```
        let longPressGestureRecognizer: UIGestureRecognizer = UILongPressGestureRecognizer(target: self, action: #selector(longPress))
        mapView.addGestureRecognizer(longPressGestureRecognizer)
```


```
    func longPress(gestureRecognizer:UIGestureRecognizer){
        let touchPoint = gestureRecognizer.location(in: mapView)
        let newCoordinates = mapView.convert(touchPoint, toCoordinateFrom: mapView)
        let annotation = MKPointAnnotation()
        annotation.coordinate = newCoordinates
        mapView.addAnnotation(annotation)
    }
```

```
mapView.removeAnnotation(<annotation: MKAnnotation>)
```

# Independent Practice 15 Mins

1. Add a pins to your instance of MapView.  

# CONCLUSION (5 mins)

## CHECK-FOR-UNDERSTANDING: WRITE-SHARE

*What is the purpose of MapView.*

## TAKEAWAYS

* MKMapView is configurable map. 

## Further Reading 

-[Apple's Documentation on MKMapView](https://developer.apple.com/reference/mapkit/mkmapview)