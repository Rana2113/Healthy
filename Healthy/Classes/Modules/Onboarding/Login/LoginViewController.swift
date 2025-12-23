import UIKit

final class LoginViewController: UIViewController {

    // MARK: - Outlets

    // MARK: - Properties

    private let viewModel: LoginViewModelType

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

        configureViewModel()
    }
}

// MARK: - Actions

private extension LoginViewController {}

// MARK: - Configuration

private extension LoginViewController {
    func configureViewModel() {}
}

// MARK: - Private Handlers

private extension LoginViewController {}
