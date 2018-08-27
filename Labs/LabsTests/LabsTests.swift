import XCTest
@testable import Labs


func convertedToFahrenheit(celsius: Double) -> Double {
    print("Yadda, yadda")
    return 0.0
}

class LabsTests: XCTestCase {
    
    func testSomethingCool() {
        print("Wow, 🗑!")
    }
    
    func testConvertedToFahrenheit() {
        let fahrenheitValue = convertedToFahrenheit(celsius: 32)
        print(fahrenheitValue)
        XCTAssertEqual(fahrenheitValue, 0.0)
    }
}
