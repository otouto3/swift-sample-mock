//
//  SampleMockTests.swift
//  SampleMockTests
//
//  Created by ごつ on 2022/07/09.
//

import XCTest
@testable import SampleMock

class SampleMockTests: XCTestCase {
    func test_order() {
        let mock = MockCock()
        mock.cockRamenCallReturn = [Ramen(soup: .醤油), Ramen(soup: .味噌)]
        
        let results = Waiter(cock: mock).order()
        
        XCTAssertEqual(results.count, 2)
        XCTAssertTrue(results.contains { $0.soup == .醤油 })
        XCTAssertTrue(results.contains { $0.soup == .味噌 })
        XCTAssertEqual(mock.cockRamenCallCount, 1)
        XCTAssertEqual(mock.cockRamenLastBowls, 2)
        XCTAssertEqual(mock.cockRamenLastSoup, .醤油)
    }
}
