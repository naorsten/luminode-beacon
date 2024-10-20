#include <Adafruit_AHTX0.h>

Adafruit_AHTX0 aht;


void setup() {
  Serial.begin(115200);

  if (!aht.begin()) {
    Serial.println("AHT30 sensor not found. check wiring.");
    while (1);
  }
  
  Serial.println("AHT30 sensor found. please wait.");
}


void loop() {
  sensors_event_t humidity, temp;
  
  aht.getEvent(&humidity, &temp); 

  Serial.print("temperature: ");
  Serial.print(temp.temperature);
  Serial.println(" °C");
  
  Serial.print("relative humidity: ");
  Serial.print(humidity.relative_humidity);
  Serial.println(" %");
  
  delay(2000);
}
