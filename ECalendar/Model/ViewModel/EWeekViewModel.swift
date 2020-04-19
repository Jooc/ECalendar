//
//  EWeekViewModel.swift
//  ECalendar
//
//  Created by 齐旭晨 on 2020/4/16.
//  Copyright © 2020 齐旭晨. All rights reserved.
//

import Foundation
import SwiftUI

class EWeekViewModel: Identifiable {
    var space: CGFloat = 18
    
    
    var days: [EDayViewModel]
    
    init() {
        days = [EDayViewModel]()
    }
}
