//
//  TicketModel.swift
//  TestApp
//
//  Created by insidefun on 27.12.16.
//  Copyright © 2016 insidefun. All rights reserved.
//

import Foundation
import SwiftyJSON

class TicketModel {
    let origin: String
    let destination: String
    let cacheTime: Float
    let transit: Int
    let departDate: String
    let returnDate: String
    let price: Float
    
    init(origin: String, destination: String, cacheTime: Float, transit: Int, departDate: String, returnDate: String, price: Float) {
        self.origin = origin
        self.destination = destination
        self.cacheTime = cacheTime
        self.transit = transit
        self.departDate = departDate
        self.returnDate = returnDate
        self.price = price
    }
    
    class func build(json: JSON) -> TicketModel?  {
        if let origin = json["origin"].string,
            let destination = json["destination"].string,
            let cacheTime = json["cacheTime"].float,
            let transit = json["transit"].int,
            let departDate = json["depart_date"].string,
            let returnDate = json["return_date"].string,
            let price = json["price"].float {
                return TicketModel(origin: origin, destination: destination, cacheTime: cacheTime, transit: transit, departDate: departDate, returnDate: returnDate, price: price)
        } else {
            print("bad json \(json)")
            return nil
        }
    }
}
