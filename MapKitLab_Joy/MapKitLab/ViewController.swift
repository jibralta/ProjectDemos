//
//  ViewController.swift
//  MapKitLab
//
//  Created by Ezekiel Abuhoff on 7/20/16.
//  Copyright © 2016 General Assembly. All rights reserved.
//

import UIKit
import MapKit

class ViewController: UIViewController, MKMapViewDelegate, CLLocationManagerDelegate {
    
    let mapView = MKMapView()

    
    // MARK: Life Cycle

    override func viewDidLoad() {
        super.viewDidLoad()
        
        mapView.frame = CGRect(x: 10, y: 60, width: view.frame.size.width - 20 , height: 300)
        mapView.center = view.center
        mapView.mapType = .standard
        mapView.isZoomEnabled = true
        
        mapView.delegate = self
        mapView.showsUserLocation = true

        view.addSubview(mapView)
        
        let tapGestureRecognizer: UIGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(tapToMakePoint))
        mapView.addGestureRecognizer(tapGestureRecognizer)

    }

    func tapToMakePoint(recognizer: UIGestureRecognizer) {
        let touchPoint = recognizer.location(in: mapView)
        let newCoordinates = mapView.convert(touchPoint, toCoordinateFrom: mapView)
        let annotation = MKPointAnnotation()
        annotation.coordinate = newCoordinates
        mapView.addAnnotation(annotation)
    }
}

