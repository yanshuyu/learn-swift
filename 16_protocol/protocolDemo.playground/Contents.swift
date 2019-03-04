import Foundation

//A protocol defines a blueprint of methods, properties, and other requirements that suit a particular task or piece of functionality.
//The protocol can then be adopted by a class, structure, or enumeration to provide an actual implementation of those requirements.
//Any type that satisfies the requirements of a protocol is said to conform to that protocol.

protocol PElectronicDevice {
    associatedtype SystemInfo
    var productName: String { get }
    var productId: Int { get }
    var systemInfo: SystemInfo { get }
    var powerEnergy: Float { get set }
    
    func powerOn() -> Bool
    func powerOff() -> Bool
    func getSystemInfo() -> SystemInfo
    func toString() -> String
}

protocol PWearableDevice {
    var isEletronic: Bool { get set }
    var weight: Float { get set }
    var wearBody: String { get set }
    
    func wearOn() -> Void
    func wearOff() -> Void
    func observer() -> Void
}

struct SSmartWatchDeviceSystemInfo {
    var os: String
    var osVersion: String
    var model: String
    var storageTotal: Float
    var storageAvalible: Float
    
    init() {	
        self.os = "unknown"
        self.osVersion = "unknown"
        self.model = "unknown"
        self.storageTotal = 0
        self.storageAvalible = 0
    }
    init(os:String, osVersion: String, model: String, storageTotal: Float, storageAvalible: Float) {
        self.os = os
        self.osVersion = osVersion
        self.model = model
        self.storageTotal = storageTotal
        self.storageAvalible = storageAvalible
    }
}

struct SIosDeviceSystemInfo {
    var osVersion: String
    var isp: String
    var model: String
    var storageTotal: Float
    var storageAvalible: Float
    
    init(osVersion: String, isp: String, model: String, storageTotal: Float, storageAvalible: Float) {
        self.osVersion = osVersion
        self.isp = isp
        self.model = model
        self.storageTotal = storageTotal
        self.storageAvalible = storageAvalible
    }
}

struct SMacDeviceSystemInfo {
    var osVersion: String
    var ram: Float
    var cpu: String
    var gpu: String
    var nic: String
    var storageTotal: Float
    var storageAvalible: Float
    
    init(osVersion: String, ram: Float, cpu: String, gpu: String, nic: String, storageTotal: Float, storageAvalible: Float) {
        self.osVersion = osVersion
        self.ram = ram
        self.cpu = cpu
        self.gpu = gpu
        self.nic = nic
        self.storageTotal = storageTotal
        self.storageAvalible = storageAvalible
    }
}

class CIosDevice: PElectronicDevice {
    var productName: String
    var productId: Int
    var systemInfo: SIosDeviceSystemInfo
    var powerEnergy: Float
    
    init() {
        self.productName = "unknowned ios device"
        self.productId = 0
        self.powerEnergy = 1.0
        self.systemInfo = SIosDeviceSystemInfo(osVersion: "unknowned ios os version", isp: "unknowned isp", model: "unknowned ios model", storageTotal: 0, storageAvalible: 0)
    }
    init(deviceName: String, deviceId: Int, power: Float, systemInfo: SIosDeviceSystemInfo) {
        self.productName = deviceName
        self.productId = deviceId
        self.powerEnergy = power
        self.systemInfo = systemInfo
    }
    func powerOn() -> Bool {
        print("\(self.productName) device power on...")
        return true
    }
    func powerOff() -> Bool {
        print("\(self.productName) device power off...")
        return true
    }
    func getSystemInfo() -> SystemInfo{
        return self.systemInfo
    }
    func toString() -> String {
        return "product: \(self.productName)\n"
            + "id: \(self.productId)\n"
            + "power: \(self.powerEnergy*100)%\n"
            + "system info: \(self.systemInfo)"
    }
}

class CMacDevice: PElectronicDevice {
    var productName: String
    var productId: Int
    var systemInfo: SMacDeviceSystemInfo
    var powerEnergy: Float
    
    init() {
        self.productName = "unknowned mac device"
        self.productId = 0
        self.powerEnergy = 1.0
        self.systemInfo = SMacDeviceSystemInfo(osVersion: "unknowned mac os version", ram: 0, cpu: "unknowned cpu", gpu: "unknowned gpu", nic: "unknowned nic", storageTotal: 0, storageAvalible: 0)
    }
    init(deviceName: String, deviceId: Int, power: Float, systemInfo: SMacDeviceSystemInfo) {
        self.productName = deviceName
        self.productId = deviceId
        self.powerEnergy = power
        self.systemInfo = systemInfo
    }
    func powerOn() -> Bool {
        print("\(self.productName) power on...")
        return true
    }
    func powerOff() -> Bool {
        print("\(self.productName) power off...")
        return true
    }
    func getSystemInfo() -> SystemInfo{
        return self.systemInfo
    }
    func toString() -> String {
        return "product: \(self.productName)\n"
            + "id: \(self.productId)\n"
            + "power: \(self.powerEnergy*100)%\n"
            + "system info: \(self.systemInfo)"
    }
}

//conform multiplue protocol
class CSmartWatch: PElectronicDevice, PWearableDevice {
    var productName: String
    var productId: Int
    var systemInfo: SSmartWatchDeviceSystemInfo
    var powerEnergy: Float
    
