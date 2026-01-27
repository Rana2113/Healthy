import UIKit

final class SignInButtonWithSocialMedia : UIView {
  
    // MARK: - IBoutlet

    @IBOutlet weak private var contentView: UIView!
    @IBOutlet weak private var signinButton: UIButton!
    @IBOutlet weak private var facebookButton: UIButton!
    @IBOutlet weak private var googleButton: UIButton!
    @IBOutlet private var mediaBackgroundViews: [UIView]!
    
    // MARK: - init
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        initView()
    
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        initView()
    }
    
    // MARK: - Configure Layout
    
    
    private func initView() {
        loadViewFromNib()
        configureLayout()
    }
    
        
    private func configureLayout() {
        signinButton.applyButtonStyle(.primary)
    }
}


