import UIKit

final class RatingDataPikerView: UIViewController {
    
    private let titleLeble = UILabel()
    private let ratingPicker = UIPickerView()
    private let saveButton = UIButton()
    private let valuesRating: [Double] = Array(stride(from: 0.0, through: 10.0, by: 0.1)) //TODO: - исправить цифры
    private var selectionRating: Double?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.addSubviews(titleLeble, ratingPicker, saveButton)
        setupConstreints()
        setupUI()
        ratingPicker.delegate = self
        ratingPicker.dataSource = self
    }
    private func setupConstreints() {
        titleLeble.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            titleLeble.topAnchor.constraint(equalTo: view.topAnchor, constant: 124),
            titleLeble.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 88),
            titleLeble.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -87)
        ])
        ratingPicker.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            ratingPicker.topAnchor.constraint(equalTo: titleLeble.bottomAnchor, constant: 32),
            ratingPicker.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            ratingPicker.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            ratingPicker.heightAnchor.constraint(equalToConstant: 131)
        ])
        saveButton.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            saveButton.topAnchor.constraint(equalTo: ratingPicker.bottomAnchor, constant: 32),
            saveButton.centerXAnchor.constraint(equalTo: view.centerXAnchor)
        ])
    }
    private func setupUI() {
        view.backgroundColor = .white
        titleLeble.textAlignment = .center
        titleLeble.text = "Your Rating"
        saveButton.setTitle("Save", for: .normal)
        saveButton.setTitleColor(.systemBlue, for: .normal)
        
    }
}

extension RatingDataPikerView: UIPickerViewDelegate, UIPickerViewDataSource {
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        valuesRating.count
    }
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        String(valuesRating[row])
    }
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        selectionRating = valuesRating[row]
    }
    
}
