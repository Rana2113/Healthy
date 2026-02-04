import Foundation
import GoogleSignIn
import UIKit
import NewRelic

final class AppCoordinator {
    private let window: UIWindow
//    private var isLoggedIn: Bool = false // TODO: Replace with acual implementation
    private var children: [Coordinator] = []

    func start() {
        GIDSignIn.sharedInstance.restorePreviousSignIn { [weak self] user, error in
            if let error {
                print("Error is \(error)")
            }
            if let nonNullableUser = user {
                print(nonNullableUser)
                self?.displayLoggedInFlow()
//                self?.isLoggedIn = true
            } else {
                self?.displayOnBoradingFlow()
//                self?.isLoggedIn = false
            }
        }
    }

    init (window: UIWindow) { self.window = window }
}

// MARK: Flows Helpers

private extension AppCoordinator {
    func displayOnBoradingFlow() {
        let navigationController = UINavigationController()
        let coordinator =
        DefaultOnboardingCoordinator(
            navigation: navigationController,
            onAuthentication: { [weak self] in
                guard let self else {
                    return
                }

//                self.isLoggedIn = true
                self.children.removeAll(where: { $0 is DefaultOnboardingCoordinator })
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
