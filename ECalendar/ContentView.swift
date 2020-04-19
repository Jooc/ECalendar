//
//  ContentView.swift
//  ECalendar
//
//  Created by 齐旭晨 on 2020/4/16.
//  Copyright © 2020 齐旭晨. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    var viewModel: CalendarViewModel
    
    var body: some View {
        Button("Button"){}
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView(viewModel: CalendarViewModel())
    }
}
