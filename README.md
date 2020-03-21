# ReactiveCodyFire

[![Version](https://img.shields.io/cocoapods/v/ReactiveCodyFire.svg?style=flat)](https://cocoapods.org/pods/ReactiveCodyFire)
[![License](https://img.shields.io/cocoapods/l/ReactiveCodyFire.svg?style=flat)](https://cocoapods.org/pods/ReactiveCodyFire)
[![Platform](https://img.shields.io/cocoapods/p/ReactiveCodyFire.svg?style=flat)](https://cocoapods.org/pods/ReactiveCodyFire)

<p><a href="https://discord.gg/q5wCPYv">SWIFT.STREAM COMMUNITY IN DISCORD</a></p>

## Installation

via [CocoaPods](https://cocoapods.org)

```ruby
pod 'ReactiveCodyFire'
```

## How to use

`Please see API declaration examples in the original CodyFire repo https://github.com/MihaelIsaev/CodyFire`

Let's imagine that you have ToDos app. Our goal is to get a list of ToDos.

Ok, let's declare a ToDo model in `Models/ToDoModel.swift`
```swift
struct ToDoModel: Codable {
    let id: UUID
    let text: String
    let createdAt: Date
}
```

Then declare your `API` class in `/API/API.swift` file
```swift
class API {
    typealias todo = ToDoController
}
```

Then declare your empty ToDo controller in `API/Controllers/ToDoController.swift` file
```swift
class ToDoController {}
```

And in a separated decorator `API/Controllers/ToDo+Search.swift` file declare a search endpoint
```swift
import ReactiveCodyFire

extension ToDoController {
    struct Query: Codable {
        let text: String
    }
    static func search(_ text: String) -> APIRequest<[ToDo]> {
        return APIRequest("todo").query(Query(text: text))
    }
}
```

When everything is ready you're able to easily use it in your reactive code!
Please don't forget to `import ReactiveCodyFire`
Every APIRequest contains `signalProducer`, so just call it whenever you need API call and just use it!
```swift
API.todos.search("").signalProducer
```

Nice, right?

`TIP: There is no need to also import CodyFire cause it's already imported by ReactiveCodyFire`

## Author

Mihael Isaev, isaev.mihael@gmail.com

## License

ReactiveCodyFire is available under the MIT license. See the LICENSE file for more info.
