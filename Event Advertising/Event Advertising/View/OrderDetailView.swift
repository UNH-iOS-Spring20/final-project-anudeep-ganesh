//
//  OrderDetaiView.swift
//  Event Advertising
//
//  Created by Anudeep Reddy Ramireddy on 5/6/20.
//  Copyright © 2020 Anudeep Reddy Ramireddy. All rights reserved.
//

import SwiftUI
struct OrderDetailView: View {
    @ObservedObject var order: Order
    private let dateFormatter: DateFormatter
    init(order: Order) {
        self.order = order
        dateFormatter = DateFormatter()
        dateFormatter.dateStyle = .long
        dateFormatter.timeStyle = .long
    }
    var body: some View {
        VStack(alignment: .leading) {
            CircleImage(image: Image("event\(order.photo)"))
            Divider()
            Text("Ordered from: \(order.event)")
                .font(.headline)
            Text("Ordered on: \(dateFormatter.string(from: order.timestamp.dateValue()))")
                .font(.headline)
            Text("Order total: $\(order.total)")
                .font(.headline)
            Divider()
            Text("Items Ordered")
                .font(.largeTitle)
            List {
                ForEach(order.items, id: \.self) { item in
                    Text(item)
                }
            }
            Spacer()
        }
        .padding()
        .navigationBarTitle("Order Details")
        .listStyle(GroupedListStyle())
    }
}
struct OrderDetailView_Previews: PreviewProvider {
    static var previews: some View {
        OrderDetailView(order: Order.example)
    }
}
