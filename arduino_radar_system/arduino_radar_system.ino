
#include <Servo.h>

Servo radarServo;

const int trigPin = 8;
const int echoPin = 9;
const int servoPin = 12;

int getDistance() {
  digitalWrite(trigPin, LOW);
  delayMicroseconds(2);

  digitalWrite(trigPin, HIGH);
  delayMicroseconds(10);
  digitalWrite(trigPin, LOW);

  long duration = pulseIn(echoPin, HIGH, 30000);

  if (duration == 0) {
    return -1;
  }

  return (int)(duration * 0.0343 / 2);
}

void setup() {
  Serial.begin(9600);

  pinMode(trigPin, OUTPUT);
  pinMode(echoPin, INPUT);

  radarServo.attach(servoPin);
  radarServo.write(0);
  delay(500);
}

void loop() {
  for (int angle = 0; angle <= 180; angle += 2) {
    scanAtAngle(angle);
  }

  for (int angle = 180; angle >= 0; angle -= 2) {
    scanAtAngle(angle);
  }
}

void scanAtAngle(int angle) {
  radarServo.write(angle);
  delay(25);

  int distance = getDistance();

  Serial.print(angle);
  Serial.print(",");
  Serial.println(distance);
}
