//
//  EventsItemRow.swift
//  Event Advertising
//
//  Created by Anudeep Reddy Ramireddy on 4/28/20.
//  Copyright © 2020 Anudeep Reddy Ramireddy. All rights reserved.
//

import SwiftUI
struct EventsItemRow: View {
    @ObservedObject var menuItem:Events
    
    var body: some View {
        HStack{
            Text(menuItem.Name)
            Spacer()
            Text("$\(menuItem.Price)")
        }
    }
}
struct EventsItemRow_Previews: PreviewProvider {
    static var previews: some View {
        EventsItemRow(menuItem:Events.example)
    }
}
