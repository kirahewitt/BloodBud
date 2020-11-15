# BloodBud Hackathon Project
### Making blood donation easy, one squeeze at a time

By donating blood, you can bring the “gift of life” to someone in need. Now more than ever, it is essential that people continue to donate blood to prevent medical shortages during this global pandemic. We’ve made this process easier than ever, with an Apple Watch app that keeps track of yearly visits, vibrates every five seconds as a reminder to squeeze and increase blood circulation, and finally turns on a 15 minute timer to ensure users wait a sufficient amount of time before resuming to normal activities. 

### What it does
When the app is first launched, users are taken to the main screen where they are able to start a new blood donation. After clicking “start”, a 15 minute countdown begins and every five seconds the watch vibrates to remind users to squeeze their fist to increase blood circulation. After 15 minutes, or whenever approximately one pint of blood is drawn and the user clicks “finished”, they are taken to the next screen. Another 15 minute timer starts to ensure users relax and don’t experience any side effects from the blood loss. When the 15 minutes is up or users feel sufficiently rested, a popup thank-you screen appears and congratulates users on their good act. Finally, users are taken to a list of their previous donations, and are shown when they are eligible to donate again. This screen can be reached at any time by swiping left.

A testable prototype of BloodBud can be found on [Figma](https://www.figma.com/proto/Wo52Ecdqz04pQYcXgohwrM/Blood-Bud?node-id=1%3A57&scaling=scale-down).

### Challenges Encountered
Our day started off in a challenging manner when one of our teammates informed us she could no longer participate in the hackathon this weekend. Because of this, we were left with only one MacBook among the team that supported XCode, and we had to take turns programming the application. While this slowed down our development process, it greatly increased our collaboration and teamwork skills. At the end of the weekend, every member of our team had a strong understanding of each element of the project, and we learned so much about SwiftUI and Apple development! 

Additionally, we had very little to no experience working with XCode and SwiftUI prior to this project, and it was everyone’s first time creating an Apple Watch app. Through lots of online tutorials, Google searches, and stack overflow searches, we were able to create our final functioning app. BloodBud uses Core Data to save donation information after app closure, supports horizontal swiping between views, and supports vibrations and timers during the drawing blood period. Our biggest technological challenge was setting up our watch’s  navigational structure. After starting a donation, users are taken through several stacked views, and our goal was to return users to the root view upon donation completion. Additionally, we wanted users to be able to swipe left and right to switch between the new donation flow and the completed donation list. After many hours of searches and tutorials, BloodBud is now able to support these features through a NavigationView approach and a  page manager.  

### What's next for BloodBud
BloodBud’s minimal viable product (MVP) is complete and ready to be launched to the Apple Store! We are hoping to win some prize money to purchase an Apple Developer Account and share BloodBud with the entire world. In later versions, we are planning to integrate BloodBud with the calendar to remind users when they are eligible for a new donation, and create an IOS version so users can receive more in depth knowledge about blood donations and nearby blood drives.  

### Donate Blood Today!
Blood donation is a heroic act that can be done by everyday people like you and me. Save a life and [sign up](https://www.redcrossblood.org/give.html/find-drive?scode=RSG00000E017&cid=nonbrand&med=cpc&source=google&gclsrc=aw.ds&gclid=Cj0KCQiAwMP9BRCzARIsAPWTJ_EDJ_wm-34fgFVnNmeAVLDX00LeneV__h0gMxwSDTIi95L9e1X-47UaAmauEALw_wcB) to donate today! 

And don’t forget to get BloodBud before you go 
