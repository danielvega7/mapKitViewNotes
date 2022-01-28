//
//  ViewController.swift
//  mapKitViewNotes
//
//  Created by DANIEL VEGA on 1/19/22.
//

import UIKit
import MapKit
class ViewController: UIViewController, CLLocationManagerDelegate {

    @IBOutlet weak var mapViewOutlet: MKMapView!
    
    var locationManager = CLLocationManager()
    var currentLocation: CLLocation!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        locationManager.requestWhenInUseAuthorization()
        mapViewOutlet.showsUserLocation = true
        locationManager.delegate = self
        locationManager.desiredAccuracy = kCLLocationAccuracyBest
        locationManager.startUpdatingLocation()
        
        
        let span = MKCoordinateSpan(latitudeDelta: 0.05, longitudeDelta: 0.05)
        let center = CLLocationCoordinate2D(latitude: 42.2371, longitude: -88.3226)
        let center2 = locationManager.location!.coordinate
        let region = MKCoordinateRegion(center: center, latitudinalMeters: 1600, longitudinalMeters: 1600)
        let region2 = MKCoordinateRegion(center: center2, span: span)
        mapViewOutlet.setRegion(region2, animated: true)
        
        
    }
    
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        currentLocation = locations[0]
        
    }


}

