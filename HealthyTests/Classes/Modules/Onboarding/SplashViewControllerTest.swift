import XCTest
@testable import Healthy

class SplashViewControllerTest : XCTestCase {

    // MARK: Properties

    private var viewController: SplashViewController!
    private var viewModel: SplashViewModelMock!

    // MARK: Lifecycle

    override func setUp () {
        super.setUp()
        viewModel = SplashViewModelMock()
        viewController = SplashViewController(viewModel: viewModel)
        viewController.loadViewIfNeeded()
    }
    override func tearDown () {}

    // MARK: Tests

    func test_didTapStartCooking_shouldCallViewModelSplash() {
        // When
        viewController.didTapStartCooking(UIButton())
        
        //Then
        XCTAssertEqual(viewModel.performStartCookingCallCount, 1)
    }
}

// MARK: SplashViewModelMock

final private class SplashViewModelMock : SplashViewModelType {
    private(set) var performStartCookingCallCount: Int = .zero
    func startCooking() {
        performStartCookingCallCount += 1
    }
}
