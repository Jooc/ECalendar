//
//  ECalendarViewModel.swift
//  ECalendar
//
//  Created by 齐旭晨 on 2020/4/16.
//  Copyright © 2020 齐旭晨. All rights reserved.
//

import Foundation

class CalendarViewModel{
    let calendar = Calendar()
    var months = [EMonthViewModel]()
    var events = Dictionary<Int, Event>()
    
    var selectedDayIndex: Int? = nil
    
    init() {
        self.generateVMs()
    }
    
    func updateEvents(with eventResponse: [Event]){
        for response in eventResponse{
            self.generateEventFromResponse(response: response)
        }
    }
}

extension CalendarViewModel{
    // Based on the year
    // Generate all viewModels of the whole year
    private func generateVMs() {
        for month in 1...12{
            let newMonthViewModel = EMonthViewModel(month: month)
            var preMonth = month - 2
            if preMonth < 0{
                preMonth += 12
            }
            let curMonth = month - 1
            let beginWeekDaySymbol = calendar.beginWeekdaySymbolOfMonth(month: month)
            
            print(String(month) + "begin with: " + String(beginWeekDaySymbol.text))
            newMonthViewModel.generateMonth(
                baseWeekday: beginWeekDaySymbol,
                preCount: calendar.daysCounts[preMonth],
                curCount: calendar.daysCounts[curMonth])
            self.months.append(newMonthViewModel)
        }
    }
    
    // TODO: get events from server
    private func generateEventFromResponse(response: Event) {
        let dateString = response.date
        let pars = dateString.prefix(upTo: dateString.lastIndex(of: " ")!)
            .split{$0 == " "}
            .map(String.init)
            .map{string in Int(string)!}
        
        self.months[pars[0]].weeks[pars[1]].days[pars[2]].events.append(response)
    }
    
    private func bindEvent2VM() {
        for (key, value) in self.events{
            let (month, week, day) = self.calendar.Index2MWD(index: key)
            self.months[month].weeks[week].days[day].events.append(value)
        }
    }
    
    private func updateEventFromVM(){
//        if let index = self.selectedDayIndex{
//            let (month, week, day) = self.calendar.Index2MWD(index: index)
//            self.events[index] = self.months[month].weeks[week].days[day].event
            
            // TODO: uploadEvents2Server()
//        }
    }
}
