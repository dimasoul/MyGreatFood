//
//  AnalyzedInstruction.swift
//  MyGreatFood
//
//  Created by Дмитрий on 17.12.2022.
//

import Foundation

// MARK: - AnalyzedInstruction
struct AnalyzedInstructionAPI: Codable {
    var name: String?
    var steps: [StepAPI]?
}
