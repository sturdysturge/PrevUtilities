//
//  File.swift
//
//
//  Created by Rob Sturgeon on 24/05/2020.
//

import SwiftUI

public struct PreviewData: Codable {
    let previews: [Preview]
    let colorScheme: String?
    public init(preview: Preview, colorScheme: ColorScheme? = nil) {
        previews = [preview]
        self.colorScheme = colorScheme?.rawValue()
    }

    public init(previews: [Preview], colorScheme: ColorScheme? = nil) {
        self.previews = previews
        self.colorScheme = colorScheme?.rawValue()
    }

    public init(filename: String) {
        do {
            if let bundlePath = Bundle.main.path(forResource: filename,
                                                 ofType: "json"),
                let jsonData = try String(contentsOfFile: bundlePath).data(using: .utf8) {
                self = try JSONDecoder().decode(PreviewData.self, from: jsonData)
            } else {
                fatalError("Couldn't get PreviewData from file")
            }
        } catch {
            fatalError("Couldn't get PreviewData from file due to an error: \(error)")
        }
    }

    func getColorScheme() -> ColorScheme? {
        guard let colorScheme = colorScheme else {
            return nil
        }
        return .initFromRawValue(colorScheme)
    }
}
