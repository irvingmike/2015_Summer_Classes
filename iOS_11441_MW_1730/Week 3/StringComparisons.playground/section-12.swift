////////// Lab 5 //////////

let firstNameArray = ["Stephen", "Steven", "Stephanie", "Stacey", "Sandy", "Sam", "Sean", "Sergio"]
var stePrefixArray: [String] = []
var enSuffixArray: [String] = []

for name in firstNameArray {
    if name.hasPrefix("Ste") {
        stePrefixArray.append(name)
    }
}

for name in firstNameArray {
    if name.hasSuffix("en") {
        enSuffixArray.append(name)
    }
}

println(stePrefixArray)
println(enSuffixArray)

//
