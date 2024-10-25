//
//  SignUpViewController.swift
//  EComNew
//
//  Created by Way2 on 10/06/24.
//

import UIKit
enum InputType {
    case email
    case name
    case password
}

class SignUpViewController: UIViewController ,UIGestureRecognizerDelegate{
    
    @IBOutlet weak var signUpLbl: UILabel!
    @IBOutlet weak var nameLbl: UILabel!
    @IBOutlet weak var emailLbl: UILabel!
    @IBOutlet weak var passwordLbl: UILabel!
    @IBOutlet weak var notValidNameLbl: UILabel!
    @IBOutlet weak var notValidEmailLbl: UILabel!
    @IBOutlet weak var notValidPasswordLbl: UILabel!
    @IBOutlet weak var alreadyHaveAcntLbl: UILabel!
    @IBOutlet weak var signUpBtn: UIButton!
    @IBOutlet weak var signUpview: UIView!
    @IBOutlet weak var signupOrSocialLbl: UILabel!
    
    @IBOutlet weak var nameView: UIView!
    @IBOutlet weak var emailView: UIView!
    @IBOutlet weak var passwordView: UIView!
    
    @IBOutlet weak var closeNameImg: UIImageView!
    @IBOutlet weak var closeEmailImg: UIImageView!
    @IBOutlet weak var closePasswordImg: UIImageView!
    
    @IBOutlet weak var nameTextField: UITextField!
    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    
    @IBOutlet weak var nameTopConst: NSLayoutConstraint!
    @IBOutlet weak var emailTopConst: NSLayoutConstraint!
    @IBOutlet weak var passowrdTopConst: NSLayoutConstraint!
    
    @IBOutlet weak var topConst1: NSLayoutConstraint!
    @IBOutlet weak var topConst2: NSLayoutConstraint!
    
    private var isForgetPasswordViewVisible = false
    
