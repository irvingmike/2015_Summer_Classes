////////// Lab 2 //////////

let jsonArray = NSJSONSerialization.JSONObjectWithData(
        jsonData,
        options: NSJSONReadingOptions.MutableContainers,
        error: nil)! as! NSArray

println(jsonArray)

//
