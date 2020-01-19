# NutritionTracker
This is an iOS app that tracks my food consumption and allows me to upload what I eat to my website.

There isn't anything particularly novel about this project. There are lots of apps that allow you to track your caloric intake (like the popular _MyFitnessPal_). But as far as I know they do not allow developers to access user food log data or export it. 

So I made this app which not only saves what I eat, but also publishes it to my website. Check it out: [https://paul.bitutsky.com#food](https://paul.bitutsky.com#food)

Hopefully, knowing that people can see what I eat will motivate me to eat healthier foods. 🙃

![Demo Pic 1](https://github.com/pbitutsky/NutritionTracker/blob/master/demo_pics/Screen%20Shot%202020-01-18%20at%209.35.02%20PM.png)

![Demo Pic 2](https://github.com/pbitutsky/NutritionTracker/blob/master/demo_pics/Screen%20Shot%202020-01-18%20at%209.36.12%20PM.png)

![Demo Pic 3](https://github.com/pbitutsky/NutritionTracker/blob/master/demo_pics/Screen%20Shot%202020-01-18%20at%209.36.27%20PM.png)

![Demo Pic 4](https://github.com/pbitutsky/NutritionTracker/blob/master/demo_pics/Screen%20Shot%202020-01-18%20at%209.36.39%20PM.png)

![Demo Pic 5](https://github.com/pbitutsky/NutritionTracker/blob/master/demo_pics/Screen%20Shot%202020-01-18%20at%209.36.50%20PM.png)

The real reason for this project, however, was for me to learn Swift 4 and SwiftUI. Special thanks to the iOS course on [raywenderlich.com](https://raywenderlich.com).

This app uses the Nutritionix API to get nutritional information (such as calories) on foods that the user inputs. The pictures also come from Nutritionix. 

Since I am the only intended user of the app, I have not published it on the app store. But if you'd like to try it out, just add the file NutritionTracker/Helpers/Secrets.swift and set the constants `NUTRITIONIX_APP_ID` and `NUTRITIONIX_APP_KEY`. You'll also need to modify the code in NutritionTracker/Helpers/Upload.swift so that it published the food data not to my site, but to yours instead. 
