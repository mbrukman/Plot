/**
*  Plot
*  Copyright (c) John Sundell 2019
*  MIT license, see LICENSE file for details
*/

import XCTest
import Plot

final class ControlFlowTests: XCTestCase {
    func testIfCondition() {
        XCTAssertEqual(Node<Any>.if(true, .text("True")).render(), "True")
        XCTAssertEqual(Node<Any>.if(false, .text("True")).render(), "")
    }

    func testIfElseCondition() {
        XCTAssertEqual(
            Node<Any>.if(true, .text("If"), else: .text("Else")).render(),
            "If"
        )

        XCTAssertEqual(
            Node<Any>.if(false, .text("If"), else: .text("Else")).render(),
            "Else"
        )
    }

    func testUnwrappingOptional() {
        var optional: String? = "Hello"
        XCTAssertEqual(Node<Any>.unwrap(optional, Node.text).render(), "Hello")

        optional = nil
        XCTAssertEqual(Node<Any>.unwrap(optional, Node.text).render(), "")
    }

    func testForEach() {
        let array = ["A", "B", "C"]
        XCTAssertEqual(Node<Any>.forEach(array, Node.text).render(), "ABC")
        XCTAssertEqual(Node<Any>.forEach([], Node.text).render(), "")
    }
}

extension ControlFlowTests {
    static var allTests: Linux.TestList<ControlFlowTests> {
        [
            ("testIfCondition", testIfCondition),
            ("testIfElseCondition", testIfElseCondition),
            ("testUnwrappingOptional", testUnwrappingOptional),
            ("testForEach", testForEach)
        ]
    }
}
