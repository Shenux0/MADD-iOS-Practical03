// Part A - Grade Enum
enum Grade: String {
    case a = "A"
    case aMinus = "A-"
    case bPlus = "B+"
    case b = "B"
    case bMinus = "B-"
    case cPlus = "C+"
    case c = "C"
    case cMinus = "C-"
    case f = "F"
}

// Part B - Student Struct
struct Student {

    var studentID: String
    var name: String
    var mark: Int

    // Part C - Computed Grade
    var grade: Grade {

        switch mark {

        case 80...100:
            return .a

        case 75..<80:
            return .aMinus

        case 70..<75:
            return .bPlus

        case 65..<70:
            return .b

        case 60..<65:
            return .bMinus

        case 55..<60:
            return .cPlus

        case 45..<55:
            return .c

        case 40..<45:
            return .cMinus

        default:
            return .f
        }
    }

    // Part D - Method
    func displayDetails() {
        print("ID: \(studentID)")
        print("Name: \(name)")
        print("Mark: \(mark)")
        print("Grade: \(grade.rawValue)")
    }
}

// Part E - Create Students
let students = [
    Student(studentID: "IT001", name: "Amal", mark: 72),
    Student(studentID: "IT002", name: "Nimali", mark: 45),
    Student(studentID: "IT003", name: "Ruwan", mark: 68),
    Student(studentID: "IT004", name: "Sanduni", mark: 90),
    Student(studentID: "IT005", name: "Kasun", mark: 38)
]

// Part F - Display Students
for student in students {
    student.displayDetails()
    print()
}

// Part G - filter
let passedStudents = students.filter {
    $0.mark >= 50
}

print("Passed Students:")
for student in passedStudents {
    print(student.name)
}

// Part H - map
let studentNames = students.map {
    $0.name
}

print()
print(studentNames)

// Part I - reduce
let totalMarks = students.reduce(0) {
    $0 + $1.mark
}

let classAverage = Double(totalMarks) / Double(students.count)

print()
print("Class Average: \(classAverage)")

// ------------------------------------------------------
// Optional extension (provisional Additional Challenge)
// ------------------------------------------------------

// guard let validation
func validateStudent(name: String?, mark: Int?) {

    guard let name = name, !name.isEmpty else {
        print("Invalid name")
        return
    }

    guard let mark = mark, (0...100).contains(mark) else {
        print("Invalid mark")
        return
    }

    print("\(name) with mark \(mark) is valid")
}

print()
validateStudent(name: "Amal", mark: 72)
validateStudent(name: "", mark: 72)
validateStudent(name: "Amal", mark: 150)
validateStudent(name: nil, mark: nil)

// tuple summary with safe empty-array handling
func summarize(_ students: [Student])
    -> (minimum: Int, maximum: Int, average: Double)? {

    guard !students.isEmpty else {
        return nil
    }

    let marks = students.map { $0.mark }
    let total = marks.reduce(0, +)

    return (marks.min()!, marks.max()!, Double(total) / Double(marks.count))
}

if let summary = summarize(students) {
    print("Min: \(summary.minimum), Max: \(summary.maximum), Average: \(summary.average)")
} else {
    print("No students to summarize")
}

// struct copy vs class reference
var originalStudent = Student(studentID: "IT010", name: "Original", mark: 60)
var copiedStudent = originalStudent
copiedStudent.mark = 99
print(originalStudent.mark)   // 60 - struct is copied (value type)
print(copiedStudent.mark)     // 99

class StudentRecord {
    var mark = 60
}

let recordA = StudentRecord()
let recordB = recordA
recordB.mark = 99
print(recordA.mark)           // 99 - both refer to the same object (reference type)
print(recordB.mark)           // 99