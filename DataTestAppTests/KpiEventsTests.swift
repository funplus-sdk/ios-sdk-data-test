//
//  DataTestAppTests.swift
//  DataTestAppTests
//
//  Created by Yuankun Zhang on 7/3/16.
//  Copyright © 2016 funplus. All rights reserved.
//

import XCTest
@testable import FunPlusSDK

class KpiEventsTests: XCTestCase {

    let TIMEOUT = 30.0
    let TIME_WAITING = 10.0
    
    let tracer = FunPlusData(funPlusConfig: ConfigFactory.getConfig())
    
    func testTraceSessionStart() {
        let ex = expectation(description: "data")
        tracer.traceSessionStart()
        
        DispatchQueue.main.asyncAfter(deadline: DispatchTime.now() + Double(Int64(TIME_WAITING * Double(NSEC_PER_SEC))) / Double(NSEC_PER_SEC)) {
            ex.fulfill()
        }
            
        waitForExpectations(timeout: TIMEOUT, handler: nil)
    }
    
    func testTraceSessionEnd() {
        let ex = expectation(description: "data")
        tracer.traceSessionEnd(sessionLength: 100)
        
        DispatchQueue.main.asyncAfter(deadline: DispatchTime.now() + Double(Int64(TIME_WAITING * Double(NSEC_PER_SEC))) / Double(NSEC_PER_SEC)) {
            ex.fulfill()
        }
        
        waitForExpectations(timeout: TIMEOUT, handler: nil)
    }
    
    func testTraceNewUser() {
        let ex = expectation(description: "data")
        tracer.traceNewUser()
        
        DispatchQueue.main.asyncAfter(deadline: DispatchTime.now() + Double(Int64(TIME_WAITING * Double(NSEC_PER_SEC))) / Double(NSEC_PER_SEC)) {
            ex.fulfill()
        }
        
        waitForExpectations(timeout: TIMEOUT, handler: nil)
    }
    
