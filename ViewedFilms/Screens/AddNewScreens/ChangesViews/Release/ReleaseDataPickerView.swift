import UIKit

final class ReleaseDataPickerView: UIViewController {
    
    var viewModel: ReleaseDataPickerViewModel!
    
    private let titleLabel = UILabel()
    private let dataPickerView = UIDatePicker()
    private let saveButton = UIButton()
    private let releaseDataTextField = UITextField()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.addSubviews(titleLabel, dataPickerView, saveButton)
        setupConstreints()
        setupUI()
    }
    
    private func configBinding() {
        viewModel.saveDataColosure = { [ weak self ] release in
            self?.releaseDataTextField.text = release
        }
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
        saveButton.addTarget(self, action: #selector(saveButtonTapped), for: .touchUpInside)
        
        releaseDataTextField.inputView = dataPickerView
        dataPickerView.datePickerMode = .date
        dataPickerView.maximumDate = Date()
        dataPickerView.preferredDatePickerStyle = .wheels
        
    }
    
    private func getData() -> String? {
        let release = self.dataPickerView.date
        let dateFormater = DateFormatter()
        dateFormater.dateFormat = "dd.MM.yyyy"
        return dateFormater.string(from: release)
    }
    
    @objc func saveButtonTapped() {
        if let release = getData() {
            viewModel.saveData(string: release)
            navigationController?.popViewController(animated: true)
        }
    }
}
