//
//  CheckOutView.swift
//  Event Advertising
//
//  Created by Anudeep Reddy Ramireddy on 5/2/20.
//  Copyright © 2020 Anudeep Reddy Ramireddy. All rights reserved.
//

import SwiftUI
import FirebaseFirestore
struct CheckOutView: View {
    @EnvironmentObject var cart: ShoppingCart
    @State private var showingPaymentAlert=false
    var body: some View {
        VStack{
            if cart.items.count==0{
                Text("The shopping cart is empty")
                    .font(.largeTitle)
            } else {
                Text("TOTAL: $\(cart.total, specifier: "%.2f")")
                    .font(.largeTitle)
            }
            Button("Confirm order"){
                self.confirmOrder()
            }.padding()
                .disabled(cart.items.isEmpty)
        }
        .navigationBarTitle(Text("payment"), displayMode: .inline)
        .alert(isPresented: $showingPaymentAlert){
            Alert(title: Text("order confirmed"), message:Text("Your total was $\(cart.total, specifier: "%.2f")- thank you!"), dismissButton: .default(Text("Ok")){
                self.cart.reset()
                })
        }
    }
    func confirmOrder(){
        self.showingPaymentAlert.toggle()
        
        guard let event=self.cart.event else{
            return
        }
        let data=["timestamp": Timestamp(),
                  "event":event.EventName,
                  "items":self.cart.items.map({$0.Name}),
                  "total":String(format:"%.2f",cart.total),
                  "photo":event.photo]
            as [String:Any]
        OrdersCollectionRef.addDocument(data:data)
        
        let content = UNMutableNotificationContent()
        content.title = "Event order placed correctly"
        content.subtitle="Your tickets from \(event.EventName) are send to you, so you can come on the event date."
        content.sound=UNNotificationSound.default
        
        let trigger=UNTimeIntervalNotificationTrigger(timeInterval:5,repeats:false)
        
        let request=UNNotificationRequest(identifier: UUID().uuidString, content:content, trigger:trigger)
        UNUserNotificationCenter.current().add(request)
    }
}

struct CheckOutView_Previews: PreviewProvider {
    static let cart = ShoppingCart()
    
    static var previews: some View {
        CheckOutView().environmentObject( cart)
    }
}
