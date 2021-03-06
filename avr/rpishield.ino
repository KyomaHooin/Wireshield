//
// RPi OneWire Shield 
//

#include<OneWire.h>
#include<LowPower.h>
#include<TFT_22_ILI9225.h>// 176x220

#define BUS1_PWR A0
#define BUS1_DQ  A1
#define BUS2_PWR A2
#define BUS2_DQ  A3
#define LED_ACC  A4
#define LED_PWR  A5
#define TFT_RS   8 // TFT D/C
#define TFT_RST  9 // TFT RST
#define TFT_CS   10// SPI SS
#define TFT_SDI  11// SPI MOSI
#define TFT_CLK  13// SPI SCK

//OneWire instance
OneWire Bus1(BUS1_DQ);
OneWire Bus2(BUS2_DQ);
//TFT HW SPI instance
TFT_22_ILI9225 tft(TFT_RST,TFT_RS,TFT_CS,0);

//VAR

int maxtemp = 30;// Maximum temperature.

byte sensor[8][8] = {
  0x28,0xff,0xaa,0xd9,0xb2,0x17,0x04,0x44,// Bus1[sensor 1-4]
  0x28,0xff,0x98,0x07,0xb2,0x17,0x04,0x57,
  0x28,0xff,0xa5,0x2b,0xb2,0x17,0x05,0x03,
  0x28,0xff,0x4c,0xd6,0xb1,0x17,0x04,0x7c,
  0x28,0xff,0x7b,0xb2,0xb1,0x17,0x04,0x37,// Bus2[sensor 5-8]
  0x28,0xff,0x8f,0x96,0xb1,0x17,0x04,0xf0,
  0x28,0xff,0x25,0xb1,0xb1,0x17,0x04,0x88,
  0x28,0xff,0x1b,0xb0,0x70,0x16,0x05,0x43
};

//SETUP

void setup() {
  //UART
  Serial.begin(9600);
  //OneWire
  pinMode(BUS1_PWR, OUTPUT);
  digitalWrite(BUS1_PWR, HIGH);
  pinMode(BUS2_PWR, OUTPUT);
  digitalWrite(BUS2_PWR, HIGH);
  //LED
  pinMode(LED_PWR, OUTPUT);
  digitalWrite(LED_PWR, HIGH);
  pinMode(LED_ACC, OUTPUT);
  digitalWrite(LED_ACC, LOW); 
  //TFT
  tft.begin();
  tft.setOrientation(1);
  tft.setFont(Terminal6x8);
  tft.clear();
}

//MAIN

void loop() {
  float temperature;
  char msg[6], payload[48] = {};
  for (int i = 0; i < 4; i++) {
    ds_temp_request(Bus1,sensor[i]);
    temperature = ds_get_temperature(Bus1,sensor[i]);
    if ( temperature <= 0 ) { temperature = 0; }
    sprintf(msg, "S%dT%03d", i, int(temperature * 10));
    strcat(payload,msg);
    tft_update(i,temperature);
  }
  for (int i = 4; i < 8; i++) {
    ds_temp_request(Bus2,sensor[i]);
    temperature = ds_get_temperature(Bus2,sensor[i]);
    if ( temperature <= 0 ) { temperature = 0; }
    sprintf(msg, "S%dT%03d", i, int(temperature * 10));
    strcat(payload,msg);
    tft_update(i,temperature);
  }
  Serial.println(payload);
  led_flash();
  for (int i = 0; i < 74; i++) {// 5min sleep
    LowPower.powerDown(SLEEP_4S, ADC_OFF, BOD_OFF);
  }
}

//FUNC

//Blink half a sec.
void led_flash() {
  digitalWrite(LED_ACC,HIGH);
  delay(100);
  digitalWrite(LED_ACC,LOW);
}

//Bus request temperature
void ds_temp_request(OneWire &ds, byte addr[8]) {
  ds.reset();
  ds.select(addr);
  ds.write(0x44);//"Convert T".
  delay(750); //12-Bit resolution delay.
}

//Bus calculate temperature.
float ds_get_temperature(OneWire &ds, byte addr[8]) {
  byte ds_data[2];
  ds.reset();
  ds.select(addr);
  ds.write(0xbe); //"Read Scratchpad".
  ds.read_bytes(ds_data,2); //LSB & MSB
  short raw = ds_data[1] << 8 | ds_data[0]; //2-Byte to 16 bit int
  return (float)raw / 16.0; //-> int to double precission float
}

//TFT background template 52x85 square 2px spacing
void tft_rectangle(int id, float val) {
  unsigned long color;
  (val > 0 && val < maxtemp) ? color = COLOR_GREEN : color = COLOR_RED;
  if(id < 4) {
     tft.drawRectangle(2 + 2*id + 52*id, 2, 54 + 2*id + 52*id, 87, color);
     tft.drawRectangle(2 + 2*id + 52*id + 1, 3, 54 + 2*id + 52*id - 1, 86, color);
  } else {
     tft.drawRectangle(2 + 2*(id-4) + 52*(id-4), 89, 54 + 2*(id-4) + 52*(id-4), 174 , color);
     tft.drawRectangle(2 + 2*(id-4) + 52*(id-4) + 1, 90, 54 + 2*(id-4) + 52*(id-4) - 1, 173 , color);
  }
}

//TFT draw value
void tft_update(int id, float val) {
  String offset;
  String sid = String("R") + String(id + 1);
  if (val >= 0 && val < 10) { offset = String(' '); }
  String tmp = offset + String(int(val)) + String(".") + String(int(val*10) % 10);
  if (id < 4) {
      tft.drawText(21 + 2*id + 52*id, 28, sid, COLOR_WHITE);
      tft.drawText(15 + 2*id + 52*id, 53, tmp, COLOR_WHITE);
  } else {
      tft.drawText(21 + 2*(id-4) + 52*(id-4), 115, sid, COLOR_WHITE);
      tft.drawText(15 + 2*(id-4) + 52*(id-4), 140, tmp, COLOR_WHITE);
  }
  tft_rectangle(id, val);
}

