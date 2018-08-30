import XCTest
@testable import Labs

class PersonTests: XCTestCase
{
    func testCreatePerson() {
        let person = Person()
        print(person)
    }
}
