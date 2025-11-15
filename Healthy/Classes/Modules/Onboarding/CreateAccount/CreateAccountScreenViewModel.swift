import Foundation

final class CreateAccountScreenViewModel {
    private unowned let onboardingCoordinator : OnboardingCoordinator

    init(coordinator: OnboardingCoordinator) {
        self.onboardingCoordinator = coordinator
    }
}

// MARK: Input

extension CreateAccountScreenViewModel : CreateAccountScreenViewModelInput{}


// MARK: Ouput

extension CreateAccountScreenViewModel : CreateAccountScreenViewModelOutput{}
