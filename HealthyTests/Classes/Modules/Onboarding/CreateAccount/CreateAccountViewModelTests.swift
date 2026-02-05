import XCTest
@testable import Healthy
final class CreateAccountViewModelTests: XCTestCase {

    // MARK: - Properties
    
    
    private var viewModel: CreateAccountViewModel!
    
    
    // MARK: - Lifecycle
    
    
    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
        viewModel = CreateAccountViewModel()
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        viewModel = nil
    }
    // MARK: - Tests
    func test_configureButtonEnabled_whenUsernameIsEmpty_shouldBeDisabled() {
        // Given
        var isEnabled: Bool?
        viewModel.configureButtonEnabled { isEnabled = $0 }
        
        // When
        viewModel.updateUsername("")
        
        // Then
        XCTAssertTrue(isEnabled == false)
        XCTAssertNil(isEnabled)
    }
    
    func test_cofigureButtonEnabled_whenEmailIsEmpty_shouldBeDisabled() {
        // Given
        var isEnabled: Bool?
        viewModel.configureButtonEnabled { isEnabled = $0 }
        
        // When
        viewModel.updateEmail("")
        
        // Then
        XCTAssertTrue(isEnabled == false)
        XCTAssertNil(isEnabled)
        
    }
    
    func test_configureButtonEnabled_whenPasswordIsEmpty_shouldBeDisabled() {
        // Given
        var isEnabled: Bool?
        viewModel.configureButtonEnabled { isEnabled = $0}
        
        // when
        viewModel.updatePassword("")
        
        // Then
        XCTAssertTrue(isEnabled == false)
        XCTAssertNil(isEnabled)
        
    }
    
    func test_configureButtonEnabled_whenConfirmPasswordIsEmpty_shouldBeDisabled() {
        // Given
        var isEnabled: Bool?
        viewModel.configureButtonEnabled {isEnabled = $0}
        
        // When
        viewModel.updateConfirmPassword("")
        
        // Then
        XCTAssertTrue(isEnabled == false)
        XCTAssertNil(isEnabled)
    }
    
    func test_configureButtonEnabled_whenAcceptTermsAndConditionsIsUnchecked_shouldBeDisabled() {
        // Given
        var isEnabled: Bool?
        viewModel.configureButtonEnabled { isEnabled = $0 }
        
        // When
        viewModel.updateAcceptTermsAndConditions(false)
        
        // Then
        XCTAssertTrue(isEnabled == false)
        XCTAssertNil(isEnabled)
    }
    
    func test_OnButtonEnabled_whenUsernameAndEmailAndPasswordAndconfirmPasswordAndAcceptTermsIsCorrect_shouldBeEnabled() {
        // Given
        var isEnabled: Bool?
        viewModel.configureButtonEnabled{ isEnabled = $0 }
        
        // When
        viewModel.updateUsername("Rana2113")
        viewModel.updateEmail("rna0882@gmail.com")
        viewModel.updatePassword("Rm*8468")
        viewModel.updateConfirmPassword("Rm*8468")
        viewModel.updateAcceptTermsAndConditions(true)
        
        // Then
        XCTAssertTrue(isEnabled == true)
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

}
