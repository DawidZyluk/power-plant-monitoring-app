

# Hydroelectric Power Plant Monitoring App
This project is a water power plant monitoring application built using Flutter and QuestDB. It allows users to monitor and analyze various aspects of a water power plant, such as water levels, power output, and environmental conditions. The application provides real-time data visualization and historical data analysis capabilities, enabling operators and engineers to make informed decisions for optimal power plant performance.

## Introduction
Water power plants are crucial for generating renewable energy from water resources. Efficient monitoring and analysis of power plant operations are essential to ensure optimal performance and identify potential issues. This project aims to develop a mobile application that enables real-time monitoring and data analysis for water power plants. By utilizing Flutter for the user interface and QuestDB for data storage and retrieval, the application provides a reliable and efficient solution for plant operators and engineers.

## Features
- Real-time monitoring of water levels, power output, and environmental conditions.
- Historical data analysis and visualization with customizable time ranges and data filters.
- Alerts and notifications for critical events or abnormal conditions.
- Intuitive user interface for easy navigation and interaction.
- Exporting data to Excel workbooks
## Technologies
The key technologies used in this project are:

**Flutter**: A cross-platform framework for building mobile applications.

**QuestDB**: A high-performance time-series database for efficient data storage and retrieval.

## Project structure
```bash
├── lib/                  # Flutter application source code
│   ├── data/             # General app state management
│   ├── models/           # Data models and entities
│   ├── screens/          # Application screens and user interface components
│   ├── services/         # Services for data retrieval and management
│   ├── widgets/          # Reusable widgets collection
│   └── main.dart         # Entry point of the application
├── assets/               # Static assets such as images and fonts
├── README.md             # Project README file
└── ...

```

## Getting Started
To get started with the project, follow these steps:

Clone the repository to your local machine:

```bash
git clone https://github.com/your-username/your-repository.git
```
Install Flutter by following the official Flutter installation guide.

Ensure you have a running instance of QuestDB. Refer to the QuestDB documentation for installation instructions.

Update the necessary configurations in the Flutter application to connect to your QuestDB instance.

## Usage
To run the water power plant monitoring application, follow these steps:

Open a terminal and navigate to the project directory:

```bash
cd water-power-plant-monitoring-app
```
Connect your device or emulator and run the Flutter application:

```bash
flutter run
```
The application will launch on the connected device or emulator, allowing you to monitor the water power plant data and perform data analysis.

## Credits
App icon was created by Jesus Chavarria on flaticon: https://www.flaticon.com/free-icon/seagull_3127593
