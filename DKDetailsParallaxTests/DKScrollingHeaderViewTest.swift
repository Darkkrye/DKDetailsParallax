//
//  DKScrollingHeaderViewTest.swift
//  DKDetailsParallax
//
//  Created by Pierre on 28/01/2017.
//  Copyright © 2017 Pierre BOUDON. All rights reserved.
//

import XCTest
@testable import DKDetailsParallax

class DKScrollingHeaderViewTest: XCTestCase {
    
    var controller: DKDetailsParallaxViewController!
    
    override func setUp() {
        super.setUp()
        // Put setup code here. This method is called before the invocation of each test method in the class.
        self.controller = DKDetailsParallaxViewController(primaryColor: UIColor.black, secondaryColor: UIColor.orange, title: "Title", headerImage: nil, idObject: 3, object: nil, withBlurredNavbar: true)
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }
    
    func testExample() {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct results.
    }
    
    func testPerformanceExample() {
        // This is an example of a performance test case.
        self.measure {
            // Put the code you want to measure the time of here.
        }
    }
    
    func testInitFromFrame() {
    }
}
