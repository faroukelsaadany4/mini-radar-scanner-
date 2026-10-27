# Mini Radar Scanner

A mini radar-style scanning system built using Arduino, an ultrasonic sensor, and a servo motor. The system scans its surroundings, measures object distances, and visualizes the readings on a radar-style display.

## Project Overview

This was my first hands-on electrical engineering project, completed as part of my journey into electronics, embedded programming, and circuit design.

The project combines hardware control, distance sensing, and serial communication to create a simple radar-like visualization.

## Components Used

- Arduino board
- Ultrasonic distance sensor (HC-SR04)
- Servo motor
- Jumper wires
- USB cable
- Computer running Arduino IDE and Processing

## How It Works

1. The servo motor rotates the ultrasonic sensor through a range of angles.
2. The ultrasonic sensor measures the distance to nearby objects.
3. The Arduino processes the angle and distance readings.
4. The readings are transmitted over serial communication to Processing.
5. Processing displays the measurements in a radar-style interface.

## Results

The completed system integrates servo motor control, ultrasonic distance measurement, and graphical visualization into a single working project.

The servo moves the sensor through different angles, allowing it to scan its surroundings and measure the distance to nearby objects. The Arduino handles the sensor readings and communicates the data to Processing, which presents the measurements in a radar-style display.

This project demonstrates how hardware components and software can work together to create a simple sensing system. It also provided practical experience with embedded programming, sensor integration, serial communication, and hardware troubleshooting.

## Files

- `radar.ino` — Arduino code for sensor readings and servo control.
- `radar_display.pde` — Processing code for visualizing the radar readings.

## Skills Practiced

- Arduino programming
- Ultrasonic distance measurement
- Servo motor control
- Serial communication
- Hardware integration and troubleshooting

## Future Improvements

- Improve measurement reliability.
- Develop a deeper understanding of the code.
- Explore circuit simulation using Tinkercad.
- Add more features as my electronics knowledge develops.
