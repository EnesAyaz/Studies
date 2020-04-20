const int Button = 4; 
int Buttonstate=0;
int LED = 3;
int PIN_HIGH=9;
float val=0;

void setup() {

  Serial.begin(9600);           //  setup serial
  // initialize digital pin LED_BUILTIN as an output.
  pinMode(LED_BUILTIN, OUTPUT);
  pinMode(Button, INPUT);
  pinMode(LED, OUTPUT);
  pinMode(PIN_HIGH, OUTPUT);
  pinMode(A1, OUTPUT);
  pinMode(A5, OUTPUT);
  pinMode(A3, INPUT);
}

// the loop function runs over and over again forever
void loop() {

  digitalWrite(PIN_HIGH, HIGH);
  Buttonstate = digitalRead(Button);
  digitalWrite(LED_BUILTIN, LOW);
  digitalWrite(LED, LOW);
  digitalWrite(A1, LOW);
  digitalWrite(A5, HIGH);
  delay(2000);
  if (Buttonstate == HIGH)  // Condition to check button input
    {
      digitalWrite(LED_BUILTIN, HIGH);
      digitalWrite(LED, HIGH);
      val = analogRead(A3);  // read the input pin
      Serial.println(val);          // debug value
      delay((val/1023)*2000);
    }
    else
    {
      digitalWrite(LED, LOW);
      digitalWrite(LED_BUILTIN, LOW);
    }
  
}
