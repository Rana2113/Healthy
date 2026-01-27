import Foundation

final class SplashViewModel {
    private unowned let onboardingCoordinator: OnboardingCoordinator

    init(coordinator: OnboardingCoordinator) {
        self.onboardingCoordinator = coordinator
    }
}

// MARK: Input

extension SplashViewModel: SplashViewModelInput {
    func startCooking() {
        onboardingCoordinator.didStartCooking()
    }
}
// MARK: Ouput

extension SplashViewModel: SplashViewModelOutput {}
