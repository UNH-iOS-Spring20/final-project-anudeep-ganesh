//
//  OrdersView.swift
//  Event Advertising
//
//  Created by Anudeep Reddy Ramireddy on 5/6/20.
//  Copyright © 2020 Anudeep Reddy Ramireddy. All rights reserved.
//

import SwiftUI
import FirebaseFirestore
let OrdersCollectionRef=Firestore.firestore().collection("Orders")


struct OrdersView: View {
    @ObservedObject private var orders=FirebaseCollection<Order>(collectionRef: OrdersCollectionRef)
    var body: some View {
        NavigationView{
            VStack{
                List{
                    ForEach(orders.items){ order in
                        NavigationLink(destination: OrderDetailView(order:order)){
                            OrderRow(order:order)
                        }
                    }
                }
            }.navigationBarTitle("Order History")
        }
    }
}

struct OrdersView_Previews: PreviewProvider {
    static var previews: some View {
        OrdersView()
    }
}
