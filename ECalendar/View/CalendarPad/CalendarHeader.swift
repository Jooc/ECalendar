//
//  CalendarHeader.swift
//  ECalendar
//
//  Created by 齐旭晨 on 2020/4/18.
//  Copyright © 2020 齐旭晨. All rights reserved.
//

import SwiftUI

struct CalendarHeader: View {
    @EnvironmentObject var store: Store
    
    var screen = UIScreen.main.bounds
    
    var body: some View {
        HStack(spacing: 30){
            Button(action: {print("Left Page")}){
                Image(systemName: "chevron.left")
            }
            Text("January")
                .frame(width: screen.width*0.3)
            Button(action: {print("Right Page")}){
                Image(systemName: "chevron.right")
            }
        }
        .frame(width: screen.width)
        .padding(.vertical)
    }
}

struct CalendarHeader_Previews: PreviewProvider {
    static var previews: some View {
        CalendarHeader().environmentObject(Store())
    }
}
