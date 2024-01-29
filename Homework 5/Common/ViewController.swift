import UIKit

class ViewController: UIViewController, UITextFieldDelegate {
    
    private lazy var arrowLeftButton: UIButton = {
        let button = UIButton()
        button.setImage(UIImage(named: "leftButton"), for: .normal)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    private lazy var newPasswordLabel: UILabel = {
        let label = UILabel()
        label.text = "Create New Password 🔐"
        label.font = .systemFont(ofSize: 28, weight: .bold)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private lazy var passwordInstructionLabel: UILabel = {
        let label = UILabel()
        label.text = "Enter your new password. If you forget it, then you have to do forgot password."
        label.textColor = .lightGray
        label.font = .systemFont(ofSize: 16, weight: .regular)
        label.numberOfLines = 2
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private lazy var passwordLabel: UILabel = {
        let label = UILabel()
        label.text = "Password"
        label.font = .systemFont(ofSize: 16, weight: .bold)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private lazy var passwordTF: UITextField = {
        let textField = UITextField()
        textField.placeholder = "Enter your new password"
        textField.isSecureTextEntry = true
        textField.delegate = self
        textField.translatesAutoresizingMaskIntoConstraints = false
        let toggleButton = UIButton(type: .system)
        toggleButton.setImage(UIImage(systemName: "eye.fill"), for: .normal)
        toggleButton.tintColor = UIColor(red: 0.96, green: 0.28, blue: 0.29, alpha: 1)
        toggleButton.addTarget(self, action: #selector(togglePasswordVisibility), for: .touchUpInside)
        textField.rightView = toggleButton
        textField.rightViewMode = .always
        return textField
    }()
    
    private lazy var seperatorView: UIView = {
        let view = UIView()
        view.backgroundColor = UIColor(red: 0.96, green: 0.28, blue: 0.29, alpha: 1)
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    private lazy var confirmPasswordLabel: UILabel = {
        let label = UILabel()
        label.text = "Confirm Password"
        label.font = .systemFont(ofSize: 16, weight: .bold)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private lazy var confirmPasswordTF: UITextField = {
        let textField = UITextField()
        textField.placeholder = "Re-enter your new password"
        textField.isSecureTextEntry = true
        textField.delegate = self
        textField.translatesAutoresizingMaskIntoConstraints = false
        let toggleButton = UIButton(type: .system)
        toggleButton.setImage(UIImage(systemName: "eye.fill"), for: .normal)
        toggleButton.tintColor = UIColor(red: 0.96, green: 0.28, blue: 0.29, alpha: 1)
        toggleButton.addTarget(self, action: #selector(SecondTogglePasswordVisibility), for: .touchUpInside)
        textField.rightView = toggleButton
        textField.rightViewMode = .always
        return textField
    }()
    
    private lazy var secondSeperatorView: UIView = {
        let view = UIView()
        view.backgroundColor = UIColor(red: 0.96, green: 0.28, blue: 0.29, alpha: 1)
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    private lazy var checkBoxButton: UIButton = {
        let button = UIButton(type: .custom)
        button.setImage(UIImage(named: "square"), for: .normal)
        button.tintColor = UIColor(red: 0.96, green: 0.28, blue: 0.29, alpha: 1)
        button.addTarget(self, action: #selector(toggleRememberMe), for: .touchUpInside)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    private var isRememberMeSelected = false
    
    private lazy var rememberMeLabel: UILabel = {
        let label = UILabel()
        label.text = "Remember me"
        label.font = .systemFont(ofSize: 18, weight: .semibold)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private lazy var continueButton: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("Continue", for: .normal)
        button.setTitleColor(.white, for: .normal)
        button.backgroundColor = UIColor(red: 0.96, green: 0.28, blue: 0.29, alpha: 1)
        button.layer.cornerRadius = 28
        button.isEnabled = false
        button.addTarget(self, action: #selector(continueButtonTapped), for: .touchUpInside)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .systemBackground
        view.addSubview(arrowLeftButton)
        view.addSubview(newPasswordLabel)
        view.addSubview(passwordInstructionLabel)
        view.addSubview(passwordLabel)
        view.addSubview(passwordTF)
        view.addSubview(seperatorView)
        view.addSubview(confirmPasswordLabel)
        view.addSubview(confirmPasswordTF)
        view.addSubview(secondSeperatorView)
        view.addSubview(checkBoxButton)
        view.addSubview(rememberMeLabel)
        view.addSubview(continueButton)
        setupLayout()
    }
    
    private func setupLayout() {
        NSLayoutConstraint.activate([
            arrowLeftButton.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            arrowLeftButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 24),
            
            newPasswordLabel.topAnchor.constraint(equalTo: arrowLeftButton.bottomAnchor, constant: 34),
            newPasswordLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 24),
            
            passwordInstructionLabel.topAnchor.constraint(equalTo: newPasswordLabel.bottomAnchor, constant: 12),
            passwordInstructionLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 24),
            passwordInstructionLabel.widthAnchor.constraint(equalToConstant: 350),
            
            passwordLabel.topAnchor.constraint(equalTo: passwordInstructionLabel.bottomAnchor, constant: 32),
            passwordLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 24),
            
            passwordTF.topAnchor.constraint(equalTo: passwordLabel.bottomAnchor, constant: 16),
            passwordTF.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 24),
            passwordTF.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -24),
            
            seperatorView.topAnchor.constraint(equalTo: passwordTF.bottomAnchor, constant: 8),
            seperatorView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 24),
            seperatorView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -24),
            seperatorView.heightAnchor.constraint(equalToConstant: 1),
            
            confirmPasswordLabel.topAnchor.constraint(equalTo: seperatorView.bottomAnchor, constant: 24),
            confirmPasswordLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 24),
            
            confirmPasswordTF.topAnchor.constraint(equalTo: confirmPasswordLabel.bottomAnchor, constant: 16),
            confirmPasswordTF.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 24),
            confirmPasswordTF.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -24),
            
            secondSeperatorView.topAnchor.constraint(equalTo: confirmPasswordTF.bottomAnchor, constant: 8),
            secondSeperatorView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 24),
            secondSeperatorView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -24),
            secondSeperatorView.heightAnchor.constraint(equalToConstant: 1),
            
            checkBoxButton.topAnchor.constraint(equalTo: secondSeperatorView.bottomAnchor, constant: 24),
            checkBoxButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 24),
            
            rememberMeLabel.topAnchor.constraint(equalTo: secondSeperatorView.bottomAnchor, constant: 26),
            rememberMeLabel.leadingAnchor.constraint(equalTo: checkBoxButton.trailingAnchor, constant: 16),
            
            continueButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 24),
            continueButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -24),
            continueButton.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor),
            continueButton.heightAnchor.constraint(equalToConstant: 58)
        ])
    }
    
    @objc private func togglePasswordVisibility() {
        passwordTF.isSecureTextEntry.toggle()
        let imageName = passwordTF.isSecureTextEntry ? "eye.fill" : "eye.slash.fill"
        if let toggleButton = passwordTF.rightView as? UIButton {
            toggleButton.setImage(UIImage(systemName: imageName), for: .normal)
        }
    }
    
    @objc private func SecondTogglePasswordVisibility() {
        confirmPasswordTF.isSecureTextEntry.toggle()
        let imageName = confirmPasswordTF.isSecureTextEntry ? "eye.fill" : "eye.slash.fill"
        if let toggleButton = confirmPasswordTF.rightView as? UIButton {
            toggleButton.setImage(UIImage(systemName: imageName), for: .normal)
        }
    }
    
    @objc private func toggleRememberMe() {
        isRememberMeSelected.toggle()
        let imageName = isRememberMeSelected ? "checkmark.square.fill" : "checkmark.square.fill"
        checkBoxButton.setImage(UIImage(named: imageName), for: .normal)
    }
    
    func textFieldDidChangeSelection(_ textField: UITextField) {
        updateContinueButtonState()
    }
    
    private func updateContinueButtonState() {
        guard let password = passwordTF.text, let confirmPassword = confirmPasswordTF.text else {
            return
        }
        
        let isValid = password == confirmPassword && password.count >= 4
        
        continueButton.isEnabled = isValid
        continueButton.backgroundColor = isValid ? UIColor(red: 0.96, green: 0.28, blue: 0.29, alpha: 1) : .gray
    }
    
    @objc private func continueButtonTapped() {
        guard continueButton.isEnabled else {
            return
        }
        
        navigationController?.pushViewController(SecondViewController(), animated: true)
    }
}
