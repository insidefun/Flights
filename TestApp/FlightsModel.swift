//
//  FlightsModel.swift
//  TestApp
//
//  Created by insidefun on 26.12.16.
//  Copyright © 2016 insidefun. All rights reserved.
//

import Foundation
import SwiftyJSON

class FlightsModel {
    let tickets: [TicketModel]
    let cities: [CityModel]
    
    init(tickets: [TicketModel], cities: [CityModel]) {
        self.tickets = tickets
        self.cities = cities
    }
    
    class func build(json: JSON) -> FlightsModel? {
        //TODO: FIX IT
        if let tickets = (json["tickets"].array?.map {return TicketModel.build(json: $0)}),
            let cities = (json["cities"].array?.map {return CityModel.build(json: $0)}) {
            
            return FlightsModel(tickets: tickets as! [TicketModel], cities: cities as! [CityModel])
        } else {
            print("bad json: \(json)")
            return nil
        }
    }
}
