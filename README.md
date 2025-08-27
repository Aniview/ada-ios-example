# Ada SDK iOS Example
This project contains a minimal example application to start displaying Ads with Aniview's [Ada library](https://github.com/Aniview/ada-sdk-ios-spm).

## Setup & Usage

1. Clone the repository:

  ```bash
   git clone https://github.com/Aniview/ada-ios-example.git
   cd ada-ios-example
  ```

2. Open the project in Xcode:

```bash
   open AdaExample.xcodeproj
```

3. Ensure required dependencies are installed:

4. Update the ad configuration (optional):

   ```swift
   let config = AdaConfig(
       pubId: "your-publisher-id",
       tagId: "your-tag-id"
   )
   ```

5. Run the project on a simulator or physical device to see the ad in action.