    var isEletronic: Bool = true
    var weight: Float
    var wearBody: String
    
    init() {
        self.productName = "unknown smart watch device"
        self.productId = 0
        self.systemInfo = SSmartWatchDeviceSystemInfo()
        self.powerEnergy = 0
        
        self.weight = 0
        self.wearBody = "unknown"
    }
    init(productName: String, productId: Int, systemInfo: SSmartWatchDeviceSystemInfo, power: Float,  weight: Float, wearBody: String) {
        self.productName = productName
        self.productId = productId
        self.systemInfo = systemInfo
        self.powerEnergy = power
        self.weight = weight
        self.wearBody = wearBody
    }

    func powerOn() -> Bool
    {
        print("\(self.productName) power on...")
        return true
    }
    func powerOff() -> Bool {
        print("\(self.productName) power off...")
        return true
    }
    func getSystemInfo() -> SystemInfo{
        return self.systemInfo
    }
    
    
    func wearOn() -> Void {
        print("wear \(self.productName) on \(self.wearBody)")
    }
    func wearOff() -> Void {
        print("takeoff \(self.productName) from \(self.wearBody)")
    }
    func observer() -> Void {
        print("\(self.productName) is not ready to observer!")
    }
    
    
    func toString() -> String {
        return "product: \(self.productName)\n"
            + "id: \(self.productId)\n"
            + "power: \(self.powerEnergy*100)%\n"
            + "weight: \(self.weight)kg\n"
            + "wearpart: \(self.wearBody)\n"
            + "system info: \(self.systemInfo)"
    }
}

class CAppleWatch: CSmartWatch {
    override init() {
        super.init()
        self.productName = "apple watch"
        self.productId = 0
        self.systemInfo = SSmartWatchDeviceSystemInfo()
        self.powerEnergy = 0
        
        self.weight = 0
        self.wearBody = "hand"
    }
    override init(productName: String, productId: Int, systemInfo: SSmartWatchDeviceSystemInfo, power: Float,  weight: Float, wearBody: String) {
        super.init(productName: productName, productId: productId, systemInfo: systemInfo, power: power, weight: weight, wearBody: wearBody)
    }
    override func observer() {
        print("now time is 2019/3/2 19:25 form apple watch")
    }
}


class CHuaweiWatch: CSmartWatch {
    override init() {
        super.init()
        self.productName = "huawei watch"
        self.productId = 0
        self.systemInfo = SSmartWatchDeviceSystemInfo()
        self.powerEnergy = 0
        
        self.weight = 0
        self.wearBody = "hand"
    }
    override init(productName: String, productId: Int, systemInfo: SSmartWatchDeviceSystemInfo, power: Float,  weight: Float, wearBody: String) {
        super.init(productName: productName, productId: productId, systemInfo: systemInfo, power: power, weight: weight, wearBody: wearBody)
    }
    override func observer() {
        print("now time is 2019/3/2 19:25 form huawei watch")
    }
}


//standard protocol
extension CSmartWatch: Equatable {
    public static func == (lhs: CSmartWatch, rhs: CSmartWatch) -> Bool{
        return lhs.productId == rhs.productId
    }
}

extension CSmartWatch: Hashable {
     public var hashValue: Int {
        return self.productId
    }
}


var iphone7Device = CIosDevice(deviceName: "iphone7", deviceId: 278578979797, power: 0.45, systemInfo:
    SIosDeviceSystemInfo(osVersion: "ios12", isp: "中国移动", model: "MNGQ2CH/A", storageTotal: 64, storageAvalible: 26))
var macbookproDevice = CMacDevice(deviceName: "macbookpro 2017 13 inch", deviceId: 8759375937, power: 0.89, systemInfo: SMacDeviceSystemInfo(osVersion: "macos mojave", ram: 8, cpu: "i7 2.7X2Hz", gpu: "Intel Iris Plus Graphics 650 1536 MB", nic: "ens7 ac:de:48:00:11:22", storageTotal: 256, storageAvalible: 145))


let appleWatch = CAppleWatch(productName: "apple wathch series 4", productId: 786676, systemInfo: SSmartWatchDeviceSystemInfo(os: "watch os 4", osVersion: "watch os 4.1.2", model: "AHKGDHG245CH/A", storageTotal: 64, storageAvalible: 32), power: 0.52, weight: 0.34, wearBody: "hand")

let huaweiWatch = CHuaweiWatch(productName: "huawei watch", productId: 2459277, systemInfo: SSmartWatchDeviceSystemInfo(os: "android 5", osVersion: "andriod 5.2.1", model: "KHFSHKFHG587CH/A", storageTotal: 128, storageAvalible: 89), power: 0.72, weight: 0.45, wearBody: "hand")

let smartWatches: [CSmartWatch] = [appleWatch, huaweiWatch]

print(iphone7Device.toString())
print(macbookproDevice.toString())
print("\n")

for watch in smartWatches {
    print(watch.toString())
}
print("\n")

var watchSet: Set<CSmartWatch> = [appleWatch, huaweiWatch]
for watch in watchSet {
    print(watch.toString())
}
print("\n")

print("\(appleWatch.productName) == \(appleWatch.productName) ? \(appleWatch == appleWatch)")
print("\(appleWatch.productName) == \(huaweiWatch.productName) ? \(appleWatch == huaweiWatch)")
