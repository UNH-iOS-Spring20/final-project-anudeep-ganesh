//
//  EditEventView.swift
//  Event Advertising
//
//  Created by Anudeep Reddy Ramireddy on 4/28/20.
//  Copyright © 2020 Anudeep Reddy Ramireddy. All rights reserved.
//

import SwiftUI

struct EditEventView: View {
    @ObservedObject var event: Event
    @Environment(\.presentationMode)var presentationMode
    var body: some View {
        Group{
            VStack(spacing:30){
                HStack{
                    Text("Event Name")
                    TextField("Enter event name",text:$event.EventName)
                    
                }
                
                HStack{
                    Text("Address")
                    TextField("Enter the Address",text:$event.Address)
                    
                }
                HStack{
                    Text("State")
                    TextField("Enter State",text:$event.State)
                    
                }
                Button(action:{
                    self.updateEvent()
                })
                {
                    Text("Update")
                }
                Spacer()
            }
            .navigationBarTitle("Edit \(event.EventName)")
        }
        .padding()
    }
    
    
    
    func updateEvent(){
        print("Editing event")
        if !event.EventName.isEmpty && !event.State.isEmpty && !event.Address.isEmpty  {
            EventsCollectionRef.document(event.id).setData(event.data)
            dismiss()
        }
    }
    
    func dismiss(){
        presentationMode.wrappedValue.dismiss()
    }
}
struct EditEventView_Previews: PreviewProvider {
    static var previews: some View {
        EditEventView(event:Event.example)
    }
}
