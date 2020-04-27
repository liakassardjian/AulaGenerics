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

func countElements(first: Array<Any>, second: Array<Any>) -> Int {
    return first.count + second.count
}

let newArray = ["a", "b", "c", "d", "e"]
countElements(first: array, second: newArray)


// MARK: - BONUS: Fazer o método acima receber N arrays

func countAnyElements(_ arrays: Array<Any>...) -> Int {
    var count = 0
    for array in arrays {
        count += array.count
    }
    
    return count
}

let anotherNewArray = [1.25, 1.5, 2.75, 3.55]
countAnyElements(array, newArray, anotherNewArray)
