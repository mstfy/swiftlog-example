import UIKit

final class LogDisplayViewController: UIViewController {
    private let tableView = UITableView()

    private var logs: [VisualLog] = []

    override func loadView() {
        view = UIView()
        view.backgroundColor = .white

        tableView.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(tableView)
        NSLayoutConstraint.activate([
            tableView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            tableView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            tableView.topAnchor.constraint(equalTo: view.topAnchor),
            tableView.bottomAnchor.constraint(equalTo: view.bottomAnchor)
        ])

        tableView.register(LogDisplayCell.self, forCellReuseIdentifier: "Cell")
        tableView.dataSource = self
        tableView.rowHeight = UITableView.automaticDimension
        tableView.estimatedRowHeight = 120
    }
}

extension LogDisplayViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        logs.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath) as! LogDisplayCell

        let log = logs[indexPath.row]

        cell.messageLabel.text = log.message
        cell.contentView.backgroundColor = log.level.color

        return cell
    }
}

extension LogDisplayViewController: LogListenerDelegate {
    func handle(log: VisualLog) {
        logs.append(log)

        guard isViewLoaded else { return }

        let indexPath = IndexPath(row: logs.count - 1, section: 0)

        tableView.beginUpdates()
        tableView.insertRows(
            at: [indexPath],
            with: .none)
        tableView.endUpdates()

        tableView.scrollToRow(at: indexPath, at: .bottom, animated: false)
    }
}