    // MARK: - ---------------- View LifeCycle Methods ----------------
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setUpViews()
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        clearTextFields()
        
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
    }
    
    // MARK: - ---------------- Public Methods ----------------
    
    // MARK: - ---------------- Private Methods ----------------
    
    private func setUpViews() {
        initialSetUp()
    }
    
    func gestureRecognizer(_ gestureRecognizer: UIGestureRecognizer, shouldRecognizeSimultaneouslyWith otherGestureRecognizer: UIGestureRecognizer) -> Bool {
        return true
    }
    
    private func initialSetUp() {
        setUpAllFonts()
        
        nameTextField.delegate = self
        nameTextField.textColor = .lightGray
        nameTextField.tintColor = .lightGray
        
        emailTextField.delegate = self
        emailTextField.textColor = .lightGray
        emailTextField.tintColor = .lightGray
        
        passwordTextField.delegate = self
        passwordTextField.textColor = .lightGray
        passwordTextField.tintColor = .lightGray
        
        nameTextField.text = ""
        let style1 = TextFieldStyle( placeholder: ECOMAPP.ENTERTHNAME,
                                     placeholderColor: .darkGray, borderColor: .clear, errorState: .success)
        nameTextField.styleTextField(style: style1)
        
        emailTextField.text = ""
        let style2 = TextFieldStyle( placeholder: ECOMAPP.ENTERTHEEMAIL,
                                     placeholderColor: .darkGray, borderColor: .clear, errorState: .success)
        emailTextField.styleTextField(style: style2)
        passwordTextField.text = ""
        let style3 = TextFieldStyle( placeholder: ECOMAPP.ENTERTHEPASSWORD,
                                     placeholderColor: .darkGray, borderColor: .clear, errorState: .success)
        passwordTextField.styleTextField(style: style3)
        
        emailView.styleRoundView(borderColor:.clear , borderWidth: 0.0)
        passwordView.styleRoundView(borderColor:.clear , borderWidth: 0.0)
        nameView.styleRoundView(borderColor:.clear , borderWidth: 0.0)
        
        let tapcloseNameImg = UITapGestureRecognizer(target: self, action: #selector(tapCloseName))
        closeNameImg.isUserInteractionEnabled = true
        closeNameImg.addGestureRecognizer(tapcloseNameImg)
        
        let tapcloseEmailImg = UITapGestureRecognizer(target: self, action: #selector(tapCloseEmail))
        closeEmailImg.isUserInteractionEnabled = true
        closeEmailImg.addGestureRecognizer(tapcloseEmailImg)
        
        let tapclosePasswordImg = UITapGestureRecognizer(target: self, action: #selector(tapClosePassword))
        closePasswordImg.isUserInteractionEnabled = true
        closePasswordImg.addGestureRecognizer(tapclosePasswordImg)
        
        nameLbl.isHidden = true
        closeNameImg.image = CustomImage.CLOSERED.image()
        closeNameImg.accessibilityIdentifier = CustomImage.CLOSERED.rawValue
        
        emailLbl.isHidden = true
        closeEmailImg.image = CustomImage.CLOSERED.image()
        closeEmailImg.accessibilityIdentifier = CustomImage.CLOSERED.rawValue
        
        passwordLbl.isHidden = true
        closePasswordImg.image = CustomImage.CLOSERED.image()
        closePasswordImg.accessibilityIdentifier = CustomImage.CLOSERED.rawValue
        
        notValidNameLbl.isHidden = true
        notValidEmailLbl.isHidden = true
        notValidPasswordLbl.isHidden = true
        
        closeNameImg.isHidden = true
        closeEmailImg.isHidden = true
        closePasswordImg.isHidden = true
        
        nameTopConst.constant = 10
        emailTopConst.constant = 10
        passowrdTopConst.constant = 10
        
        topConst1.constant = -5
        topConst2.constant = -5
        
  
    }
    
    private func setUpAllFonts() {
        signUpLbl.font = CustomFont.bold.font(size: 34)
        nameLbl.font = CustomFont.regular.font(size: 11)
        notValidNameLbl.font = CustomFont.regular.font(size: 11)
        emailLbl.font = CustomFont.regular.font(size: 11)
        notValidEmailLbl.font = CustomFont.regular.font(size: 11)
        passwordLbl.font = CustomFont.regular.font(size: 11)
        notValidPasswordLbl.font = CustomFont.regular.font(size: 11)
        alreadyHaveAcntLbl.font = CustomFont.medium.font(size: 14)
        signupOrSocialLbl.font = CustomFont.medium.font(size: 14)
        //signUpBtn.titleLabel?.font = CustomFont.medium.font(size: 14)
        
    }
    
    private func updateCloseImageState(imageState: UIImageView) {
        // Disable user interaction if the image is OKGREEN
        let okGreenImage = CustomImage.OKGREEN.image()
        okGreenImage?.accessibilityIdentifier = CustomImage.OKGREEN.rawValue
        
        if imageState == closeNameImg  || imageState == closeEmailImg  || imageState == closePasswordImg {
            if imageState.accessibilityIdentifier == okGreenImage?.accessibilityIdentifier {
                imageState.isUserInteractionEnabled = false
            } else {
                imageState.isUserInteractionEnabled = true
            }
        }
        
    }
    
    private func hideErrorElements(for inputType: InputType, textViewToRound: UIView, textField: UITextField,textHide: String) {
        switch inputType {
        case .name:
            closeNameImg.isHidden = true
            notValidNameLbl.isHidden = true
            nameLbl.isHidden = true
            textField.text = textHide
            let style = TextFieldStyle(placeholder: ECOMAPP.ENTERTHNAME,
                                       placeholderColor: .darkGray, borderColor: .clear, errorState: .success)
            textField.styleTextField(style: style)
            textViewToRound.styleRoundView( borderColor:.clear , borderWidth: 0.0)
            topConst1.constant = -5
            
            updateCloseImageState(imageState: self.closeNameImg)
            
        case .email:
            closeEmailImg.isHidden = true
            notValidEmailLbl.isHidden = true
            emailLbl.isHidden = true
            textField.text = textHide
            let style = TextFieldStyle(placeholder: ECOMAPP.ENTERTHEEMAIL,
                                       placeholderColor: .darkGray, borderColor: .clear, errorState: .success)
            textField.styleTextField(style: style)
            textViewToRound.styleRoundView( borderColor:.clear , borderWidth: 0.0)
            topConst1.constant = -5
            
            updateCloseImageState(imageState: self.closeEmailImg)
        case .password:
            closePasswordImg.isHidden = true
            notValidPasswordLbl.isHidden = true
            passwordLbl.isHidden = true
            textField.text = textHide
            let style3 = TextFieldStyle(placeholder: ECOMAPP.ENTERTHEPASSWORD,
                                        placeholderColor: .darkGray, borderColor: .clear, errorState: .success)
            textField.styleTextField(style: style3)
            textViewToRound.styleRoundView( borderColor:.clear , borderWidth: 0.0)
            updateCloseImageState(imageState: self.closePasswordImg)
            
        }
    }
    
    private func clearTextFields() {
        nameTextField.text = ""
        emailTextField.text  = ""
        passwordTextField.text = ""
        nameLbl.isHidden = true
        emailLbl.isHidden = true
        passwordLbl.isHidden = true
        closeNameImg.isHidden = true
        closeEmailImg.isHidden = true
        closePasswordImg.isHidden = true
        nameTextField.isEnabled = true
        emailTextField.isEnabled = false
        passwordTextField.isEnabled = false
        
    }
    
    // MARK: - ---------------- Private Methods End----------------
    
    // MARK: - ---------------- Action Methods ----------------
    
    @objc func tapCloseName() {
        hideErrorElements(for: .name, textViewToRound: nameView, textField: nameTextField, textHide: "")
    }
    
    @objc func tapCloseEmail() {
        hideErrorElements(for: .email, textViewToRound: emailView, textField: emailTextField, textHide: "")
    }
    
    @objc func tapClosePassword() {
        hideErrorElements(for: .password, textViewToRound: passwordView, textField: passwordTextField, textHide: "")
    }
    
    // MARK: - ---------------- IBActions Methods ----------------
    
    @IBAction func alreadyAcounutActClick(_ sender: UIButton) {
       
        
        if let signinVC: SignInViewController = UIStoryboard.instantiateViewController(storyboardName: "Main", identifier: ECOMAPP.VC.SIGNIN) {
            self.navigationController?.pushViewController(signinVC, animated: true)
        }
    }
    
    @IBAction func signUpClick(_ sender: Any) {
        if let homevc: HomeViewController = UIStoryboard.instantiateViewController(storyboardName: "Main", identifier: ECOMAPP.VC.HOMEVC) {
            self.navigationController?.pushViewController(homevc, animated: true)
        }
    }
    
    @IBAction func googleActClick(_ sender: UIButton) {
   
    }
    
    @IBAction func fbActClick(_ sender: UIButton) {
  
    }
    
    private func showErrorElements(for inputType: InputType, textViewToRound: UIView, textField: UITextField) {
        let colorError = UIColor.customBottomRed
        switch inputType {
        case .name:
            notValidNameLbl.isHidden = false
            notValidEmailLbl.isHidden = true
            notValidPasswordLbl.isHidden = true
            nameLbl.textColor = colorError
            topConst1.constant = 10
            closeNameImg.image = CustomImage.image(.CLOSERED)()
            closeNameImg.isHidden = false
            
            let style = TextFieldStyle( placeholder: "",
                                        placeholderColor: .clear, borderColor: .gray, errorState: .error)
            nameTextField.styleTextField(style: style)
            nameView.styleRoundView( borderColor:colorError , borderWidth: 1.0)
            
        case .email:
            notValidNameLbl.isHidden = true
            notValidEmailLbl.isHidden = false
            notValidPasswordLbl.isHidden = true
            emailLbl.textColor = colorError
            topConst2.constant = 10
            closeEmailImg.image = CustomImage.image(.CLOSERED)()
            closeEmailImg.isHidden = false
            
            let style3 = TextFieldStyle( placeholder: "",
                                         placeholderColor: .clear, borderColor: .gray, errorState: .error)
            emailTextField.styleTextField(style: style3)
            emailView.styleRoundView( borderColor:colorError , borderWidth: 1.0)
        case .password:
            notValidNameLbl.isHidden = true
            notValidEmailLbl.isHidden = true
            notValidPasswordLbl.isHidden = false
            passwordLbl.textColor = colorError
            closePasswordImg.image = CustomImage.image(.CLOSERED)()
            closePasswordImg.isHidden = false
            
            let style3 = TextFieldStyle(placeholder: "",
                                        placeholderColor: .clear, borderColor: .gray, errorState: .error)
            passwordTextField.styleTextField(style: style3)
            passwordView.styleRoundView(borderColor:colorError , borderWidth: 1.0)
            
        }
    }
    
      override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
          super.touchesBegan(touches, with: event)
          view.endEditing(true)
      }
}

// UITextFieldDelegate METHODS
extension SignUpViewController: UITextFieldDelegate {
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        // Allow changes for all text fields except nameTextField
        guard textField == nameTextField || textField == emailTextField || textField == passwordTextField else {
            return true // Allow changes for other text fields
        }
        // Get the current text in the text field
        let currentText = textField.text ?? ""
        // Convert the NSRange to a Range<String.Index>
        guard let stringRange = Range(range, in: currentText) else { return false }
        // Create the updated text
        let updatedText = currentText.replacingCharacters(in: stringRange, with: string)
        if updatedText.isEmpty {
            // Set placeholder and visibility for the text field
            switch textField {
            case nameTextField:
                closeNameImg.isHidden = true
                nameLbl.isHidden = true
                textField.placeholder = ECOMAPP.ENTERTHNAME
                hideErrorElements(for: .name, textViewToRound: nameView, textField: nameTextField, textHide: nameTextField.text ?? "")
            case emailTextField:
                closeEmailImg.isHidden = true
                emailLbl.isHidden = true
                textField.placeholder = ECOMAPP.ENTERTHEEMAIL
                hideErrorElements(for: .email, textViewToRound: emailView, textField: emailTextField, textHide: emailTextField.text ?? "")
            case passwordTextField:
                closePasswordImg.isHidden = true
                passwordLbl.isHidden = true
                textField.placeholder = ECOMAPP.ENTERTHEPASSWORD
                hideErrorElements(for: .password, textViewToRound: passwordView, textField: passwordTextField, textHide: passwordTextField.text ?? "")
            default:
                break
            }
        } else {
            switch textField {
            case nameTextField:
                guard let name = nameTextField.text else { return false}
                if !nameTextField.text!.isValidName() {
                    showErrorElements(for: .name, textViewToRound: nameView, textField: nameTextField)
                }
                if nameTextField.text!.isValidName() {
                    hideErrorElements(for: .name, textViewToRound: nameView, textField: nameTextField, textHide: name)
                    nameLbl.textColor = UIColor.customBottomGray
                }
                nameLbl.isHidden = false
                nameTextField.placeholder = ""
            case emailTextField:
                guard let email = emailTextField.text else { return false}
                if !emailTextField.text!.isValidEmail() {
                    showErrorElements(for: .email, textViewToRound: emailView, textField: emailTextField)
                }
                
                if emailTextField.text!.isValidEmail() {
                    hideErrorElements(for: .email, textViewToRound: emailView, textField: emailTextField, textHide: email)
                    emailLbl.textColor = UIColor.customBottomGray
                }
                emailLbl.isHidden = false
                emailTextField.placeholder = ""
            case passwordTextField:
                guard let password = passwordTextField.text else { return false}
                if !passwordTextField.text!.isValidPassword() {
                    showErrorElements(for: .password, textViewToRound: passwordView, textField: passwordTextField)
                }
                
                if passwordTextField.text!.isValidPassword() {
                    hideErrorElements(for: .password, textViewToRound: passwordView, textField: passwordTextField, textHide: password)
                    passwordLbl.textColor = UIColor.customBottomGray
                }
                passwordTextField.placeholder = ""
                passwordLbl.isHidden = false
            default:
                break
            }
        }
        return true
    }
    
    func textFieldShouldBeginEditing(_ textField: UITextField) -> Bool {
        switch textField {
        case nameTextField:
            hideErrorElements(for: .name, textViewToRound: nameView, textField: nameTextField, textHide: nameTextField.text ?? "")
            nameLbl.isHidden = false
            nameLbl.textColor = UIColor.customBottomGray
            emailTextField.isEnabled = false
            passwordTextField.isEnabled = false
        case emailTextField:
            hideErrorElements(for: .email, textViewToRound: emailView, textField: emailTextField, textHide: emailTextField.text ?? "")
            emailLbl.isHidden = false
            emailLbl.textColor = UIColor.customBottomGray
            nameTextField.isEnabled = false
            passwordTextField.isEnabled = false
        case passwordTextField:
            hideErrorElements(for: .password, textViewToRound: passwordView, textField: passwordTextField, textHide: passwordTextField.text ?? "" )
            passwordLbl.isHidden = false
            passwordLbl.textColor = UIColor.customBottomGray
            nameTextField.isEnabled = false
            emailTextField.isEnabled = false
            
        default:
            break
        }
        
        textField.placeholder = ""
        
        return true
    }
    
    func textFieldDidEndEditing(_ textField: UITextField) {
        switch textField {
        case nameTextField:
            guard let name = nameTextField.text else { return }
            if name.isValidName() {
                closeNameImg.image = CustomImage.OKGREEN.image()
                closeNameImg.accessibilityIdentifier = CustomImage.OKGREEN.rawValue
                hideErrorElements(for: .name, textViewToRound: nameView, textField: nameTextField, textHide: name)
                closeNameImg.isHidden = false
                nameLbl.isHidden = false
                nameLbl.textColor = UIColor.customBottomGray
                emailTextField.isEnabled = true
            } else {
                if !nameTextField.text!.isEmpty {
                    showErrorElements(for: .name, textViewToRound: nameView, textField: nameTextField)
                    emailTextField.isEnabled = false
                }
            }
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
        case nameTextField:
            if !nameTextField.text!.isValidName() {
                showErrorElements(for: .name, textViewToRound: nameView, textField: nameTextField)
                showAlert(message: ECOMAPP.VALIDNAME)
                isValid = false
                emailTextField.isEnabled = false
            }
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

