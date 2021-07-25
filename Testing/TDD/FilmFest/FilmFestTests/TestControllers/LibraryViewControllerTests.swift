import XCTest
@testable import FilmFest

class LibraryViewControllerTests: XCTestCase {
    
    var sut: LibraryViewController!

    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
        sut = UIStoryboard(name: "Main", bundle: nil)
            .instantiateViewController(identifier: "LibraryViewControllerID")
        //In order for a view, to be tested, its veiwDidLoad() method needs to be manualy triggered
        _ = sut.view
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    //MARK: Nill Checks
    func testLibraryVC_TableViewShouldNotBeNill() {
        XCTAssertNotNil(sut.libraryTableView)
    }
    
    //MARK: Data Source
    func testDataSource_ViewDidLoad_SetsTableViewDataSource() {
        XCTAssertNotNil(sut.libraryTableView.dataSource)
        XCTAssertTrue(sut.libraryTableView.dataSource is MovieLibraryDataService)
    }
    
    //MARK: Delegate
    func testDelegate_ViewDidLoad_SetsTableViewDelegate() {
        XCTAssertNotNil(sut.libraryTableView.delegate)
        XCTAssertTrue(sut.libraryTableView.delegate is MovieLibraryDataService)
    }
    
    //MARK: Data Service Assumptions
    func testDataService_ViewDidLoad_SigleDataServiceObject() {
        XCTAssertEqual(sut.libraryTableView.dataSource as! MovieLibraryDataService, sut.libraryTableView.delegate as! MovieLibraryDataService)
    }
}
