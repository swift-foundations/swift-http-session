# swift-http-session

![Development Status](https://img.shields.io/badge/status-active--development-blue.svg)

Session identity and lifecycle policy for HTTP clients.

## Installation

```swift
dependencies: [
    .package(url: "https://github.com/swift-foundations/swift-http-session.git", branch: "main")
]
```

Add the product to your target:

```swift
.target(
    name: "YourTarget",
    dependencies: [
        .product(name: "HTTP Session", package: "swift-http-session")
    ]
)
```

## License

Apache 2.0. See [LICENSE](LICENSE.md).
