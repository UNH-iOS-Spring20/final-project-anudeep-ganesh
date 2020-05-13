//
//  ShoppingCart.swift
//  Event Advertising
//
//  Created by Anudeep Reddy Ramireddy on 5/2/20.
//  Copyright © 2020 Anudeep Reddy Ramireddy. All rights reserved.
//
import UIKit

enum ShoppingCartError: Error {
    case menuItemDoesNotMatchEvent
}
class ShoppingCart: ObservableObject{
    @Published var event: Event?
    @Published var items = [Events]()
    var total: Double{
        if items.count>0 {
            return items.reduce(0) { $0 + Double($1.Price)! }
        } else {
            return 0
        }
    }
    func add(item: Events, event:Event) throws {
        if self.event == nil {
            self.event = event
        }
        
        if self.event != event {
            throw ShoppingCartError.menuItemDoesNotMatchEvent
        }
        items.append(item)
        
    }
    func remove(item:Events){
        if let index = items.firstIndex(of: item){
        items.remove(at: index)
        }
        if items.isEmpty{
            reset()
        }
    }
    
    func reset(){
        event = nil
        items=[Events]()
    }
}
