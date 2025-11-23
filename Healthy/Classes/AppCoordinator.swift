import Foundation
import UIKit

final class AppCoordinator {
    private let window: UIWindow
    private var isLoggedIn: Bool = false // TODO: Replace with acual implementation
    private var children: [Coordinator] = []

    func start() {
        if isLoggedIn {
            displayLoggedInFlow()
        } else {
            displayOnBoradingFlow()
        }
    }
    init (window: UIWindow) {
        self.window = window
    }
}

// MARK: Flows Helpers

private extension AppCoordinator {
    func displayOnBoradingFlow() {
        let navigationController = UINavigationController()
        let coordinator =
        DefaultOnboardingCoordinator(
            navigation: navigationController,
            onAuthentication: { [weak self] in
                guard let self else { return }
                self.isLoggedIn = true
                self.children.removeAll(where: { $0 is DefaultOnboardingCoordinator})
                self.start()
            }
        )
        coordinator.start()
        children.append(coordinator)
        replaceRootViewController(navigationController)
    }

    func displayLoggedInFlow() {
        // TODO: Put the login flow
    }
}

// MARK: Window Replacement

private extension AppCoordinator {
    func replaceRootViewController(_ viewController: UIViewController) {
        window.rootViewController = viewController
        window.makeKeyAndVisible()
    }
}
