////////// Lab 3 //////////

var frPrefixArray: [String] = []
var zSuffixArray: [String] = []
let vowelArray: [String] = ["A", "E", "I", "O", "U"]
var vowelPrefixArray: [String] = []

for thisName in names {
    if thisName.hasPrefix("Fr") {
        frPrefixArray.append(String(thisName))
    }
}

for thisName in names {
    if thisName.hasPrefix("z") {
        zSuffixArray.append(String(thisName))
    }
}

for thisName in names {
    for vowel in vowelArray {
        if thisName.hasPrefix(vowel) {
            vowelPrefixArray.append(String(thisName))
        }
    }
}


println(frPrefixArray)
println(zSuffixArray)
println(vowelPrefixArray.count)

//
