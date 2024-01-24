import UIKit

final class ReleaseDataPickerView: UIViewController {
    
    var viewModel: ReleaseDataPickerViewModel!
    
    private let titleLabel = UILabel()
    private let dataPickerView = UIDatePicker()
    private let saveButton = UIButton()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.addSubviews(titleLabel, dataPickerView, saveButton)
        setupConstreints()
        setupUI()
    }
    private func setupConstreints() {
        titleLabel.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            titleLabel.topAnchor.constraint(equalTo: view.topAnchor, constant: 124),
            titleLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 88),
            titleLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -87)
        ])
        dataPickerView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            dataPickerView.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 32),
            dataPickerView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            dataPickerView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            dataPickerView.heightAnchor.constraint(equalToConstant: 194)
        ])
        saveButton.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            saveButton.topAnchor.constraint(equalTo: dataPickerView.bottomAnchor, constant: 32),
            saveButton.centerXAnchor.constraint(equalTo: view.centerXAnchor)
        ])
    }
    private func setupUI() {
        view.backgroundColor = .white
        titleLabel.textAlignment = .center
        titleLabel.text = "Release Date"
        saveButton.setTitle("Save", for: .normal)
        saveButton.setTitleColor(.systemBlue, for: .normal)
        
        dataPickerView.datePickerMode = .date
        dataPickerView.maximumDate = Date()
        dataPickerView.preferredDatePickerStyle = .wheels
    }
}
