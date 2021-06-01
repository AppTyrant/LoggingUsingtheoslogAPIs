/*
	Copyright (C) 2016 Apple Inc. All Rights Reserved.
	See LICENSE.txt for this sample’s licensing information
	
	Abstract:
	A paper company which handles trees, logs, and paper. Uses a custom logging component.
 */

import os.log

private let NumStartingTrees = 5

public class PaperCompany {
    // MARK: Properties
	
	/*
		We want to use a custom logging component for our model (as in model-view-controller).
	This allows us to enable debug logging for just our model, so we don't have to wade
	through logs from the view just to see what's wrong with one method in our model.
	*/
	static let model_log = OSLog(subsystem: "com.example.apple-samplecode.Paper-Company-Swift", category: "Model")
	
	let companyName: String
    
	private(set) public var livingTrees = NumStartingTrees
    
	private(set) public var logs = 0
    
	private(set) public var papers = 0
	
    // MARK: Initialization
    
	public init(name: String) {
		companyName = name
	}
    
    // MARK: Implementation
	
	/// Chop down a tree, turning it into a log.
	func chopDownTree() {
		// Make sure we actually have a tree to chop down.
		guard livingTrees > 0 else {
			os_log("No trees left to chop down!", log: PaperCompany.model_log, type: .info)
			return
		}
		
		// We're good.
		os_log("Chopped down a tree!", log: PaperCompany.model_log, type: .info)
		livingTrees -= 1
		logs += 1
		os_log("%lu trees remaining, %lu logs accumulated", log: PaperCompany.model_log, type: .debug, livingTrees, logs)
	}
	
	/// Turn all available logs into paper.
	func makePaper() {
		// Make sure we actually have a log to turn into paper.
		guard logs > 0 else {
			os_log("No logs to pulverize into paper!", log: PaperCompany.model_log, type: .info)
			return
		}
		
		// We're good.
		os_log("Making paper from our logs!", log: PaperCompany.model_log, type: .info)
		os_log("Pulverizing %lu logs into paper.", log: PaperCompany.model_log, type: .debug, logs)
		papers += logs
		logs = 0
		os_log("We now have %lu papers.", log: PaperCompany.model_log, type: .debug, papers)
	}
	
}
