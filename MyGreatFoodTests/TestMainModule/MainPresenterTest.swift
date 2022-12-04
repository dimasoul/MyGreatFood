//
//  MainPresenterTest.swift
//  MyGreatFoodTests
//
//  Created by Дмитрий on 01.12.2022.
//

import XCTest
@testable import MyGreatFood

class MockView: MainViewProtocol {
    var titleTest: String?
    func setGreeting(greeting: String) {
        self.titleTest = greeting
    }
}

class MainPresenterTest: XCTestCase {

    var view: MockView!
    var person: Person!
    var presenter: MainPresenter!
    
    override func setUpWithError() throws {
        view = MockView()
        person = Person(firstName: "Baz", lastName: "Bar")
        presenter = MainPresenter(view: view, person: person)
    }

    override func tearDownWithError() throws {
        view = nil
        person = nil
        presenter = nil
        
    }

    func testModuleIsNotNill() {
        XCTAssertNotNil(view, "view is not nill")
        XCTAssertNotNil(person, "person is not nill")
        XCTAssertNotNil(presenter, "presenter is not nill")
    }
    
    func testView() {
        presenter.showGreeting()
        XCTAssertEqual(view.titleTest, "Baz Bar")
    }
    
    func testPersonModel() {
        XCTAssertEqual(person.firstName, "Baz")
        XCTAssertEqual(person.lastName, "Bar")
        
    }
}
