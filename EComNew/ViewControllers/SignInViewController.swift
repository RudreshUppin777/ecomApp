//
//  SignInViewController.swift
//  EComNew
//
//  Created by Way2 on 10/06/24.
//

import UIKit

enum InputType1 {
    case email
    case password
}

class SignInViewController: UIViewController ,ForgetPasswordDelegate{
    @IBOutlet weak var emailLbl: UILabel!
    @IBOutlet weak var notValidEmailLbl: UILabel!
    @IBOutlet weak var passwordLbl: UILabel!
    @IBOutlet weak var notValidPasswordLbl: UILabel!
    @IBOutlet weak var signupOrSocialLbl: UILabel!
    @IBOutlet weak var forgetPasswordLbl1: UILabel!
    @IBOutlet weak var loginHeadingLbl: UILabel!
    
    @IBOutlet weak var loginBtn: UIButton!
    
    @IBOutlet weak var emailView: UIView!
    @IBOutlet weak var passwordView: UIView!
    
    @IBOutlet weak var passwordTextField: UITextField!
    @IBOutlet weak var emailTextField: UITextField!
    
    @IBOutlet weak var closePasswordImg: UIImageView!
    @IBOutlet weak var closeEmailImg: UIImageView!
    
    @IBOutlet weak var emailTopConst: NSLayoutConstraint!
    @IBOutlet weak var passowrdTopConst: NSLayoutConstraint!
    
    lazy var forgetPasswordView: ForgetPasswordView = {
        let fpView = ForgetPasswordView()
        let safeAreaInsets = view.safeAreaInsets
        
        fpView.backgroundColor = .green
        fpView.fpdelegate = self
        fpView.frame = CGRect(
            x: 0,
            y: viewHeight,
            width: viewWidth,
            height: viewHeight  - safeAreaInsets.bottom
        )
        return fpView
    }()
    
    
    private var isForgetPasswordViewVisible = false
    
