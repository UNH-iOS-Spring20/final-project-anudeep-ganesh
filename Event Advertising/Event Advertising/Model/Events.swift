//
//  Events.swift
//  Event Advertising
//
//  Created by Anudeep Reddy Ramireddy on 3/29/20.
//  Copyright © 2020 Anudeep Reddy Ramireddy. All rights reserved.
//
import FirebaseFirestore
class Events:FirebaseCodable, Equatable{
    static func == (lhs: Events, rhs: Events) -> Bool {
        return lhs.id==rhs.id
    }
    
    var id:String
    @Published var Name:String
    @Published var Price:String
    
    
    var data:[String: Any]{
        return [
            "Price":Price,
            "Name":Name,
            
        ]
    }
    
    required init?(id:String,data:[String:Any]){
        guard let Name=data["Name"] as? String,
            let Price=data["Price"] as? String
            else{
                return nil
        }
        self.id=id
        self.Name=Name
        self.Price=Price
    }
    #if DEBUG
    static let example=Events(id:"1", data:["Name":"General",
                                            "Price":"16.99"])!
    #endif
    
}
