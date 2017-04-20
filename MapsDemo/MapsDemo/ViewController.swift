//
//  ViewController.swift
//  MapsDemo
//
//  Created by Joy Umali on 4/18/17.
//  Copyright © 2017 Joy Umali. All rights reserved.
//

import UIKit
import MapKit

class ViewController: UIViewController, MKMapViewDelegate, CLLocationManagerDelegate {
    
    let mapView = MKMapView()
    let locationManager = CLLocationManager()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let longGestureRecognizer: UIGestureRecognizer = UILongPressGestureRecognizer(target: self, action: #selector(longPress))
        mapView.addGestureRecognizer(longGestureRecognizer)
        
        locationManager.delegate = self
        
        if (locationManager.responds(to: #selector(CLLocationManager.requestAlwaysAuthorization))) {
            locationManager.requestAlwaysAuthorization()
            
        }
        
        mapView.frame = CGRect(x: 10, y: 60, width: view.frame.size.width - 20 , height: 300)
        mapView.center = view.center
        mapView.mapType = .standard
        mapView.isZoomEnabled = true
        
        mapView.delegate = self
        mapView.showsUserLocation = true
        
        view.addSubview(mapView)
        
    }
    
    func longPress(recognizer: UIGestureRecognizer) {
        let touchPoint = recognizer.location(in: mapView)
        let newCoordinates = mapView.convert(touchPoint, toCoordinateFrom: mapView)
        let annotation = MKPointAnnotation()
        annotation.coordinate = newCoordinates
        mapView.addAnnotation(annotation)
    }
}

