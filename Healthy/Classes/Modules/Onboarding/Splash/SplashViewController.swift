import UIKit

class SplashViewController: UIViewController {
    @IBOutlet weak var logoCaptionLabel: UILabel!
    @IBOutlet weak var headerTitleLabel: UILabel!
    @IBOutlet weak var headerCaptionLabel: UILabel!
    @IBOutlet weak var startCookingButton: UIButton!

    private let viewModel: SplashViewModelType

    init(viewModel: SplashViewModelType) {
        self.viewModel = viewModel
        super.init(nibName: nil, bundle: nil)
    }

    @available(*, unavailable)
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        configureAppearance()
    }
}

// MARK: - Actions

extension SplashViewController {
    @IBAction func didTapStartCooking(_ sender: UIButton) {
        viewModel.startCooking()
    }
}

// MARK: - Configurations

private extension SplashViewController {
    func configureAppearance() {
        startCookingButton.applyButtonStyle(.primary)
    }
}
