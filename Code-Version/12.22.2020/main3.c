#include <F2837xD_Device.h>
#include <F2837xD_Examples.h>
#include <math.h>

__interrupt void epwm3_isr(void);       /*prototype of the ISR functions*/
void InitializeEpwm3Registers();        /*prototype of epwm1 initialization function*/
void EPwm1(void); // Complementary 2 tane pwm üretiliyor. Bu üretilen iki pwm her zaman sabit. EPWM2A ise bunlara göre deðiþiyor. 1. leg pwmleri
void EPwm2(void); // Complementary 2 tane pwm üretiliyor. Bu 2PWM frequency veya phase e göre EWPM1 e göre deðiþiyor.
void ConfigureGPIO(void);// GPIO pinlerinin ayarlarýný yapýyorum.

/**
 * main.c
 */

//DEFINITIONS
//Led definitions
#define ON_LED GPIO24  // Devre çalýþtýðýnda GPIO24 yansýn.
//System Definitions
#define sysclk_frequency    200000000   // Hz
#define sysclk_period       5               // ns
#define pwmclk_frequency    200000000   // Hz
#define pwmclk_period       5               // ns
//#define PI                  3.141592654 //Burayý defineladým ama henüz kullanmayacaðým çünkü bilmiyorum.
//Switching Definitions
#define switching_frequency 20000 // Switching frequency 150khz olarak seçildi.
#define switching_period 6666 //ns
#define dead_time 300 //Dead time 100ns seçildi.
//Control mode selection
// Birini 1 yaparken öbürünü 0 yapmayý unutma
#define FREQCONT 1 // 1 olunca Frequency Control
/////////////////////////////////////////////////////////////////////////////////////////////////////
//VARIABLES
//////////BT Variables
float Epwm3Counter = 0;
float pos_com=0;
float neg_com=0;
float PI=3.141592654;

int main(void)
{

    InitSysCtrl();  /*initialize the peripheral clocks*/

    EALLOW;
    ClkCfgRegs.PERCLKDIVSEL.bit.EPWMCLKDIV = 0; // EPWM Clock Divide Select: /1 of PLLSYSCLK
    EDIS;

    InitPieCtrl();  /*initialize the PIE table (interrupt related)*/
    IER = 0x0000;   /*clear the Interrupt Enable Register   (IER)*/
    IFR = 0x0000;   /*clear the Interrupt Flag Register     (IFR)*/
    InitPieVectTable();

    EALLOW;
    CpuSysRegs.PCLKCR0.bit.TBCLKSYNC = 0;   /*stop the TimeBase clock for later synchronization*/
    CpuSysRegs.PCLKCR0.bit.GTBCLKSYNC = 0;  /*stop the global TimeBase clock for later synchronization*/
    EDIS;

    /*Initialize cpu timers*/
    InitCpuTimers();
    ConfigCpuTimer(&CpuTimer0, 200, 1000000); //1 seconds
    ConfigCpuTimer(&CpuTimer1, 200, 1000000); //1 seconds
    ConfigCpuTimer(&CpuTimer2, 200, 1000000); //1 seconds
    CpuTimer0Regs.TCR.all = 0x4000; // enable cpu timer interrupt
    CpuTimer1Regs.TCR.all = 0x4000; // enable cpu timer interrupt
    CpuTimer2Regs.TCR.all = 0x4000; // enable cpu timer interrupt

    InitializeEpwm3Registers();

    ConfigureGPIO();
    EPwm1();
    EPwm2();


    EALLOW;
    PieVectTable.EPWM3_INT = &epwm3_isr;        /*specify the interrupt service routine (ISR) address to the PIE table*/
    EDIS;
    IER |= M_INT3;  /*Enable the PIE group of Epwm3 interrupt*/
    PieCtrlRegs.PIECTRL.bit.ENPIE = 1;  // Enable the PIE block
    PieCtrlRegs.PIEIER3.bit.INTx3 = 1;  /*Enable the 1st interrupt of the Group 3, which is for epwm1 interrupt*/

    EALLOW;
    CpuSysRegs.PCLKCR0.bit.TBCLKSYNC = 1;   /*start the TimeBase clock */
    CpuSysRegs.PCLKCR0.bit.GTBCLKSYNC = 1;  /*start the global TimeBase clock */
    EDIS;

    EINT;  // Enable Global interrupt INTM
    ERTM;  // Enable Global realtime interrupt DBGM



    while(1)
    {

    }
	return 0;
}


