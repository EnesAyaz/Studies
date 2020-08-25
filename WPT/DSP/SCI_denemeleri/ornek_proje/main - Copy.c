//###########################################################################
//
// FILE:    Example_2837xDScia_FFDLB.c
//
// TITLE:   SCI FIFO Digital Loop Back Test.
//
//! \addtogroup cpu01_example_list
//! <h1>SCI FIFO Digital Loop Back Test (sci_looback)</h1>
//!
//!  This program uses the internal loop back test mode of the peripheral.
//!  Other then boot mode pin configuration, no other hardware configuration
//!  is required.
//!
//!  This test uses the loopback test mode of the SCI module to send
//!  characters starting with 0x00 through 0xFF.  The test will send
//!  a character and then check the receive buffer for a correct match.
//!
//!  \b Watch \b Variables \n
//!  - \b LoopCount - Number of characters sent
//!  - \b ErrorCount - Number of errors detected
//!  - \b SendChar - Character sent
//!  - \b ReceivedChar - Character received
//!
//
//###########################################################################
// $TI Release: F2837xD Support Library v210 $
// $Release Date: Tue Nov  1 14:46:15 CDT 2016 $
// $Copyright: Copyright (C) 2013-2016 Texas Instruments Incorporated -
//             http://www.ti.com/ ALL RIGHTS RESERVED $
//###########################################################################

//
// Included Files
//
#include "F28x_Project.h"
#include <math.h>

#define MFDS_LIB_CPU_FREQ   200e6
#define MFDS_THETAG              "hsrc"
#define MFDS_THETAGBYTESIZE      4
#define MFDS_SCILIBBUFFERLENGTH      256
#define MFDS_SCIARXBUFFERSIZE        256
#define MFDS_MULTIPLEFLOATARRAYSIZE (24+MFDS_THETAGBYTESIZE)


unsigned int uiSciaRxBufferIndex = 0;
unsigned char ucSciaRxBuffer[MFDS_SCIARXBUFFERSIZE];

char cTransmitSciaLibDataBuffer[MFDS_SCILIBBUFFERLENGTH];
unsigned int uiTransmitSciaLibReadFromBufferIndex = 0;
unsigned int uiTransmitSciaLibWriteToBufferIndex=0;
unsigned int uiTransmitSciaLibBufferNumberOfMessages=0;

unsigned int uiReceiveSciaLibBufferNumberOfMessages=0;
void SciaBackgroundTaskReceive(void);
void InitializeSciaRegisters(float fSciBaudRate);



