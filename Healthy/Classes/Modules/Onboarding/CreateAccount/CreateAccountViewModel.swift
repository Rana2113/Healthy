import Foundation

// MARK: - CreateAccountViewModel

final class CreateAccountViewModel {
    private var username: String = ""
    private var email: String = ""
    private var password: String = ""
    private var confirmPassword: String = ""
    private var isChecked: Bool = false
    private var onButtonEnable: (Bool) -> Void = { _ in }
 }

// MARK: - Input

extension CreateAccountViewModel: CreateAccountViewModelInput {
    func updateUsername(_ text: String) {
        username = text
        updateEnableStateButton()
    }
    func updateEmail(_ text: String) {
        email = text
        updateEnableStateButton()
    }
    func updatePassword(_ text: String) {
        password = text
        updateEnableStateButton()
    }
    func updateConfirmPassword(_ text: String) {
        confirmPassword = text
        updateEnableStateButton()
    }
    func updateAcceptTermsAndConditions(_ isChecked: Bool) {
        self.isChecked = isChecked
        updateEnableStateButton()
    }
}

// MARK: - Output

extension CreateAccountViewModel: CreateAccountViewModelOutput {
    func configureButtonEnabled(onEnable: @escaping (Bool) -> Void) {
        onButtonEnable = onEnable
        updateEnableStateButton()
    }
}

// MARK: - Private Handlers

private extension CreateAccountViewModel {
    func updateEnableStateButton() {
        let isUserNameValid = !username.isEmpty
        // TODO: Validation
    }
}
