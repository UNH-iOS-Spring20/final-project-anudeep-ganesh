//
//  OrderRow.swift
//  Event Advertising
//
//  Created by Anudeep Reddy Ramireddy on 5/6/20.
//  Copyright © 2020 Anudeep Reddy Ramireddy. All rights reserved.
//

import SwiftUI

struct OrderRow: View {
    @ObservedObject var order:Order
    private let dateFormatter:DateFormatter
    
    init(order:Order){
        self.order=order
        dateFormatter = DateFormatter()
        dateFormatter.dateStyle = .short
        dateFormatter.timeStyle = .short
    }
    var body: some View {
        HStack{
            Image("event\(order.photo)")
                .resizable()
                .frame(width:50, height:50)
                .clipShape(Circle())
                .overlay(Circle().stroke(Color.gray, lineWidth: 2))
            Text(order.event)
            Spacer()
            Text("$\(order.total)")
            Text(dateFormatter.string(from: order.timestamp.dateValue()))
        }
    }
}

struct OrderRow_Previews: PreviewProvider {
    static var previews: some View {
        OrderRow(order:Order.example)
    }
}
