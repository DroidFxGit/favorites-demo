//
//  SessionManagerTest.swift
//  favorites-demo
//
//  Created by Carlos Vazquez Gomez on 9/6/17.
//  Copyright © 2017 fx. All rights reserved.
//

import XCTest

class SessionManagerTest: XCTestCase {
    
    fileprivate var sessionManager: SessionManager?
    fileprivate var window: UIWindow?
    
    override func setUp() {
        super.setUp()
        window = UIWindow(frame: UIScreen.main.bounds)
        sessionManager = SessionManager(window: window)
    }
    
    func configureMainScreen() {
        sessionManager?.configureMainScreen()
    }
    
    func testThatMainScreenIsConfiguredCorrectly() {
        configureMainScreen()
        assert(window?.rootViewController != nil, "rootView was configured correctly")
    }
    
    func testThatSplashViewIsConfiguredCorrectly() {
        configureMainScreen()
        assert(window?.rootViewController is SplashViewController, "SplashView was shown correctly")
    }
    
    override func tearDown() {
        super.tearDown()
        sessionManager = nil
        window = nil
    }
    
}
