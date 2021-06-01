/*
	Copyright (C) 2016 Apple Inc. All Rights Reserved.
	See LICENSE.txt for this sample’s licensing information
	
	Abstract:
	A simple interface with a few buttons to trigger logging events. Demonstrates the Activity APIs.
 */

import UIKit
import os.log

public class ViewController: UIViewController {
    // MARK: Properties
    
	static let ui_log = OSLog(subsystem: "com.example.apple-samplecode.Paper-Company-Swift", category: "UI")
	
	private(set) public var company: PaperCompany!
    
    // MARK: Interface Builder outlets
    
	@IBOutlet weak var companyNameLabel: UILabel!
	@IBOutlet weak var treeButton: UIButton!
	@IBOutlet weak var truckButton: UIButton!
	@IBOutlet weak var paperButton: UIButton!
	
    // MARK: UIViewController
    
	override public func viewWillAppear(_ animated: Bool) {
		super.viewWillAppear(animated)
		company = PaperCompany(name: companyNameLabel.text!)
		os_log("Created company named %@", log: ViewController.ui_log, company.companyName)
		updateButtonCounts()
	}
    
    // MARK: Interface Builder actions.
	
	/// Chop down a tree to turn into a log.
	@IBAction private func treeButtonTapped(sender: UIButton) {
		os_log("Cutting down trees to turn them into logs", log: ViewController.ui_log, type: .info)
		os_log("Sender: %@", log: ViewController.ui_log, type: .debug, sender)
		company.chopDownTree()
		updateButtonCounts()
	}
	
	/// Send logs to the paper mill to be turned into paper.
	@IBAction private func truckButtonTapped(sender: UIButton) {
		os_log("Taking logs to the paper mill", log: ViewController.ui_log, type: .info)
		os_log("Sender: %@", log: ViewController.ui_log, type: .debug, sender)
		company.makePaper()
		updateButtonCounts()
	}
	
	/// This does nothing. Paper is useless in our modern world.
	@IBAction private func paperButtonTapped(sender: UIButton) {
		os_log("Paper is useless in our modern world!", log: ViewController.ui_log, type: .info)
		os_log("Sender: %@", log: ViewController.ui_log, type: .debug, sender)
		updateButtonCounts()
	}
	
	/// Simulate a crash.
	@IBAction func bombButtonTapped(sender: AnyObject) {
		/*
			Use `error` when something goes wrong in your app, and use `fault` when
		something goes wrong involving another process. Both `os_log_error` and
		`os_log_fault` do extra work to make sure the relevant information is
		preserved, so only call them when something actually goes wrong.
		*/
		os_log("B-b-b-b-b-b-b-bomb!", log: ViewController.ui_log, type: .error)
		
		// Don't try this at home, kids!
		company = nil
		company!.chopDownTree()
	}
    
    // MARK: Convenience
    
    private func updateButtonCounts() {
        os_log("Updating button counts", log: ViewController.ui_log)
        treeButton.setTitle("🌲 x\(company.livingTrees)", for: [])
        truckButton.setTitle("🚚 x\(company.logs)", for: [])
        paperButton.setTitle("📄 x\(company.papers)", for: [])
    }
}
