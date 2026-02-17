import Foundation
import UIKit
protocol OnboardingCoordinator: AnyObject {
    func didStartCooking()
    func didTapSignUp()
    func didTapSignIn()
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
        let viewModel = LoginViewModel(coordinator: self)
        let viewController = LoginViewController(viewModel: viewModel)
        navigationControl.pushViewController(viewController, animated: true)
//        navigationControl.popToViewController(viewController, animated: true)
    }
    func didTapSignUp() {
        let viewModel = CreateAccountViewModel(coordinator: self)
        let viewController = CreateAccountViewController(viewModel: viewModel)
        navigationControl.pushViewController(viewController, animated: true)
    }
    func didTapSignIn() {
        navigationControl.popViewController(animated: true)
    }

    func didFinishAuthentication() {
        onAuthentication()
    }
}
