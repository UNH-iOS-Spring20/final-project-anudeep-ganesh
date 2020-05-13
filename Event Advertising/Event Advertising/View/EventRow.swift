//
//  EventRow.swift
//  Event Advertising
//
//  Created by Anudeep Reddy Ramireddy on 4/28/20.
//  Copyright © 2020 Anudeep Reddy Ramireddy. All rights reserved.
//

import SwiftUI

struct EventRow: View {
    @ObservedObject var event:Event
    var body: some View {
        HStack{
            Image("event\(event.photo)")
            .resizable()
                .frame(width:50, height:50)
                .clipShape(Circle())
                .overlay(Circle().stroke(Color.gray, lineWidth: 2))
            Text(event.EventName)
        }
    }
}

struct EventRow_Previews: PreviewProvider {
    static var previews: some View {
        EventRow(event:Event.example)
    }
}
