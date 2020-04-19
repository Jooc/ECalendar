//
//  DayCell.swift
//  ECalendar
//
//  Created by 齐旭晨 on 2020/4/16.
//  Copyright © 2020 齐旭晨. All rights reserved.
//

import SwiftUI

struct DayCell: View {
    var viewModel: EDayViewModel
    
    var body: some View {
        Text(viewModel.getStringDate())
            .frame(width: viewModel.size.width, height: viewModel.size.height)
            .background(viewModel.backGroundColor)
            .foregroundColor(viewModel.fontColor)
            .clipShape(Circle())
    }
}

struct DayCell_Previews: PreviewProvider {
    static var previews: some View {
        VStack(spacing: 20) {
            DayCell(viewModel: EDayViewModel.Sample(date: nil, state: .uncover))
            DayCell(viewModel: EDayViewModel.Sample(date: nil, state: .available))
            DayCell(viewModel: EDayViewModel.Sample(date: nil, state: .selected))
            DayCell(viewModel: EDayViewModel.Sample(date: nil, state: .unavailable))
        }
    }
}
