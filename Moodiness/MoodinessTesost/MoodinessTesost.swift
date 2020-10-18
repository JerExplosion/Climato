////
////  MoodinessTesost.swift
////  MoodinessTesost
////
////  Created by Jerry Ren on 10/17/20.
////  Copyright © 2020 Jerry Ren. All rights reserved.
////
//
import XCTest
@testable import Moodiness

class MoodinessTesost: XCTestCase {
    private var calio: Calcio?
    static var ppqppqq = "qothapuckaqotha"
    override func setUp() {
        super.setUp()
        calio = Calcio.init(sin: [Double(00_0.33733)])
    }
    func testst_addiNiUmb() {
        let resl = calio?.addolyn(q: "qotha", p: "pucka")
        XCTAssertEqual(resl, MoodinessTesost.ppqppqq)
    }

}

