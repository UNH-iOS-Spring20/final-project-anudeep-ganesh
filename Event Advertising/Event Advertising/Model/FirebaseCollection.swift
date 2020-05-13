//
//  FirebaseCollection.swift
//  Event Advertising
//
//  Created by Anudeep Reddy Ramireddy on 4/24/20.
//  Copyright © 2020 Anudeep Reddy Ramireddy. All rights reserved.
//

import FirebaseFirestore

protocol FirebaseCodable:Identifiable,ObservableObject {
    init?(id:String, data:[String: Any])
}

class FirebaseCollection<T:FirebaseCodable>: ObservableObject {
    @Published private(set) var items:[T]
    
    init(collectionRef:CollectionReference){
        self.items=[]
        listenForChanges(collectionRef: collectionRef)
        
    }
    
    func listenForChanges(collectionRef: CollectionReference ) {
        collectionRef.addSnapshotListener { snapshot , error in
            guard let snapshot = snapshot else {
                print("error fetching snapshots:\(error!)")
                return
        }
        let models=snapshot.documents.map{(document)->T in
            if let model=T(id:document.documentID,
                           data: document.data()){
                return model
            } else {
                fatalError("Unable to initialise type\(T.self) with dictionary \(document.data())")
            }
            
        }
        self.items=models
    }
}
    
}
