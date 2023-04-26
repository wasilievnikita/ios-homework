
import UIKit

class LogInViewController: UIViewController, UITextFieldDelegate {
    
    private let nc = NotificationCenter.default
    
    private let scrollView: UIScrollView = {
        let scrollView = UIScrollView()
        scrollView.translatesAutoresizingMaskIntoConstraints = false
        return scrollView
    }()
    
    private let contentView: UIView = {
        let contentView = UIView()
        contentView.translatesAutoresizingMaskIntoConstraints = false
        return contentView
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        layout()
        self.textFieldPass.delegate = self
        self.textFieldLogin.delegate = self
    }
  
    //Закрытие клавиатуры по кнопке return
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return(true)
    }
    
    private lazy var vkLogo: UIImageView = {
        let vkLogo = UIImageView()
        vkLogo.translatesAutoresizingMaskIntoConstraints = false
        vkLogo.contentMode = .scaleAspectFit
        vkLogo.clipsToBounds = true
        vkLogo.image = UIImage(named: "logo")
        return vkLogo
    }()
    
    private lazy var textFieldLogin: UITextField = {
        let textFieldLogin = UITextField()
        textFieldLogin.translatesAutoresizingMaskIntoConstraints = false
        textFieldLogin.font = .systemFont(ofSize: 16)
        textFieldLogin.textColor = .black
        textFieldLogin.backgroundColor = .systemGray6
        textFieldLogin.autocapitalizationType = .none
        textFieldLogin.layer.cornerRadius = 10
        textFieldLogin.layer.borderColor = UIColor.lightGray.cgColor
        textFieldLogin.layer.borderWidth = 0.5
        textFieldLogin.placeholder = " Email of phone "
        textFieldLogin.layer.maskedCorners = [.layerMaxXMinYCorner, .layerMinXMinYCorner]
        return textFieldLogin
    }()

    private lazy var textFieldPass: UITextField = {
        let textFieldPass = UITextField()
        textFieldPass.translatesAutoresizingMaskIntoConstraints = false
        textFieldPass.font = .systemFont(ofSize: 16)
        textFieldPass.textColor = .black
        textFieldPass.backgroundColor = .systemGray6
        textFieldPass.layer.cornerRadius = 10
        textFieldPass.layer.borderColor = UIColor.lightGray.cgColor
        textFieldPass.layer.borderWidth = 0.5
        textFieldPass.placeholder = " Password "
        textFieldPass.isSecureTextEntry = true
        textFieldPass.layer.maskedCorners = [.layerMaxXMaxYCorner, .layerMinXMaxYCorner]
        return textFieldPass
    }()

    private lazy var button: UIButton = {
        let button = UIButton(type: .system)
        button.isUserInteractionEnabled = true
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitle("Log in", for: .normal)
        button.titleLabel?.font = UIFont.systemFont(ofSize: 16)
        button.tintColor = .white
        button.layer.cornerRadius = 10
        button.backgroundColor = color
        button.addTarget(self, action: #selector(showProfile), for: .touchUpInside)
        button.alpha = 0.8
        return button
    }()
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        nc.addObserver(self, selector: #selector(keyboardShow), name: UIResponder.keyboardWillShowNotification, object: nil)
        nc.addObserver(self, selector: #selector(keyboardHide), name: UIResponder.keyboardWillHideNotification, object: nil)
    }
    
    override func viewDidDisappear(_ animated: Bool) {
        super.viewDidDisappear(animated)
        nc.removeObserver(self, name: UIResponder.keyboardWillShowNotification, object: nil)
        nc.removeObserver(self, name: UIResponder.keyboardWillHideNotification, object: nil)
    }
    
    @objc private func keyboardShow(notification: NSNotification) {
        if let keyboardSize: CGRect = (notification.userInfo?[UIResponder.keyboardFrameEndUserInfoKey] as? NSValue)?.cgRectValue {
            scrollView.contentInset.bottom = keyboardSize.height
            scrollView.verticalScrollIndicatorInsets = UIEdgeInsets(top: 0,
                                                                    left: 0,
                                                                    bottom: keyboardSize.height,
                                                                    right: 0)
        }
    }
    
    @objc private func keyboardHide() {
        scrollView.contentInset.bottom = .zero
        scrollView.verticalScrollIndicatorInsets = .zero
    }
    
    @objc func showProfile() {
        let profileViewCOntroller = ProfileViewController()
        navigationController?.pushViewController(profileViewCOntroller, animated: true)
    }
    
    func layout() {
        
        view.addSubview(scrollView)
        
        NSLayoutConstraint.activate([
            scrollView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            scrollView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            scrollView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor),
            scrollView.trailingAnchor.constraint(equalTo: view.trailingAnchor)
        ])
        
        scrollView.addSubview(contentView)
        
        NSLayoutConstraint.activate([
            contentView.topAnchor.constraint(equalTo: scrollView.topAnchor),
            contentView.leadingAnchor.constraint(equalTo: scrollView.leadingAnchor),
            contentView.bottomAnchor.constraint(equalTo: scrollView.bottomAnchor),
            contentView.trailingAnchor.constraint(equalTo: scrollView.trailingAnchor),
            contentView.widthAnchor.constraint(equalTo: scrollView.widthAnchor)
        ])
        
        [button, textFieldLogin, textFieldPass, vkLogo].forEach { contentView.addSubview($0) }

        NSLayoutConstraint.activate([
        
            vkLogo.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 120),
            vkLogo.widthAnchor.constraint(equalToConstant: 100),
            vkLogo.heightAnchor.constraint(equalToConstant: 100),
            vkLogo.centerXAnchor.constraint(equalTo: contentView.centerXAnchor),


            textFieldLogin.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 16),
            textFieldLogin.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -16),
            textFieldLogin.topAnchor.constraint(equalTo: vkLogo.bottomAnchor, constant: 120),
            textFieldLogin.heightAnchor.constraint(equalToConstant: 50),

            textFieldPass.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 16),
            textFieldPass.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -16),
            textFieldPass.topAnchor.constraint(equalTo: textFieldLogin.bottomAnchor),
            textFieldPass.heightAnchor.constraint(equalToConstant: 50),

            button.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 16),
            button.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -16),
            button.topAnchor.constraint(equalTo: textFieldPass.bottomAnchor, constant: 16),
            button.heightAnchor.constraint(equalToConstant: 50),
            button.bottomAnchor.constraint(equalTo: contentView.bottomAnchor)

        ])
    }
}
