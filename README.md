# Mini Radar Scanner

A mini radar-style scanning system built using Arduino, an ultrasonic distance sensor, and a servo motor. The system scans its surroundings, measures distances to nearby objects, and visualizes the readings on a radar-style display.

## Project Overview

This was my first hands-on electrical engineering project as I began learning about electronics, embedded programming, and circuit design.

The project combines hardware control, distance sensing, and serial communication to create a simple radar-like visualization.

## Components Used

- Arduino board
- HC-SR04 ultrasonic distance sensor
- Servo motor
- Jumper wires
- USB cable
- Computer running Arduino IDE and Processing

## How It Works

1. The servo motor rotates the ultrasonic sensor through a range of angles.
2. The sensor measures the distance to nearby objects using ultrasonic waves.
3. The Arduino processes the angle and distance readings.
4. The readings are sent to Processing through serial communication.
5. Processing displays the measurements in a radar-style interface.

## Results

The completed project integrates servo motor control, ultrasonic distance measurement, and graphical visualization into a single working system.

The system scans its surroundings, measures distances at different angles, and displays the readings through a radar-style interface. Building the project provided practical experience in connecting hardware components, programming a microcontroller, communicating data between applications, and troubleshooting a working electronic system.

## Project Files

- `radar.ino` — Arduino code for servo control and sensor readings.
- `radar_display.pde` — Processing code for radar visualization.

## Skills Practiced

- Arduino programming
- Ultrasonic distance measurement
- Servo motor control
- Serial communication
- Hardware integration and troubleshooting

## Future Improvements

- Improve measurement reliability.
- Understand and optimize the code.
- Explore circuit simulation using Tinkercad.
- Add new features as my electronics knowledge develops.
