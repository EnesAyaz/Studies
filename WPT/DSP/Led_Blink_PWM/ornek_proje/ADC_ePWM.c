#include "F28x_Project.h"
// Function Prototype
void ConfigureADC(void);
void ConfigureEPWM(void);
void SetupADCEpwm(Uint16 channel);
interrupt void adca1_isr(void);
// Defines
#define RESULTS_BUFFER_SIZE 256
// Globals
Uint16 AdcaResults_First[RESULTS_BUFFER_SIZE];
Uint16 AdcaResults_Second[RESULTS_BUFFER_SIZE];
Uint16 ePWM1_First[RESULTS_BUFFER_SIZE];
Uint16 ePWM1_Second[RESULTS_BUFFER_SIZE];
Uint16 ePWM2_First[RESULTS_BUFFER_SIZE];
Uint16 ePWM2_Second[RESULTS_BUFFER_SIZE];


Uint16 Current[RESULTS_BUFFER_SIZE];
Uint16 Voltage_L1[RESULTS_BUFFER_SIZE];
Uint16 Voltage_L2[RESULTS_BUFFER_SIZE];


Uint16 resultsIndex;
volatile Uint16 bufferFull=0;

void main(void)
{
    InitSysCtrl();
    InitGpio(); // Skipped for this example
    DINT;
    InitPieCtrl();

    IER = 0x0000;
    IFR = 0x0000;

    InitPieVectTable();

    EALLOW;
    PieVectTable.ADCA1_INT = &adca1_isr; //function for ADCA interrupt 1
    EDIS;

    ConfigureADC();

    ConfigureEPWM();

    SetupADCEpwm(1);

    IER |= M_INT1; //Enable group 1 interrupts
    EINT;  // Enable Global interrupt INTM
    ERTM;  // Enable Global realtime interrupt DBGM

//
    for(resultsIndex = 0; resultsIndex < RESULTS_BUFFER_SIZE; resultsIndex++)
    {
        AdcaResults[resultsIndex] = 0;
    }
    resultsIndex = 0;
    bufferFull = 0;
//
    PieCtrlRegs.PIEIER1.bit.INTx1 = 1;
//
    EALLOW;
    CpuSysRegs.PCLKCR0.bit.TBCLKSYNC = 1;

    //start ePWM
    //
    EPwm1Regs.ETSEL.bit.SOCAEN = 1;  //enable SOCA
    EPwm1Regs.TBCTL.bit.CTRMODE = 0; //unfreeze, and enter up count mode

//
    do
    {

        if(bufferFull==0)
        {Current=AdcaResults_Second;
        Voltage_L1=ePWM1_Second;
        Voltage_L2=ePWM2_Second;
        }
        else if ((bufferFull==1)
        {
        Current=AdcaResults_First;
        Voltage_L1=ePWM1_First;
        Voltage_L2=ePWM2_First;
        }

        Current



        //asm("   ESTOP0");
    }while(1);
}
//

void ConfigureADC(void)
{
    EALLOW;
    AdcaRegs.ADCCTL2.bit.PRESCALE = 6; //set ADCCLK divider to /4
    AdcSetMode(ADC_ADCA, ADC_RESOLUTION_12BIT, ADC_SIGNALMODE_SINGLE);
    AdcaRegs.ADCCTL1.bit.INTPULSEPOS = 1;
    AdcaRegs.ADCCTL1.bit.ADCPWDNZ = 1;
    DELAY_US(1000);
    EDIS;
}

void ConfigureEPWM(void)
{
    EALLOW;
    // Assumes ePWM clock is already enabled
    EPwm1Regs.ETSEL.bit.SOCAEN    = 0;    // Disable SOC on A group
    EPwm1Regs.ETSEL.bit.SOCASEL    = 4;   // Select SOC on up-count
    EPwm1Regs.ETPS.bit.SOCAPRD = 1;       // Generate pulse on 1st event
    EPwm1Regs.CMPA.bit.CMPA =25;     // Set compare A value to 2048 counts
    EPwm1Regs.TBPRD = 50;             // Set period to 4096 counts
    EPwm1Regs.TBCTL.bit.CTRMODE = 3;      // freeze counter
    EDIS;
}
//
void SetupADCEpwm(Uint16 channel)
{
    Uint16 acqps;
    if(ADC_RESOLUTION_12BIT == AdcaRegs.ADCCTL2.bit.RESOLUTION)
    {
        acqps = 14; //75ns
    }
    else //resolution is 16-bit
    {
        acqps = 63; //320ns
    }

    //
    EALLOW;
    AdcaRegs.ADCSOC0CTL.bit.CHSEL = channel;  //SOC0 will convert pin A0
    AdcaRegs.ADCSOC0CTL.bit.ACQPS = acqps; //sample window is 100 SYSCLK cycles
    AdcaRegs.ADCSOC0CTL.bit.TRIGSEL = 5; //trigger on ePWM1 SOCA/C
    AdcaRegs.ADCINTSEL1N2.bit.INT1SEL = 0; //end of SOC0 will set INT1 flag
    AdcaRegs.ADCINTSEL1N2.bit.INT1E = 1;   //enable INT1 flag
    AdcaRegs.ADCINTFLGCLR.bit.ADCINT1 = 1; //make sure INT1 flag is cleared
    EDIS;
}

interrupt void adca1_isr(void)
{
    if (bufferFull==0)
    {
    AdcaResults_First[resultsIndex++] = AdcaResultRegs.ADCRESULT0;
    if(RESULTS_BUFFER_SIZE <= resultsIndex)
    {
        resultsIndex = 0;
        bufferFull = 1;

    }
    // burada ayni zamanda PWM degerlerini almak lazim

    }
    else if (bufferFull==1)

      AdcaResults_Second[resultsIndex++] = AdcaResultRegs.ADCRESULT0;
      if(RESULTS_BUFFER_SIZE <= resultsIndex)
      {
          resultsIndex = 0;
          bufferFull = 1;
      }



    AdcaRegs.ADCINTFLGCLR.bit.ADCINT1 = 1; //clear INT1 flag
    PieCtrlRegs.PIEACK.all = PIEACK_GROUP1;
}

