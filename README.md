# CraneControl Schematic and PCB

![FlyingBergman](doc/header.jpg)

**Electronic hardware for controlling a vehicle mounted movie production crane**

	Copyright (c) 2019-2022 Martin Schröder, All rights reserved.

- Connect with me on LinkedIn: https://www.linkedin.com/in/martinschroder/
- Connect by email: martin.schroder@swedishembedded.com

This repository contains electical schematic and pcb layouts for boards that
can be used to control a movie production camera crane.

![FlyingBergman](doc/Render-Top.jpg)

What does such a crane look like in practice? Well here is CraneControl boards
providing HMI and dual motor control function to FlyingBergman movie production
crane (click on images to watch the video):

[![FlyingBergman](http://img.youtube.com/vi/k-2InPx5LMA/0.jpg)](http://www.youtube.com/watch?v=k-2InPx5LMA
"FlyingBergman")


[![FlyingBergman](http://img.youtube.com/vi/5sOf54V7gs8/0.jpg)](http://www.youtube.com/watch?v=5sOf54V7gs8
"FlyingBergman on land")


[![FlyingBergman](http://img.youtube.com/vi/lv9wT3cRuf8/0.jpg)](http://www.youtube.com/watch?v=lv9wT3cRuf8
"FlyingBergman at sea")

[FlyingBergman](https://flyingbergman.se) crane is best known for being used for filming all car scenes in
2022 Netflix series "Clark".

[![FlyingBergman](http://img.youtube.com/vi/Xm6EU1w8b1s/0.jpg)](http://www.youtube.com/watch?v=Xm6EU1w8b1s
"Clark")

If you are a movie producer and would like to order finished product then send
an email to info@swedishembedded.com and ask for more information. The complete
FlyingBergman setup also includes the crane assembly, HMI control panel for
mounting inside the vehicle and all necessary electronics.

## CraneControl platform

FlyingBergman is only one specific application of crane control hardware
design. CraneControl was originally designed to be a versatile solution capable
of advanced features like field oriented control of 2 60V PMSM motors at the
same time using the same microcontroller. It was also designed to provide
modern communication options like CAN-FD and EtherCAT.

In the case of FlyingBergman only a subset of these features was used - meaning
there is a lot of room to epand the use of this hardware for achieving more
complex control tasks in an industrial environment.

## Block diagram

![FlyingBergman](doc/block_diagram.jpg)

## Schematic PDF

[![Schematic](doc/schematic-screenshot.jpg)](motordriver-2x.pdf)

## Who is this for

This repository is for you if:

- You are a student of embedded systems courses at swedishembedded.com
  (https://swedishembedded.com/tag/training).

- You are building industrial control solutions and you would like to add
  support for advanced motor control (in this case you can also contract this
  task to Swedish Embedded Consulting Group. Book a call here:
  https://swedishembedded.com/book-call)

- You are simply curious about designing practical hardware and would like to
  learn from this project.

## License

You may use this design as inspiration for other designs as long as you develop
schematic and layout by yourself. You may also use this design as learning
materials for study.

If you would like to build a commercial product using this design then you can
contract Swedish Embedded Consulting Group to implement a specialized
hardware/software solution for you (send and email to
info@swedishembedded.com).

## Building

To generate gerbers for this design from command line you can use kibot
(https://github.com/INTI-CMNB/KiBot) with provided 'motordriver-2x.kibot.yaml'
file in this repository.

You can also edit this design in KiCad (version 6.0 or above).


