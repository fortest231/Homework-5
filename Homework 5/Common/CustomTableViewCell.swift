import UIKit

class UserTableViewCell: UITableViewCell {
    
    
    private lazy var avatarImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    private lazy var stackForLabels: UIStackView = {
        let stack = UIStackView()
        stack.axis = .vertical
        stack.spacing = 6
        stack.translatesAutoresizingMaskIntoConstraints = false
        return stack
    }()
    
    private lazy var notificationText: UILabel = {
        let label = UILabel()
        label.numberOfLines = 2
        label.font = .systemFont(ofSize: 16, weight: .semibold)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private lazy var timestampText: UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: 14, weight: .medium)
        label.textColor = .lightGray
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private lazy var productImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    private lazy var ellipsisButton: UIButton = {
        let button = UIButton()
        button.setImage(UIImage(named: "ellipsis"), for: .normal)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
        
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        setupLayout()
    }
    
    required init?(coder: NSCoder) {
        fatalError("Ошибка")
    }
    
    
    func configureCell(with user: UserCard) {
        avatarImageView.image = user.avatarImage
        notificationText.text = user.notificationText
        timestampText.text = user.timestampText
        productImageView.image = user.productImage
    }
    
    
    private func setupLayout() {
        guard avatarImageView.superview == nil else { return }
        
        contentView.addSubview(avatarImageView)
        contentView.addSubview(stackForLabels)
        stackForLabels.addArrangedSubview(notificationText)
        stackForLabels.addArrangedSubview(timestampText)
        contentView.addSubview(productImageView)
        contentView.addSubview(ellipsisButton)
        
        NSLayoutConstraint.activate([
            avatarImageView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
            avatarImageView.centerYAnchor.constraint(equalTo: contentView.centerYAnchor),
            
            stackForLabels.leadingAnchor.constraint(equalTo: avatarImageView.trailingAnchor, constant: 12),
            stackForLabels.centerYAnchor.constraint(equalTo: contentView.centerYAnchor),
            stackForLabels.widthAnchor.constraint(equalToConstant: 181),
            
            productImageView.leadingAnchor.constraint(equalTo: stackForLabels.trailingAnchor, constant: 12),
            productImageView.centerYAnchor.constraint(equalTo: contentView.centerYAnchor),
            
            ellipsisButton.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
            ellipsisButton.centerYAnchor.constraint(equalTo: contentView.centerYAnchor),
        ])
    }
}


extension UITableViewCell {
    static var reuseIdentifier: String {
        return String(describing: self)
    }
}
