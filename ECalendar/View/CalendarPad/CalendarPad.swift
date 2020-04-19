//
//  CalendarPage.swift
//  ECalendar
//
//  Created by 齐旭晨 on 2020/4/18.
//  Copyright © 2020 齐旭晨. All rights reserved.
//

import SwiftUI

struct CalendarPad: View {
    @EnvironmentObject var store: Store
    var screen = UIScreen.main.bounds
    
    @State var activePageIndex: Int = 0
    
    var padWidth = UIScreen.main.bounds.width
    var itemCount = 12
    
    @State var currentScrollOffset: CGFloat = 0
    @State var dragOffset: CGFloat = 0
    
    func pageIndexForOffset(offset: CGFloat) -> Int{
        guard self.itemCount>0 else{
            return 0
        }
        
        let floatIndex = (self.logicalScrollOffset(trueOffset: offset))/(screen.width)
        var computedIndex = Int(round(floatIndex))
        computedIndex = max(computedIndex, 0)
        return min(computedIndex, self.itemCount-1)
    }
    
    func offsetForPageIndex(_ index: Int)->CGFloat {
        let activePageOffset = CGFloat(index)*(padWidth)
        return 0 - activePageOffset
    }
    
    func computeScrollOffset() -> CGFloat{
        return self.offsetForPageIndex(self.activePageIndex) + self.dragOffset
    }
    
    func logicalScrollOffset(trueOffset: CGFloat) -> CGFloat{
        return (trueOffset) * -1
    }
    
    var body: some View {
        VStack {
            ScrollView(.horizontal, showsIndicators: false){
                HStack(alignment: .top, spacing: 0){
                    ForEach(self.store.appState.calendar.months){month in
                        VStack {
                            Text(String(month.month))
                            MonthPad(viewModel: month)
                            .padding(.vertical)
                        }
                    }
                }
                .onAppear{
                    self.currentScrollOffset = self.offsetForPageIndex(self.activePageIndex)
                }
                .background(Color("Base"))
                .offset(x: self.currentScrollOffset)
                .simultaneousGesture(
                    DragGesture(minimumDistance: 1, coordinateSpace: .local)
                        .onChanged{ value in
                            self.dragOffset = value.translation.width
                            self.currentScrollOffset = self.computeScrollOffset()
                    }
                    .onEnded{ value in
                        let velocityDiff = (value.predictedEndTranslation.width - self.dragOffset)
                        print(velocityDiff)
                        let newPageindex = self.pageIndexForOffset(offset: self.currentScrollOffset + velocityDiff)
                        self.dragOffset = 0
                        withAnimation(.spring()){
                            self.activePageIndex = newPageindex
                            self.currentScrollOffset = self.computeScrollOffset()
                        }
                    }
                )
            }
            Button("next"){
                self.activePageIndex = min(11, self.activePageIndex+1)
                self.currentScrollOffset = self.offsetForPageIndex(self.activePageIndex)
            }
        }
    }
}

struct CalendarPad_Previews: PreviewProvider {
    static var previews: some View {
        CalendarPad().environmentObject(Store())
    }
}
