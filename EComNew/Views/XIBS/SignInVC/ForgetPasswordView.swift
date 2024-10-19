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
    @IBOutlet weak var forgetPasswordTitle: UILabel!
    @IBOutlet weak var emailLbl: UILabel!
    @IBOutlet weak var viaEmailLbl: UILabel!
    @IBOutlet weak var notValidEmailLbl: UILabel!

    @IBOutlet weak var emailView: UIView!
    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var closeBtnView: UIImageView!
    @IBOutlet weak var sendBtn: UIButton!    
    @IBOutlet weak var emailFieldTopConst: NSLayoutConstraint!

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
        
    // MARK: - ---------------- Public Methods END ----------------
//    private func showErrorElements(for inputType: InputType, textViewToRound: UIView, textField: UITextField) {
//        let colorError = UIColor.customBottomRed
//        let placeholderFont = UIFont.systemFont(ofSize: 14, weight: .regular)
//        switch inputType {
//        case .name:
//            
//            notValidNameLbl.isHidden = false
//            notValidEmailLbl.isHidden = true
//            notValidPasswordLbl.isHidden = true
//            
//            topConst1.constant = 10
//            nameLbl.textColor = colorError
//            closeNameImg.image = CustomImage.image(.CLOSERED)()
//            closeNameImg.isHidden = false
//            
//            nameTextField.styleTextField(borderStyle: .none,
//                                         borderColor: .gray,
//                                         cornerRadius: 0.0,
//                                         borderWidth: 0.0,
//                                         placeholder: "",
//                                         placeholderFont: placeholderFont,
//                                         placeholderColor: .clear)
//            nameView.styleRoundView( borderColor:colorError , borderWidth: 1.0)
//            
//        case .email:
//            notValidNameLbl.isHidden = true
//            notValidEmailLbl.isHidden = false
//            notValidPasswordLbl.isHidden = true
//            
//            topConst2.constant = 10
//            emailLbl.textColor = colorError
//            closeEmailImg.image = CustomImage.image(.CLOSERED)()
//            closeEmailImg.isHidden = false
//
//            emailTextField.styleTextField(borderStyle: .none,
//                                          borderColor: .gray,
//                                          cornerRadius: 0.0,
//                                          borderWidth: 0.0,
//                                          placeholder: "",
//                                          placeholderFont: placeholderFont,
//                                          placeholderColor: .clear)
//            emailView.styleRoundView( borderColor:colorError , borderWidth: 1.0)
//            
//        case .password:
//          
//            notValidNameLbl.isHidden = true
//            notValidEmailLbl.isHidden = true
//            notValidPasswordLbl.isHidden = false
//            
//            passwordLbl.textColor = colorError
//            closePasswordImg.image = CustomImage.image(.CLOSERED)()
//            closePasswordImg.isHidden = false
//
//            passwordTextField.styleTextField(borderStyle: .none,
//                                             borderColor: .gray,
//                                             cornerRadius: 0.0,
//                                             borderWidth: 0.0,
//                                             placeholder: "",
//                                             placeholderFont: placeholderFont,
//                                             placeholderColor: .clear)
//            passwordView.styleRoundView(borderColor:colorError , borderWidth: 1.0)
//        }
//    }

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
       // hideErrorEmailElements()
        
        emailLbl.isHidden = true
        closeBtnView.isHidden = true
        notValidEmailLbl.isHidden = true
                             
        emailFieldTopConst.constant = 10
        emailTextField.text = ""
        let style = TextFieldStyle(placeholder: ECOMAPP.ENTERTHEEMAIL,
                                   placeholderColor: .darkGray, borderColor: .clear, errorState: .success)

        emailTextField.styleTextField(style: style)

        let colorClear = UIColor.clear
        emailView.styleRoundView( borderColor:colorClear , borderWidth: 0.0)
        
        emailTextField.delegate = self
        emailTextField.textColor = .lightGray
        emailTextField.tintColor = .lightGray

        let tapGcloseBtn = UITapGestureRecognizer(target: self, action: #selector(handleCloseBtnTap))
        closeBtnView.isUserInteractionEnabled = true
        closeBtnView.addGestureRecognizer(tapGcloseBtn)
        //setUpAllFonts()
        
        viaEmailLbl.font = CustomFont.medium.font(size: 11)

        forgetPasswordTitle.font = CustomFont.bold.font(size: 34)
        notValidEmailLbl.font = CustomFont.regular.font(size: 11)
        sendBtn.titleLabel?.font =  CustomFont.medium.font(size: 14)
    }
    
    private func clearTextFields() {
//        nameTextField.text = ""
//        emailTextField.text  = ""
//        passwordTextField.text = ""
//        
//        nameLbl.isHidden = true
//        emailLbl.isHidden = true
//        passwordLbl.isHidden = true
//        closeNameImg.isHidden = true
//        closeEmailImg.isHidden = true
//        closePasswordImg.isHidden = true
//        
//        nameTextField.isEnabled = true
//        emailTextField.isEnabled = false
//        passwordTextField.isEnabled = false
    }
    
    
    private func hideErrorEmailElements() {
//        emailLbl.isHidden = true
//        closeBtnView.isHidden = true
//        notValidEmailLbl.isHidden = true
//        emailFieldTopConst.constant = 10
//        let placeholderFont = UIFont.systemFont(ofSize: 14, weight: .regular)
//        emailTextField.text = ""
//        emailTextField.styleTextField(borderStyle: .none,
//                                      borderColor: .clear,
//                                      cornerRadius: 0.0,
//                                      borderWidth: 0.0,
//                                      placeholder: ECOMAPP.ENTERTHEEMAIL,
//                                      placeholderFont:placeholderFont,
//                                      placeholderColor: .darkGray)
//        let colorClear = UIColor.clear
//        emailView.styleRoundView( borderColor:colorClear , borderWidth: 0.0)
    }
    
    private func showErrorEmailElements() {
        let colorError = UIColor.customBottomRed
        emailLbl.isHidden = false
        emailLbl.textColor = colorError
        
        closeBtnView.isHidden = false
        closeBtnView.image = UIImage(named: CustomImage.CLOSERED.rawValue)

        notValidEmailLbl.isHidden = false
        emailFieldTopConst.constant = 18
        let style = TextFieldStyle(placeholder: "",
                                   placeholderColor: .clear, borderColor: .gray, errorState: .error)
        emailTextField.styleTextField(style: style)
        emailView.styleRoundView(borderColor:colorError , borderWidth: 1.0)
        
    }
    
    private func showSuccessEmailElements() {
        emailLbl.textColor = UIColor.customBottomGray
        emailLbl.isHidden = false
        closeBtnView.isHidden = false
        closeBtnView.image = UIImage(named: CustomImage.OKEMAIL.rawValue)
        emailFieldTopConst.constant = 18
        notValidEmailLbl.isHidden = true
        emailView.styleRoundView(borderColor:.clear , borderWidth: 1.0)
    }
    
    private func setUpAllFonts() {
        // Create the attributed string
        viaEmailLbl.font = CustomFont.medium.font(size: 11)

        forgetPasswordTitle.font = CustomFont.bold.font(size: 34)
        notValidEmailLbl.font = CustomFont.regular.font(size: 11)
        sendBtn.titleLabel?.font =  CustomFont.medium.font(size: 14)
    }
    
    
    // MARK: - ---------------- Private Methods END ----------------

    // MARK: - ---------------- IBActions ----------------
    
    @IBAction func backActionClicked(_ sender: UIButton) {
        emailTextField.resignFirstResponder()
        fpdelegate?.removeForgetPasswordView()
    }
    
    @objc func handleCloseBtnTap() {
        hideErrorEmailElements()
    }

    @IBAction func sendActClicked(_ sender: UIButton) {
        emailTextField.resignFirstResponder()
        fpdelegate?.removeForgetPasswordView()
        
    }
    
    // MARK: - ---------------- IBActions  END----------------

 
    
}