void InitializeEpwm3Registers()
{
    EPwm3Regs.TBCTL.all = 0x00;
    EPwm3Regs.TBCTL.bit.CTRMODE = TB_COUNT_UPDOWN;  // Set counter to be up-down

    /*These bits select the time base clock pre-scale value (TBCLK = EPWMCLK/(HSPCLKDIV * CLKDIV):*/
    EPwm3Regs.TBCTL.bit.CLKDIV = TB_DIV1;
    EPwm3Regs.TBCTL.bit.HSPCLKDIV = TB_DIV1;


   // EPwm3Regs.TBPRD = (200000000) / (10000) /2;  /*period is set to be 10khz (for up down count)*/
    EPwm3Regs.TBPRD = (20000000) / (10000) /2;  /*period is set to be 10khz (for up down count)*/

    EPwm3Regs.CMPCTL.all = 0x00;
    EPwm3Regs.CMPCTL.bit.SHDWAMODE = 1;         //only active registers are used

    EPwm3Regs.AQCTLA.all = 0x00;
    EPwm3Regs.AQCTLA.bit.CAU = AQ_SET;      //set high
    EPwm3Regs.AQCTLA.bit.CAD = AQ_CLEAR;    //set low

    EPwm3Regs.CMPA.bit.CMPA = EPwm3Regs.TBPRD / 2;    // Set compare A value

    EPwm3Regs.ETSEL.all = 0x00;
    EPwm3Regs.ETSEL.bit.INTSEL = 1; // When TBCTR == 0
    EPwm3Regs.ETSEL.bit.INTEN = 1;  // Enable INT
    EPwm3Regs.ETPS.all = 0x00;
    EPwm3Regs.ETPS.bit.INTPRD = 1;  // Generate INT on first event

    EALLOW;
    GpioCtrlRegs.GPAPUD.bit.GPIO4 = 1;    // Disable pull-up on GPIO0 (EPWM1A)
    GpioCtrlRegs.GPAPUD.bit.GPIO5 = 1;    // Disable pull-up on GPIO1 (EPWM1B)
    GpioCtrlRegs.GPAGMUX1.bit.GPIO4 = 0;  // Configure GPIO0 as EPWM1A
    GpioCtrlRegs.GPAGMUX1.bit.GPIO5 = 0;  // Configure GPIO1 as EPWM1B
    GpioCtrlRegs.GPAMUX1.bit.GPIO4 = 1;   // Configure GPIO0 as EPWM1A
    GpioCtrlRegs.GPAMUX1.bit.GPIO5 = 1;   // Configure GPIO1 as EPWM1B
    EDIS;


}

void ConfigureGPIO(void) //GPIO pinleri aktileþtiriliyor.
{
EALLOW;
///////PWM GPIO Definitions
    GpioCtrlRegs.GPAPUD.bit.GPIO0=1; // pull-up disable
    GpioCtrlRegs.GPAGMUX1.bit.GPIO0=0;
    GpioCtrlRegs.GPAMUX1.bit.GPIO0=1; //Epwm1A gpio0 secildi

    GpioCtrlRegs.GPAPUD.bit.GPIO1=1; // pull-up disable
    GpioCtrlRegs.GPAGMUX1.bit.GPIO1=0;
    GpioCtrlRegs.GPAMUX1.bit.GPIO1=1; //Epwm1B gpio1 secildi

    GpioCtrlRegs.GPAPUD.bit.GPIO2=1; // pull-up disable
    GpioCtrlRegs.GPAGMUX1.bit.GPIO2=0;
    GpioCtrlRegs.GPAMUX1.bit.GPIO2=1; //Epwm2A gpio0 secildi

    GpioCtrlRegs.GPAPUD.bit.GPIO3=1; // pull-up disable
    GpioCtrlRegs.GPAGMUX1.bit.GPIO3=0;
    GpioCtrlRegs.GPAMUX1.bit.GPIO3=1; //Epwm2B gpio3 secildi



    GpioCtrlRegs.GPAPUD.bit.ON_LED=1;
     GpioCtrlRegs.GPAGMUX2.bit.ON_LED=0;
     GpioCtrlRegs.GPAMUX2.bit.ON_LED=0; //System ON ledi aktifleþtirildi
     GpioCtrlRegs.GPADIR.bit.ON_LED=1; // System ON GPIOsu output olarak seçildi.



EDIS;
}

void EPwm1(void)
{
    EALLOW;
    EPwm1Regs.TBCTL.all = 0x00;
    EPwm1Regs.TBCTL.bit.CTRMODE = TB_COUNT_UPDOWN;  // Set counter to be up-down
    EPwm1Regs.TBCTL.bit.CLKDIV = 0;
    EPwm1Regs.TBCTL.bit.HSPCLKDIV =0;
    EPwm1Regs.TBPRD = pwmclk_frequency/switching_frequency/2;  /*period is set to be 10khz (for up down count)*/

    EPwm1Regs.CMPCTL.all = 0x00;
    EPwm1Regs.CMPCTL.bit.SHDWAMODE = CC_SHADOW;         //only active registers are used
    EPwm1Regs.CMPCTL.bit.LOADAMODE = CC_CTR_ZERO;
    EPwm1Regs.CMPCTL.bit.SHDWBMODE = 1;
    EPwm1Regs.CMPCTL.bit.LOADBMODE = CC_CTR_ZERO;

    EPwm1Regs.CMPA.bit.CMPA = EPwm1Regs.TBPRD / 2; //EPWM1A için seçildi
    EPwm1Regs.CMPB.bit.CMPB = EPwm1Regs.TBPRD / 2; //EPWM1B için seçildi

    EPwm1Regs.AQCTLA.all = 0x00;
    EPwm1Regs.AQCTLA.bit.CAU = AQ_SET;      //set high
    EPwm1Regs.AQCTLA.bit.CAD = AQ_CLEAR;    //Set low

    EPwm1Regs.AQCTLB.all = 0x00;
    EPwm1Regs.AQCTLB.bit.CAU = AQ_CLEAR;      //set low
    EPwm1Regs.AQCTLB.bit.CAD = AQ_SET;    //Set high

    EPwm1Regs.DBCTL.bit.OUT_MODE = 3;
    EPwm1Regs.DBCTL.bit.POLSEL = 2;
    EPwm1Regs.DBFED.bit.DBFED = dead_time / pwmclk_period;
    EPwm1Regs.DBRED.bit.DBRED = dead_time / pwmclk_period;
    EPwm1Regs.DBCTL2.all = 0x00;


    EPwm1Regs.TBCTL.bit.PHSEN = 0;
    EPwm1Regs.TBCTL.bit.SYNCOSEL = TB_CTR_ZERO; //SYNCOUT
    EDIS;
}

