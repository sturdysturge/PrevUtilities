# PrevUtilities

This package allows you to easily import the files from the Medium tutorial [How to Create Reusable SwiftUI Previews That Can Be Saved As JSON Files](https://medium.com/better-programming/how-to-create-reusable-swiftui-previews-that-can-be-saved-as-json-files-2ca7b42c9ac6). 

# Devices as Codable structs 
This package allows saving and loading devices to a JSON file.

Here's an example file that could be loaded into any project:
```json
{"previews":
	[
		{"colorScheme":"dark","device":"iPhone 11 Pro","displayName":"First"},
		{"colorScheme":"light","displayName":"Second","width":700,"height":500}
	]
}
```
# Usage
```swift
import PrevUtilities
import SwiftUI
    
struct ContentView: View {
    var body: some View {
        Text("Hello world")
    }
}
    
struct ContentView_Previews: PreviewProvider {
  //Two examples of Previews
  static let firstPreview = Preview.defaultPreview
  static let secondPreview = Preview(width: 700, height: 500, colorScheme: .light, displayName: "Custom size")
  //Combining two Previews into a PreviewData object
  static let previewData = PreviewData(previews: [firstPreview, secondPreview])
  //Load a preview from a file
  static let previewDataFromFile = PreviewData(filename: "Previews")
  
  static var previews: some View {
    ContentView()
      .preview(previewDataFromFile)
  }
}
```


# Constants for iOS 13 devices
As seen below, the package provides convenient constants for all iOS 13 supported devices, so you don't need to pass a string to the constructor for PreviewDevice anymore.

You can also pass an array of devices, eliminating the need to put your View inside a Group and repeat it several times with different devices.
# Usage
```swift
import PrevUtilities
import SwiftUI
    
struct ContentView: View {
    var body: some View {
        Text("Hello world")
    }
}
    
struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
          .previewDevices([.iPhone_8, .iPhone_11_Pro_Max, .iPad_7thGen, .iPad_Pro_12Point9Inch])
    }
}
```
