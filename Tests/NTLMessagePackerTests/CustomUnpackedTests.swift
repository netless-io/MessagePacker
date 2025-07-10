//
//  CustomUnpackedTests.swift
//  MessagePackerTests
//
//  Created by Hirotaka Nishiyama on 2018/11/11.
//  Copyright © 2018年 hiro. All rights reserved.
//

import XCTest
@testable import NTLMessagePacker

class CustomUnpackedTests: XCTestCase {
    let decoder = MessagePackDecoder()

    override func setUp() {
        super.setUp()
    }

    override func tearDown() {
        super.tearDown()
    }

    func testCustomClass() {
        let input = Data([129, 168, 108, 101, 103, 67, 111, 117, 110, 116, 206, 1, 107, 8, 108])
        let output = Animal(legCount: 23791724)
        XCTAssertEqual(try decoder.decode(Animal.self, from: input), output)
    }

    func testCustomSubClass() {
        let input = Data([130, 164, 110, 97, 109, 101, 169, 227, 131, 158, 227, 130, 181, 227, 131, 171, 165, 115, 117, 112, 101, 114, 129, 168, 108, 101, 103, 67, 111, 117, 110, 116, 4])
        let output = Dog(legCount: 4, name: "マサル")
        XCTAssertEqual(try decoder.decode(Dog.self, from: input), output)
    }

    func testDate() {
        let input = Data([214, 255, 91, 242, 15, 95])
        let output = Date(timeIntervalSince1970: 1542590303)
        XCTAssertEqual(try decoder.decode(Date.self, from: input), output)
    }

    func testURL() {
        let input = Data([185, 104, 116, 116, 112, 115, 58, 47, 47, 119, 119, 119, 46, 103, 111, 111, 103, 108, 101, 46, 99, 111, 46, 106, 112, 47])
        let output = URL(string: "https://www.google.co.jp/")!
        XCTAssertEqual(try decoder.decode(URL.self, from: input), output)
    }

    func testCustomUnkeyedCollection() {
        let input = Data([147, 1, 205, 7, 208, 206, 1, 107, 8, 108])
        let output: CustomUnkeyedCollection = [1, 2000, 23791724]
        XCTAssertEqual(try decoder.decode(CustomUnkeyedCollection.self, from: input), output)
    }

    func testCustomkeyedCollection() {
        let input = Data([131, 161, 98, 205, 7, 208, 161, 99, 206, 1, 107, 8, 108, 161, 97, 1])
        let output: CustomkeyedCollection = ["a": 1, "b": 2000, "c": 23791724]

        do {
            let result = try decoder.decode(CustomkeyedCollection.self, from: input)
            XCTAssertEqual(result["a"], output["a"])
            XCTAssertEqual(result["b"], output["b"])
            XCTAssertEqual(result["c"], output["c"])
        } catch {
            XCTFail(error.localizedDescription)
        }
    }
}
