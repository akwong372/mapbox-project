//
//  ViewController.swift
//  mapbox takehome1
//
//  Created by Alvin Kwong on 10/2/22.
//

import UIKit
import MapboxMaps

class ViewController: UIViewController {
    
    internal var mapView: MapView!

    override func viewDidLoad() {
        super.viewDidLoad()
        let myResourceOptions = ResourceOptions(accessToken: "pk.eyJ1IjoiYWt3b25nMzcyIiwiYSI6ImNsOG96ZzR4dzEzc3Qzd2xwcXUxcmszazgifQ.Cp_Lpv2mJaD-JYT7fyJ7sw")
        let myMapInitOptions = MapInitOptions(resourceOptions: myResourceOptions)
        mapView = MapView(frame: view.bounds, mapInitOptions: myMapInitOptions)
        mapView.autoresizingMask = [.flexibleWidth, .flexibleHeight]

        self.view.addSubview(mapView)
        
        // Center the map camera over Copenhagen.
        //changed to san francisco
        let centerCoordinate = CLLocationCoordinate2D(latitude: 37.773972, longitude: -122.431297)
        let options = MapInitOptions(cameraOptions: CameraOptions(center: centerCoordinate, zoom: 8.0))
         
        mapView = MapView(frame: view.bounds, mapInitOptions: options)
        mapView.autoresizingMask = [.flexibleWidth, .flexibleHeight]
        view.addSubview(mapView)
         
        // We want to display the annotation at the center of the map's current viewport
        //getting error with this uncommented but it looks like the annotation works without it?
        //let centerCoordinate = mapView.cameraState.center
         
        // Make a `PointAnnotationManager` which will be responsible for managing a
        // collection of `PointAnnotation`s.
        let pointAnnotationManager = mapView.annotations.makePointAnnotationManager()
         
        // Initialize a point annotation with a single coordinate
        // and configure it with a custom image (sourced from the asset catalogue)
        var customPointAnnotation = PointAnnotation(coordinate: centerCoordinate)
         
        // Make the annotation show a red pin
        customPointAnnotation.image = .init(image: UIImage(named: "ios_pin")!, name: "ios_pin")
         
        // Add the annotation to the manager in order to render it on the map.
        pointAnnotationManager.annotations = [customPointAnnotation]
        
    }
}

