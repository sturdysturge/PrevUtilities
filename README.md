# PrevUtilities

This package allows you to easily import the files from the Medium tutorial [How to Create Reusable SwiftUI Previews That Can Be Saved As JSON Files](https://medium.com/better-programming/how-to-create-reusable-swiftui-previews-that-can-be-saved-as-json-files-2ca7b42c9ac6). 

# Devices as Codable structs 
This package allows saving and loading devices to a JSON file.

Here's an example file that could be loaded into any project:

    {"previews":
	    [
		{"colorScheme":"dark","device":"iPhone 11 Pro","displayName":"First"},
		{"colorScheme":"light","displayName":"Second","width":700,"height":500}
	    ]
    }

# Constants for iOS 13 devices
As seen below, the package provides convenient constants for all iOS 13 supported devices, so you don't need to pass a string to the constructor for PreviewDevice anymore.

You can also pass an array of devices, eliminating the need to put your View inside a Group and repeat it several times with different devices.
```swift
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
    
    
    extension View {
      public func previewDevices(_ values: [PreviewDevice]) -> some View {
        Group {
          ForEach(0..<values.count, id: \.self) {
            index in
            self.previewDevice(values[index])
          }
        }
      }
    }
    
    extension PreviewDevice {
      static let Mac = PreviewDevice(rawValue: "Mac"),
      iPod_Touch_7thGen = PreviewDevice(rawValue: "iPod Touch (7th generation)"),
      iPhone_6s = PreviewDevice(rawValue: "iPhone 6s"),
      iPhone_6s_Plus = PreviewDevice(rawValue: "iPhone 6s Plus"),
      iPhone_7 = PreviewDevice(rawValue: "iPhone 7"),
      iPhone_7_Plus = PreviewDevice(rawValue: "iPhone 7 Plus"),
      iPhone_8 = PreviewDevice(rawValue: "iPhone 8"),
      iPhone_8_Plus = PreviewDevice(rawValue: "iPhone 8 Plus"),
      iPhone_SE = PreviewDevice(rawValue: "iPhone SE"),
      iPhone_X = PreviewDevice(rawValue: "iPhone X"),
      iPhone_XS = PreviewDevice(rawValue: "iPhone Xs"),
      iPhone_XS_Max = PreviewDevice(rawValue: "iPhone Xs Max"),
      iPhone_XR = PreviewDevice(rawValue: "iPhone Xʀ"),
      iPhone_11 = PreviewDevice(rawValue: "iPhone 11"),
      iPhone_11_Pro = PreviewDevice(rawValue: "iPhone 11 Pro"),
      iPhone_11_Pro_Max = PreviewDevice(rawValue: "iPhone 11 Pro Max"),
      iPhone_SE_2ndGen = PreviewDevice(rawValue: "iPhone SE (2nd generation)"),
      iPad_2 = PreviewDevice(rawValue: "iPad 2"),
      iPad_Mini_4 = PreviewDevice(rawValue: "iPad mini 4"),
      iPad_Air_2 = PreviewDevice(rawValue: "iPad Air 2"),
      iPad_Pro_9Point7Inch = PreviewDevice(rawValue: "iPad Pro (9.7-inch)"),
      iPad_Pro_12Point9Inch = PreviewDevice(rawValue: "iPad Pro (12.9-inch)"),
      iPad_5thGen = PreviewDevice(rawValue: "iPad (5th generation)"),
      iPad_Pro_12Point9Inch_2ndGen = PreviewDevice(rawValue: "iPad Pro (12.9-inch) (2nd generation)"),
      iPad_Pro_10Point5Inch = PreviewDevice(rawValue: "iPad Pro (10.5-inch)"),
      iPad_6thGen = PreviewDevice(rawValue: "iPad (6th generation)"),
      iPad_7thGen = PreviewDevice(rawValue: "iPad (7th generation)"),
      iPad_Pro_11Inch = PreviewDevice(rawValue: "iPad Pro (11-inch)"),
      iPad_Pro_11Inch_2ndGen = PreviewDevice(rawValue: "iPad Pro (11-inch) (2nd generation)"),
      iPad_Pro_12Point9Inch_3rdGen = PreviewDevice(rawValue: "iPad Pro (12.9-inch) (3rd generation)"),
      iPad_Pro_12Point9Inch_4thGen = PreviewDevice(rawValue: "iPad Pro (12.9-inch) (4th generation)"),
      iPad_Mini_5thGen = PreviewDevice(rawValue: "iPad mini (5th generation)"),
      iPad_Air_3rdGen = PreviewDevice(rawValue: "iPad Air (3rd generation)"),
      AppleTV = PreviewDevice(rawValue: "Apple TV"),
      AppleTV_4K = PreviewDevice(rawValue: "Apple TV 4K"),
      AppleTV_4K_1080p = PreviewDevice(rawValue: "Apple TV 4K (at 1080p)"),
      AppleWatch_S2_38mm = PreviewDevice(rawValue: "Apple Watch Series 2 - 38mm"),
      AppleWatch_S2_42mm = PreviewDevice(rawValue: "Apple Watch Series 2 - 42mm"),
      AppleWatch_S3_38mm = PreviewDevice(rawValue: "Apple Watch Series 3 - 38mm"),
      AppleWatch_S3_42mm = PreviewDevice(rawValue: "Apple Watch Series 3 - 42mm"),
      AppleWatch_S4_40mm = PreviewDevice(rawValue: "Apple Watch Series 4 - 40mm"),
      AppleWatch_S4_44mm = PreviewDevice(rawValue: "Apple Watch Series 4 - 44mm"),
      AppleWatch_S5_40mm = PreviewDevice(rawValue: "Apple Watch Series 5 - 40mm"),
      AppleWatch_S5_44mm = PreviewDevice(rawValue: "Apple Watch Series 5 - 44mm")
    }


<!--stackedit_data:
eyJoaXN0b3J5IjpbMTg2NzgzODUxMSwyNjA0NzMwNTAsMjYwND
czMDUwLDE4OTA5NjcyNzFdfQ==
-->
