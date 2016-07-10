//
//  ViewController.swift
//  HonoluluArt
//
//  Created by TJ Maynes on 7/9/16.
//  Copyright © 2016 TJ Maynes. All rights reserved.
//

import UIKit
import MapKit

class ViewController: UIViewController {

    @IBOutlet weak var mapView: MKMapView!

    let regionRadius: CLLocationDistance = 1000

    override func viewDidLoad() {
        super.viewDidLoad()
        let initialLocation = CLLocation(latitude: 21.282778, longitude: -157.829444)
        centerMapOnLocation(initialLocation)

        mapView.delegate = self

        let artworks = loadInitialData()
        mapView.addAnnotations(artworks)
    }

    override func viewWillAppear(animated: Bool) {
        super.viewDidAppear(animated)
        checkLocationAuthorizationStatus()
    }

    func centerMapOnLocation(location: CLLocation) {
        let coordinateRegion = MKCoordinateRegionMakeWithDistance(location.coordinate, regionRadius * 2.0, regionRadius * 2.0)
        mapView.setRegion(coordinateRegion, animated: true)
    }

    func loadInitialData() -> [Artwork] {
        let fileName = NSBundle.mainBundle().pathForResource("PublicArt", ofType: "json")
        var data: NSData? = nil
        do {
            data = try NSData(contentsOfFile: fileName!, options: NSDataReadingOptions.DataReadingMappedIfSafe)
        } catch {
            print("Unhandled error")
        }

        var jsonData: AnyObject! = nil
        do {
            jsonData = try NSJSONSerialization.JSONObjectWithData(data!, options: NSJSONReadingOptions())
        } catch {
            print("Unhandled error")
        }

        var artworks = [Artwork]()
        if let jsonObject = jsonData as? [String: AnyObject], let jsonData = JSONValue.fromObject(jsonObject)?["data"]?.array {
            for artworkJSON in jsonData {
                if let artworkJSON = artworkJSON.array,
                    artwork = Artwork.fromJSON(artworkJSON) {
                    artworks.append(artwork)
                }
            }
        }

        return artworks
    }

    var locationManger = CLLocationManager()
    func checkLocationAuthorizationStatus() {
        if CLLocationManager.authorizationStatus() == .AuthorizedWhenInUse {
            mapView.showsUserLocation = true
        } else {
            locationManger.requestWhenInUseAuthorization()
        }
    }
}

