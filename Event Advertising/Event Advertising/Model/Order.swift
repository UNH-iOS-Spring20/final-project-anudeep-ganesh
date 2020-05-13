//
//  Order.swift
//  Event Advertising
//
//  Created by Anudeep Reddy Ramireddy on 5/6/20.
//  Copyright © 2020 Anudeep Reddy Ramireddy. All rights reserved.
//

import Foundation
import FirebaseFirestore

class Order:FirebaseCodable {
    var id:String
    @Published var items:[String]
    @Published var event:String
    @Published var total:String
    @Published var timestamp: Timestamp
    @Published var photo: String
    
    var data:[String:Any]{
        return [
            "items":items,
            "event":event,
            "total":total,
            "timestamp": timestamp,
            "photo":photo
        ]
    }
    required init?(id:String, data:[String:Any]){
        guard let items=data["items"] as?[String],
            let event=data["event"] as? String,
            let total = data["total"] as? String,
            let timestamp=data["timestamp"] as? Timestamp,
            let photo=data["photo"] as? String
            else{
                return nil
        }
        self.id=id
        self.items=items
        self.event=event
        self.total=total
        self.timestamp=timestamp
        self.photo=photo
    }
    
    #if DEBUG
    static let example=Order(id:"1", data:["items":["General","Premium"],
                                           "event":"Event10",
                                           "total":"24.99",
                                           "timestamp":Timestamp(),
                                           "photo":"1"])!
    #endif
}
