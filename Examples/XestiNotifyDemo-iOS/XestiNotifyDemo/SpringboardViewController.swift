//
//  LockScreenViewController.swift
//  XestiNotifyDemo-iOS
//
//  Created by J. G. Pusey on 2018-08-28.
//
//  © 2018 J. G. Pusey (see LICENSE.md)
//

import UIKit
import XestiMonitors

public class SpringboardViewController: UITableViewController {

    // MARK: Private Instance Properties

    @IBOutlet private weak var lockScreenActionLabel: UILabel!
    @IBOutlet private weak var lockScreenStatusLabel: UILabel!

    private lazy var lockScreenMonitor = LockScreenMonitor(options: .all,
                                                           queue: .main) { [unowned self] in
                                                            self.displayLockScreen($0)
    }

    private lazy var monitors: [Monitor] = [lockScreenMonitor]

    // MARK: Private Instance Methods

    private func displayLockScreen(_ event: LockScreenMonitor.Event?) {
        if let event = event {
            switch event {
            case .didLock:
                lockScreenActionLabel.text = "Did lock"

            case .didUnlock:
                lockScreenActionLabel.text = "Did unlock"
            }
        } else {
            lockScreenActionLabel.text = " "
        }

        lockScreenStatusLabel.text = formatStatus(lockScreenMonitor.status)
    }

    // MARK: Overridden UIViewController Methods

    override public func viewDidLoad() {
        super.viewDidLoad()

        displayLockScreen(nil)
    }

    override public func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)

        monitors.forEach { $0.startMonitoring() }
    }

    override public func viewWillDisappear(_ animated: Bool) {
        monitors.forEach { $0.stopMonitoring() }

        super.viewWillDisappear(animated)
    }
}
