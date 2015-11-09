
class Student: Printable {
    var firstName: String
    var lastName: String
    var studentID: Int

    init(firstName: String, lastName: String, studentID: Int) {
        self.firstName = firstName
        self.lastName = lastName
        self.studentID = studentID
    }

    var description: String {
        return "Student: \(lastName), \(firstName), ID: \(studentID)"
    }
}

