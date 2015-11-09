////////// Lab 1 //////////

let path = XCPSharedDataDirectoryPath.stringByAppendingPathComponent("propernames")

let namesFile = String(
    contentsOfFile: path,
    encoding: NSUTF8StringEncoding,
    error: nil)!

//
