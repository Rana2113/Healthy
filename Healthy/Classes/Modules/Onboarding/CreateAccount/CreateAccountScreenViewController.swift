import UIKit

class CreateAccountScreenViewController : UIViewController {
    
    
    private let viewModel: CreateAccountScreenViewModelType
    
    init(viewModel : CreateAccountScreenViewModelType) {
        self.viewModel = viewModel
        super.init(nibName: nil, bundle: nil)
    }
    
    @available(*, unavailable)
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
}

// MARK: - Actions

extension CreateAccountScreenViewController {}

// MARK: - Configurations

private extension CreateAccountScreenViewController {}
