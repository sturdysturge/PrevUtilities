//
//  ExampleContentView.swift
//
//
//  Created by Rob Sturgeon on 24/05/2020.
//

import SwiftUI

public struct ExampleContentView: View {
  public init() {}
  public var body: some View {
        Group {
            Text("Hello world")
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background(Color(UIColor.systemBackground))
    }
}

public struct ExampleContentView_Previews: PreviewProvider {
  public init() {}
    // Two examples of Previews
    static let firstPreview = Preview(device: .iPhone_11_Pro, colorScheme: .dark, displayName: "First")
    static let secondPreview = Preview(width: 700, height: 500, colorScheme: .light, displayName: "Second")
    // Combining two Previews into a PreviewData object
    static let previewData = PreviewData(previews: [firstPreview, secondPreview])
    // Load a preview from a file
    static let previewDataFromFile = PreviewData(filename: "Previews")

  public static var previews: some View {
        ExampleContentView()
            .preview(previewData)
    }
}