    func testTracePayment() {
        let ex = expectation(description: "data")
        let amount = 399.0
        let currency = "USD"
        let productId = "com.funplus.barnvoyage.jewelBox.270"
        let productName = "Jewel Box 270"
        let productType = "rc"
        let transactionId = "23533353"
        let paymentProcessor = "appleiap"
        let itemsReceived = [
            [
                "d_item_id": "4312",
                "d_item_name": "booster_butterfly",
                "d_item_type":"booster",
                "m_item_amount":"1",
                "d_item_class":"consumable"
            ]
        ]
        let currencyReceived = [
            [
                "d_currency_type": "rc",
                "m_currency_amount": "20"
            ],
            [
                "d_currency_type": "coins",
                "m_currency_amount": "2000"
            ]
        ]
        let currencyReceivedType = "gold"
        
        tracer.tracePayment(
            amount: amount,
            currency: currency,
            productId: productId,
            productName: productName,
            productType: productType,
            transactionId: transactionId,
            paymentProcessor: paymentProcessor,
            itemsReceived: itemsReceived.description,
            currencyReceived: currencyReceived.description,
            currencyReceivedType: currencyReceivedType
        )
        
        DispatchQueue.main.asyncAfter(deadline: DispatchTime.now() + Double(Int64(TIME_WAITING * Double(NSEC_PER_SEC))) / Double(NSEC_PER_SEC)) {
            ex.fulfill()
        }
        
        waitForExpectations(timeout: TIMEOUT, handler: nil)
    }

//    let fpData = FunPlusData.sharedInstanceInit(
//        dataTag: DataTestAppTests.TEST_DATA_TAG,
//        dataKey: DataTestAppTests.TEST_DATA_KEY
//    )
//    
//    override func setUp() {
//        super.setUp()
//        // Put setup code here. This method is called before the invocation of each test method in the class.
//    }
//    
//    override func tearDown() {
//        // Put teardown code here. This method is called after the invocation of each test method in the class.
//        super.tearDown()
//    }
//    
//    /**
//        Test:
//        
//        1. Login
//        2. Purchase
//        3. Logout
//     
//     
//        Four events expected:
//        
//        1. session_start
//        2. payment
//        3. session_end
//        4. After current session ends, an anonymous session starts immediately, so there will be a session_start event
//     */
//    func testTraceUserLoginThenPurchaseThenLogout() {
//        // Given
//        let userId = "1000008"
//        let level = "11"
//        let vipLevel = "3"
//        let facebookId = "12345678"
//        let gameServerId = "4"
//        let amount = 299.0
//        let currency = "USD"
//        let productId = "com.funplus.jewelBox.270"
//        let productName = "Jewels"
//        let productType = "rc"
//        let transactionId = "64753768"
//        let paymentProcessor = "appleiap"
//        let expectation = self.expectation(description: "data")
//        let itemsReceived = [
//            [
//                "d_item_id": "5312",
//                "d_item_name": "booster_moves",
//                "d_item_type":"booster",
//                "m_item_amount":"1",
//                "d_item_class":"consumable"
//            ]
//        ]
//        let currencyReceived = [
//            [
//                "d_currency_type": "rc",
//                "m_currency_amount": "40"
//            ],
//            [
//                "d_currency_type": "coins",
//                "m_currency_amount": "4000"
//            ]
//        ]
//        
//        // When
//        fpData.traceUserLogin(userId: userId,level: level,vipLevel: vipLevel,facebookId: facebookId,gameServerId: gameServerId)
//        
//        fpData.tracePurchase(
//            amount: amount,
//            currency: currency,
//            productId: productId,
//            productName: productName,
//            productType: productType,
//            transactionId: transactionId,
//            paymentProcessor: paymentProcessor,
//            itemsReceived: itemsReceived,
//            currencyReceived: currencyReceived
//        )
//        
//        
//        fpData.traceUserLogout()
//        
//        DispatchQueue.main.asyncAfter(deadline: DispatchTime.now() + Double(Int64(TIME_WAITING * Double(NSEC_PER_SEC))) / Double(NSEC_PER_SEC)) {
//            expectation.fulfill()
//        }
//        
//        waitForExpectations(timeout: TIMEOUT, handler: nil)
//    }
//    
//    /**
//        Test:
//     
//        1. Login
//        2. Purchase
//     
//        Two events expected:
//        
//        1. session_start
//        2. payment
//     */
//    func testTraceUserLoginThenPurchase() {
//        // Given
//        let userId = "1000009"
//        let amount = 299.0
//        let currency = "USD"
//        let productId = "com.funplus.jewelBox.270"
//        let productName = "Jewels"
//        let productType = "rc"
//        let transactionId = "46826592"
//        let paymentProcessor = "appleiap"
//        let expectation = self.expectation(description: "data")
//        let itemsReceived = [
//            [
//                "d_item_id": "4312",
//                "d_item_name": "booster_butterfly",
//                "d_item_type":"booster",
//                "m_item_amount":"1",
//                "d_item_class":"consumable"
//            ]
//        ]
//        let currencyReceived = [
//            [
//                "d_currency_type": "rc",
//                "m_currency_amount": "20"
//            ],
//            [
//                "d_currency_type": "coins",
//                "m_currency_amount": "2000"
//            ]
//        ]
//        
//        // When
//        fpData.traceUserLogin(userId: userId)
//        
//        fpData.tracePurchase(
//            amount: amount,
//            currency: currency,
//            productId: productId,
//            productName: productName,
//            productType: productType,
//            transactionId: transactionId,
//            paymentProcessor: paymentProcessor,
//            itemsReceived: itemsReceived,
//            currencyReceived: currencyReceived
//        )
//        
//        DispatchQueue.main.asyncAfter(deadline: DispatchTime.now() + Double(Int64(TIME_WAITING * Double(NSEC_PER_SEC))) / Double(NSEC_PER_SEC)) {
//            expectation.fulfill()
//        }
//        
//        waitForExpectations(timeout: TIMEOUT, handler: nil)
//    }
//    
//    /**
//        Test: Login with no level
//     
//        One event expeceted: session_start
//     */
//    func testTraceUserLoginNoLevel() {
//        // Given
//        let userId = "1000012"
//        let level = "0"
//        let vipLevel = "0"
//        let facebookId = "12435678"
//        let gameServerId = "1"
//        let expectation = self.expectation(description: "data")
//        
//        // When
//        fpData.traceUserLogin(userId: userId,level: level,vipLevel: vipLevel,facebookId: facebookId,gameServerId: gameServerId )
//        
//        DispatchQueue.main.asyncAfter(deadline: DispatchTime.now() + Double(Int64(TIME_WAITING * Double(NSEC_PER_SEC))) / Double(NSEC_PER_SEC)) {
//            expectation.fulfill()
//        }
//        
//        waitForExpectations(timeout: TIMEOUT, handler: nil)
//    }
//    
//    /**
//        Test: Purchase without login
//     
//        Zero event expeceted, because a login is required no matter before or after the purchase event.
//     */
//    func testTraceOnlyPurchase() {
//        // Given
//        //let userId = "1000003"
//        let amount = 399.0
//        let currency = "USD"
//        let productId = "com.funplus.barnvoyage.jewelBox.270"
//        let productName = "Jewel Box 270"
//        let productType = "rc"
//        let transactionId = "23533355"
//        let paymentProcessor = "appleiap"
//        let expectation = self.expectation(description: "data")
//        let itemsReceived = [
//            [
//                "d_item_id": "3312",
//                "d_item_name": "plant",
//                "d_item_type":"plant",
//                "m_item_amount":"1",
//                "d_item_class":"consumable"
//            ]
//        ]
//        let currencyReceived = [
//            [
//                "d_currency_type": "rc",
//                "m_currency_amount": "20"
//            ],
//            [
//                "d_currency_type": "coins",
//                "m_currency_amount": "2000"
//            ]
//        ]
//        
//        // When
//        fpData.tracePurchase(
//            amount: amount,
//            currency: currency,
//            productId: productId,
//            productName: productName,
//            productType: productType,
//            transactionId: transactionId,
//            paymentProcessor: paymentProcessor,
//            itemsReceived: itemsReceived,
//            currencyReceived: currencyReceived
//        )
//        DispatchQueue.main.asyncAfter(deadline: DispatchTime.now() + Double(Int64(TIME_WAITING * Double(NSEC_PER_SEC))) / Double(NSEC_PER_SEC)) {
//            expectation.fulfill()
//        }
//        
//        waitForExpectations(timeout: TIMEOUT, handler: nil)
//    }
//    
//    /**
//        Test:
//     
//        1. Purchase
//        2. Login
//     
//        Two event expecetd:
//     
//        1. payment
//        2. session_start
//     */
//    func testTracePurchaseThenLogin() {
//        // Given
//        let userId = "1000013"
//        let amount = 399.0
//        let currency = "USD"
//        let productId = "com.funplus.jewelBox.270"
//        let productName = "Jewel Box 270"
//        let productType = "rc"
//        let transactionId = "2638797"
//        let paymentProcessor = "appleiap"
//        let expectation = self.expectation(description: "data")
//        let itemsReceived = [
//            [
//                "d_item_id": "3312",
//                "d_item_name": "plant",
//                "d_item_type":"plant",
//                "m_item_amount":"1",
//                "d_item_class":"consumable"
//            ]
//        ]
//        let currencyReceived = [
//            [
//                "d_currency_type": "rc",
//                "m_currency_amount": "20"
//            ],
//            [
//                "d_currency_type": "coins",
//                "m_currency_amount": "2000"
//            ]
//        ]
//        
//        // When
//        fpData.tracePurchase(
//            amount: amount,
//            currency: currency,
//            productId: productId,
//            productName: productName,
//            productType: productType,
//            transactionId: transactionId,
//            paymentProcessor: paymentProcessor,
//            itemsReceived: itemsReceived,
//            currencyReceived: currencyReceived
//        )
//        
//        fpData.traceUserLogin(userId: userId)
//        
//        DispatchQueue.main.asyncAfter(deadline: DispatchTime.now() + Double(Int64(TIME_WAITING * Double(NSEC_PER_SEC))) / Double(NSEC_PER_SEC)) {
//            expectation.fulfill()
//        }
//        
//        waitForExpectations(timeout: TIMEOUT, handler: nil)
//    }
//    
//    /**
//        Test: logout before login
//     
//        Zero event expeceted
//     */
//    func testTraceUserLogoutBeforeLogin() {
//        // Given
//        let expectation = self.expectation(description: "data")
//        
//        // When
//        fpData.traceUserLogout()
//        
//        DispatchQueue.main.asyncAfter(deadline: DispatchTime.now() + Double(Int64(TIME_WAITING * Double(NSEC_PER_SEC))) / Double(NSEC_PER_SEC)) {
//            expectation.fulfill()
//        }
//        
//        waitForExpectations(timeout: TIMEOUT, handler: nil)
//    }
//
//    /**
//        Test: app did become active
//     
//        One event expeceted: session_start
//     */
//    func testAppDidBecomeActive() {
//        // Given
//        let expectation = self.expectation(description: "data")
//        
//        // When
//        fpData.appDidBecomeActive()
//        
//        DispatchQueue.main.asyncAfter(deadline: DispatchTime.now() + Double(Int64(TIME_WAITING * Double(NSEC_PER_SEC))) / Double(NSEC_PER_SEC)) {
//            expectation.fulfill()
//        }
//        
//        waitForExpectations(timeout: TIMEOUT, handler: nil)
//    }
//    
//    /**
//        Test:
//    
//        1. App did become active
//        2. App did enter background
//     
//        Two events expected:
//     
//        1. session_start
//        2. session_end
//     */
//    func testAppDidBecomeActiveThenEnterBackground() {
//        // Given
//        let expectation = self.expectation(description: "data")
//        
//        // When
//        fpData.appDidBecomeActive()
//        fpData.appDidEnterBackground()
//        
//        DispatchQueue.main.asyncAfter(deadline: DispatchTime.now() + Double(Int64(TIME_WAITING * Double(NSEC_PER_SEC))) / Double(NSEC_PER_SEC)) {
//            expectation.fulfill()
//        }
//        
//        waitForExpectations(timeout: TIMEOUT, handler: nil)
//    }
    
}
