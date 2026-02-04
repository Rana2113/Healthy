import UIKit
import GoogleSignIn
import Combine
final class LoginViewController: UIViewController {

    // MARK: - Outlets
    @IBOutlet private(set) weak var emailTextFieldLabel: UILabel!
    @IBOutlet private(set) weak var emailTextField: UITextField!
    @IBOutlet private(set) weak var passwordTextFieldlabel: UILabel!
    @IBOutlet private(set) weak var passwordTextField: UITextField!
    @IBOutlet private(set) weak var forgetPasswordButton: UIButton!
    @IBOutlet private(set) weak var signInButton: UIButton!
    @IBOutlet private(set) weak var signInWithGoogle: GIDSignInButton!
    @IBOutlet private(set) weak var signInWithFacebook: UIButton!
    @IBOutlet private(set) weak var signUpWithButton: UIButton!
    
    // MARK: - Properties

    private let viewModel: LoginViewModelType
    private var subscriptions: Set<AnyCancellable> = []

    // MARK: - Init

    init(viewModel: LoginViewModelType) {
        self.viewModel = viewModel
        super.init(nibName: nil, bundle: nil)
    }

    @available(*, unavailable)
    required init(coder: NSCoder) {
        fatalError("init(coder: ) has not been implemented")
    }

    // MARK: - Lifecycle

    override func viewDidLoad() {
        super.viewDidLoad()

        configureViewModelInputs()
        configureViewModelOutputs()
        
    }
}
// MARK: - Actions


// MARK: - TextField Changes

private extension LoginViewController {
    func bindTextFieldsChanges() {
        emailTextField.addTarget(self, action: #selector(textDidChange), for: .editingChanged)
        passwordTextField.addTarget(self, action: #selector(textDidChange), for: .editingChanged)
    }
    @objc func textDidChange(_ sender: UITextField) {
        guard let text = sender.text else { return }
        if sender == emailTextField {
            viewModel.updateEmail(text)
        }else if sender == passwordTextField {
            viewModel.updatePassword(text)
        }
    }
}

// MARK: - Configuration

private extension LoginViewController {
    func configureViewModelInputs() {
        bindTextFieldsChanges()
    }
    
    
    func configureViewModelOutputs() {
        bindLoadingIndicator()
        bindErrorMessage()
        bindButtonState()
        bindLoginstatus()
    }
    
    
    func bindLoadingIndicator() {
        viewModel.isLoginStatusPublisher.sink { [weak self] isLoggedIn in
            guard let _ = self else { return }
            
        }
        .store(in: &subscriptions)
    }
    
    
    func bindErrorMessage() {
        viewModel.isShowErrorMessagePublisher
            .sink { [weak self] message in
                guard let _ = self else { return }
                
            }
            .store(in: &subscriptions)
    }
    
    
    func bindButtonState() {
 
        viewModel.isLoginEnabledPublisher.assign(to: \.isEnabled , on: signInButton)
            .store(in: &subscriptions)
    }
    
    
    func bindLoginstatus() {
        viewModel.isLoginStatusPublisher .sink { [weak self] status in
            guard let _ = self else { return }
            
        }
        .store(in: &subscriptions)
    }
    
    

}

// MARK: - Private Handlers

private extension LoginViewController {
    
}