void EPwm2(void)
{

    EALLOW;
    EPwm2Regs.TBCTL.all = 0;
    EPwm2Regs.TBCTL.bit.CLKDIV =0;  // CLKDIV = 1
    EPwm2Regs.TBCTL.bit.HSPCLKDIV =0;   // HSPCLKDIV = 1
    EPwm2Regs.TBCTL.bit.CTRMODE = TB_COUNT_UPDOWN;  // up - down mode
    EPwm2Regs.TBCTL.bit.PHSEN = 1;      // enable phase shift for ePWM2
    EPwm2Regs.CMPCTL.all = 0x00;
    EPwm2Regs.CMPCTL.bit.SHDWAMODE = CC_SHADOW;         //only active registers are used
    EPwm2Regs.CMPCTL.bit.LOADAMODE = CC_CTR_ZERO;
    EPwm2Regs.CMPCTL.bit.SHDWBMODE = 1;
    EPwm2Regs.CMPCTL.bit.LOADBMODE = CC_CTR_ZERO;
    EPwm2Regs.AQCTLA.bit.CAU = AQ_SET;      //set high
    EPwm2Regs.AQCTLA.bit.CAD = AQ_CLEAR;    // Set low
    EPwm2Regs.AQCTLB.bit.CAU = AQ_CLEAR;    //set low
    EPwm2Regs.AQCTLB.bit.CAD = AQ_SET;      //set high
    EPwm2Regs.DBCTL.bit.OUT_MODE = 3;
    EPwm2Regs.DBCTL.bit.POLSEL = 2;
    EPwm2Regs.DBFED.bit.DBFED = dead_time / pwmclk_period;
    EPwm2Regs.DBRED.bit.DBRED = dead_time / pwmclk_period;
    EPwm2Regs.DBCTL2.all = 0x00;
    EPwm2Regs.TBCTL.bit.SYNCOSEL =  TB_SYNC_IN;
    EPwm2Regs.TBCTL.bit.PHSDIR = TB_DOWN;
    EPwm2Regs.TBPRD =(pwmclk_frequency)/(switching_frequency)/2;            // 10KHz - PWM signal
    EPwm2Regs.CMPA.bit.CMPA = EPwm2Regs.TBPRD/2; // EPWM2A için %50duty
    EPwm2Regs.CMPB.bit.CMPB = EPwm2Regs.TBPRD/2; // EPWM2B için %50duty
    #if FREQCONT
    EPwm2Regs.TBPHS.bit.TBPHS= 0;   // 1/3 phase shift
  	#endif
    EDIS;
}

__interrupt void epwm3_isr(void)
{
	  GpioDataRegs.GPATOGGLE.bit.ON_LED=1;
	  Epwm3Counter=Epwm3Counter+(PI/1000);
	  Epwm3Counter=fmodf(Epwm3Counter,2*PI);
	 /* if (Epwm3Counter>=2*PI)
		  {Epwm3Counter=Epwm3Counter-(2*PI);} */

	  pos_com= 0.5*(cosf(Epwm3Counter)+1)/2;
	  neg_com= 0.5*(1-cosf(Epwm3Counter))/2;

	  EPwm1Regs.CMPA.bit.CMPA = (EPwm1Regs.TBPRD)* pos_com; //EPWM1A için seçildi
	  EPwm1Regs.CMPB.bit.CMPB = (EPwm1Regs.TBPRD)* pos_com; //EPWM1A için seçildi

	  EPwm2Regs.CMPA.bit.CMPA = (EPwm2Regs.TBPRD)* neg_com; //EPWM1A için seçildi
	  EPwm2Regs.CMPB.bit.CMPB = (EPwm2Regs.TBPRD)*neg_com; //EPWM1A için seçildi


    EPwm3Regs.ETCLR.bit.INT = 1;
    // Acknowledge this interrupt to receive more interrupts from group 3
    PieCtrlRegs.PIEACK.all = PIEACK_GROUP3;
}
