import XCTest
@testable import Healthy


final class LoginViewModelTest: XCTestCase {
    // MARK: - Properties
    private var viewModel: LoginViewModel!
    
    // MARK: - Lifecycle

    override func setUpWithError() throws {
       viewModel = LoginViewModel()
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }
    // MARK: - Tests

    func test_onButtonEnabled_whenEmailAndPasswordIsEmpty_shouldBeDisabled() {

        // Given
        var isEnabled: Bool?
        let expectation = XCTestExpectation(description: "Login enabled publisher")

        let cancellable = viewModel.isLoginEnabledPublisher
            .sink { value in
                isEnabled = value
                expectation.fulfill()
            }

        // When
        viewModel.updateEmail("")
        viewModel.updatePassword("")

        // Then
        wait(for: [expectation], timeout: 1)
        XCTAssertFalse(isEnabled ?? true)

        cancellable.cancel()
    }
    
    
    func test_onButtonEnabled_whenEmailOnlyIsEmpty_shouldBeDisabled() {

        // Given
        var isEnabled: Bool?
        let expectation = XCTestExpectation(description: "Login enabled publisher")

        let cancellable = viewModel.isLoginEnabledPublisher
            .sink { value in
                isEnabled = value
                expectation.fulfill()
            }

        // When
        viewModel.updateEmail("")
        viewModel.updatePassword("123456")

        // Then
        wait(for: [expectation], timeout: 1)
        XCTAssertFalse(isEnabled ?? true)

        cancellable.cancel()
    }
    
    func test_onButtonEnabled_whenPasswordOnlyIsEmpty_shouldBeDisabled() {

        // Given
        var isEnabled: Bool?
        let expectation = XCTestExpectation(description: "Login enabled publisher")

        let cancellable = viewModel.isLoginEnabledPublisher
            .sink { value in
                isEnabled = value
                expectation.fulfill()
            }

        // When
        viewModel.updateEmail("test@test.com")
        viewModel.updatePassword("")

        // Then
        wait(for: [expectation], timeout: 1)
        XCTAssertFalse(isEnabled ?? true)

        cancellable.cancel()
    }
    
    func test_onButtonEnabled_whenEmailAndPasswordIsCorrect_shouldBeEnabled() {

        // Given
        var isEnabled: Bool?
        let expectation = XCTestExpectation(description: "Login enabled publisher")

        let cancellable = viewModel.isLoginEnabledPublisher
            .sink { value in
                isEnabled = value
                expectation.fulfill()
            }

        // When
        viewModel.updateEmail("test@test.com")
        viewModel.updatePassword("123456")

        // Then
        wait(for: [expectation], timeout: 1)
        XCTAssertTrue(isEnabled ?? false)

        cancellable.cancel()
    }
 
}
