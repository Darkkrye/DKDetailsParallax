//
//  DKScrollingHeaderViewTest.swift
//  DKDetailsParallax
//
//  Created by Pierre on 28/01/2017.
//  Copyright © 2017 Pierre BOUDON. All rights reserved.
//

import XCTest
@testable import DKDetailsParallax

class DKDetailsParallaxViewControllerTest: XCTestCase {
    
    override func setUp() {
        super.setUp()
        // Put setup code here. This method is called before the invocation of each test method in the class.
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
    
    func testInit() {
        let vc = DKDetailsParallaxViewController(primaryColor: UIColor.blue, secondaryColor: UIColor.orange, title: "Title", headerImage: nil, idObject: 3, object: nil, dismissIcon: .back, withBlurredNavbar: true)
        
        XCTAssertEqual(vc.primaryColor, UIColor.blue)
        XCTAssertEqual(vc.secondaryColor, UIColor.orange)
        XCTAssertEqual(vc.navbarTitle, "Title")
        XCTAssertNil(vc.headerImage)
        XCTAssertEqual(vc.idObject, 3)
        XCTAssertNil(vc.object)
        XCTAssertEqual(vc.wantsBlurredNavbar, true)
        XCTAssertEqual(vc.needsToSetBlurredImage, false)
        XCTAssertEqual(vc.dismissIcon, "backIcon")
    }
}
