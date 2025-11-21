import Foundation
import UIKit

protocol OnboardingCoordinator: AnyObject {
    func didStartCooking()
    func didFinishAuthentication()
}

final class DefaultOnboardingCoordinator: Coordinator {
    var navigationControl: UINavigationController
    private let onAuthentication: () -> Void
    init(navigation: UINavigationController, onAuthentication: @escaping () -> Void ) {
        self.navigationControl = navigation
        self.onAuthentication = onAuthentication
    }

    func start() {
        let splashViewModel = SplashViewModel(coordinator: self)
        let splashViewController = SplashViewController(viewModel: splashViewModel)
        navigationControl.setViewControllers([splashViewController], animated: false)
    }
}

extension DefaultOnboardingCoordinator: OnboardingCoordinator {
    func didStartCooking() {
        // TODO: Navigate to the login screen
    }

    func didFinishAuthentication() {
        onAuthentication()
    }
}
