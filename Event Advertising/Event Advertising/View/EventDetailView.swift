//
//  EventDetailView.swift
//  Event Advertising
//
//  Created by Anudeep Reddy Ramireddy on 4/24/20.
//  Copyright © 2020 Anudeep Reddy Ramireddy. All rights reserved.
//

import SwiftUI
import FirebaseFirestore

struct EventDetailView: View {
    @ObservedObject var event:Event
    @ObservedObject var menu:FirebaseCollection<Events>
    private var menuCollectionRef:CollectionReference
    
    init(event:Event){
        self.event=event
        self.menuCollectionRef = EventsCollectionRef.document(event.id).collection("menu")
        self.menu=FirebaseCollection<Events>(collectionRef:menuCollectionRef)
    }
    
    var body: some View {
        VStack(alignment: .leading) {
            HStack{
                Text(event.Address)
                Text(String(event.State))
                Spacer()
                NavigationLink(destination: EditEventView(event: event)){
                    Text("Edit")
                }
            }
            CircleImage(image:Image("event\(event.photo)"))
            Text("Menu")
                .font(.largeTitle)
            List{
                ForEach(menu.items){ menuItem in
                    NavigationLink(destination:EventItemDetailView(menuItem: menuItem, event:self.event)){
                        EventsItemRow(menuItem: menuItem)
                    }
                }
            }
            Spacer()
        }
        .padding()
        .navigationBarTitle(event.EventName)
    }
}

struct EventDetailView_Previews: PreviewProvider {
    static var previews: some View {
        EventDetailView(event: Event.example )
    }
}
