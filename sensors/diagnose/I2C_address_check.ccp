#include <Wire.h>

void setup() {
  // Start the serial communication
  Serial.begin(115200);
  // Start the I2C communication
  Wire.begin();

  Serial.println("I2C scanner initialized.");
}

void loop() {
  byte error, address;
  int nDevices = 0;

  Serial.println("scanning...");

  // Loop through all possible I2C addresses (0x03 to 0x77)
  for (address = 1; address < 127; address++) {
    Wire.beginTransmission(address);
    error = Wire.endTransmission();

    if (error == 0) {
      Serial.print("I2C device found at address 0x.");
      if (address < 16) {
        Serial.print("0");
      }
      Serial.println(address, HEX);
      nDevices++;
    } else if (error == 4) {
      Serial.print("unknown error at address 0x.");
      if (address < 16) {
        Serial.print("0");
      }
      Serial.println(address, HEX);
    }
  }

  if (nDevices == 0) {
    Serial.println("no I2C devices found.\n");
  } else {
    Serial.println("scan complete.\n");
  }

  delay(5000);  // Wait 5 seconds before the next scan
}
