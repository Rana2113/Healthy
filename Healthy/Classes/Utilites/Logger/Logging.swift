//
//  Logging.swift
//  Healthy
//
//  Created by Abdelrahman Zain on 18/11/2025.
//

import Foundation

protocol Logging {
    func log(_ message: String,
             level: LogLevel,
             file: StaticString,
             function: StaticString,
             line: UInt)
}
