---
title: "2015 Burning Man - Dreamland"
date: 2015-08-30T12:00:00-07:00
showDate: false
draft: false
tags: ["Burning Man","Flux Foundation"]
---
*A whimsical experience of vivid colors, dazzling light and flames transport participants to the world of spectacle and the carnivalesque.*
![Duncan-1](/gallery/images/dreamland_1_duncan_co.jpg)
*Photo: [Duncan Rawlinson](https://duncan.co/)* 

## Involvement
- Electro/Mechanical design
  - In order to pass both electricity and propane through the central spire's hub, I designed a joint consisting of a rotary fluid union and an electrical slip ring. This design allowed for up to: 200cfm of propane and 25A @120VAC.
  - Carousel position was captured by creating a custom rotary encoder that consisted of a square tooth gear with two hall-effect sensors 90deg out of phase with one another. This configuration allowed us to track position(leading to velocity and acceleration) as well as directionality of the rotation.
- Lighting design
  - One of the first design constraits was to mimic the globe bulbs on old time carnival rides. This was accomplished by sourcing WS2812b plastic globe lights from China for the main carousel. Since this piece was indended to be highly interactive, I decided to utilize dome lights for the lamp poles to prevent people accidently breaking the lights. From there, the bench lights became the simple choice of using WS2811 LED strips.
- Controllers and Networking architecture
  - Choosing the WS2812b lights limited the number of controllers I was able to utilize for Dreamland. The light type, plus the shear footprint of the piece lead to the decision to treat each structure (carousel, lamp poles, benches) as a fully self contained unit consisting of a: raspberry pi, Fadecandy controller and power distribution. This architecture allowed each structure to be de-coupled from one another, which increase the testing velocity in Oakland, prevented cascading failures and simplified onsite debugging.
- Flame effects controllers
  - Firing the poofers was accomplished with an off the shelf relay board for makers. Safety was accomplished by connecting the solenoids to the normally closed contacts of the relay, which would only stay open if the controller constantly received the appropriate command from the controller - essentially a digital deadman's switch.
- Software
