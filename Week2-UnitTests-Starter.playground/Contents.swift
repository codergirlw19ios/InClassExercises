import Foundation
import XCTest


func twoPlusTwo() -> Int {
    return 2 + 2
}


class UnitTests: XCTestCase {
    
    func testTwoPlusTwo() {
        let expectedOutput = 4
        
        let actualOutput = twoPlusTwo()
        
        XCTAssertEqual(expectedOutput, actualOutput)
    }
}




class TestObserver: NSObject, XCTestObservation {
    func testCase(_ testCase: XCTestCase,
                  didFailWithDescription description: String,
                  inFile filePath: String?,
                  atLine lineNumber: Int) {
        assertionFailure(description, line: UInt(lineNumber))
    }
}
let testObserver = TestObserver()
XCTestObservationCenter.shared.addTestObserver(testObserver)
UnitTests.defaultTestSuite.run()
