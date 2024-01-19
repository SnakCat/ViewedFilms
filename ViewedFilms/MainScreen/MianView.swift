import UIKit

final class DefaultMainView: UIViewController {
    //MARK: - propertis
    private let tableView = UITableView()
    
    //MARK: - life cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        setupTableView()
        setupConstreints()
        setupUI()
    }
    //MARK: - setup tableView
    private func setupTableView() {
        view.addSubview(tableView)
        tableView.dataSource = self
        tableView.delegate = self
        tableView.register(CastomTableViewCell.self, forCellReuseIdentifier: "CastomTableViewCell")
    }
    //MARK: - constreints
    private func setupConstreints() {
        tableView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            tableView.topAnchor.constraint(equalTo: view.topAnchor),
            tableView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            tableView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            tableView.bottomAnchor.constraint(equalTo: view.bottomAnchor)
        ])
    }
    //MARK: - UI
    private func setupUI() {
        tableView.backgroundColor = .backgroundMainView
        title = "My Movie List"
        navigationController?.navigationBar.prefersLargeTitles = true
        navigationItem.rightBarButtonItem = UIBarButtonItem(systemItem: .add)
        tableView.separatorStyle = .none
    }
}
    //MARK: - extension tableView
extension DefaultMainView: UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        10
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if let cell = tableView.dequeueReusableCell(withIdentifier: "CastomTableViewCell", for: indexPath) as? CastomTableViewCell {
            
            return cell
        }
        return UITableViewCell()
    }
    
    
}
