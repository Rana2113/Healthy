import Foundation

/// CreateAccountViewModelType Input & Output
///
typealias CreateAccountViewModelType = CreateAccountViewModelInput & CreateAccountViewModelOutput

/// CreateAccountViewModelType ViewModel Input
///
protocol CreateAccountViewModelInput {
    func updateUsername(_ text: String)
    func updateEmail(_ text: String)
    func updatePassword(_ text: String)
    func updateConfirmPassword(_ text: String)
    func updateAcceptTermsAndConditions(_ isChecked: Bool)
    func didTapSignIn()
}

/// CreateAccountViewModelType ViewModel Output
///
protocol CreateAccountViewModelOutput {
    func configureButtonEnabled(onEnable: @escaping (Bool) -> Void)
}
