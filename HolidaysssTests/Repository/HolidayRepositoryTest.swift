//
//  HolidayRepositoryTest.swift
//  HolidaysssTests
//
//  Created by Josue German Hernandez Gonzalez on 23-09-23.
//

import XCTest
@testable import Holidaysss

final class HolidayRepositoryTest: XCTestCase {

    func testGetAllHolidays() async {
        let mock = HolidayRespositoryImpMock()
        let result = await mock.getAllHoliday(by: "2024")

        XCTAssertEqual(result.count, 2)
    }

    func testDetermineNextHoliday() {
        let mock = HolidayRespositoryImpMock()
        let nextHoliday = mock.determineNextHoliday(by: [.defaultValue])

        XCTAssertNotNil(nextHoliday)
    }

}

class HolidayRespositoryImpMock: HolidayRepository {
    var shouldFail = false

    func getAllHoliday(by year: String) async -> [Holiday] {
        if shouldFail {
            return []
        }
        return [.defaultValue, .defaultValue]
    }

    func determineNextHoliday(by data: [Holiday]) -> Holiday? {
        return .defaultValue
    }
}
