import Foundation

var intA = 1
var intB = 2
let maiorInt = maior(intA, intB)

var doubleA = Double.pi
var doubleB = 3.14
let maiorDouble =  maior(doubleA, doubleB)

var tratorA = AgriculturalMachinery(size: 12)
var tratorB = AgriculturalMachinery(size: 783)
let maiorTrator = maior(tratorA, tratorB)

var pilha = Pilha<Int>()

pilha.push(intA)
pilha.push(intB)

// MARK: - Fazer um método que recebe um Array e um elemento, retorna um Bool dizendo se o elemento se encontra no Array

func contains<T: Equatable>(array: Array<T>, element: T) -> Bool {
    return array.contains(element)
}

let array = [1, 2, 3, 4, 5, 6, 7, 8, 9, 10]
contains(array: array, element: 5)


// MARK: - Extensão de Array contendo uma função que retorna a soma de todos os elementos, independente de qual o valor numérico

extension Array where Element: Numeric {
    func sumAll() -> Element {
        var sum = Element.zero
        for element in array {
            sum += Element(exactly: element) ?? 0
        }
        return sum
    }
}

array.sumAll()


// MARK: - Fazer um método que recebe 2 Arrays e retorna um Int referente a quantidade de elementos presentes em ambos os Arrays

func countElements<T: Equatable>(first: Array<T>, second: Array<T>) -> Int {
    var count = 0
    for element in first {
        if second.contains(element) {
            count += 1
        }
    }

    return count
}

let newArray = [1, 2, 3, 4, 5]
countElements(first: array, second: newArray)


// MARK: - BONUS: Fazer o método acima receber N arrays

// A função só considera se um elemento for encontrado em todos os arrays
func countAnyElements<T: Equatable>(_ arrays: Array<T>...) -> Int {
    var copy = arrays
    let firstArray = copy.removeFirst()
    
    var results = [T]()
    
    for element in firstArray {
        var isContainedIn = 1
        
        for array in copy {
            if !array.contains(element) {
                break
            }
            
            isContainedIn += 1
        }
        
        if isContainedIn == arrays.count && !results.contains(element) {
            results.append(element)
        }
    }
    
    return results.count
}

let anotherNewArray = [1, 2, 3, 4]
countAnyElements(array, newArray, anotherNewArray)
