

import UIKit

class ViewController: UIViewController {
    
    // 1
    var isDefaultStatusBar = true

    // 2
    override var preferredStatusBarStyle: UIStatusBarStyle {
        return isDefaultStatusBar ? .default : .lightContent
    }
    
    @IBOutlet weak var headerView: UIView!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var themeSwitch: UISwitch!
    
    @IBOutlet weak var inputCardView: UIView!
    @IBOutlet weak var billAmountTextField: BillAmountTextField!
    @IBOutlet weak var tipPercentSegment: UISegmentedControl!
    
    @IBOutlet weak var outputCardView: UIView!
    @IBOutlet weak var tipAmountTitleLabel: UILabel!
    @IBOutlet weak var tipAmount: UILabel!
    @IBOutlet weak var totalAmountTitleLabel: UILabel!
    @IBOutlet weak var totalAmount: UILabel!
    
    @IBOutlet weak var resetButton: UIButton!
    
    // MARK: - View Lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupViews()
        setTheme(isDark: false)
        
        billAmountTextField.calculateButtonAction = {
            self.calculate()
           }
        
    }
    
    @IBAction func themeToggle(_ sender: UISwitch) {
        setTheme(isDark: sender.isOn)
    }
    
    @IBAction func tipPercentChanged(_ sender: UISegmentedControl) {
        calculate()
    }
    
    @IBAction func resetButtonTapped(_ sender: UIButton) {
        clear()
    }
    
    func calculate() {
        // dismiss keyboard
        if self.billAmountTextField.isFirstResponder {
            self.billAmountTextField.resignFirstResponder()
        }

        guard let billAmountText = self.billAmountTextField.text,
            let billAmount = Double(billAmountText) else {
                clear()
                return
        }

        let roundedBillAmount = (100 * billAmount).rounded() / 100
        
        let tipPercent: Double
           switch tipPercentSegment.selectedSegmentIndex {
           case 0:
               tipPercent = 0.15
           case 1:
               tipPercent = 0.18
           case 2:
               tipPercent = 0.20
           default:
               preconditionFailure("Unexpected index.")
           }

        let tipAmount = roundedBillAmount * tipPercent
        let roundedTipAmount = (100 * tipAmount).rounded() / 100

        let totalAmount = roundedBillAmount + roundedTipAmount

        // Update UI
        self.billAmountTextField.text = String(format: "%.2f", roundedBillAmount)
        self.tipAmount.text = String(format: "%.2f", roundedTipAmount)
        self.totalAmount.text = String(format: "%.2f", totalAmount)
    }
    
    func clear(){
        self.billAmountTextField.text = nil
        self.tipAmount.text = "$0.00"
        self.totalAmount.text = "$0.00"
        tipPercentSegment.selectedSegmentIndex = 0
    }
    
    func setupViews(){
        // adding dropshadow to headview
        headerView.layer.shadowOffset = CGSize(width: 0, height: 1)
        headerView.layer.shadowOpacity = 0.05
        headerView.layer.shadowColor = UIColor.black.cgColor
        headerView.layer.shadowRadius = 35
        
        inputCardView.layer.cornerRadius = 8
        inputCardView.layer.masksToBounds = true
        
        outputCardView.layer.cornerRadius = 8
        outputCardView.layer.masksToBounds = true
        
        // set output card border
        
        outputCardView.layer.borderWidth = 1
        outputCardView.layer.borderColor = UIColor.tcHotPink.cgColor
        
        resetButton.layer.cornerRadius = 8
        resetButton.layer.masksToBounds = true
        
    }
    // useful for theme toggle switch
    func setTheme(isDark: Bool){
        let theme = isDark ? ColorTheme.dark : ColorTheme.light

        view.backgroundColor = theme.viewControllerBackgroundColor

        headerView.backgroundColor = theme.primaryColor
        titleLabel.textColor = theme.primaryTextColor

        inputCardView.backgroundColor = theme.secondaryColor

        billAmountTextField.tintColor = theme.accentColor
        tipPercentSegment.tintColor = theme.accentColor

        outputCardView.backgroundColor = theme.primaryColor
        outputCardView.layer.borderColor = theme.accentColor.cgColor

        tipAmountTitleLabel.textColor = theme.primaryTextColor
        totalAmountTitleLabel.textColor = theme.primaryTextColor

        tipAmount.textColor = theme.outputTextColor
        totalAmount.textColor = theme.outputTextColor

        resetButton.backgroundColor = theme.secondaryColor
        
        isDefaultStatusBar = theme.isDefaultStatusBar
        setNeedsStatusBarAppearanceUpdate()
    }

}
