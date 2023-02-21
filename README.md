# AMTriangularSlider

A custom triangled slider in SwiftUI with gradiented background.
Ypu can easily configure the color and the size of the slider itself, the gradient of background and the corner radius of the component.

## Installation
Requirements:
 - .iOS(.v15)
https://github.com/DungeonDev78/AMTriangularSlider.git

### Swift Package Manager 
1. In Xcode, open your project and navigate to File → Swift Packages → Add Package Dependency.
2. Paste the repository URL (https://github.com/DungeonDev78/AMTriangularSlider.git) and click Next.
3. For Rules, select version.
4. Click Finish.

### Swift Package
```swift
.package(url: "https://github.com/DungeonDev78/AMTriangularSlider.git", .upToNextMajor(from: "1.0.0"))
```

## Usage:

Import the package:

```Swift
import AMTriangularSlider
```

and then use it in your views:

```Swift
@State var value: CGFloat = 0.3
private let sliderColor = Color.blue
private let gradient = LinearGradient(gradient: Gradient(colors: [Color.green, Color.yellow, Color.red]), startPoint: .leading, endPoint: .trailing)

var body: some View {
  AMTriangularSlider(value: $value, cornerRadius: 20, sliderWidth: 30, sliderColor: sliderColor, background: gradient)
  .frame(width: 300, height: 80)  
  .padding()
}
    
```

![Example](https://github.com/DungeonDev78/AMTriangularSlider/blob/main/Img/001.jpg?raw=true)

## Author

* **Alessandro "DungeonDev78" Manilii**

## License

This project is licensed under the MIT License
