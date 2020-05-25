//
//  File.swift
//
//
//  Created by Rob Sturgeon on 24/05/2020.
//

import SwiftUI
public struct Preview: Codable, Hashable {
    static let defaultPreview = Preview(device: .iPhone_11_Pro_Max, colorScheme: .dark, displayName: "Default")

    let device: String?
    let colorScheme: String?
    let displayName: String?
    let width: CGFloat?
    let height: CGFloat?

    public init(width: CGFloat, height: CGFloat, colorScheme: ColorScheme?, displayName: String?) {
        self.width = width
        self.height = height
        self.colorScheme = colorScheme?.rawValue()
        self.displayName = displayName
        device = nil
    }

    public init(device: PreviewDevice, colorScheme: ColorScheme?, displayName: String?) {
        width = nil
        height = nil
        self.colorScheme = colorScheme?.rawValue()
        self.displayName = displayName
        self.device = device.rawValue
    }

    public init(filename: String) {
        do {
            if let bundlePath = Bundle.main.path(forResource: filename,
                                                 ofType: "json"),
                let jsonData = try String(contentsOfFile: bundlePath).data(using: .utf8) {
                self = try JSONDecoder().decode(Preview.self, from: jsonData)
            } else {
                fatalError("Couldn't get Preview from file")
            }
        } catch {
            fatalError("Couldn't get Preview from file due to an error: \(error)")
        }
    }

    func getDevice() -> PreviewDevice? {
        guard let device = device else {
            return nil
        }
        return PreviewDevice(rawValue: device)
    }

    func isDevice() -> Bool {
        return getDevice() != nil
    }

    func getColorScheme() -> ColorScheme {
        guard let colorScheme = colorScheme else {
            return .light
        }
        return .initFromRawValue(colorScheme)
    }
}
