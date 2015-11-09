////////// Lab 3 //////////

class Contact: Printable {
    
    var firstName: String
    var lastName: String
    var email: String
    var cell: String
    
    init(contactDictionary: NSDictionary) {
        firstName = (contactDictionary["firstName"] ?? "") as! String
        lastName = (contactDictionary["lastName"] ?? "") as! String
        email = (contactDictionary["email"] ?? "") as! String
        cell = (contactDictionary["cell"] ?? "") as! String
    }
    
    var description: String {
        return "\(firstName) \(lastName), \(email), \(cell)"
    }
}

//
