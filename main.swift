import Foundation

struct Video {
    let title: String
    let views: Int
    let url: String
}

func generateSampleVideos() -> [Video] {
    return [
        Video(title: "Swift Programming", views: 5000, url: "https://example.com/video1"),
        Video(title: "SwiftUI Basics", views: 3200, url: "https://example.com/video2"),
        Video(title: "Introduction to iOS Development", views: 4500, url: "https://example.com/video3"),
        Video(title: "Advanced Swift Techniques", views: 3800, url: "https://example.com/video4"),
        Video(title: "Building Apps with UIKit", views: 2200, url: "https://example.com/video5"),
        Video(title: "Data Persistence in Swift", views: 4100, url: "https://example.com/video6"),
        Video(title: "Networking with URLSession", views: 3000, url: "https://example.com/video7"),
        Video(title: "Concurrency in Swift", views: 2700, url: "https://example.com/video8"),
        Video(title: "Swift Package Manager", views: 1500, url: "https://example.com/video9"),
        Video(title: "Testing in Swift", views: 3200, url: "https://example.com/video10")
    ]
}

func printVideos(_ videos: [Video]) {
    for (index, video) in videos.enumerated() {
        print("\(index + 1). Назва: \(video.title), Перегляди: \(video.views)")
    }
}

func searchVideos(by title: String, in videos: [Video]) -> [Video] {
    return videos.filter { $0.title.localizedCaseInsensitiveContains(title) }
}

func sortVideosByViewsDescending(_ videos: [Video]) -> [Video] {
    return videos.sorted { $0.views > $1.views }
}

func printVideoDetails(_ video: Video) {
    print("Назва: \(video.title)")
    print("Перегляди: \(video.views)")
    print("Посилання: \(video.url)")
}

func clearConsole() {
    print("\u{1B}[2J")
    print("\u{1B}[H")
}

func main() {
    var videos = generateSampleVideos()
    
    while true {
        clearConsole()
        
        print("\nВітаємо! Оберіть дію:")
        print("1. Показати всі відео")
        print("2. Знайти відео за назвою")
        print("3. Сортувати відео за кількістю переглядів")
        print("4. Детальна інформація про відео")
        print("5. Вийти")
        
        if let choice = readLine(), let option = Int(choice) {
            switch option {
            case 1:
                print("\nСписок відео:")
                printVideos(videos)
            case 2:
                print("\nВведіть назву для пошуку:")
                if let query = readLine() {
                    let results = searchVideos(by: query, in: videos)
                    if results.isEmpty {
                        print("Результати пошуку не знайдено.")
                    } else {
                        print("\nРезультати пошуку:")
                        printVideos(results)
                    }
                }
            case 3:
                print("\nСписок відео, відсортованих за кількістю переглядів:")
                let sortedVideos = sortVideosByViewsDescending(videos)
                printVideos(sortedVideos)
            case 4:
                print("\nВведіть номер відео для перегляду деталей:")
                if let input = readLine(), let index = Int(input), index > 0, index <= videos.count {
                    print("\nДетальна інформація про відео:")
                    printVideoDetails(videos[index - 1])
                } else {
                    print("Невірний номер. Спробуйте ще раз.")
                }
            case 5:
                print("Дякуємо за використання програми. До побачення!")
                return
            default:
                print("Невірний вибір. Спробуйте ще раз.")
            }
        } else {
            print("Помилка вводу. Будь ласка, введіть число.")
        }
        
        print("\nНатисніть Enter для продовження...")
        _ = readLine()
    }
}

main()

