import Foundation

enum IOError: Error {
    case NoError
    case NoSuchFileOrDirectory
    case NoPermission
    case NoSupportedFormat
    case FileOrDirectoryLocked
}


func throwError(_ e: IOError) throws {
    if e != IOError.NoError{
        throw e
    }
}

func fireError(_ e: IOError) {
    do {
        try throwError(e)
    } catch IOError.NoSuchFileOrDirectory {
        print("IOError: NoSuchFileOrDirectory!")
    } catch IOError.NoPermission {
        print("IOError: NoPermission!")
    } catch IOError.NoSupportedFormat {
        print("IOError: NoSupportedFormat!")
    } catch IOError.FileOrDirectoryLocked {
        print("IOError: FileOrDirectoryLocked!")
    } catch {
        print("Unknown error occur!")
    }
}


fireError(IOError.NoPermission)
fireError(IOError.NoSuchFileOrDirectory)
fireError(IOError.NoError)

