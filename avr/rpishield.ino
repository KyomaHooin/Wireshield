//
// RPi OneWire Shield 
//

#include<SPI.h>
#include<OneWire.h>
#include<TFT_22_ILI9225.h>

#define BUS1_PWR A0
#define BUS1_DQ  A1
#define BUS2_PWR A2
#define BUS2_DQ  A3
#define TFT_RST  8 // TFT RST
#define TFT_RS   9 // TFT D/C
#define TFT_CS   10// SPI SS
#define TFT_SDI  11// SPI MOSI
#define TFT_CLK  13// SPI SCK
#define LED_ACC  A4
#define LED_PWR  A5

//OneWire instace
OneWire Bus1(BUS1_DQ);
OneWire Bus2(BUS2_DQ);
//TFT HW SPI instance
TFT_22_ILI9225 tft(TFT_RST,TFT_RS,TFT_CS,0);

//VAR

byte sensor[8][8] = {
  0x7C000040041BA828,
  0x6B0000400429CC28,
  0x8700004004D8D428,
  0x8700004004D8D428,
  0x5D0000400408A928,
  0x6B0000400429CC28,
  0x5D0000400408A928,
  0x8700004004D8D428
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
  tft_draw_background();
}

//MAIN

void loop() {
  float temperature;
  char msg[6], payload[48];

  for (int i = 0; i < 4; i++) {
    digitalWrite(LED_ACC, HIGH);
    ds_temp_request(Bus1,sensor[i]);
    temperature = ds_get_temperature(Bus1,sensor[i]);
    *payload += sprintf(msg, "S%uT%03d", i, temperature * 10);
    tft_update(i,temperature);
    digitalWrite(LED_ACC, LOW);
  }
  for (int i = 4; i < 8; i++) {
    digitalWrite(LED_ACC, HIGH);
    ds_temp_request(Bus2,sensor[i]);
    temperature = ds_get_temperature(Bus2,sensor[i]);
    *payload += sprintf(msg, "S%uT%03d", i, temperature * 10);
    tft_update(i,temperature);
    digitalWrite(LED_ACC, LOW);
  }
  Serial.println(payload);
  delay(50000);// hang for 5 min. sleep?
}

//FUNC

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
  ds.write(0xBE); //"Read Scratchpad".
  ds.read_bytes(ds_data,2); //LSB & MSB
  short raw = ds_data[1] << 8 | ds_data[0]; //2-Byte to 16 bit int
  return (float)raw / 16.0; //-> int to double precission float
}

//TFT background template
void tft_draw_background() {
  tft.clear();
  tft.setBackgroundColor(COLOR_BLACK);
  tft.drawRectangle(5,5,305,235,COLOR_WHITE);
  for (int i = 0; i < 8; i++) {
    tft.drawText(10 * i, 20, "HODNOTA: ", COLOR_WHITE);
  }
}

//TFT draw value
void tft_update(int id, float val) {
  tft.setFont(Terminal6x8);
  tft.drawText(10 * id, 40, String(val), COLOR_WHITE);
}

