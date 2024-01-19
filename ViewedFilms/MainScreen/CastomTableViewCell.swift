import UIKit

class CastomTableViewCell: UITableViewCell {
    //MARK: - propertis
    private let contenerView = UIView()
    private let movieImageView = UIImageView()
    private let nameLabel = UILabel()
    private let gradeLabel = UILabel()
    
    //MARK: - life cycle
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        setupConstreints()
    }
    
    required init?(coder: NSCoder) {
        fatalError()
    }
    //MARK: - add subView Cell
    private func addSubViewCell() {
        contene
    }
    //MARK: - constreints
    private func setupConstreints() {
        
    }

}
