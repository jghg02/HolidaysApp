## Chilean Holidays App

### Overview

The Chilean Holidays App is a sleek and modern iOS application built using SwiftUI. It leverages the principles of Clean Architecture and follows the MVVM design pattern to ensure a scalable, maintainable, and testable codebase. This application consumes an API to fetch and display all the official holidays in Chile.

### Features

1. **Fetch All Holidays**: Retrieve a comprehensive list of all the official holidays in Chile for a given year.
2. **Next Holiday Highlight**: Quickly identify the upcoming holiday.

### Technical Details

#### Architecture

The application is structured following the Clean Architecture principles, which divides the system into layers, making it more testable and scalable. The project is further organized using the MVVM pattern, facilitating separation of concerns and easier maintenance.

#### Packages

The project utilizes two Swift Package Managers (SPM):

1. **[NET](https://github.com/jghg02/NET)**: A robust Network Layer created to handle API requests. It utilizes modern Swift features such as async and await for better readability and handling of asynchronous tasks.
   
2. **Lottie**: A package used to incorporate animations within the SplashView, creating a more engaging user interface.

#### API

The application consumes the Chilean government's official [API](https://apis.digital.gob.cl/fl/feriados) to fetch the data about the holidays in Chile.

### Getting Started

#### Prerequisites

- Xcode 13 or later
- Swift 5.5 or later
- A device or simulator running iOS 15 or later

#### Installation

1. Clone the repository to your local machine.
2. Open the project in Xcode.
3. Resolve the SPM dependencies by navigating to **File** > **Swift Packages** > **Resolve Package Versions**.
4. Build and run the project on your preferred simulator or physical device.


### License

This project is open-source, and it is distributed under the [MIT License](LICENSE).

### Contact

If you have any questions or suggestions, please open an issue on GitHub.

### Acknowledgments

- Chilean Government for providing the official [API](https://apis.digital.gob.cl/fl/feriados) to fetch holiday data.
- [NET](https://github.com/jghg02/NET) Network Layer for facilitating smooth and efficient network operations.
- Lottie for enhancing the user experience with beautiful animations.

---

Thank you for using the Chilean Holidays App! We hope it helps you stay informed about the official holidays in Chile.
