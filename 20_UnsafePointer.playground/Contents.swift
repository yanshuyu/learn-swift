import Foundation

//
// memory layout
//

MemoryLayout<Int>.size
MemoryLayout<Int>.alignment
MemoryLayout<Int>.stride

MemoryLayout<Int8>.size
MemoryLayout<Int8>.alignment
MemoryLayout<Int8>.stride

MemoryLayout<Int16>.size
MemoryLayout<Int16>.alignment
MemoryLayout<Int16>.stride


struct EmptyStruct { }
MemoryLayout<EmptyStruct>.size
MemoryLayout<EmptyStruct>.alignment
MemoryLayout<EmptyStruct>.stride


struct SimpleStruct {
    var number: Int32
    var flag: Bool
}
MemoryLayout<SimpleStruct>.size
MemoryLayout<SimpleStruct>.alignment
MemoryLayout<SimpleStruct>.stride


class EmptyClass {
    
}
MemoryLayout<EmptyClass>.size
MemoryLayout<EmptyClass>.alignment
MemoryLayout<EmptyClass>.stride

class SimpleClass {
    var number: Int32
    var flag: Bool
    
    init(num: Int32, flg: Bool) {
        self.number = num
        self.flag = flg
    }
}
MemoryLayout<SimpleClass>.size
MemoryLayout<SimpleClass>.alignment
MemoryLayout<SimpleClass>.stride



//
//unsafe row point
//

print("unsafe raw pointer:")
let cnt = 10
let rawPointer = UnsafeMutableRawPointer.allocate(byteCount: MemoryLayout<Int>.stride * cnt, alignment: MemoryLayout<Int>.alignment)
for i in 1...cnt {
    rawPointer.advanced(by: MemoryLayout<Int>.stride * (i-1)).storeBytes(of: i, as: Int.self)
}

for j in 1...cnt {
    let number = rawPointer.advanced(by: MemoryLayout<Int>.stride * (j-1)).load(as: Int.self)
    print(number)
}

let rawBufferPointer = UnsafeRawBufferPointer(start: rawPointer, count: cnt)
for (index, bytes) in rawBufferPointer.enumerated() {
    print("index: \(index) , bytes: \(bytes)")
}

rawBufferPointer.deallocate()
UnsafeMutableRawPointer.deallocate(rawPointer)


//
//unsafe typed pointer
//

print("unsafe type pointer:")
let typePointer = UnsafeMutablePointer<Int>.allocate(capacity: cnt)
typePointer.initialize(repeating: 0, count: cnt)
for k in 1...(cnt-2) {
    typePointer.advanced(by: k-1).pointee = k
}

for ii in 1...cnt {
    print(typePointer.advanced(by: ii-1).pointee)
}

let typeBufferPointer = UnsafeBufferPointer(start: typePointer, count: cnt)
for (index, value) in typeBufferPointer.enumerated() {
    print("index: \(index), value: \(value)")
}

//typeBufferPointer.deallocate()
typePointer.deinitialize(count: cnt)
typePointer.deallocate()


print("getting bytes from an instance: ")
var simpleClassInstance = SimpleClass(num: 1, flg: true)
withUnsafeBytes(of: &simpleClassInstance) { bytes in
    for (index, byte) in bytes.enumerated() {
        print("index: \(index), byte: \(byte)")
    }
    
}


print("covert unsafe raw pointer to unsafe typed pointer")

let rawPointerConverted = rawPointer.bindMemory(to: Int.self, capacity: cnt)
let rawPointerConvertedBuffer = UnsafeBufferPointer(start: rawPointerConverted, count: cnt)
for (index, value) in rawPointerConvertedBuffer.enumerated() {
    print("index: \(index), value: \(value)")
}
