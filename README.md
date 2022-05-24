# starcoin-swift
The swift sdk for starcoin


# Swift Package Manager

```swift
  .package(url: "https://github.com/starcoinorg/starcoin-swift.git", .branch("master"))
```


# how to use

```swift
    import starcoin



    let service = StarcoinClient(url: "https://main-seed.starcoin.org")
    // Perform request
    let rs = service.nodeInfo()
    do {
        let nodeInfo = try rs.wait()
        debugPrint(nodeInfo.peer_info)
    } catch {
        
        print("error", rs.error, rs.value)
    }
```