////////// Lab 3 //////////

//let success = myString.writeToFile(path,
//    atomically: true,
//    encoding: NSUTF8StringEncoding,
//    error: nil)

if myString.writeToFile(path, atomically: true, encoding: NSUTF8StringEncoding, error: nil) {
    println("File was saved successfully.")
} else {
    println("Error saving the file.")
}

//
