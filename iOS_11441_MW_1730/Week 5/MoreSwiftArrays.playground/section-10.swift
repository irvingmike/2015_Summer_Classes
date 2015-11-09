
func studentSort(student1: Student, student2: Student) -> Bool {
  
    let lastFirst1 = "\(student1.lastName)\(student1.firstName)"
    let lastFirst2 = "\(student2.lastName)\(student2.firstName)"
    
    return lastFirst1 < lastFirst2
}

