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
    
    @IBOutlet weak var emailView: UIView!
    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var emailLbl: UILabel!
    @IBOutlet weak var closeEmailImg: UIImageView!
    @IBOutlet weak var notValidEmailLbl: UILabel!
    
    @IBOutlet weak var passwordView: UIView!
    @IBOutlet weak var passwordTextField: UITextField!
    @IBOutlet weak var passwordLbl: UILabel!
    @IBOutlet weak var closePasswordImg: UIImageView!
    @IBOutlet weak var notValidPasswordLbl: UILabel!
    
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
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
    }
    
    // MARK: - ---------------- Public Methods ----------------
    func removeForgetPasswordView() {
        animateForgetPasswordView1()
    }
    
    
    // MARK: - ---------------- Private Methods ----------------
    
    private func setUpViews() {
        initialSetUp()
    }
    
    @objc func tapCloseEmail() {
        hideErrorElements(for: .email, textViewToRound: emailView, textField: emailTextField, textHide: "")
    }
    
    @objc func tapClosePassword() {
        hideErrorElements(for: .password, textViewToRound: passwordView, textField: passwordTextField, textHide: "")
    }
    
    private func initialSetUp() {
        hideAllErrorElements()
        
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
        
    }
    
    private func hideAllErrorElements() {
        
        closeEmailImg.isHidden = true
        closePasswordImg.isHidden = true
        
        emailLbl.isHidden = true
        passwordLbl.isHidden = true
        
        notValidEmailLbl.isHidden = true
        notValidPasswordLbl.isHidden = true
        
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
        emailView.styleRoundView( borderColor:.clear , borderWidth: 0.0)
        passwordView.styleRoundView( borderColor:.clear , borderWidth: 0.0)
        
    }
    
    private func showErrorElements(for inputType: InputType1, textViewToRound: UIView, textField: UITextField) {
        let colorError = UIColor.customBottomRed
        let placeholderFont = UIFont.systemFont(ofSize: 14, weight: .regular)
        switch inputType {
       
        case .email:
            closeEmailImg.isHidden = false
            closePasswordImg.isHidden = true
            
            emailLbl.isHidden = false
            passwordLbl.isHidden = true
            
            notValidEmailLbl.isHidden = false
            notValidPasswordLbl.isHidden = true
            
            closeEmailImg.image = UIImage(named: "closeRed")
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
            closePasswordImg.isHidden = false
            
            emailLbl.isHidden = true
            passwordLbl.isHidden = false
            
            notValidEmailLbl.isHidden = true
            notValidPasswordLbl.isHidden = false
            
            closePasswordImg.image = UIImage(named: "closeRed")
            passwordLbl.textColor = colorError
            
            passwordTextField.styleTextField(borderStyle: .none,
                                             borderColor: .gray,
                                             cornerRadius: 0.0,
                                             borderWidth: 0.0,
                                             placeholder: "",
                                             placeholderFont: placeholderFont,
                                             placeholderColor: .clear)
            passwordView.styleRoundView( borderColor:colorError , borderWidth: 1.0)
        }
    }
    
    private func hideErrorElements(for inputType: InputType1, textViewToRound: UIView, textField: UITextField,textHide: String) {
        switch inputType {
        
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
            
            textViewToRound.styleRoundView(borderColor:.clear , borderWidth: 0.0)
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
    
    //    private func animateForgetPasswordView() {
    //          let finalYPosition: CGFloat
    //          let animationDuration: TimeInterval = 0.5
    //
    //          if isBottomViewVisible {
    //              finalYPosition = self.viewHeight
    //          } else {
    //              finalYPosition = self.viewHeight-85
    //          }
    //
    //          UIView.animate(withDuration: animationDuration,
    //                         delay: 0,
    //                         options: [.curveEaseOut],
    //                         animations: {
    //              self.bottomMenu.frame.origin.y = finalYPosition
    //          }, completion: { _ in
    //              self.isBottomViewVisible.toggle()
    //          })
    //      }
    //
    
    // MARK: - ---------------- IBActions Methods ----------------
    
    
    private func loadForgetPasswordView() {
        
    }
    
    @IBAction func forgetPasswordViewClicked(_ sender: UIButton) {
        animateForgetPasswordView1()
    }
    
    @IBAction func backActClicked(_ sender: UIButton) {
        self.navigationController?.popViewController(animated: true)
    }
 
}


extension SignInViewController: UITextFieldDelegate {
    func textFieldShouldBeginEditing(_ textField: UITextField) -> Bool {
        if textField == emailTextField {
            if let email = emailTextField.text, email.isValidEmail() {
                if  !passwordLbl.isHidden  {
                    showAlert(message: ECOMAPP.ENTERTHETEXTFIELD)
                    return false
                }
                else {
                    return true
                }
            }
            else {
                if  !passwordLbl.isHidden {
                    showAlert(message: ECOMAPP.ENTERTHETEXTFIELD)
                    return false
                }
            }
        }
        
        if textField == passwordTextField {
            if let email = passwordTextField.text, email.isValidPassword() {
                if  !emailLbl.isHidden  {
                    showAlert(message: ECOMAPP.ENTERTHETEXTFIELD)
                    return false
                } else {
                    return true
                }
            }
            else {
                if  !emailLbl.isHidden  {
                    showAlert(message: ECOMAPP.ENTERTHETEXTFIELD)
                    return false
                }
            }
        }
        
        return true
    }
    
    func textFieldDidEndEditing(_ textField: UITextField) {
        print("TextField did end editing")
        
        if textField == passwordTextField {
            if let name = passwordTextField.text, name.isValidPassword() {
                hideErrorElements(for: .password, textViewToRound: passwordView, textField: passwordTextField, textHide: passwordTextField.text ?? "")
            } else {
                if  emailLbl.isHidden {
                    showErrorElements(for: .password, textViewToRound: passwordView, textField: passwordTextField)
                }
            }
        } else if textField == emailTextField {
            if let email = emailTextField.text, email.isValidEmail() {
                hideErrorElements(for: .email, textViewToRound: emailView, textField: emailTextField, textHide: emailTextField.text ?? "")
                
            } else {
                if  passwordLbl.isHidden {
                    showErrorElements(for: .email, textViewToRound: emailView, textField: emailTextField)
                }
            }
            
        }
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
}
