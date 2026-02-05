import XCTest
@testable import Healthy


final class LoginViewControllerTests: XCTestCase {
    
    
    // MARK: - Properties
    
    private var loginViewModelMock: LoginViewModelMock!
    private var sut: LoginViewController!
    
    
    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
        
        loginViewModelMock = LoginViewModelMock()
        sut=LoginViewController(viewModel: loginViewModelMock)
        sut.loadViewIfNeeded( )
    }

    // MARK: TextFields tests

    func test_whenLoginViewControllerCreated_shouldHasEmptyEmailTextField () throws {
        // When
        let emailTextField = try XCTUnwrap(sut.emailTextField)
        // Then
        XCTAssertEqual(emailTextField.text, "")
    }
    
    func test_WhenLoginViewControllerCreated_shouldHasEmptyPasswordTextField () throws {
        // When
        let passwordTextField = try XCTUnwrap(sut.passwordTextField)
        // Then
        XCTAssertEqual(passwordTextField.text, "")
      
    }
    // MARK: Button tests
    
    func test_whenLoginViewControllerCreated_shouldHasSignInButtonAndAction () throws {
        
        // Given
        let signInButton: UIButton = try XCTUnwrap(sut.signInButton)
        
        // When
        let signInButtonActions = try XCTUnwrap(signInButton
            .actions(forTarget: sut, forControlEvent: .touchUpInside))
        
        // Then
        XCTAssertEqual(signInButtonActions.count, 1)
        XCTAssertEqual(signInButtonActions.first, "didTapSignIn:")
    }
    
    func test_whenLoginViewControllerCreated_shouldHasForgetPasswordButtonAndAction () throws {
        
        // Given
        let forgetPasswordButton: UIButton = try XCTUnwrap(sut.forgetPasswordButton)
        // When
        let forgetPasswordButtonActions = try XCTUnwrap(forgetPasswordButton
            .actions(forTarget: sut, forControlEvent: .touchUpInside))
        // Then
        XCTAssertEqual(forgetPasswordButtonActions.count, 1)
        XCTAssertEqual(forgetPasswordButtonActions.first, "didTapForgetPassword:")
    }
    
    func test_whenLoginViewControllerCreated_shouldHasSignInWithGoogleButtonAndAction () throws
    {
        // Given
        let SignInWithGoogleButton = try XCTUnwrap(sut.signInWithGoogle)
        
        // When
        let signInWithGoogleButtonActions = try XCTUnwrap(SignInWithGoogleButton
            .actions(forTarget: sut, forControlEvent: .touchUpInside))
        
        // Then
        XCTAssertEqual(signInWithGoogleButtonActions.count, 1)
        XCTAssertEqual(signInWithGoogleButtonActions.first, "didTapSignInWithGoogle:")
    }
    
    func test_whenLoginViewControllerCreated_shouldHasSignInWithFacebookButtonAndAction () throws
    {
        // Given
        let SignInWithFacebookButton = try XCTUnwrap(sut.signInWithFacebook)
        
        // When
        let signInWithFacebookButtonActions = try XCTUnwrap(SignInWithFacebookButton
            .actions(forTarget: sut, forControlEvent: .touchUpInside))
        
        // Then
        XCTAssertEqual(signInWithFacebookButtonActions.count, 1)
        XCTAssertEqual(signInWithFacebookButtonActions.first, "didTapSignInWithGoogle:")
    }
    
    func test_didTapSignIn_shouldCallViewModelPerformSignIn() {
        // When
        sut.didTapSignIn(UIButton())
        
        // Then
        XCTAssertEqual(loginViewModelMock.performSignInCallCount, 1)
    }
    
    func test_didTapSignUp_shouldCallViewModelPerformSignUp() {
        // When
        sut.didTapSignUp(UIButton())
        
        // Then
        XCTAssertEqual(loginViewModelMock.performSignUpCallCount, 1)
    }
    
    func test_didTapForgetPassword_shouldCallViewModelPerformForgetPassword() {
        // When
        sut.didTapForgetPassword(UIButton())
        
        // Then
        XCTAssertEqual(loginViewModelMock.performForgetPasswordCount, 1)
    }
    
    func test_didTapSignInWithGoogle_shouldCallViewModelPerformSignInWithSocialMedia() {
        // When
        sut.didTapSignInWithGoogle(UIButton())
        
        // Then
        XCTAssertEqual(loginViewModelMock.performSocialMediaSignInCount, 1)
    }
    
    func test_didTapSignInWithFacebook_shouldCallViewModelPerformSignInWithSocialMedia() {
        // When
        sut.didTapSignInWithFacebook(UIButton())
        
        // Then
        XCTAssertEqual(loginViewModelMock.performSocialMediaSignInCount, 1)
    }

}
