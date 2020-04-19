//
//  Samples.swift
//  ECalendar
//
//  Created by 齐旭晨 on 2020/4/16.
//  Copyright © 2020 齐旭晨. All rights reserved.
//

import Foundation

extension EDayViewModel{
    static func Sample(date: Int?, state: EDayState) -> EDayViewModel{
        switch state {
        case .uncover: return EDayViewModel(model: EDay(date: date ?? 31), state: .uncover)
        case .available: return EDayViewModel(model: EDay(date: date ?? 1), state: .available)
        case .selected: return EDayViewModel(model: EDay(date: date ?? 2), state: .selected)
        case .unavailable: return EDayViewModel(model: EDay(date: date ?? 3), state: .unavailable)
        }
    }
}

extension EWeekViewModel{
    static func Sample() -> EWeekViewModel{
        let viewModel = EWeekViewModel()
        viewModel.days.append(EDayViewModel.Sample(date: 31, state: .uncover))
        viewModel.days.append(EDayViewModel.Sample(date: 1, state: .available))
        viewModel.days.append(EDayViewModel.Sample(date: 2, state: .available))
        viewModel.days.append(EDayViewModel.Sample(date: 3, state: .available))
        viewModel.days.append(EDayViewModel.Sample(date: 4, state: .available))
        viewModel.days.append(EDayViewModel.Sample(date: 5, state: .selected))
        viewModel.days.append(EDayViewModel.Sample(date: 6, state: .available))
        return viewModel
    }
}

extension EMonthViewModel{
    static func Sample() -> EMonthViewModel{
        let viewModel = EMonthViewModel(month: 1)
        viewModel.generateMonth(baseWeekday: .Tuesday, preCount: 31, curCount: 31)
        return viewModel
    }
}

extension CalendarViewModel{
    static func Sample() -> CalendarViewModel{
        let viewModel = CalendarViewModel()
        viewModel.updateEvents(with: Event.all)
        
        return viewModel
    }
}

extension Event{
    static var all: [Event] = {
        (1...2).map{ id in
            let event:Event = FileHelper.loadBundleJSON(file: "event-\(id)")
            return event
        }
    }()
}
