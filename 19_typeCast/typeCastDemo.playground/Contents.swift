import Foundation

//type casting in Swift is implemented with the is and as operators.
//Use the type check operator (is) to check whether an instance is of a certain subclass type.
//Because downcasting can fail, the type cast operator comes in two different forms.
//The conditional form, as?, returns an optional value of the type you are trying to downcast to.
//The forced form, as!, attempts the downcast and force-unwraps the result as a single compound action.

class MediaItem {
    var type: String?
    
    init() {
        self.type = nil
    }
    
    init(what type: String?) {
        self.type = type
    }
    
}


class Song: MediaItem {
    var artist: String?
    
    override init() {
        super.init()
        self.artist = nil
    }
    
    override init(what type: String?) {
        super.init(what: type)
        self.artist = nil
    }
    
    init(what type: String?, artist who: String?) {
        super.init(what: type)
        self.artist = who
    }
}


class Movie: MediaItem {
    var director: String?
    
    override init() {
        super.init()
        self.director = nil
    }
    
    override init(what type: String?) {
        super.init(what: type)
        self.director = nil
    }
    
    init(what type: String?, director who: String?) {
        super.init(what: type)
        self.director = who
    }
    
}


let mediaItems = [ Song(what: "My Heart Will Go On", artist: "Celine Dion"),
                    Movie(what: "Titanic", director: "James Cameron"),
                    Song(what: "Lazy Afternoon", artist: "Elyonbeats")]

var songCount = 0
var movieCount = 0
for mediaItem in mediaItems {
    if mediaItem is Song {
        songCount += 1
    } else if mediaItem is Movie {
        movieCount += 1
    }
}

print("media items: \(mediaItems)\nsong count: \(songCount)\nmovie count: \(movieCount)")



for mediaItem in mediaItems {
    if let song = mediaItem as? Song {
        print("Song.name = \(song.type!), Song.artist = \(song.artist!)")
    } else if let movie = mediaItem as? Movie {
        print("Movie.name = \(movie.type!), Movie.director = \(movie.director!)")
    }
}
