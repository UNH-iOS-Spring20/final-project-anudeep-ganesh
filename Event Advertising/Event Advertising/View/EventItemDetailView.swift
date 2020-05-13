//
//  EventItemDetailView.swift
//  Event Advertising
//
//  Created by Anudeep Reddy Ramireddy on 5/2/20.
//  Copyright © 2020 Anudeep Reddy Ramireddy. All rights reserved.
//

import SwiftUI

struct EventItemDetailView: View {
    
    @EnvironmentObject var cart:ShoppingCart
    @ObservedObject var menuItem:Events
    @ObservedObject var event:Event
    @State private var showingCartAlert=false
    
    var body: some View {
        VStack{
            Text(menuItem.Name)
                .font(.largeTitle)
                .padding()
            Button("Add to cart"){
                self.addToCart()
            }.font(.headline)
            Spacer()
        }.navigationBarTitle(Text(menuItem.Name),displayMode: .inline)
        .alert(isPresented: $showingCartAlert){
            Alert(title: Text("Invalid request"), message:Text("The ticket you are trying to add to the cart is from different event"), dismissButton: .default(Text("Ok")))
        }
    }
    func addToCart(){
        do {
            try self.cart.add(item: self.menuItem, event:event)
        } catch ShoppingCartError.menuItemDoesNotMatchEvent {
            print("menu item doesnot match event")
            showingCartAlert.toggle()
        } catch {
            print("failed for another reason")
        }
    }
}

struct EventItemDetailView_Previews: PreviewProvider {
    static let  cart = ShoppingCart()
    static var previews: some View {
        EventItemDetailView( menuItem: Events.example,event:Event.example).environmentObject(cart)
    }
}
