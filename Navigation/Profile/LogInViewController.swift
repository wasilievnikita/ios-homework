
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
    
    
    private let stackView: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .vertical
        stackView.spacing = 0
        stackView.layer.borderColor = UIColor.lightGray.cgColor
        stackView.layer.borderWidth = 0.5
        stackView.layer.cornerRadius = 10
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.clipsToBounds = true
        return stackView
    }()
    
    private let viewSeparate: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = .systemGray4
        return view
    }()
    
    private lazy var textFieldLogin: UITextField = {
        let texField = UITextField()
        texField.translatesAutoresizingMaskIntoConstraints = false
        texField.font = .systemFont(ofSize: 16)
        texField.textColor = .black
        texField.textAlignment = .left
        texField.leftViewMode = .always
        texField.backgroundColor = .systemGray6
        texField.leftView = UIView(frame: CGRect(x: 0, y: 0, width: 10, height: 0))
        texField.autocapitalizationType = .none
        texField.placeholder = " Email of phone "
        
        return texField
    }()
    
    private lazy var textFieldPass: UITextField = {
        let textField = UITextField()
        textField.translatesAutoresizingMaskIntoConstraints = false
        textField.font = .systemFont(ofSize: 16)
        textField.textColor = .black
        textField.backgroundColor = .systemGray6
        textField.leftView = UIView(frame: CGRect(x: 0, y: 0, width: 10, height: 0))
        textField.textAlignment = .left
        textField.leftViewMode = .always
        textField.autocapitalizationType = .none
        textField.placeholder = " Password "
        textField.isSecureTextEntry = true
        return textField
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
        stackView.addArrangedSubview(textFieldLogin)
        stackView.addArrangedSubview(viewSeparate)
        stackView.addArrangedSubview(textFieldPass)
        
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
        
        [button, stackView, vkLogo].forEach { contentView.addSubview($0) }
        
        NSLayoutConstraint.activate([
            
            vkLogo.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 120),
            vkLogo.widthAnchor.constraint(equalToConstant: 100),
            vkLogo.heightAnchor.constraint(equalToConstant: 100),
            vkLogo.centerXAnchor.constraint(equalTo: contentView.centerXAnchor),
            
            stackView.topAnchor.constraint(equalTo: vkLogo.bottomAnchor, constant: 120),
            stackView.heightAnchor.constraint(equalToConstant: 100),
            stackView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 16),
            stackView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -16),
            
            textFieldLogin.topAnchor.constraint(equalTo: stackView.topAnchor),
            textFieldLogin.heightAnchor.constraint(equalToConstant: 50),
            viewSeparate.topAnchor.constraint(equalTo: textFieldLogin.bottomAnchor),
            viewSeparate.heightAnchor.constraint(equalToConstant: 0.5),
            textFieldPass.topAnchor.constraint(equalTo: viewSeparate.bottomAnchor),
            
            button.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 16),
            button.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -16),
            button.topAnchor.constraint(equalTo: stackView.bottomAnchor, constant: 16),
            button.heightAnchor.constraint(equalToConstant: 50),
            button.bottomAnchor.constraint(equalTo: contentView.bottomAnchor)
            
        ])
    }
}
