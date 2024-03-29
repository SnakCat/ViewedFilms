import UIKit

final class FilmNameView: UIViewController {
    
    //MARK: - propertis
    var viewModel: FilmNameViewModel!
    private let titleLabel = UILabel()
    private let nameTextField = UITextField()
    private let lineView = UIView()
    private let saveButton = UIButton()
    
    //MARK: - life cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        view.addSubviews(titleLabel, nameTextField, lineView, saveButton)
        setupConstreints()
        setupUI()
    }
    
    //MARK: - binding
    private func configBilding() {
        viewModel.saveNameClosure = { [ weak self ] name in
            self?.nameTextField.text = name
        }
    }
    
    //MARK: - constreints
    private func setupConstreints() {
        titleLabel.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            titleLabel.topAnchor.constraint(equalTo: view.topAnchor, constant: 124),
            titleLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 88),
            titleLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -87)
        ])
        nameTextField.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            nameTextField.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 42),
            nameTextField.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 25),
            nameTextField.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -24),
            nameTextField.heightAnchor.constraint(equalToConstant: 44)
        ])
        lineView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            lineView.topAnchor.constraint(equalTo: nameTextField.bottomAnchor),
            lineView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 25),
            lineView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -24),
            lineView.heightAnchor.constraint(equalToConstant: 1)
        ])
        saveButton.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            saveButton.topAnchor.constraint(equalTo: lineView.bottomAnchor, constant: 42),
            saveButton.centerXAnchor.constraint(equalTo: view.centerXAnchor)
        ])
    }
    
    //MARK: - UI
    private func setupUI() {
        view.backgroundColor = .white
        
        titleLabel.textAlignment = .center
        titleLabel.text = "Film Name"
        
        nameTextField.placeholder = "Name"
        
        lineView.backgroundColor = .systemGray5
        
        saveButton.setTitle("Save", for: .normal)
        saveButton.setTitleColor(.systemBlue, for: .normal)
        saveButton.addTarget(self, action: #selector(saveButtonTapped), for: .touchUpInside)
    }
    
    //MARK: - methods
    private func getText() -> String? {
        let text = self.nameTextField.text
        return text
        
    }
    
    @objc func saveButtonTapped() {
        if let name = getText() {
            viewModel.saveName(string: name)
            navigationController?.popViewController(animated: true)
        }
    }
}
