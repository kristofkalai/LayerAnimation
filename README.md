# LayerAnimation
Animate layer's properties like never before! ✨

## Setup

Add the following to `Package.swift`:

```swift
.package(url: "https://github.com/stateman92/LayerAnimation", exact: .init(0, 0, 1))
```

[Or add the package in Xcode.](https://developer.apple.com/documentation/xcode/adding_package_dependencies_to_your_app)

## Usage

```swift
let label = UILabel()
label.text = "Test label"
label.layer.backgroundColor = UIColor.white.cgColor
label.layer.animate(to: CALayer.LayerAnimatable.backgroundColor(.green), with: 5) {
    print("Finished: \($0)")
}
```

For details see the Example app.

## Example

<p style="text-align:center;"><img src="https://github.com/stateman92/LayerAnimation/blob/main/Resources/screenrecording.gif?raw=true" width="50%" alt="Example"></p>
