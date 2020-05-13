//
//  OrderView.swift
//  Event Advertising
//
//  Created by Anudeep Reddy Ramireddy on 5/2/20.
//  Copyright © 2020 Anudeep Reddy Ramireddy. All rights reserved.
//

import SwiftUI

struct CartView:View {
    @EnvironmentObject var cart:ShoppingCart
    
    var body: some View {
        NavigationView{
            List{
                Section{
                    ForEach(cart.items){ item in
                        HStack{
                            Text(item.Name)
                            Spacer()
                            Text("$\(item.Price)")
                        }
                    }.onDelete(perform: deleteItems)
                }
                
                Section{
                    NavigationLink(destination:CheckOutView()){
                        Text("Place order")
                    }
                }.disabled(cart.items.isEmpty)
            }.navigationBarTitle("Shopping Cart")
                .listStyle(GroupedListStyle())
                .navigationBarItems(trailing: EditButton())
        }
    }
    
    func deleteItems(at offsets: IndexSet){
        cart.remove(item: cart.items[offsets.first!])
    }
}
struct CartView_Previews: PreviewProvider {
    static let cart = ShoppingCart()
    static var previews: some View {
        CartView().environmentObject(cart)
    }
}
