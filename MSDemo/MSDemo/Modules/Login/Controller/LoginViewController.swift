//
//  ViewController.swift
//  MSDemo
//
//  Created by Vishank Raghav on 9/14/22.
//

import UIKit

class LoginViewController: UIViewController {

    // ------------------------------
    // MARK: Outlets
    // ------------------------------
    @IBOutlet weak var mainBgView: UIView!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var usernameBgView: UIView!
    @IBOutlet weak var usernameBorderView: UIView!
    @IBOutlet weak var usernameTextField: UITextField!
    @IBOutlet weak var usernameHintLabel: UILabel!
    @IBOutlet weak var usernameErrorLabel: UILabel!
    @IBOutlet weak var passwordBgView: UIView!
    @IBOutlet weak var passwordBorderView: UIView!
    @IBOutlet weak var passwordTextField: UITextField!
    @IBOutlet weak var passwordHintLabel: UILabel!
    @IBOutlet weak var passwordErrorLabel: UILabel!
    @IBOutlet weak var showPasswordLabel: UILabel!
    @IBOutlet weak var showPasswordSwitch: UISwitch!
    @IBOutlet weak var loginButton: UIButton!
    
    
    // ------------------------------
    // MARK: Properties
    // ------------------------------
    // Computed Properties
    var isValidUsername: Bool = false {
        didSet {
            usernameErrorLabel.isHidden = isValidUsername
        }
    }
    var isValidPassword: Bool = false {
        didSet {
            passwordErrorLabel.isHidden = isValidPassword
        }
    }
    var loginViewModel: LoginViewModel?
    
    // ------------------------------
    // MARK: Lifecycle Methods
    // ------------------------------
    override func viewDidLoad() {
        super.viewDidLoad()
        setUpUI()
        setUpGestures()
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        usernameTextField.text?.removeAll()
        passwordTextField.text?.removeAll()
        showPasswordSwitch.isOn = false
    }

    // ------------------------------
    // MARK: SetUp
    // ------------------------------
    func setUpUI() {
        titleLabel.text = "Welcome"
        usernameHintLabel.text = "Username"
        passwordHintLabel.text = "Password"
        usernameErrorLabel.text = "Please enter username"
        passwordErrorLabel.text = "Please enter password"
        showPasswordLabel.text = "Show password"
        
        usernameErrorLabel.isHidden = true
        passwordErrorLabel.isHidden = true
        
        usernameBorderView.layer.borderWidth = 1
        usernameBorderView.layer.cornerRadius = 10
        usernameBorderView.layer.borderColor = UIColor.clear.cgColor
        
        passwordBorderView.layer.borderWidth = 1
        passwordBorderView.layer.cornerRadius = 10
        passwordBorderView.layer.borderColor = UIColor.clear.cgColor
        
        loginButton.setTitle("Login", for: .normal)
        loginButton.layer.cornerRadius = 10
    }
    
    func setUpGestures() {
        let tap = UITapGestureRecognizer(target: view, action: #selector(UIView.endEditing))
        tap.cancelsTouchesInView = false
        view.addGestureRecognizer(tap)
    }
    
    // ------------------------------
    // MARK: Helper Methods
    // ------------------------------
    func pushToHomeViewController(user: LoginAPIResponse) {
        guard let vc = UIStoryboard.init(name: AppStoryboardName.main.rawValue, bundle: Bundle.main).instantiateViewController(withIdentifier: HomeViewController.className) as? HomeViewController else { return }
        vc.user = user
        self.navigationController?.pushViewController(vc, animated: true)
        
    }
    
    // ------------------------------
    // MARK: Action Outlets
    // ------------------------------
    @IBAction func loginPressed(_ sender: UIButton) {
        if isValidUsername && isValidPassword {
            guard let username = usernameTextField.text, let password = passwordTextField.text else { return }
            loginViewModel?.loginWith(username: username, andPassword: password) { [weak self] isSuccess, response in
                if let user = response, isSuccess {
                    print(user)
                    ProjectWireframe.navigateToHomeViewController(for: user, with: self?.navigationController)
                } else {
                    print("User not found")
                }
            }
        } else {
            validUsernameAction(usernameTextField)
            validPasswordAction(passwordTextField)
        }
    }
    @IBAction func showPasswordSwitch(_ sender: UISwitch) {
        passwordTextField.isSecureTextEntry = !sender.isOn
    }
    
    // ------------------------------
    // MARK: TextField Validations
    // ------------------------------
    @IBAction func validUsernameAction(_ sender: UITextField) {
        guard let username = sender.text, let loginViewModel = loginViewModel else { return }
        isValidUsername = loginViewModel.validUsername(username)
    }
    
    @IBAction func validPasswordAction(_ sender: UITextField) {
        guard let password = sender.text, let loginViewModel = loginViewModel else { return }
        isValidPassword = loginViewModel.validPassword(password)
    }
}

extension LoginViewController: UITextFieldDelegate {
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
}
