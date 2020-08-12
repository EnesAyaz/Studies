#include <F2837xD_Device.h>
#include <F2837xD_Examples.h>


// This code is created to blink a led

#define BLINKY_LED_GPIO    31

#define LED_1    1

#define LED_2    2


#define PERIOD_LED  2000 // period of led in ms


#define DUTY_LED 0.25  // duty of Led between 0-1

void main(void)
{

    InitSysCtrl(); // Initialize System Control : PLL, WatchDog, enable Peripheral Clocks

    InitGpio();  //Initialize GPIO:

    GPIO_SetupPinMux(BLINKY_LED_GPIO, GPIO_MUX_CPU1, 0);
    GPIO_SetupPinOptions(BLINKY_LED_GPIO, GPIO_OUTPUT, GPIO_PUSHPULL);

    GPIO_SetupPinMux(LED_1, GPIO_MUX_CPU1, 0);
    GPIO_SetupPinOptions(LED_1, GPIO_OUTPUT, GPIO_PUSHPULL);

    GPIO_SetupPinMux(LED_2, GPIO_MUX_CPU1, 0);
    GPIO_SetupPinOptions(LED_2, GPIO_OUTPUT, GPIO_PUSHPULL);

    DINT; // Disable CPU interrupts

    InitPieCtrl(); // initialize the PIE control registers to their default state.

    IER = 0x0000; // Disable CPU interrupts and clear all CPU interrupt flags:
    IFR = 0x0000;

    InitPieVectTable(); // Initialize the PIE vector table with pointers to the shell Interrupt

    EINT;  // Enable Global interrupt INTM
    ERTM;  // Enable Global realtime interrupt DBGM

    // IDLE loop. Just sit and loop forever

    for(;;)
      {
          //
          // Turn on LED BlINKY, Turn off LED_1
          //
          GPIO_WritePin(BLINKY_LED_GPIO, 0);
          GPIO_WritePin(LED_1, 0);

          //
          // Delay for a bit.
          //
          DELAY_US(1000*PERIOD_LED*(1-DUTY_LED));

          //
          // Turn off LED BLINKY, , Turn on LED_1
          //
          GPIO_WritePin(BLINKY_LED_GPIO, 1);
          GPIO_WritePin(LED_1, 1);

          //
          // Delay for a bit.
          //
          DELAY_US(1000*PERIOD_LED*DUTY_LED);
      }
  }

