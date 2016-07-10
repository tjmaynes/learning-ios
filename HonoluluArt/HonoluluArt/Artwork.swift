//
//  Artwork.swift
//  HonoluluArt
//
//  Created by TJ Maynes on 7/9/16.
//  Copyright © 2016 TJ Maynes. All rights reserved.
//

import MapKit
import Contacts

class Artwork: NSObject, MKAnnotation {
    let title: String?
    let locationName: String
    let discipline: String
    let coordinate: CLLocationCoordinate2D

    init(title: String, locationName: String, discipline: String, coordinate: CLLocationCoordinate2D) {
        self.title = title
        self.locationName = locationName
        self.discipline = discipline
        self.coordinate = coordinate

        super.init()
    }

    class func fromJSON(json: [JSONValue]) -> Artwork? {
        var title: String
        if let titleOrNil = json[16].string {
            title = titleOrNil
        } else {
            title = ""
        }

        let locationName = json[12].string
        let discipline = json[15].string

        let latitude = (json[18].string! as NSString).doubleValue
        let longitude = (json[19].string! as NSString).doubleValue
        let coordinate = CLLocationCoordinate2D(latitude: latitude, longitude: longitude)

        return Artwork(title: title, locationName: locationName!, discipline: discipline!, coordinate: coordinate)
    }

    var subtitle: String? {
        return locationName
    }

    func mapItem() -> MKMapItem {
        let addressDictionary = [String(CNPostalAddressStreetKey): self.subtitle!]
        let placemark = MKPlacemark(coordinate: coordinate, addressDictionary: addressDictionary)
        let mapItem = MKMapItem(placemark: placemark)
        mapItem.name = title

        return mapItem
    }

    func pinColor() -> UIColor {
        switch discipline {
        case "Sculpture", "Plaque":
            return UIColor.redColor()
        case "Mural", "Monument":
            return UIColor.purpleColor()
        default:
            return UIColor.greenColor()
        }
    }
}
