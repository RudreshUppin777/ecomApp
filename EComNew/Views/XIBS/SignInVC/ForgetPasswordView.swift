//
//  ForgetPasswordView.swift
//  EComNew
//
//  Created by Way2 on 07/06/24.
//


import UIKit

protocol ForgetPasswordDelegate: AnyObject {
    func removeForgetPasswordView()
}

class ForgetPasswordView: UIView {
    
    // MARK: - ---------------- Public  Variables ---------
    var view: UIView!
    weak var fpdelegate: ForgetPasswordDelegate?
    
    @IBOutlet weak var emailView: UIView!
    @IBOutlet weak var emailFieldTopConst: NSLayoutConstraint!
    @IBOutlet weak var emailerrorLbl: UILabel!
    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var closeBtnView: UIImageView!
    
    @IBOutlet weak var notValidEmailLbl: UILabel!
    
    
    // MARK: - ---------------- Delegates ----------------
    
    
    // MARK: - ---------------- IBOutlets ----------------
    
    
    // MARK: - ---------------- Override Init ------------
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        nibSetup()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        nibSetup()
        
    }
    
    // MARK: - ---------------- Public Functions ----------------
        
    // MARK: - ---------------- Private Functions ----------------
    
    private func nibSetup() {
        view = viewFromNib()
        view.frame = bounds
        view.autoresizingMask = [.flexibleWidth, .flexibleHeight]
        view.translatesAutoresizingMaskIntoConstraints = true
        addSubview(view)
       
        setUpViews()
    }
    
    private func viewFromNib() -> UIView {
        let bundle = Bundle(for: type(of:self))
        let nib = UINib(nibName: ECOMAPP.VIEW.FORGETPASSWORD, bundle: bundle)
        let view = nib.instantiate(withOwner: self, options: nil)[0] as! UIView
        return view
    }
    
    private func setUpViews() {
        initialSetUp()
    }
    
    private func initialSetUp() {
        hideErrorEmailElements()
        emailTextField.delegate = self
        emailTextField.textColor = .lightGray
        emailTextField.tintColor = .lightGray

        let tapGcloseBtn = UITapGestureRecognizer(target: self, action: #selector(handleCloseBtnTap))
        closeBtnView.isUserInteractionEnabled = true
        closeBtnView.addGestureRecognizer(tapGcloseBtn)
        
    }
    
    private func hideErrorEmailElements() {
        emailerrorLbl.isHidden = true
        closeBtnView.isHidden = true
        notValidEmailLbl.isHidden = true
        emailFieldTopConst.constant = 10
        let placeholderFont = UIFont.systemFont(ofSize: 14, weight: .regular)
        emailTextField.text = ""
        emailTextField.styleTextField(borderStyle: .none,
                                      borderColor: .clear,
                                      cornerRadius: 0.0,
                                      borderWidth: 0.0,
                                      placeholder: ECOMAPP.ENTERTHEEMAIL,
                                      placeholderFont:placeholderFont,
                                      placeholderColor: .darkGray)
        let colorClear = UIColor.clear
        emailView.styleRoundView( borderColor:colorClear , borderWidth: 0.0)
    }
        
    
    private func showErrorEmailElements() {
        let colorError = UIColor.customBottomRed
        emailerrorLbl.isHidden = false
        emailerrorLbl.textColor = colorError
        
        closeBtnView.isHidden = false
        closeBtnView.image = UIImage(named: "closeRed")

        notValidEmailLbl.isHidden = false
        emailFieldTopConst.constant = 18
        
        let placeholderFont = UIFont.systemFont(ofSize: 14, weight: .regular)
        emailTextField.styleTextField(borderStyle: .none,
                                      borderColor: .gray,
                                      cornerRadius: 0.0,
                                      borderWidth: 0.0,
                                      placeholder: "",
                                      placeholderFont: placeholderFont,
                                      placeholderColor: .clear)
        emailView.styleRoundView(borderColor:colorError , borderWidth: 1.0)
        
    }
    
    // MARK: - ---------------- IBActions ----------------
    
    @IBAction func backActionClicked(_ sender: UIButton) {
        emailTextField.resignFirstResponder()
        fpdelegate?.removeForgetPasswordView()
    }
    
    @objc func handleCloseBtnTap() {
        hideErrorEmailElements()
    }
   
    private func showSuccessEmailElements() {
        emailerrorLbl.textColor = UIColor.customBottomGray
        emailerrorLbl.isHidden = false
        closeBtnView.isHidden = false
        closeBtnView.image = UIImage(named: "okEmail")
        emailFieldTopConst.constant = 18
        notValidEmailLbl.isHidden = true
        emailView.styleRoundView(borderColor:.clear , borderWidth: 1.0)
    }
    
    @IBAction func sendActClicked(_ sender: UIButton) {
        emailTextField.resignFirstResponder()
        fpdelegate?.removeForgetPasswordView()
    }
}

extension ForgetPasswordView: UITextFieldDelegate {
    // Implement the delegate methods
    func textFieldShouldBeginEditing(_ textField: UITextField) -> Bool {
        print("TextField should begin editing")
        return true // Return true to allow editing
    }
    
    func textFieldDidEndEditing(_ textField: UITextField) {
        print("TextField did end editing")
        if let email = textField.text, email.isValidEmail() {
            print("Valid email address")
            showSuccessEmailElements()
        } else {
            print("Invalid email address")
            if (textField.text == "") {
                hideErrorEmailElements()
            }else {
                showErrorEmailElements()
            }
        }
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        emailTextField.resignFirstResponder()
        return true
    }
    
}
