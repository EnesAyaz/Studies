
// Included Files
//
#include "F28x_Project.h"
#include <math.h>



#define MFDS_SCIARXBUFFERSIZE        256


unsigned int uiSciaRxBufferIndex = 0;
unsigned char ucSciaRxBuffer[MFDS_SCIARXBUFFERSIZE];

unsigned int uiReceiveSciaLibBufferNumberOfMessages=0;

void SciaBackgroundTaskReceive(void);
void InitializeSciaRegisters();


//
// Main
//
void main(void)
{
    Uint16 SendChar;
    Uint16 ReceivedChar;

InitSysCtrl();
//
   InitGpio();

#if 0
  GPIO_SetupPinMux(18, GPIO_MUX_CPU1, 1);
  GPIO_SetupPinOptions(18, GPIO_INPUT, GPIO_PUSHPULL);
  GPIO_SetupPinMux(19, GPIO_MUX_CPU1, 1);
  GPIO_SetupPinOptions(19, GPIO_OUTPUT, GPIO_ASYNC);
#endif

  //
  EALLOW;
  GpioCtrlRegs.GPBGMUX1.bit.GPIO42 = 3;
  GpioCtrlRegs.GPBMUX1.bit.GPIO42 = 3;
  GpioCtrlRegs.GPBGMUX1.bit.GPIO43 = 3;
  GpioCtrlRegs.GPBMUX1.bit.GPIO43 = 3;
  EDIS;




    DINT;
    IER = 0x0000;
    IFR = 0x0000;

    InitPieVectTable();
    EnableInterrupts();

    InitializeSciaRegisters();


    while(1)
    {
    	SciaBackgroundTaskReceive();
    }

}
void InitializeSciaRegisters()
{

   SciaRegs.SCICCR.all = 0x0007;      // 1 stop bit,  No loopback
                                      // No parity,8 char bits,
                                      // async mode, idle-line protocol
   SciaRegs.SCICTL1.all = 0x0003;     // enable TX, RX, internal SCICLK,
                                      // Disable RX ERR, SLEEP, TXWAKE
   SciaRegs.SCICTL2.bit.TXINTENA = 0;
   SciaRegs.SCICTL2.bit.RXBKINTENA = 0;


   SciaRegs.SCIHBAUD.all = 0x0002;
   SciaRegs.SCILBAUD.all = 0x008B;

   SciaRegs.SCICCR.bit.LOOPBKENA = 0; // Enable loop back
   SciaRegs.SCIFFTX.all = 0xC022;
   SciaRegs.SCIFFRX.all = 0x0022;
   SciaRegs.SCIFFCT.all = 0x00;

   SciaRegs.SCICTL1.all = 0x0023;     // Relinquish SCI from Reset
   SciaRegs.SCIFFTX.bit.TXFIFORESET = 1;
   SciaRegs.SCIFFRX.bit.RXFIFORESET = 1;
}



void SciaBackgroundTaskReceive(void)
{
    while ((uiReceiveSciaLibBufferNumberOfMessages < MFDS_SCIARXBUFFERSIZE))
    {
        while(SciaRegs.SCIFFRX.bit.RXFFST != 0)
        {
        	ucSciaRxBuffer[uiSciaRxBufferIndex] = SciaRegs.SCIRXBUF.all;
        	uiSciaRxBufferIndex++;
        	if(uiSciaRxBufferIndex>=MFDS_SCIARXBUFFERSIZE)
        	{
        		uiSciaRxBufferIndex = 0;
        	}
        	uiReceiveSciaLibBufferNumberOfMessages++;
        	if(uiReceiveSciaLibBufferNumberOfMessages==MFDS_SCIARXBUFFERSIZE)
        	{
        		break;
        	}
        }

    }
}
