//
//  Debug.swift
//  Event Advertising
//
//  Created by Anudeep Reddy Ramireddy on 4/1/20.
//  Copyright © 2020 Anudeep Reddy Ramireddy. All rights reserved.
//

import SwiftUI
import FirebaseFirestore
let db=Firestore.firestore()

struct Debug: View {
    var body: some View {
        VStack(alignment: .leading){
                Text("Event Advertising")
                    .font(.title)
                Text("Usa")
                    .font(.subheadline)
                .padding()
                Button(action: {getCollection(Collection: "Events")}){
                    Text("Events List")
                }
                Button(action: {deleteCollection(Collection: "Events")}){
                    Text("Delete Events List")
                }
            }
        }
    }


private func createEvents(){
    let EventRef = db.collection("Events")
    
    EventRef.document().setData([
        "EventName" : "Anudeep Event 1",
        "Capacity": "20",
        "Address" : "300 Boston Post Road",
        "Price" : "1000"
    ])
    EventRef.document().setData([
        "EventName" : "Anudeep Event 2",
        "Capacity": "25",
        "Address" : "300 Boston Post Road",
        "Price" : "1200"
    ])
    EventRef.document().setData([
        "EventName" : "Anudeep Event 3",
        "Capacity": "40",
        "Address" : "300 Boston Post Road",
        "Price" : "1400"
    ])
    EventRef.document().setData([
        "EventName" : "Anudeep Event 4",
        "Capacity": "50",
        "Address" : "300 Boston Post Road",
        "Price" : "1500"
    ])
    
}
private func getCollection(Collection : String){
    createEvents()
    db.collection(Collection).getDocuments(){
        (querySnapshot,err) in
        if let err = err{
            print("Error getting Documents: \(err)")
        } else{
            for document in querySnapshot!.documents{
                print("\(document.documentID) => \(document.data())")
            }
        }
    }
}

private func deleteCollection(Collection : String){
    db.collection(Collection).getDocuments(){
        (querySnapshot,err) in
        if let err = err{
            print("Error getting Documents: \(err)")
        } else{
            for document in querySnapshot!.documents{
                print("Deleting \(document.documentID) => \(document.data())")
                document.reference.delete()
            }
        }
    }
}
struct Debug_Previews: PreviewProvider {
    static var previews: some View {
        Debug()
    }
}
