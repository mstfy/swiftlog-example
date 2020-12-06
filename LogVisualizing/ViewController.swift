//
//  ViewController.swift
//  LogVisualizing
//
//  Created by Mustafa Yusuf on 6.12.2020.
//

import Logging
import UIKit
import LogVisualizer

class ViewController: UIViewController {
    @IBOutlet weak var containerView: UIView!

    var logs: [() -> Void] = []

    var logger = Logger(label: "ViewController") { label in
        let stream = StreamLogHandler.standardOutput(label: label)
        let visual = VisualLogHandler()

        return MultiplexLogHandler([stream, visual])
    }

    override func viewDidLoad() {
        super.viewDidLoad()

        logger.logLevel = .trace

        createSampleLogs()

        let logDisplay = VisualLogHandler.logDisplayer
        addChild(logDisplay)
        logDisplay.view.translatesAutoresizingMaskIntoConstraints = false
        containerView.addSubview(logDisplay.view)
        NSLayoutConstraint.activate([
            logDisplay.view.leadingAnchor.constraint(equalTo: containerView.leadingAnchor),
            logDisplay.view.trailingAnchor.constraint(equalTo: containerView.trailingAnchor),
            logDisplay.view.topAnchor.constraint(equalTo: containerView.topAnchor),
            logDisplay.view.bottomAnchor.constraint(equalTo: containerView.bottomAnchor)
        ])
        logDisplay.didMove(toParent: self)
    }

    @IBAction func logEvent(_ sender: Any) {
        guard let log = logs.first else {
            createSampleLogs()
            logEvent(sender)
            return
        }

        logs.remove(at: 0)

        log()
    }
}

extension ViewController {
    func createSampleLogs() {
        let logger = self.logger
        logs = [
            { logger.trace("trace logs") },
            { logger.debug("debug logs") },
            { logger.info("info logs") },
            { logger.notice("notice logs") },
            { logger.warning("warning logs") },
            { logger.error("error logs") },
            { logger.critical("critical logs") },
            { logger.trace("trace logs") },
            { logger.debug("debug logs") },
            { logger.info("info logs") },
            { logger.notice("notice logs") },
            { logger.warning("warning logs") },
            { logger.error("error logs") },
            { logger.critical("critical logs") },
            { logger.trace("trace logs") },
            { logger.debug("debug logs") },
            { logger.info("info logs") },
            { logger.notice("notice logs") },
            { logger.warning("warning logs") },
            { logger.error("error logs") },
            { logger.critical("critical logs") },
            { logger.trace("trace logs") },
            { logger.debug("debug logs") },
            { logger.info("info logs") },
            { logger.notice("notice logs") },
            { logger.warning("warning logs") },
            { logger.error("error logs") },
            { logger.critical("critical logs") },
            { logger.trace("trace logs") },
            { logger.debug("debug logs") },
            { logger.info("info logs") },
            { logger.notice("notice logs") },
            { logger.warning("warning logs") },
            { logger.error("error logs") },
            { logger.critical("critical logs") },
        ]
    }
}
