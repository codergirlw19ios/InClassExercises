import Foundation
import XCTest


func twoPlusTwo() -> Int {
    return 2 + 2
}

func returnInitials(from string: String) -> String {
    let words = string.components(separatedBy: " ")
    var initials = [String]()
    for word in words {
        initials.append(String(word.first!).capitalized)
    }
    
    return initials.joined()
}

// week
// solve FizzBuzz
// find index of first numeric character in a string

let string = "B0b has a typo problem."

let arrayOfCharacters = Array(string)
var indicesOfNumerics = [Int]()
for (index, character) in arrayOfCharacters.enumerated() {
    guard let _ = Int(String(character)) else { continue }
    indicesOfNumerics.append(index)
}

let firstNumeric = indicesOfNumerics.first

class UnitTests: XCTestCase {
    func testReturnInitials(){
        let testInput = "nathen Is Cool"
        let expectedOutput = "NIC"
        let actualOutput = returnInitials(from: testInput)
        XCTAssertEqual(expectedOutput, actualOutput)
    }
    
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
