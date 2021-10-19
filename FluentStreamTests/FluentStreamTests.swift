//
//  FluentStreamTests.swift
//  FluentStreamTests
//
//  Created by Kyle Musco on 10/6/21.
//

import XCTest
@testable import FluentStream

class FluentStreamTests: XCTestCase {
    let chatManager = ChatViewModel()

    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testSortMessagesIntoChats_1() {
        let messages = [
            Message(id: 1, timestamp: Date(timeIntervalSince1970: TimeInterval(1)), username_from: "test_user_1", username_to: "test_user_2", recording: "test.mp3"),
            Message(id: 2, timestamp: Date(timeIntervalSince1970: TimeInterval(2)), username_from: "test_user_1", username_to: "test_user_2", recording: "test.mp3"),
            Message(id: 3, timestamp: Date(timeIntervalSince1970: TimeInterval(3)), username_from: "test_user_1", username_to: "test_user_3", recording: "test.mp3")
        ]
        
        let chats = chatManager.sortMessagesIntoChats(messages, true)
        
        XCTAssertEqual(chats.count, 2)
        XCTAssertEqual(chats[0].dateOfLastMessage, Date(timeIntervalSince1970: TimeInterval(3)))
        XCTAssertEqual(chats[0].users[0], "test_user_1")
        XCTAssertEqual(chats[0].users[1], "test_user_3")
        XCTAssertEqual(chats[0].messages.count, 1)
        
        XCTAssertEqual(chats[1].dateOfLastMessage, Date(timeIntervalSince1970: TimeInterval(2)))
        XCTAssertEqual(chats[1].users[0], "test_user_1")
        XCTAssertEqual(chats[1].users[1], "test_user_2")
        XCTAssertEqual(chats[1].messages.count, 2)
    }

}
