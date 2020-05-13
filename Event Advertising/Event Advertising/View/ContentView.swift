//
//  ContentView.swift
//  Event Advertising
//
//  Created by Anudeep Reddy Ramireddy on 3/24/20.
//  Copyright © 2020 Anudeep Reddy Ramireddy. All rights reserved.
//

import SwiftUI
import FirebaseFirestore

let EventsCollectionRef=Firestore.firestore().collection("Events")


struct ContentView: View {
    @ObservedObject private var Events=FirebaseCollection<Event>(collectionRef:EventsCollectionRef)
    
    var body: some View {
        
        NavigationView{
            VStack{
                NavigationLink(destination:AddEventView()){
                    Text("Add event")
            }
                
            List{
                ForEach(Events.items){event in
                    NavigationLink(destination:EventDetailView(event:event)){
                        EventRow(event: event)
                    }
                }.onDelete(perform:deleteEvent)
            }
        }
         .navigationBarTitle(Text("Events"))
         .navigationBarItems(leading:EditButton())
        }
    }
    func deleteEvent(at offsets:IndexSet){
        let index=offsets.first!
        print("Deleting Event:\(Events.items[index])")
        let id=Events.items[index].id
        EventsCollectionRef.document(id).delete(){ error in
            if let error = error{
                print("error removing deocument:\(error)")
            } else{
                print("Documnet succesfully removed!")
            }
        }
    }
}


struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
