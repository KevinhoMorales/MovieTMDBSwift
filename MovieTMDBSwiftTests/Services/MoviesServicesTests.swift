//
//  MoviesServicesTests.swift
//  MovieTMDBSwiftTests
//
//  Created by Kevinho Morales on 7/2/23.
//

import XCTest
import RxSwift
import RxRelay
import RxBlocking
@testable import MovieTMDBSwift

final class MoviesServicesTests: XCTestCase {
    
    var moviesRequest: MoviesRequest?
    
    override func setUp() {
        moviesRequest = MoviesRequest()
    }
    
    override func tearDown() {
        moviesRequest = nil
    }
    
    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }
    
    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }
    
    func testExample() throws {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct results.
        // Any test you write for XCTest can be annotated as throws and async.
        // Mark your test throws to produce an unexpected failure when your test encounters an uncaught error.
        // Mark your test async to allow awaiting for asynchronous code to complete. Check the results with assertions afterwards.
    }
    
    func testPerformanceExample() throws {
        // This is an example of a performance test case.
        self.measure {
            // Put the code you want to measure the time of here.
        }
    }
    
    func testMoviesMock() {
        let mainView = MainViewController()
        let moviesTest = BehaviorRelay(value: [])
        moviesRequest?.getMovies(endpoint: "https://api.themoviedb.org/3/movie/upcoming?api_key=91380f96fa2addf2dfb94d48397cf8da", filter: nil)
            .subscribe(on: MainScheduler.instance)
            .observe(on: MainScheduler.instance)
            .subscribe(
                onNext: { movies in
                    moviesTest.accept(movies)
                }, onError: { error in
                    print("Error -> \(error.localizedDescription)")
                }, onCompleted: {
                    print("Completed!")
                }).disposed(by: mainView.disposeBag)
        XCTAssertEqual(moviesTest.value.count, 3)
    }
    
}
