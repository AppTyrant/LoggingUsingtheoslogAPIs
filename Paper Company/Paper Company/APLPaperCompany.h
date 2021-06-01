/*
	Copyright (C) 2016 Apple Inc. All Rights Reserved.
	See LICENSE.txt for this sample’s licensing information
	
	Abstract:
	A paper company which handles trees, logs, and paper. Uses a custom logging component.
 */

@import Foundation;


@interface APLPaperCompany : NSObject

@property (nonatomic, readonly) NSString *companyName;
@property (nonatomic, readonly) NSUInteger numTrees;
@property (nonatomic, readonly) NSUInteger numLogs;
@property (nonatomic, readonly) NSUInteger numPapers;

/**
 * Create a new paper company.
 *
 * @param name The new company's name.
 */
- (instancetype)initWithCompanyName:(NSString *)name;

/// Chop down a tree, turning it into a log.
- (void)chopDownTree;

/// Turn all available logs into paper.
- (void)makePaper;

@end
