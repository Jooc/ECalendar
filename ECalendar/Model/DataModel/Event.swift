//
//  Event.swift
//  ECalendar
//
//  Created by 齐旭晨 on 2020/4/16.
//  Copyright © 2020 齐旭晨. All rights reserved.
//

import Foundation

struct Event: Codable, Hashable{
    var date: String
    
    var title: String
    var content: String
    var location: String?
}
