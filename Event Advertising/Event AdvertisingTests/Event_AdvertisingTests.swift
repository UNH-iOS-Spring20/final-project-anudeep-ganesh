//
//  Event_AdvertisingTests.swift
//  Event AdvertisingTests
//
//  Created by Anudeep Reddy Ramireddy on 3/24/20.
//  Copyright © 2020 Anudeep Reddy Ramireddy. All rights reserved.
//

import XCTest
@testable import Event_Advertising

class Event_AdvertisingTests: XCTestCase {

    override func setUp() {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }
    
    func testValidNewEventCreation() {       // Testing Valid True New Event is Created or Not
        let TestEvent1 = Events.init(EventName: "Anudeep Event 1", Capacity: 10, Address:"West Haven, USA", Price: 1000)
        XCTAssertNotNil(TestEvent1)
        let TestEvent2 = Events.init(EventName: "Anudeep Event 2", Capacity: 15, Address:"West Haven, USA", Price: 1500)
        XCTAssertNotNil(TestEvent2)
        
        let TestZeroCapacityEvent = Events.init(EventName: "Anudeep Event 1", Capacity: 0, Address:"West Haven, USA", Price: 1200)
        XCTAssertNil(TestZeroCapacityEvent)
        let TestNoNameEvent = Events.init(EventName: "", Capacity: 15, Address:"West Haven, USA", Price: 1500)
        XCTAssertNil(TestNoNameEvent)
    }
    
    func testRegistrationCart() {
        let TestEvent1 = Events.init(EventName: "Anudeep Event 1", Capacity: 10, Address:"West Haven, USA", Price: 1000)!
        let TestEvent2 = Events.init(EventName: "Anudeep Event 2", Capacity: 15, Address:"West Haven, USA", Price: 1100)!
        let TestEvent3 = Events.init(EventName: "Anudeep Event 3", Capacity: 20, Address:"West Haven, USA", Price: 1200)!
        let TestEvent4 = Events.init(EventName: "Anudeep Event 4", Capacity: 25, Address:"West Haven, USA", Price: 1300)!
        let TestEvent5 = Events.init(EventName: "Anudeep Event 5", Capacity: 30, Address:"West Haven, USA", Price: 1500)!
        let Cart = RegistrationCart.init()
        Cart.addEvent(Item: TestEvent1)
        XCTAssertEqual(1000, Cart.CartPriceTotal())
        Cart.addEvent(Item: TestEvent2)
        XCTAssertNotEqual(1000, Cart.CartPriceTotal())
        Cart.addEvent(Item: TestEvent3)
        XCTAssertEqual(3300, Cart.CartPriceTotal())
        Cart.addEvent(Item: TestEvent4)
        XCTAssertEqual(4600, Cart.CartPriceTotal())
        Cart.addEvent(Item: TestEvent5)
        XCTAssertEqual(6100, Cart.CartPriceTotal())
    }
    
    func testValidUser() {
        let TestUser1 = Users.init(Name: "Anudeep Reddy", Address: "392 ELM Street", City: "West Haven", Username: "ranudeepreddy", State: "CT", IsAdmin: false)
        XCTAssertNotNil(TestUser1)
        XCTAssertEqual(TestUser1?.IsAdmin, false)
        
        let TestUser2 = Users.init(Name: "Ganesh Palacharla", Address: "392 ELM Street", City: "West Haven", Username: "", State: "CT", IsAdmin: true)
        XCTAssertNil(TestUser2)
    }


    func testExample() {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct results.
        XCTAssertNotEqual(4,3)
    }

    func testPerformanceExample() {
        // This is an example of a performance test case.
        self.measure {
            // Put the code you want to measure the time of here.
        }
    }

}
