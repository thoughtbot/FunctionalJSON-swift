import XCTest
import FunctionalJSON

class UserDecodingTests: XCTestCase {
  func testUserDecodingWithEmail() {
    let json = ["id": 5, "name": "Tester", "email": "tester@test.com"]
    let user = User.decode(json)

    assert(user != nil)
    assert(user?.id == 5)
    assert(user?.name == "Tester")
    assert(user?.email != nil)
    assert(user?.email! == "tester@test.com")
  }

  func testUserDecodingWithoutEmail() {
    let json = ["id": 5, "name": "Tester"]
    let user = User.decode(json)

    assert(user != nil)
    assert(user?.id == 5)
    assert(user?.name == "Tester")
    assert(user?.email == nil)
  }
}
