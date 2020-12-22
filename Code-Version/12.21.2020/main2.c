#include <F2837xD_Device.h>
#include <F2837xD_Examples.h>
#include <math.h>

// Bu kodda sadece 4 tane PWM olusturuluyor. Bunlar sabit frekans ve duty de. dead time var ama ayarli degil tam olarak. 

// Fonksiyonlarýn temelleri
void EPwm1(void); // Complementary 2 tane pwm üretiliyor. Bu üretilen iki pwm her zaman sabit. EPWM2A ise bunlara göre deðiþiyor. 1. leg pwmleri
void EPwm2(void); // Complementary 2 tane pwm üretiliyor. Bu 2PWM frequency veya phase e göre EWPM1 e göre deðiþiyor.
void ConfigureGPIO(void);// GPIO pinlerinin ayarlarýný yapýyorum.
/////////////////////////////////////////////////////////////////////////////////////////////////////
/////////////////////////////////////////////////////////////////////////////////////////////////////
//DEFINITIONS
//Led definitions
//System Definitions
#define sysclk_frequency    200000000   // Hz
#define sysclk_period       5               // ns
#define pwmclk_frequency    200000000   // Hz
#define pwmclk_period       5               // ns
#define PI                  3.141592654 //Burayý defineladým ama henüz kullanmayacaðým çünkü bilmiyorum.
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

int main(void)
{    InitSysCtrl();
     InitPieCtrl();  /*initialize the PIE table (interrupt related)*/

    EALLOW;
    ClkCfgRegs.PERCLKDIVSEL.bit.EPWMCLKDIV = 0; // EPWM Clock Divide Select: /1 of PLLSYSCLK
    EDIS;

    IER = 0x0000;   /*clear the Interrupt Enable Register   (IER)*/
    IFR = 0x0000;   /*clear the Interrupt Flag Register     (IFR)*/
    InitPieVectTable();
    EALLOW;
    CpuSysRegs.PCLKCR0.bit.TBCLKSYNC = 0;   /*stop the TimeBase clock for later synchronization*/
    CpuSysRegs.PCLKCR0.bit.GTBCLKSYNC = 0;  /*stop the global TimeBase clock for later synchronization*/
    EDIS;

   InitCpuTimers(); // CPU timerlarý aktifleþtiriliyor.
   ConfigCpuTimer(&CpuTimer0, 200, 10); //1 seconds
   CpuTimer0Regs.TCR.all = 0x4000; // enable cpu timer interrupt
   EALLOW;//
   EDIS;
   EALLOW;
   ClkCfgRegs.PERCLKDIVSEL.bit.EPWMCLKDIV = 0; // EPWM Clock Divide Select: /1 of PLLSYSCLK
   EDIS;

    IER |= M_INT1;  /*PIE Vectorlerinden ilk row'u aktif ediyorum. Referans Manual 96. sayfaya bakabilirsiniz. ADCA1 ve Timer0 Interruptlarý burada*/
    PieCtrlRegs.PIECTRL.bit.ENPIE = 1;  // Enable the PIE block

    EALLOW;
    CpuSysRegs.PCLKCR2.bit.EPWM1 = 1; // Furkan K. ekle dedi ama bence gerek yok.
    CpuSysRegs.PCLKCR2.bit.EPWM2 = 1; // Furkan K. ekle dedi ama bence gerek yok.
    CpuSysRegs.PCLKCR2.bit.EPWM3 = 1; // Furkan K. ekle dedi ama bence gerek yok.
    CpuSysRegs.PCLKCR0.bit.TBCLKSYNC = 1;   /*start the TimeBase clock */
    CpuSysRegs.PCLKCR0.bit.GTBCLKSYNC = 1;  /*start the global TimeBase clock */
    EDIS;
    EINT;  // Enable Global interrupt INTM
    ERTM;  // Enable Global realtime interrupt DBGM

    ConfigureGPIO();
    EPwm1();
    EPwm2();

  while(1)
  {


 }
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
    EDIS;
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

