//
//  WeekRow.swift
//  ECalendar
//
//  Created by 齐旭晨 on 2020/4/18.
//  Copyright © 2020 齐旭晨. All rights reserved.
//

import SwiftUI

struct WeekRow: View {
    var viewModel: EWeekViewModel
    
    var body: some View {
        HStack(spacing: self.viewModel.space){
            ForEach(self.viewModel.days){ day in
                DayCell(viewModel: day)
            }
        }
    }
}

struct WeekRow_Previews: PreviewProvider {
    static var previews: some View {
        WeekRow(viewModel: EWeekViewModel.Sample())
    }
}
