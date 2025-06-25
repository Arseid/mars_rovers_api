# mars_rover_api

A Flutter application that lets you explore photos taken by NASA’s Mars rovers: **Curiosity**, **Opportunity**, and **Spirit**.

## Features

- Select a rover from a side drawer.
- View mission information (launch date, landing date, status, etc.).
- Browse available sols (Martian days) for each rover.
- View paginated photos taken on each sol.
- Display the camera name used for each photo.

## API Configuration

The app uses NASA’s public Mars Rover Photos API:  
[`https://api.nasa.gov/mars-photos/api/v1/...`](https://api.nasa.gov)

You need an **API key** to perform requests.  
Both the base URL and the API key are stored in a `.env` file.

### Sample `.env` file:

```env
API_BASE_URL=https://api.nasa.gov/mars-photos/api/v1
NASA_API_KEY=your_api_key_here
```

## Getting Started

1. Install dependencies:
   ```bash
   flutter pub get
   ```
2. Create a `.env` file in the root directory with your NASA API URL & key.
3. Run the app:
   ```bash
   flutter run
   ```
