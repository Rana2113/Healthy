import UIKit

final class CreateAccountViewController: UIViewController {
    // MARK: - Outlets
    @IBOutlet weak var nameTextField: UITextField!
    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    @IBOutlet weak var confirmPasswordTextField: UITextField!
    @IBOutlet weak var checkBoxButton: CheckboxButton!
    @IBOutlet weak var signUpButton: UIButton!
    
    // MARK: - Properties

    private let viewModel: CreateAccountViewModelType

    // MARK: - Init

    init(viewModel: CreateAccountViewModelType) {
        self.viewModel = viewModel
        super.init(nibName: "CreateAccountViewController", bundle: nil)
    }

    @available(*, unavailable)
    required init(coder: NSCoder) {
        fatalError("init(coder: ) has not been implemented")
    }

    // MARK: - Lifecycle

    override func viewDidLoad() {
        super.viewDidLoad()
        
        configureTextField()
        configureSignUpButton()
        configureAcceptTermsAndConditions()
        configureViewModel()
    }
}

// MARK: - Actions

private extension CreateAccountViewController {
    @objc func textDidChange(_ sender: UITextField) {
        guard let text = sender.text else { return }
    
        switch sender {
        case nameTextField:
            viewModel.updateUsername(text)
        case emailTextField:
            viewModel.updateEmail(text)
        case passwordTextField:
            viewModel.updatePassword(text)
        case confirmPasswordTextField:
            viewModel.updateConfirmPassword(text)
        default:
            assertionFailure("Unexpected text field: \(sender)")
           
        }
    }
    @objc private func didTapSignUp(_ sender: Any) {
    }
}

// MARK: - Configuration

private extension CreateAccountViewController {
    func configureTextField() {
        nameTextField.addTarget(self, action: #selector(textDidChange), for: .editingChanged)
        emailTextField.addTarget(self, action: #selector(textDidChange), for: .editingChanged)
        passwordTextField.addTarget(self, action: #selector(textDidChange), for: .editingChanged)
        confirmPasswordTextField.addTarget(self, action: #selector(textDidChange), for: .editingChanged)
    }
    
    func configureAcceptTermsAndConditions(){
        viewModel.updateAcceptTermsAndConditions(checkBoxButton.isChecked)
    }
    
    func configureSignUpButton() {
        signUpButton.addTarget(self, action: #selector(didTapSignUp), for: .touchUpInside)
    }
    func configureViewModel() {
        viewModel.configureButtonEnabled { [weak self] isEnabled in
            self?.signUpButton.isEnabled = isEnabled
        }
    }
}

// MARK: - Private Handlers

private extension CreateAccountViewController {}
