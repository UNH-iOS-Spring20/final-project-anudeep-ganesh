//
//  Event.swift
//  Event Advertising
//
//  Created by Anudeep Reddy Ramireddy on 4/23/20.
//  Copyright © 2020 Anudeep Reddy Ramireddy. All rights reserved.
//

import FirebaseFirestore

class Event : FirebaseCodable, Equatable {
    static func == (lhs: Event, rhs: Event) -> Bool {
        return lhs.id == rhs.id
    }
    
    var id:String
    @Published var EventName:String
    @Published var State:String
    @Published var Address:String
    @Published var photo:String
    
    var data:[String: Any]{
        return [
            "EventName":EventName,
            "State":State,
            "Address":Address,
            "photo":photo
        ]
    }
    
    required init?(id:String,data:[String:Any]){
        guard let EventName=data["EventName"] as? String,
            let State=data["State"] as? String,
            let Address=data["Address"] as? String,
            let photo=data["photo"] as? String
            else{
                return nil
        }
        self.id=id
        self.EventName=EventName
        self.State=State
        self.Address=Address
        self.photo=photo
    }
    
    #if DEBUG
    static let example=Event(id:"1",data:["EventName":"NewEvent",
                                          "State":"Ct",
                                          "Address":"800 bostonpost road",
                                          "photo":"2"])!
    #endif
    
    
}
