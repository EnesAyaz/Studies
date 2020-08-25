
#include "F28x_Project.h"

//
// Function Prototypes
//



void spi_init(void);






void spi_init()
{
       // Initialize SPI-A
       // Set reset low before configuration changes
       // Clock polarity (0 == rising, 1 == falling)
       // 16-bit character
       // Enable loop-back
       SpiaRegs.SPICCR.bit.SPISWRESET = 0;
       SpiaRegs.SPICCR.bit.CLKPOLARITY = 0;
       SpiaRegs.SPICCR.bit.SPICHAR = (16-1);
       SpiaRegs.SPICCR.bit.SPILBK = 1;

       // Enable master (0 == slave, 1 == master)
       // Enable transmission (Talk)
       // Clock phase (0 == normal, 1 == delayed)
       // SPI interrupts are disabled
       SpiaRegs.SPICTL.bit.MASTER_SLAVE = 1;
       SpiaRegs.SPICTL.bit.TALK = 1;
       SpiaRegs.SPICTL.bit.CLK_PHASE = 0;
       SpiaRegs.SPICTL.bit.SPIINTENA = 0;


       //clear SPI flags Overurn_flag, int_flag ???

       // Set the baud rate

       SpiaRegs.SPIBRR.bit.SPI_BIT_RATE = SPI_BRR;

       // Set FREE bit
       // Halting on a breakpoint will not halt the SPI
       SpiaRegs.SPIPRI.bit.FREE = 1;

       // Release the SPI from reset
       SpiaRegs.SPICCR.bit.SPISWRESET = 1;

}

void spi_a_GPIO()
{
   EALLOW;

    //
    // Enable internal pull-up for the selected pins
    //
    // Pull-ups can be enabled or disabled by the user.
    // This will enable the pullups for the specified pins.
    // Comment out other unwanted lines.
    //
    GpioCtrlRegs.GPAPUD.bit.GPIO16 = 0;  // Enable pull-up on GPIO16 (SPISIMOA)
//  GpioCtrlRegs.GPAPUD.bit.GPIO5 = 0;   // Enable pull-up on GPIO5 (SPISIMOA)
    GpioCtrlRegs.GPAPUD.bit.GPIO17 = 0;  // Enable pull-up on GPIO17 (SPISOMIA)
//  GpioCtrlRegs.GPAPUD.bit.GPIO3 = 0;   // Enable pull-up on GPIO3 (SPISOMIA)
    GpioCtrlRegs.GPAPUD.bit.GPIO18 = 0;  // Enable pull-up on GPIO18 (SPICLKA)
    GpioCtrlRegs.GPAPUD.bit.GPIO19 = 0;  // Enable pull-up on GPIO19 (SPISTEA)

    //
    // Set qualification for selected pins to asynch only
    //
    // This will select asynch (no qualification) for the selected pins.
    // Comment out other unwanted lines.
    //
    GpioCtrlRegs.GPAQSEL2.bit.GPIO16 = 3; // Asynch input GPIO16 (SPISIMOA)
//  GpioCtrlRegs.GPAQSEL1.bit.GPIO5 = 3;  // Asynch input GPIO5 (SPISIMOA)
    GpioCtrlRegs.GPAQSEL2.bit.GPIO17 = 3; // Asynch input GPIO17 (SPISOMIA)
//  GpioCtrlRegs.GPAQSEL1.bit.GPIO3 = 3;  // Asynch input GPIO3 (SPISOMIA)
    GpioCtrlRegs.GPAQSEL2.bit.GPIO18 = 3; // Asynch input GPIO18 (SPICLKA)
    GpioCtrlRegs.GPAQSEL2.bit.GPIO19 = 3; // Asynch input GPIO19 (SPISTEA)

    //
    //Configure SPI-A pins using GPIO regs
    //
    // This specifies which of the possible GPIO pins will be SPI functional
    // pins.
    // Comment out other unwanted lines.
    //
    GpioCtrlRegs.GPAMUX2.bit.GPIO16 = 1; // Configure GPIO16 as SPISIMOA
//  GpioCtrlRegs.GPAMUX1.bit.GPIO5 = 2;  // Configure GPIO5 as SPISIMOA
    GpioCtrlRegs.GPAMUX2.bit.GPIO17 = 1; // Configure GPIO17 as SPISOMIA
//  GpioCtrlRegs.GPAMUX1.bit.GPIO3 = 2;  // Configure GPIO3 as SPISOMIA
    GpioCtrlRegs.GPAMUX2.bit.GPIO18 = 1; // Configure GPIO18 as SPICLKA
    GpioCtrlRegs.GPAMUX2.bit.GPIO19 = 1; // Configure GPIO19 as SPISTEA

    EDIS;
}
