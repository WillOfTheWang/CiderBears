//
//  MapViewController.swift
//  Herd
//
//  Created by Yunfang Xiao on 11/3/18.
//  Copyright © 2018 Draphix. All rights reserved.
//

import UIKit
import MapKit
import CoreLocation

class MapScreen: UIViewController {
    
    @IBOutlet weak var mapView: MKMapView!
    
    let manager = CLLocationManager()
    
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation])
    {
        let location = locations[0]
        
        let span:MKCoordinateSpan = MKCoordinateSpanMake(0.01, 0.01)
        let myLocation:CLLocationCoordinate2D = CLLocationCoordinate2DMake(location.coordinate.latitude, location.coordinate.longitude)
        let region:MKCoordinateRegion = MKCoordinateRegionMake(myLocation, span)
        mapView.setRegion(region, animated: true)
        
        print(location.altitude)
        print(location.speed)
        
        self.mapView.showsUserLocation = true
    }
    
    
    override func viewDidLoad()
    {
        super.viewDidLoad()
        manager.delegate = self as? CLLocationManagerDelegate
        manager.desiredAccuracy = kCLLocationAccuracyBest
        manager.requestWhenInUseAuthorization()
        manager.startUpdatingLocation()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
}
