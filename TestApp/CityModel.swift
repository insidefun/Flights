//
//  CityModel.swift
//  TestApp
//
//  Created by insidefun on 27.12.16.
//  Copyright © 2016 insidefun. All rights reserved.
//

import Foundation
import SwiftyJSON

class CityModel {
    let code: String
    let name: String
    let city: String
    let country: String
    let lat: Float
    let lng: Float
    let picture: String
    
    init(code: String, name: String, city: String, country: String, lat: Float, lng: Float, picture: String) {
        self.code = code
        self.name = name
        self.city = city
        self.country = country
        self.lat = lat
        self.lng = lng
        self.picture = picture
    }
    
    class func build(json: JSON) -> CityModel? {
        if let code = json["code"].string,
            let name = json["name"].string,
            let city = json["city"].string,
            let country = json["country"].string,
            let lat = json["lat"].float,
            let lng = json["lng"].float,
            let picture = json["picture"].string {
            
            return CityModel(code: code, name: name, city: city, country: country, lat: lat, lng: lng, picture: picture)
        } else {
            print("bad json: \(json)")
            return nil
        }
    }
}