//
// Main
//
void main(void)
{
    Uint16 SendChar;
    Uint16 ReceivedChar;

//
// Step 1. Initialize System Control registers, PLL, WatchDog, Clocks to
// default state:
// This function is found in the F2837xD_SysCtrl.c file.
//
    InitSysCtrl();

//
// Step 2. Initialize GPIO:
// This example function is found in the F2837xD_Gpio.c file and
// illustrates how to set the GPIO to it's default state.
//
   InitGpio();

//
// For this example, only init the pins for the SCI-A port.
//  GPIO_SetupPinMux() - Sets the GPxMUX1/2 and GPyMUX1/2 register bits
//  GPIO_SetupPinOptions() - Sets the direction and configuration of the GPIOS
// These functions are found in the F2837xD_Gpio.c file.
//
#if 0
   GPIO_SetupPinMux(28, GPIO_MUX_CPU1, 1);
   GPIO_SetupPinOptions(28, GPIO_INPUT, GPIO_PUSHPULL);
   GPIO_SetupPinMux(29, GPIO_MUX_CPU1, 1);
   GPIO_SetupPinOptions(29, GPIO_OUTPUT, GPIO_ASYNC);
#endif
//
// Step 3. Initialize PIE vector table:
// The PIE vector table is initialized with pointers to shell Interrupt
// Service Routines (ISR).  The shell routines are found in F2837xD_DefaultIsr.c.
// Insert user specific ISR code in the appropriate shell ISR routine in
// the F2837xD_DefaultIsr.c file.
//

//
// Disable and clear all CPU __interrupts:
//
    DINT;
    IER = 0x0000;
    IFR = 0x0000;

//
// Initialize Pie Control Registers To Default State:
// This function is found in the F2837xD_PieCtrl.c file.
//
// InitPieCtrl();  //PIE is not used for this example

//
// Initialize the PIE Vector Table To a Known State:
// This function is found in F2837xD_PieVect.c.
// This function populates the PIE vector table with pointers
// to the shell ISR functions found in F2837xD_DefaultIsr.c.
//
    InitPieVectTable();

//
// Enable CPU and PIE __interrupts
// This example function is found in the F2837xD_PieCtrl.c file.
//
    EnableInterrupts();

//
// Step 4. User specific functions, Reassign vectors (optional),
// Enable Interrupts:
//


    //
    // Note: Autobaud lock is not required for this example
    //

//
// Send a character starting with 0
//
    SendChar = 0;

//
// Step 5. Send Characters forever starting with 0x00 and going through
// 0xFF.  After sending each, check the receive buffer for the correct value
//
    EALLOW;
    GpioCtrlRegs.GPBGMUX1.bit.GPIO42 = 3;
    GpioCtrlRegs.GPBMUX1.bit.GPIO42 = 3;
    GpioCtrlRegs.GPBGMUX1.bit.GPIO43 = 3;
    GpioCtrlRegs.GPBMUX1.bit.GPIO43 = 3;
    EDIS;
    InitializeSciaRegisters(115200.0);
    while(1)
    {
    	SciaBackgroundTaskReceive();
    }

}
void InitializeSciaRegisters(float fSciBaudRate)
{
    float lspclkdivider = 0;
    float lspclkfreq = 0;



#define SCI_FREQ        fSciBaudRate
#define SCI_PRD         (((float)lspclkdivider)/(SCI_FREQ*8))-1

    switch(ClkCfgRegs.LOSPCP.bit.LSPCLKDIV)
    {
        case 0:
            lspclkdivider = 1;
        case 1:
            lspclkdivider = 2;
        case 2:
            lspclkdivider = 4;
        case 3:
            lspclkdivider = 6;
        case 4:
            lspclkdivider = 8;
        case 5:
            lspclkdivider = 10;
        case 6:
            lspclkdivider = 12;
        case 7:
            lspclkdivider = 14;
        default:
            lspclkdivider = 4;
    }
    lspclkfreq = ((float)MFDS_LIB_CPU_FREQ)/lspclkdivider;

   SciaRegs.SCICCR.all = 0x0007;      // 1 stop bit,  No loopback
                                      // No parity,8 char bits,
                                      // async mode, idle-line protocol
   SciaRegs.SCICTL1.all = 0x0003;     // enable TX, RX, internal SCICLK,
                                      // Disable RX ERR, SLEEP, TXWAKE
   SciaRegs.SCICTL2.bit.TXINTENA = 0;
   SciaRegs.SCICTL2.bit.RXBKINTENA = 0;
   SciaRegs.SCIHBAUD.all = 0x0000;
   SciaRegs.SCILBAUD.all = round((((float)lspclkfreq)/(fSciBaudRate*8.0))-1);
   SciaRegs.SCICCR.bit.LOOPBKENA = 0; // Enable loop back
   SciaRegs.SCIFFTX.all = 0xC022;
   SciaRegs.SCIFFRX.all = 0x0022;
   SciaRegs.SCIFFCT.all = 0x00;

   SciaRegs.SCICTL1.all = 0x0023;     // Relinquish SCI from Reset
   SciaRegs.SCIFFTX.bit.TXFIFORESET = 1;
   SciaRegs.SCIFFRX.bit.RXFIFORESET = 1;
}
void SciaBackgroundTaskTransmit(void)
{
    while ((uiTransmitSciaLibBufferNumberOfMessages > 0))
    {
        while(SciaRegs.SCIFFTX.bit.TXFFST != 16)
        {
            SciaRegs.SCITXBUF.all =
                    cTransmitSciaLibDataBuffer[uiTransmitSciaLibReadFromBufferIndex];
            uiTransmitSciaLibReadFromBufferIndex++;
            if (uiTransmitSciaLibReadFromBufferIndex == MFDS_SCILIBBUFFERLENGTH)
            {
                uiTransmitSciaLibReadFromBufferIndex = 0;
            }
            uiTransmitSciaLibBufferNumberOfMessages--;
            if(uiTransmitSciaLibBufferNumberOfMessages==0)
            {
                break;
            }
        }

    }
}

int SciaUartSend_NoInterrupt(char *BuffWriteArray, unsigned int lengthOfData)
{
    if ((uiTransmitSciaLibBufferNumberOfMessages + lengthOfData) > MFDS_SCILIBBUFFERLENGTH)
    {
        /*because the buffer is full, try again later*/
        return -1;
    }
    if ((uiTransmitSciaLibWriteToBufferIndex + lengthOfData) < MFDS_SCILIBBUFFERLENGTH)
    {
        /*if rollover won't happen, just copy inside the buffer*/
        memcpy(&cTransmitSciaLibDataBuffer[uiTransmitSciaLibWriteToBufferIndex], BuffWriteArray,
               lengthOfData);
        uiTransmitSciaLibWriteToBufferIndex += lengthOfData;
        uiTransmitSciaLibBufferNumberOfMessages += lengthOfData;
    }
    else
    {
        /*if rollover happens, deal with it nicely*/
        /*first copy the first part*/
        memcpy(&cTransmitSciaLibDataBuffer[uiTransmitSciaLibWriteToBufferIndex], BuffWriteArray,
               (MFDS_SCILIBBUFFERLENGTH - uiTransmitSciaLibWriteToBufferIndex));
        /*then copy the second part*/
        memcpy(&cTransmitSciaLibDataBuffer[0],
               BuffWriteArray
                       + (MFDS_SCILIBBUFFERLENGTH - uiTransmitSciaLibWriteToBufferIndex),
               lengthOfData
                       - (MFDS_SCILIBBUFFERLENGTH - uiTransmitSciaLibWriteToBufferIndex));
        uiTransmitSciaLibBufferNumberOfMessages += lengthOfData;
        uiTransmitSciaLibWriteToBufferIndex = lengthOfData
                - (MFDS_SCILIBBUFFERLENGTH - uiTransmitSciaLibWriteToBufferIndex);
    }
    return lengthOfData;
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
