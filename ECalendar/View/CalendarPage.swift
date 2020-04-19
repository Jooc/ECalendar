//
//  CalendarPage.swift
//  ECalendar
//
//  Created by 齐旭晨 on 2020/4/18.
//  Copyright © 2020 齐旭晨. All rights reserved.
//

import SwiftUI

struct CalendarPage: View {
    @EnvironmentObject var store: Store
    var screen = UIScreen.main.bounds

    var body: some View {
        VStack(spacing: 0){
            VStack{
                CalendarHeader()
                CalendarPad()
            }
            VStack{
                Text("123")
            }
            .frame(width: screen.width)
            .frame(maxHeight: .infinity)
        }
    }
}

struct CalendarPage_Previews: PreviewProvider {
    static var previews: some View {
        CalendarPage().environmentObject(Store())
    }
}