    // MARK: - ---------------- View LifeCycle Methods ----------------
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setUpViews()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        navigationItem.hidesBackButton = true
        clearTextFields()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
    }
    
    // MARK: - ---------------- Public Methods ----------------
    func removeForgetPasswordView() {
        animateForgetPasswordView1()
    }
    
    
    // MARK: - ---------------- Public Methods END ----------------
    
    // MARK: - ---------------- Private Methods ----------------
    
    private func setUpViews() {
        initialSetUp()
    }
    
    private func initialSetUp() {
        
        closeEmailImg.isHidden = true
        closePasswordImg.isHidden = true
        
        emailLbl.isHidden = true
        passwordLbl.isHidden = true
        
        notValidEmailLbl.isHidden = true
        notValidPasswordLbl.isHidden = true
        
        emailTextField.text = ""
        let style = TextFieldStyle(placeholder: ECOMAPP.ENTERTHEEMAIL,
                                    placeholderColor: .darkGray, borderColor: .clear, errorState: .success)
        emailTextField.styleTextField(style: style)
        
        
        passwordTextField.text = ""
        let style3 = TextFieldStyle(placeholder: ECOMAPP.ENTERTHEPASSWORD,
                                    placeholderColor: .darkGray, borderColor: .clear, errorState: .success)     
        passwordTextField.styleTextField(style: style3)
        
        emailView.styleRoundView( borderColor:.clear , borderWidth: 0.0)
        passwordView.styleRoundView( borderColor:.clear , borderWidth: 0.0)
        
        
        
        
        emailTextField.delegate = self
        emailTextField.textColor = .lightGray
        emailTextField.tintColor = .lightGray
        
        passwordTextField.delegate = self
        passwordTextField.textColor = .lightGray
        passwordTextField.tintColor = .lightGray
        
        
        let tapcloseEmailImg = UITapGestureRecognizer(target: self, action: #selector(tapCloseEmail))
        closeEmailImg.isUserInteractionEnabled = true
        closeEmailImg.addGestureRecognizer(tapcloseEmailImg)
        
        let tapclosePasswordImg = UITapGestureRecognizer(target: self, action: #selector(tapClosePassword))
        closePasswordImg.isUserInteractionEnabled = true
        closePasswordImg.addGestureRecognizer(tapclosePasswordImg)
        
        emailTopConst.constant = 10
        passowrdTopConst.constant = 10
        setUpAllFonts()
    }
    
    private func clearTextFields() {
        emailTextField.text = ""
        passwordTextField.text = ""
        
        emailLbl.isHidden = true
        passwordLbl.isHidden = true
        closeEmailImg.isHidden = true
        closePasswordImg.isHidden = true
        
        emailTextField.isEnabled = false
        passwordTextField.isEnabled = false
    }
    private func showErrorElements(for inputType: InputType1, textViewToRound: UIView, textField: UITextField) {
        let colorError = UIColor.customBottomRed
        let placeholderFont = UIFont.systemFont(ofSize: 14, weight: .regular)
        switch inputType {
            
        case .email:
            notValidEmailLbl.isHidden = false
            notValidPasswordLbl.isHidden = true
            emailLbl.textColor = colorError
            closeEmailImg.image = CustomImage.image(.CLOSERED)()
            closeEmailImg.isHidden = false
            let style = TextFieldStyle(placeholder: "",
                                       placeholderColor: .clear, borderColor: .gray, errorState: .error)
            
            emailTextField.styleTextField(style: style)
            emailView.styleRoundView( borderColor:colorError , borderWidth: 1.0)
            
        case .password:
            
            notValidEmailLbl.isHidden = true
            notValidPasswordLbl.isHidden = false
            passwordLbl.textColor = colorError
            closePasswordImg.image = CustomImage.image(.CLOSERED)()
            closePasswordImg.isHidden = false
            let style = TextFieldStyle(placeholder: "",
                                       placeholderColor: .clear, borderColor: .gray, errorState: .error)
            passwordTextField.styleTextField(style: style)
            passwordView.styleRoundView(borderColor:colorError , borderWidth: 1.0)
            
        }
    }
    
    private func hideErrorElements(for inputType: InputType1, textViewToRound: UIView, textField: UITextField,textHide: String) {
        switch inputType {
            
        case .email:
            closeEmailImg.isHidden = true
            
            emailLbl.isHidden = true
            notValidEmailLbl.isHidden = true
            
            textField.text = textHide
            let style = TextFieldStyle(placeholder: ECOMAPP.ENTERTHEEMAIL,
                                       placeholderColor: .darkGray, borderColor: .clear, errorState: .success)
        
            textField.styleTextField(style: style)
            
            textViewToRound.styleRoundView(borderColor:.clear , borderWidth: 0.0)
        case .password:
            closePasswordImg.isHidden = true
            
            passwordLbl.isHidden = true
            notValidPasswordLbl.isHidden = true
            
            textField.text = textHide
            let style = TextFieldStyle(placeholder: ECOMAPP.ENTERTHEPASSWORD,
                                       placeholderColor: .darkGray, borderColor: .clear, errorState: .success)
        
            textField.styleTextField(style: style)
            
            textViewToRound.styleRoundView(borderColor:.clear , borderWidth: 0.0)
        }
    }
    
    
    private func animateForgetPasswordView1() {
        let finalYPosition: CGFloat
        let animationDuration: TimeInterval = 0.5
        
        if isForgetPasswordViewVisible {
            finalYPosition = self.view.frame.height
        } else {
            self.view.addSubview(forgetPasswordView)
            finalYPosition = 0
        }
        
        UIView.animate(withDuration: animationDuration,
                       delay: 0,
                       options: [.curveEaseOut],
                       animations: {
            self.forgetPasswordView.frame.origin.y = finalYPosition
        }, completion: { _ in
            if self.isForgetPasswordViewVisible {
                self.forgetPasswordView.removeFromSuperview()
            }
            self.isForgetPasswordViewVisible.toggle()
        })
    }
    
    private func setUpAllFonts() {
        loginHeadingLbl.font = CustomFont.bold.font(size: 34)
        emailLbl.font = CustomFont.regular.font(size: 11)
        passwordLbl.font = CustomFont.regular.font(size: 11)
        notValidEmailLbl.font = CustomFont.regular.font(size: 11)
        notValidPasswordLbl.font = CustomFont.regular.font(size: 11)
        forgetPasswordLbl1.font = CustomFont.medium.font(size: 14)
        signupOrSocialLbl.font = CustomFont.medium.font(size: 14)
        loginBtn.titleLabel?.font =  CustomFont.medium.font(size: 14)
    }
    
    // MARK: - ---------------- Private Methods END ----------------
    @objc func tapCloseEmail() {
        hideErrorElements(for: .email, textViewToRound: emailView, textField: emailTextField, textHide: "")
    }
    
    @objc func tapClosePassword() {
        hideErrorElements(for: .password, textViewToRound: passwordView, textField: passwordTextField, textHide: "")
    }
    
    
    // MARK: - ---------------- IBActions Methods ----------------
    
    @IBAction func forgetPasswordViewClicked(_ sender: UIButton) {
        animateForgetPasswordView1()
    }
    
    @IBAction func backActClicked(_ sender: UIButton) {
        self.navigationController?.popViewController(animated: true)
    }
    
    // MARK: - ---------------- IBActions Methods  END----------------
    
}


extension SignInViewController: UITextFieldDelegate {
    func textFieldShouldBeginEditing(_ textField: UITextField) -> Bool {
        switch textField {
       
        case emailTextField:
            hideErrorElements(for: .email, textViewToRound: emailView, textField: emailTextField, textHide: emailTextField.text ?? "")
            emailLbl.isHidden = false
            emailLbl.textColor = UIColor.customBottomGray
            passwordTextField.isEnabled = false
            
        case passwordTextField:
            hideErrorElements(for: .password, textViewToRound: passwordView, textField: passwordTextField, textHide: passwordTextField.text ?? "" )
            passwordLbl.isHidden = false
            passwordLbl.textColor = UIColor.customBottomGray
            emailTextField.isEnabled = false
            
        default:
            break
        }
        
        textField.placeholder = ""

        return true
    }

    func textFieldDidEndEditing(_ textField: UITextField) {
        switch textField {
        case emailTextField:
            guard let email = emailTextField.text else { return }
            if email.isValidEmail() {
                closeEmailImg.image = CustomImage.OKGREEN.image()
                closeEmailImg.accessibilityIdentifier = CustomImage.OKGREEN.rawValue
                hideErrorElements(for: .email, textViewToRound: emailView, textField: emailTextField, textHide: email)
                closeEmailImg.isHidden = false
                emailLbl.textColor = UIColor.customBottomGray
                emailLbl.isHidden = false
                passwordTextField.isEnabled = true
                
            } else {
                if !emailTextField.text!.isEmpty {
                    showErrorElements(for: .email, textViewToRound: emailView, textField: emailTextField)
                    passwordTextField.isEnabled = false
                }
            }
        case passwordTextField:
            guard let password = passwordTextField.text else { return }
            if  password.isValidPassword() {
                closePasswordImg.image = CustomImage.OKGREEN.image()
                closePasswordImg.accessibilityIdentifier = CustomImage.OKGREEN.rawValue
                hideErrorElements(for: .password, textViewToRound: passwordView, textField: passwordTextField, textHide: password)
                passwordLbl.isHidden = false
                passwordLbl.textColor = UIColor.customBottomGray
                closePasswordImg.isHidden = false
            } else {
                if !passwordTextField.text!.isEmpty {
                    showErrorElements(for: .password, textViewToRound: passwordView, textField: passwordTextField)
                }
            }
        default:
            break
        }
    }

    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        var isValid = true

        switch textField {

        case emailTextField:
            if !emailTextField.text!.isValidEmail() {
                showErrorElements(for: .email, textViewToRound: emailView, textField: emailTextField)
                showAlert(message: ECOMAPP.VALIDEMAIL)
                isValid = false
                passwordTextField.isEnabled = false
            }

        case passwordTextField:
            if !passwordTextField.text!.isValidPassword() {
                notValidPasswordLbl.isHidden = false
                showAlert(message: ECOMAPP.VALIDPASSWORD)
                isValid = false
            }

        default:
            break
        }

        if isValid {
            textField.resignFirstResponder()
        }

        return isValid
    }

}
