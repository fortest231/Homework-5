import UIKit

class SecondViewController: UIViewController {
    
    private lazy var arrowLeftButton: UIButton = {
        let button = UIButton()
        button.setImage(UIImage(named: "leftButton"), for: .normal)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    private lazy var notificationLabel: UILabel = {
        let label = UILabel()
        label.text = "Notification"
        label.font = .systemFont(ofSize: 24, weight: .bold)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private lazy var settingButton: UIButton = {
        let button = UIButton()
        button.setImage(UIImage(named: "settings"), for: .normal)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    private lazy var stackForLabels: UIStackView = {
        let stack = UIStackView()
        stack.axis = .horizontal
        stack.distribution = .fillEqually
        stack.translatesAutoresizingMaskIntoConstraints = false
        return stack
    }()
    
    private lazy var generalLabel: UILabel = {
        let label = UILabel()
        label.text = "General"
        label.textAlignment = .center
        label.font = .systemFont(ofSize: 18, weight: .semibold)
        label.textColor = UIColor(red: 0.96, green: 0.28, blue: 0.29, alpha: 1)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private lazy var systemLabel: UILabel = {
        let label = UILabel()
        label.text = "System"
        label.textAlignment = .center
        label.font = .systemFont(ofSize: 18, weight: .semibold)
        label.textColor = .lightGray
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private lazy var stackForSeperators: UIStackView = {
        let stack = UIStackView()
        stack.axis = .horizontal
        stack.distribution = .fillEqually
        stack.translatesAutoresizingMaskIntoConstraints = false
        return stack
    }()
    
    private lazy var seperatorView: UIView = {
        let view = UIView()
        view.backgroundColor = UIColor(red: 0.96, green: 0.28, blue: 0.29, alpha: 1)
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    private lazy var secondSeperatorView: UIView = {
        let view = UIView()
        view.backgroundColor = UIColor(red: 0.93, green: 0.93, blue: 0.93, alpha: 1)
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    private lazy var tableView: UITableView = {
        let table = UITableView()
        table.translatesAutoresizingMaskIntoConstraints = false
        table.dataSource = self
        table.delegate = self
        table.separatorStyle = .none
        table.register(UserTableViewCell.self, forCellReuseIdentifier: UserTableViewCell.reuseIdentifier)
        return table
    }()
    
    var dataSource: [UserCard] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        dataSource = [
            UserCard(avatarImage: UIImage(named: "person1"), notificationText: "Jane Cooper has published a new recipe!", timestampText: "Today | 09:24 AM", productImage: UIImage(named: "food")),
            UserCard(avatarImage: UIImage(named: "person2"), notificationText: "Rochel has commented on your recipe", timestampText: "1 day ago | 14:43 PM", productImage: UIImage(named: "food1")),
            UserCard(avatarImage: UIImage(named: "person3"), notificationText: "Brad Wigington liked your comment", timestampText: "1 day ago | 09:29 AM", productImage: UIImage(named: "food2")),
            UserCard(avatarImage: UIImage(named: "person4"), notificationText: "Tyra Ballentine has published a new recipe!", timestampText: "2 days ago | 10:29 AM", productImage: UIImage(named: "food3")),
            UserCard(avatarImage: UIImage(named: "person5"), notificationText: "Marci Winkles has published a new recipe!", timestampText: "3 days ago | 16:52 PM", productImage: UIImage(named: "food4")),
            UserCard(avatarImage: UIImage(named: "person6"), notificationText: "Aileen has commented on your recipe", timestampText: "4 days ago | 14:27 PM", productImage: UIImage(named: "food5")),
            UserCard(avatarImage: UIImage(named: "person7"), notificationText: "George has commented on your recipe", timestampText: "5 days ago | 09:20 AM", productImage: UIImage(named: "food6"))
        ]
        
        view.backgroundColor = .systemBackground
        view.addSubview(arrowLeftButton)
        view.addSubview(notificationLabel)
        view.addSubview(settingButton)
        view.addSubview(stackForLabels)
        stackForLabels.addArrangedSubview(generalLabel)
        stackForLabels.addArrangedSubview(systemLabel)
        view.addSubview(stackForSeperators)
        stackForSeperators.addArrangedSubview(seperatorView)
        stackForSeperators.addArrangedSubview(secondSeperatorView)
        view.addSubview(tableView)
        
        setupLayout()
    }
    
    private func setupLayout() {
        NSLayoutConstraint.activate([
            arrowLeftButton.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            arrowLeftButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            
            notificationLabel.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            notificationLabel.leadingAnchor.constraint(equalTo: arrowLeftButton.trailingAnchor, constant: 16),
            
            settingButton.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            settingButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
            
            stackForLabels.topAnchor.constraint(equalTo: settingButton.bottomAnchor, constant: 34),
            stackForLabels.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            stackForLabels.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
            
            seperatorView.heightAnchor.constraint(equalToConstant: 4),
            secondSeperatorView.heightAnchor.constraint(equalToConstant: 2),
            
            stackForSeperators.topAnchor.constraint(equalTo: stackForLabels.bottomAnchor, constant: 12),
            stackForSeperators.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            stackForSeperators.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
            
            tableView.topAnchor.constraint(equalTo: secondSeperatorView.bottomAnchor, constant: 1),
            tableView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            tableView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
            tableView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor)
        ])
    }
}

extension SecondViewController: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return dataSource.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: UserTableViewCell.reuseIdentifier, for: indexPath) as! UserTableViewCell
        
        let userCard = dataSource[indexPath.row]
        cell.configureCell(with: userCard)
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        90
    }
}