// UITextFieldDelegate
extension ForgetPasswordView: UITextFieldDelegate {
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        // Only handle changes for emailTextField
        guard textField == emailTextField else {
            return true // Allow changes for other text fields
        }

        // Get the current text in the text field
        let currentText = textField.text ?? ""
        // Convert the NSRange to a Range<String.Index>
        guard let stringRange = Range(range, in: currentText) else { return false }

        // Create the updated text
        let updatedText = currentText.replacingCharacters(in: stringRange, with: string)

        if updatedText.isEmpty {
            // Set placeholder and visibility for the email text field
//            closeEmailImg.isHidden = true
//            emailLbl.isHidden = true
            textField.placeholder = ECOMAPP.ENTERTHEEMAIL
        } else {
            // Clear placeholder and show label for the email text field
//            emailLbl.isHidden = false
//            emailLbl.textColor = UIColor.customBottomGray
            textField.placeholder = ""
        }

        return true
    }


    func textFieldShouldBeginEditing(_ textField: UITextField) -> Bool {
        // Only handle logic for emailTextField
        if textField == emailTextField {
            // Check if the name is valid if needed (assuming you still have the nameTextField logic)
            if !emailTextField.text!.isValidName() {
                //showAlert(message: ECOMAPP.ENTERTHRVALIDNAME)
                return false
            }
            
            // If valid, disable other text fields if necessary
//            nameTextField.isEnabled = false
//            passwordTextField.isEnabled = false
        }

        return true
    }


    func textFieldDidEndEditing(_ textField: UITextField) {
        // Only handle logic for emailTextField
        if textField == emailTextField {
            guard let email = emailTextField.text else { return }
            
            if email.isValidEmail() {
                closeBtnView.image = CustomImage.OKGREEN.image()
                closeBtnView.accessibilityIdentifier = CustomImage.OKGREEN.rawValue
                
                // Hide any error elements and update UI
              //  hideErrorElements(for: .email, textViewToRound: emailView, textField: emailTextField, textHide: email)
                closeBtnView.isHidden = false
                emailLbl.isHidden = false
                
                // Optionally enable the password text field if applicable
                // passwordTextField.isEnabled = true
            } else {
                if !email.isEmpty {
                    // Show error elements if email is invalid
              //      showErrorElements(for: .email, textViewToRound: emailView, textField: emailTextField)
                    
                    // Optionally disable the password text field if applicable
                    // passwordTextField.isEnabled = false
                }
            }
        }
    }

    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        // Validate the input when pressing return
        guard textField == emailTextField else {
            return true // Allow return key for other text fields if necessary
        }
        
        // Flag to track validity
        var isValid = true
        
        // Validate the email
        if let email = textField.text, !email.isValidEmail() {
            //showErrorElements(for: .email, textViewToRound: emailView, textField: emailTextField)
           // showAlert(message: ECOMAPP.VALIDEMAIL)
            isValid = false
        }
        
        // Dismiss the keyboard only if validation passes
        if isValid {
            textField.resignFirstResponder()
        }
        
        return isValid
    }


}
