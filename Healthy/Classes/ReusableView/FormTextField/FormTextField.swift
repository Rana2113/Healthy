import UIKit

class FormTextField: UIView {
    
    
    // MARK: - IBOutlets
    @IBOutlet weak var contentView: UIView!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var inputTextField: UITextField!
    @IBOutlet weak var errorLabel: UILabel!
    
    
    // MARK: - Properties
    private var onChange: ((String) -> Void)?
    
    
    // MARK: - Computed Properties
    var title: String {
        get {
            return self.titleLabel.text ?? ""
        }
        set {
            self.titleLabel.text = newValue
        }
    }
    
    var placeholder: String {
        get {
            return self.inputTextField.placeholder ?? ""
        }
        set {
            self.inputTextField.placeholder = newValue
        }
    }
    
    var keyboardType: UIKeyboardType {
        get {
            return self.inputTextField.keyboardType
        }
        set {
            self.inputTextField.keyboardType = newValue
        }
    }
    
    var error: String {
        get {
            return self.errorLabel.text ?? ""
        }
        set {
            self.errorLabel.text = newValue
        }
    }
    
    
    // MARK: - Initializers
    override init(frame: CGRect) {
        super.init(frame: frame)
        commonInit()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        commonInit()
    }
   
    
    // MARK: - Setup
    private func commonInit() {
       loadFromNib()
        configureLayout()
        configureTextFieldObserver()
    }
    
    private func loadFromNib() {
        Bundle.main.loadNibNamed("FormTextField", owner: self, options:  nil)
        guard let contentView = contentView else {return}
        contentView.frame = bounds
        contentView.autoresizingMask = [.flexibleWidth, .flexibleHeight]
        addSubview(contentView)
    }
    
    private func configureLayout() {
        titleLabel.applyBodyStyle()
        inputTextField.applyTextFieldStyle(.primary)
        errorLabel.isHidden = true
        errorLabel.textColor = .warning
    }
    
    private func configureTextFieldObserver() {
        inputTextField.addTarget(self, action: #selector(textFieldDidChange), for: .editingChanged)
    }
    // MARK: - Actions
    @objc private func textFieldDidChange() {
        self.errorLabel.text = ""
        onChange?(inputTextField.text ?? "")
    }
    
    func onChange (_ onChange: @escaping (String) -> Void) {
        self.onChange = onChange
    }
}
