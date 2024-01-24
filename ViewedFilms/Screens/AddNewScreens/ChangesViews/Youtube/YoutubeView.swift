import UIKit

final class YoutubeView: UIViewController {
    
    var viewModel: YoutubeViewModel!
    
    private let titleName = UILabel()
    private let urlTextField = UITextField()
    private let lineView = UIView()
    private let saveButton = UIButton()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.addSubviews(titleName, urlTextField, lineView, saveButton)
        setupConstreints()
        setupUI()
    }
    private func setupConstreints() {
        titleName.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            titleName.topAnchor.constraint(equalTo: view.topAnchor, constant: 124),
            titleName.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 88),
            titleName.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -87)
        ])
        urlTextField.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            urlTextField.topAnchor.constraint(equalTo: titleName.bottomAnchor, constant: 42),
            urlTextField.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 25),
            urlTextField.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -24),
            urlTextField.heightAnchor.constraint(equalToConstant: 44)
        ])
        lineView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            lineView.topAnchor.constraint(equalTo: urlTextField.bottomAnchor),
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
    private func setupUI() {
        view.backgroundColor = .white
        titleName.textAlignment = .center
        titleName.text = "YouTube Link"
        urlTextField.placeholder = "Name"
        lineView.backgroundColor = .systemGray5
        saveButton.setTitle("Save", for: .normal)
        saveButton.setTitleColor(.systemBlue, for: .normal)
    }
}
