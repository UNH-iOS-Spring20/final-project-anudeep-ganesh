//
//  Users.swift
//  Event Advertising
//
//  Created by Anudeep Reddy Ramireddy on 3/29/20.
//  Copyright © 2020 Anudeep Reddy Ramireddy. All rights reserved.
//

class Users{
    
    var Name : String
    var Address : String
    var City : String
    var State: String
    var Username : String
    var IsAdmin : Bool = false     // Check current user is Admin or Not(Default: Not an Admin)
    
    init?(Name : String, Address : String, City : String, Username : String, State: String, IsAdmin : Bool){
        
        if(Name.isEmpty || Username.isEmpty){
            return nil
        }
        self.Name = Name
        self.Address = Address
        self.City = City
        self.State = State
        self.Username = Username
        self.IsAdmin = IsAdmin
        
    }
    
    
}
