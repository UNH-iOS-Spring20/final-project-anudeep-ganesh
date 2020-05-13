//
//  AddEventView.swift
//  Event Advertising
//
//  Created by Anudeep Reddy Ramireddy on 4/24/20.
//  Copyright © 2020 Anudeep Reddy Ramireddy. All rights reserved.
//

import SwiftUI

struct AddEventView: View {
    @Environment(\.presentationMode)var presentationMode
    @State private var EventName=""
    @State private var State=""
    @State private var Address=""
    var body: some View {
        Group{
            VStack(spacing:25){
                HStack{
                    Text("Event Name")
                    TextField("Enter event name",text:$EventName)
                    
                }
                
                HStack{
                    Text("Address")
                    TextField("Enter the Address",text:$Address)
                    
                }
                HStack{
                    Text("State")
                    TextField("Enter State",text:$State)
                    
                }
                Button(action:{
                    self.addEvent()
                }){
                    Text("Add")
                }
                Spacer()
            }
            .navigationBarTitle("Add Event")
        }.padding()
    }
    
    func addEvent(){
        print("Adding event")
        if !EventName.isEmpty && !State.isEmpty && !Address.isEmpty  {
            let photo=String(Int.random(in: 1 ..< 9))
            let data=["EventName":EventName, "Address":Address,"State":State,"photo":photo]
            EventsCollectionRef.addDocument(data:data)
            dismiss()
        }
    }
    func dismiss(){
        presentationMode.wrappedValue.dismiss()
    }
    struct AddEventView_Previews: PreviewProvider {
        static var previews: some View {
            AddEventView()
        }
    }
}
