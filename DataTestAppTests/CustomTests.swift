//
//  CustomTests.swift
//  DataTestApp
//
//  Created by FunPlus on 7/28/16.
//  Copyright © 2016 funplus. All rights reserved.
//

import XCTest
import AdSupport
//@testable import FunPlusData

class DataCustomEventTests: XCTestCase {
    
//    static let TEST_DATA_TAG = "sdk.global.sandbox"
//    static let TEST_DATA_KEY = "0a5649c54090d1bf3d3b16467bf5a9ea"
//    
//    let TEST_EVENT_NAME = "level_up"
//    let TEST_EVENT_NAME1 = "tutorial"
//    let TEST_EVENT_NAME2 = "quest"
//    let TEST_EVENT_NAME3 = "shop"
//    let TEST_EVENT_NAME4 = "loading"
//    
//    let TIMEOUT = 30.0
//    let TIME_WAITING = 10.0
//    
//    let fpData = FunPlusData.sharedInstanceInit(
//        dataTag: DataTestAppTests.TEST_DATA_TAG,
//        dataKey: DataTestAppTests.TEST_DATA_KEY
//    )
//    
//    
//    override func setUp() {
//        //fpData.sessionId = nil
//        //fpData.sessionStartTime = nil
//        super.setUp()
//        // Put setup code here. This method is called before the invocation of each test method in the class.
//    }
//    
//    override func tearDown() {
//        //fpData.sessionId = nil
//        //fpData.sessionStartTime = nil
//
//        // Put teardown code here. This method is called after the invocation of each test method in the class.
//        super.tearDown()
//    }
//    
//    /**
//        Test:
//     
//        1. Login
//        2. Level up
//     
//        Two events expecetd:
//     
//        1. session_start
//        2. level_up
//     */
//    func testLevelUpEvent() {
//        // Given
//        let userId = "1000012"
//        let level = "2"
//        let vipLevel = "3"
//        let facebookId = "123456789"
//        let gameServerId = "0"
//        
//        fpData.traceUserLogin(userId: userId,level: level,vipLevel: vipLevel,facebookId: facebookId,gameServerId: gameServerId)
//        var properties = [String: AnyObject]()
//        properties["d_c1"] = [
//                "key": "action",
//                "value": "level_up"
//        ]
//        properties["d_c2"] = [
//                "key": "from_level",
//                "value": "2"
//        ]
//        properties["d_c3"] = [
//            "key": "to_level",
//            "value": "3"
//        ]
//        properties["device"] = "iPhone" as AnyObject?
//        properties["gameserver_id"] = "0" as AnyObject?
//        properties["facebook_id"] = "1234567" as AnyObject?
//        properties["level"] = "3" as AnyObject?
//        properties["vip_level"] = "3" as AnyObject?
//        
//        
//        // When
//        let event = DataCustomEvent(eventName: TEST_EVENT_NAME, properties: properties)
//        let expectation = self.expectation(description: "data")
//        fpData.trace(event)
//        
//        DispatchQueue.main.asyncAfter(deadline: DispatchTime.now() + Double(Int64(TIME_WAITING * Double(NSEC_PER_SEC))) / Double(NSEC_PER_SEC)) {
//            expectation.fulfill()
//        }
//        
//        waitForExpectations(timeout: TIMEOUT, handler: nil)
//    }
//    
//    /**
//        Test: tutorial
//     
//        1 event expected: tutorial
//     */
//    func testTutorialEvent() {
//        // Given
//        
//        var properties = [String: AnyObject]()
//        properties["d_c1"] = [
//            "key": "action",
//            "value": "tutorial"
//        ]
//        properties["d_c2"] = [
//            "key": "step_name",
//            "value": "new_site"
//        ]
//        properties["d_c3"] = [
//            "key": "tutorial_step",
//            "value": "2"
//        ]
//        properties["device"] = "iPhone" as AnyObject?
//        properties["gameserver_id"] = "0" as AnyObject?
//        properties["facebook_id"] = "1234567" as AnyObject?
//        properties["level"] = "2" as AnyObject?
//        properties["vip_level"] = "3" as AnyObject?
//        
//        // When
//        let event = DataCustomEvent(eventName: TEST_EVENT_NAME1, properties: properties)
//        let expectation = self.expectation(description: "data")
//        fpData.trace(event)
//        
//        DispatchQueue.main.asyncAfter(deadline: DispatchTime.now() + Double(Int64(TIME_WAITING * Double(NSEC_PER_SEC))) / Double(NSEC_PER_SEC)) {
//            expectation.fulfill()
//        }
//        
//        waitForExpectations(timeout: TIMEOUT, handler: nil)
//    }
//    
//    /**
//        Test: quest
//     
//        1 event expected: quest
//     */
//    func testQuestEvent() {
//        // Given
//        
//        var properties = [String: AnyObject]()
//        properties["d_c1"] = [
//            "key": "action",
//            "value": "finish_quest"
//        ]
//        properties["d_c2"] = [
//            "key": "quest_id",
//            "value": "1000"
//        ]
//        properties["d_c3"] = [
//            "key": "task_id",
//            "value": "2"
//        ]
//        properties["d_c4"] = [
//            "key": "status",
//            "value": "10"
//        ]
//        
//        properties["device"] = "iPhone" as AnyObject?
//        properties["gameserver_id"] = "0" as AnyObject?
//        properties["facebook_id"] = "1234567" as AnyObject?
//        properties["level"] = "2" as AnyObject?
//        properties["vip_level"] = "3" as AnyObject?
//        
//        // When
//        let event = DataCustomEvent(eventName: TEST_EVENT_NAME2, properties: properties)
//        let expectation = self.expectation(description: "data")
//        fpData.trace(event)
//        
//        DispatchQueue.main.asyncAfter(deadline: DispatchTime.now() + Double(Int64(TIME_WAITING * Double(NSEC_PER_SEC))) / Double(NSEC_PER_SEC)) {
//            expectation.fulfill()
//        }
//        
//        waitForExpectations(timeout: TIMEOUT, handler: nil)
//    }
//    
//    /**
//        Test: shop
//     
//        1 event expected: shop
//     */
//    func testShopEvent() {
//        // Given
//        
//        var properties = [String: AnyObject]()
//        properties["d_c1"] = [
//            "key": "action",
//            "value": "but"
//        ]
//        properties["d_c2"] = [
//            "key": "item_name",
//            "value": "plant"
//        ]
//        properties["d_c3"] = [
//            "key": "item_id",
//            "value": "2000"
//        ]
//        properties["d_c4"] = [
//            "key": "status",
//            "value": "10"
//        ]
//        
//        properties["device"] = "iPhone" as AnyObject?
//        properties["gameserver_id"] = "0" as AnyObject?
//        properties["facebook_id"] = "1234567" as AnyObject?
//        properties["level"] = "2" as AnyObject?
//        properties["vip_level"] = "3" as AnyObject?
//        
//        // When
//        let event = DataCustomEvent(eventName: TEST_EVENT_NAME3, properties: properties)
//        let expectation = self.expectation(description: "data")
//        fpData.trace(event)
//        
//        DispatchQueue.main.asyncAfter(deadline: DispatchTime.now() + Double(Int64(TIME_WAITING * Double(NSEC_PER_SEC))) / Double(NSEC_PER_SEC)) {
//            expectation.fulfill()
//        }
//        
//        waitForExpectations(timeout: TIMEOUT, handler: nil)
//    }
//    
//    /**
//        Test: loading
//     
//        1 event expected: loading
//     */
//    func testLoadingEvent() {
//        // Given
//        
//        var properties = [String: AnyObject]()
//        properties["d_c1"] = [
//            "key": "elapse_time",
//            "value": "90"
//        ]
//        properties["d_c2"] = [
//            "key": "loading_step",
//            "value": "show_screen"
//        ]
//        properties["d_c3"] = [
//            "key": "loading_step_id",
//            "value": "2"
//        ]
//        properties["device"] = "iPhone" as AnyObject?
//        properties["gameserver_id"] = "0" as AnyObject?
//        properties["facebook_id"] = "1234567" as AnyObject?
//        properties["level"] = "2" as AnyObject?
//        properties["vip_level"] = "3" as AnyObject?
//        
//        // When
//        let event = DataCustomEvent(eventName: TEST_EVENT_NAME4, properties: properties)
//        let expectation = self.expectation(description: "data")
//        fpData.trace(event)
//        
//        DispatchQueue.main.asyncAfter(deadline: DispatchTime.now() + Double(Int64(TIME_WAITING * Double(NSEC_PER_SEC))) / Double(NSEC_PER_SEC)) {
//            expectation.fulfill()
//        }
//        
//        waitForExpectations(timeout: TIMEOUT, handler: nil)
//    }
//    
//    func testPerformanceExample() {
//        // This is an example of a performance test case.
//        self.measure {
//            // Put the code you want to measure the time of here.
//        }
//    }
    
}
