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

class SignUpViewController: UIViewController {
    
    @IBOutlet weak var signUpLbl: UILabel!
    @IBOutlet weak var nameLbl: UILabel!
    @IBOutlet weak var emailLbl: UILabel!
    @IBOutlet weak var passwordLbl: UILabel!
    @IBOutlet weak var notValidNameLbl: UILabel!
    @IBOutlet weak var notValidEmailLbl: UILabel!
    @IBOutlet weak var notValidPasswordLbl: UILabel!
    
    
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
    
    private func initialSetUp() {
        hideAllErrorElements()
        
        nameTextField.delegate = self
        nameTextField.textColor = .lightGray
        nameTextField.tintColor = .lightGray
        
        emailTextField.delegate = self
        emailTextField.textColor = .lightGray
        emailTextField.tintColor = .lightGray
        
        passwordTextField.delegate = self
        passwordTextField.textColor = .lightGray
        passwordTextField.tintColor = .lightGray
        
        let tapcloseNameImg = UITapGestureRecognizer(target: self, action: #selector(tapCloseName))
        closeNameImg.isUserInteractionEnabled = true
        closeNameImg.addGestureRecognizer(tapcloseNameImg)
        
        let tapcloseEmailImg = UITapGestureRecognizer(target: self, action: #selector(tapCloseEmail))
        closeEmailImg.isUserInteractionEnabled = true
        closeEmailImg.addGestureRecognizer(tapcloseEmailImg)
        
        let tapclosePasswordImg = UITapGestureRecognizer(target: self, action: #selector(tapClosePassword))
        closePasswordImg.isUserInteractionEnabled = true
        closePasswordImg.addGestureRecognizer(tapclosePasswordImg)
        
        nameTopConst.constant = 10
        emailTopConst.constant = 10
        passowrdTopConst.constant = 10
        
        topConst1.constant = -5
        topConst2.constant = -5
    }
    
    private func setUpAllFonts() {
        signUpLbl.font = CustomFont.bold.font(size: 34)
        nameLbl.font = CustomFont.regular.font(size: 11)
        emailLbl.font = CustomFont.regular.font(size: 11)
        passwordLbl.font = CustomFont.regular.font(size: 11)
        notValidNameLbl.font = CustomFont.bold.font(size: 34)
        notValidEmailLbl.font = CustomFont.bold.font(size: 34)
        notValidPasswordLbl.font = CustomFont.bold.font(size: 34)
        
        
        notValidPasswordLbl.font = CustomFont.medium.font(size: 14)
        notValidPasswordLbl.font = CustomFont.medium.font(size: 14)

    }
   
    private func hideAllErrorElements() {
        closeNameImg.isHidden = true
        closeEmailImg.isHidden = true
        closePasswordImg.isHidden = true
        
        nameLbl.isHidden = true
        emailLbl.isHidden = true
        passwordLbl.isHidden = true
        
        notValidNameLbl.isHidden = true
        notValidEmailLbl.isHidden = true
        notValidPasswordLbl.isHidden = true
        let nameFont = UIFont.systemFont(ofSize: 14, weight: .regular)
        nameTextField.text = ""
        nameTextField.styleTextField(borderStyle: .none,
                                     borderColor: .clear,
                                     cornerRadius: 0.0,
                                     borderWidth: 0.0,
                                     placeholder: ECOMAPP.ENTERTHNAME,
                                     placeholderFont:nameFont,
                                     placeholderColor: .darkGray)
        
        let placeholderFont = UIFont.systemFont(ofSize: 14, weight: .regular)
        emailTextField.text = ""
        emailTextField.styleTextField(borderStyle: .none,
                                      borderColor: .clear,
                                      cornerRadius: 0.0,
                                      borderWidth: 0.0,
                                      placeholder: ECOMAPP.ENTERTHEEMAIL,
                                      placeholderFont:placeholderFont,
                                      placeholderColor: .darkGray)
        
        let passwordFont = UIFont.systemFont(ofSize: 14, weight: .regular)
        passwordTextField.text = ""
        passwordTextField.styleTextField(borderStyle: .none,
                                         borderColor: .clear,
                                         cornerRadius: 0.0,
                                         borderWidth: 0.0,
                                         placeholder: ECOMAPP.ENTERTHEPASSWORD,
                                         placeholderFont:passwordFont,
                                         placeholderColor: .darkGray)
        emailView.styleRoundView(borderColor:.clear , borderWidth: 0.0)
        passwordView.styleRoundView(borderColor:.clear , borderWidth: 0.0)
        nameView.styleRoundView(borderColor:.clear , borderWidth: 0.0)

    }
    
    private func hideErrorElements(for inputType: InputType, textViewToRound: UIView, textField: UITextField,textHide: String) {
        switch inputType {
        case .name:
            closeNameImg.isHidden = true
            
            nameLbl.isHidden = true
            notValidNameLbl.isHidden = true
            
            let nameFont = UIFont.systemFont(ofSize: 14, weight: .regular)
            textField.text = textHide
            textField.styleTextField(borderStyle: .none,
                                     borderColor: .clear,
                                     cornerRadius: 0.0,
                                     borderWidth: 0.0,
                                     placeholder: ECOMAPP.ENTERTHNAME,
                                     placeholderFont:nameFont,
                                     placeholderColor: .darkGray)
            
            textViewToRound.styleRoundView( borderColor:.clear , borderWidth: 0.0)
            topConst1.constant = -5
        case .email:
            closeEmailImg.isHidden = true
            
            emailLbl.isHidden = true
            notValidEmailLbl.isHidden = true
            
            let nameFont = UIFont.systemFont(ofSize: 14, weight: .regular)
            textField.text = textHide
            textField.styleTextField(borderStyle: .none,
                                     borderColor: .clear,
                                     cornerRadius: 0.0,
                                     borderWidth: 0.0,
                                     placeholder: ECOMAPP.ENTERTHEEMAIL,
                                     placeholderFont:nameFont,
                                     placeholderColor: .darkGray)
            
            textViewToRound.styleRoundView( borderColor:.clear , borderWidth: 0.0)
            topConst1.constant = -5
        case .password:
            closePasswordImg.isHidden = true
            
            passwordLbl.isHidden = true
            notValidPasswordLbl.isHidden = true
            
            let nameFont = UIFont.systemFont(ofSize: 14, weight: .regular)
            textField.text = textHide
            textField.styleTextField(borderStyle: .none,
                                     borderColor: .clear,
                                     cornerRadius: 0.0,
                                     borderWidth: 0.0,
                                     placeholder: ECOMAPP.ENTERTHEPASSWORD,
                                     placeholderFont:nameFont,
                                     placeholderColor: .darkGray)
            
            textViewToRound.styleRoundView( borderColor:.clear , borderWidth: 0.0)
            
        }
    }

    private func clearTextFields() {
        nameTextField.text = ""
        emailTextField.text  = ""
        passwordTextField.text = ""
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
    
    @IBAction func signUpActClick(_ sender: UIButton) {
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
        let placeholderFont = UIFont.systemFont(ofSize: 14, weight: .regular)
        switch inputType {
        case .name:
            closeNameImg.isHidden = false
            closePasswordImg.isHidden = true
            closeEmailImg.isHidden = true
            
            nameLbl.isHidden = false
            emailLbl.isHidden = true
            passwordLbl.isHidden = true
            
            notValidNameLbl.isHidden = false
            notValidEmailLbl.isHidden = true
            notValidPasswordLbl.isHidden = true
            
            topConst1.constant = 10
            nameLbl.textColor = colorError
            closeNameImg.image = UIImage(named: ECOMAPP.IMG.CLOSERED)
            
            nameTextField.styleTextField(borderStyle: .none,
                                         borderColor: .gray,
                                         cornerRadius: 0.0,
                                         borderWidth: 0.0,
                                         placeholder: "",
                                         placeholderFont: placeholderFont,
                                         placeholderColor: .clear)
            nameView.styleRoundView( borderColor:colorError , borderWidth: 1.0)
            
        case .email:
            closeEmailImg.isHidden = false
            closeNameImg.isHidden = true
            closePasswordImg.isHidden = true
            
            nameLbl.isHidden = true
            emailLbl.isHidden = false
            passwordLbl.isHidden = true
            
            notValidNameLbl.isHidden = true
            notValidEmailLbl.isHidden = false
            notValidPasswordLbl.isHidden = true
            
            topConst2.constant = 10
            closeEmailImg.image = UIImage(named: ECOMAPP.IMG.CLOSERED)
            emailLbl.textColor = colorError
            
            emailTextField.styleTextField(borderStyle: .none,
                                          borderColor: .gray,
                                          cornerRadius: 0.0,
                                          borderWidth: 0.0,
                                          placeholder: "",
                                          placeholderFont: placeholderFont,
                                          placeholderColor: .clear)
            emailView.styleRoundView( borderColor:colorError , borderWidth: 1.0)
            
        case .password:
            closeEmailImg.isHidden = true
            closeNameImg.isHidden = true
            closePasswordImg.isHidden = false
            
            nameLbl.isHidden = true
            emailLbl.isHidden = true
            passwordLbl.isHidden = false
            
            notValidNameLbl.isHidden = true
            notValidEmailLbl.isHidden = true
            notValidPasswordLbl.isHidden = false
            
            closePasswordImg.image = UIImage(named: ECOMAPP.IMG.CLOSERED)
            passwordLbl.textColor = colorError
            
            passwordTextField.styleTextField(borderStyle: .none,
                                             borderColor: .gray,
                                             cornerRadius: 0.0,
                                             borderWidth: 0.0,
                                             placeholder: "",
                                             placeholderFont: placeholderFont,
                                             placeholderColor: .clear)
            passwordView.styleRoundView(borderColor:colorError , borderWidth: 1.0)
        }
    }
    
    
}

extension SignUpViewController: UITextFieldDelegate {
  
    func textFieldShouldBeginEditing(_ textField: UITextField) -> Bool {
        if textField == nameTextField {
        if let name = nameTextField.text, name.isValidName() {
            
            return false
        }
//            if let nameText = nameTextField.text, nameText.isEmpty {
//                showAlert(message: ECOMAPP.ENTERTHNAME)
//                return false
//            }
//            else {
//                    return true
//            }
//            
//            if let name = nameTextField.text, name.isValidName() {
//                if  !emailLbl.isHidden || !passwordLbl.isHidden {
//                    showAlert(message: ECOMAPP.ENTERTHETEXTFIELD)
//                    return false
//                }
//                else {
//                    return true
//                }
//            }
//            else {
//                if  !emailLbl.isHidden || !passwordLbl.isHidden {
//                    showAlert(message: ECOMAPP.ENTERTHETEXTFIELD)
//                    return false
//                }
//            }
        }
        
        if textField == emailTextField {
            if let nameText = nameTextField.text, nameText.isEmpty {
                showAlert(message: ECOMAPP.ENTERTHETEXTFIELD)
                return false
            } else {
                if  !notValidNameLbl.isHidden {
                    showAlert(message: ECOMAPP.ENTERTHNAME)
                    return false
                }
                
                if let email = emailTextField.text, email.isValidEmail() {
                   
                }
                else {
                   
                }
            }
            
//            if let email = emailTextField.text, email.isValidEmail() {
//                if  !nameLbl.isHidden || !passwordLbl.isHidden {
//                    showAlert(message: ECOMAPP.ENTERTHETEXTFIELD)
//                    return false
//                }
//
////                if  !nameLbl.isHidden || !passwordLbl.isHidden {
////                    showAlert(message: ECOMAPP.ENTERTHETEXTFIELD)
////                    return false
////                } else {
////                    return true
////                }
//            }
//            else {
////                if  !nameLbl.isHidden || !passwordLbl.isHidden {
////                    showAlert(message: ECOMAPP.ENTERTHETEXTFIELD)
////                    return false
////                }
//            }
        }
        
        // Check if the text field being validated is the password field
        // Check if the text field being validated is the password field
        if textField == passwordTextField {
            if let emailText = emailTextField.text, emailText.isEmpty {
                showAlert(message: ECOMAPP.ENTERTHEEMAIL)
                return false
            }
            
            // Validate the password
//            if let password = passwordTextField.text, password.isValidPassword() {
//                // If both emailLbl and nameLbl are hidden, the password is valid
//                if emailLbl.isHidden && nameLbl.isHidden {
//                    return true
//                } else {
//                    // If any label (emailLbl or nameLbl) is not hidden, show an alert
//                    showAlert(message: ECOMAPP.ENTERTHETEXTFIELD)
//                    return false
//                }
//            } else {
//                // If password is not valid, check if nameTextField or emailTextField is empty
//                if (nameTextField.text?.isEmpty ?? true) {
//                    showAlert(message: ECOMAPP.ENTERTHNAME)
//                    return false
//                }
//                else if (emailTextField.text?.isEmpty ?? true) {
//                    showAlert(message: ECOMAPP.ENTERTHEEMAIL)
//                    return false
//                }
//
//            }
        }

        // Add additional validation logic here for other text fields if needed


        // Add additional validation logic here if needed for other text fields

        
        return true
    }

    func textFieldDidEndEditing(_ textField: UITextField) {
        print("TextField did end editing")
        
        if textField == nameTextField {
            if let name = nameTextField.text, name.isValidName() {
                hideErrorElements(for: .name, textViewToRound: nameView, textField: nameTextField, textHide: nameTextField.text ?? "")
                nameLbl.isHidden = false
                nameLbl.textColor = UIColor.customBottomGray
            } else {
                if passwordLbl.isHidden || emailLbl.isHidden {
                    showErrorElements(for: .name, textViewToRound: nameView, textField: nameTextField)
                }
            }
        } else if textField == emailTextField {
            if let email = emailTextField.text, email.isValidEmail() {
                hideErrorElements(for: .email, textViewToRound: emailView, textField: emailTextField, textHide: emailTextField.text ?? "")

            } else {
                if passwordLbl.isHidden || nameLbl.isHidden {
                    showErrorElements(for: .email, textViewToRound: emailView, textField: emailTextField)
                }
            }
        } else if textField == passwordTextField {
            if let password = passwordTextField.text, password.isValidPassword() {
                hideErrorElements(for: .password, textViewToRound: passwordView, textField: emailTextField, textHide: passwordTextField.text ?? "")
            } else {
                if emailLbl.isHidden || nameLbl.isHidden {
                   // showErrorElements(for: .password, textViewToRound: passwordView, textField: passwordTextField)
                }
            }
        }
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
    
}

