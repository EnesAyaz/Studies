#include <F2837xD_Device.h>
#include <math.h>
#include <F2837xD_Examples.h>



/*Constant definitions*/
#define UNIPOLAR 1
#define BIPOLAR 1-UNIPOLAR
#define PI 					          3.141592654
#define SYSTEMCLOCKFREQUENCY 	200000000	  // Hz
#define SYSTEMCLOCKPERIOD 		5				    // ns
#define MOTORFREQUENCY        50         // Hz			/*need to define this as constant value rather than macro, for control loop*/

#if UNIPOLAR
#define SWITCHINGFREQUENCY    20000         // Hz
#endif

#if BIPOLAR  // also change PWM's
#define SWITCHINGFREQUENCY    40000         // Hz
#endif


#define LOOPFREQUENCY    100000         // Hz
#define DEADTIME 			        2000	 			// ns
#define OPENLOOPCONTROLMODE 	1
#define CONTROLMODE           0 //OPENLOOPCONTROLMODE //OPENLOOPCONTROLMODE /*Use this to define the control mode each time*/

/*External functions*/
extern void InitSysCtrl(void);
extern void InitPieCtrl(void);
extern void InitPieVectTable(void);
extern void InitCpuTimers(void);
extern void ConfigCpuTimer(struct CPUTIMER_VARS *, float, float);
extern void InitAdc(void);
extern void InitPeripheralClocks(void);
extern int16 GetTemperatureC(int16);
extern void InitTempSensor(float32);

/*Setup functions*/
void GPIOSetup();
void EPWM1Setup(); // Phase-A
void EPWM2Setup(); // Phase-B



/*Interrupt functions*/
__interrupt void cpu_timer0_isr(void);



/*Variables: Open Loop Control*/
float fModulationIndexModule1;
float fModulationIndexModule2;
float fModulationIndexDefault=0.9;




/*Variables: Pulse Width Modulation*/
int iSinusoidalPWMCounter = 0;
float fEpwm1DutyCycle = 0.5;
float fEpwm2DutyCycle = 0.5;

int main(void)
{

    InitSysCtrl();
    InitPeripheralClocks();
    EALLOW;
    CpuSysRegs.PCLKCR0.bit.TBCLKSYNC = 0;
    ClkCfgRegs.PERCLKDIVSEL.bit.EPWMCLKDIV = 0; // EPWM Clock Divide Select: /1 of PLLSYSCLK
    EDIS;

    GPIOSetup();
    DINT;

    InitPieCtrl();
    IER = 0x0000;
    IFR = 0x0000;
    InitPieVectTable();

    EALLOW;
    PieVectTable.TIMER0_INT = &cpu_timer0_isr;
    EDIS;

    InitCpuTimers();
    ConfigCpuTimer(&CpuTimer0, 200, (1000000/LOOPFREQUENCY)); // 100kHz

    EPWM1Setup();
    EPWM2Setup();


    CpuTimer0Regs.TCR.all = 0x4000; // Use write-only instruction to set TSS bit = 0

    IER |= M_INT1;   // ADC-A1 & CPU1.TIMER0
    PieCtrlRegs.PIEIER1.bit.INTx7 = 1; // TIMER0

    EINT;
    ERTM;

    EALLOW;
    CpuSysRegs.PCLKCR0.bit.TBCLKSYNC = 1; /*Enable all the clocks.*/
    EDIS;

    while (1)
    {


    }
}

void GPIOSetup()
{

    EALLOW;




    // HB B PWM (ePWM2)
    GpioCtrlRegs.GPAPUD.bit.GPIO2 = 1;    // Disable pull-up on GPIO2 (EPWM2A)
    GpioCtrlRegs.GPAPUD.bit.GPIO3 = 1;    // Disable pull-up on GPIO3 (EPWM2B)
    GpioCtrlRegs.GPAGMUX1.bit.GPIO2 = 0;  // Configure GPIO2 as EPWM2A
    GpioCtrlRegs.GPAGMUX1.bit.GPIO3 = 0;  // Configure GPIO3 as EPWM2B
    GpioCtrlRegs.GPAMUX1.bit.GPIO2 = 1;   // Configure GPIO2 as EPWM2A
    GpioCtrlRegs.GPAMUX1.bit.GPIO3 = 1;   // Configure GPIO3 as EPWM2B


    // HB A PWM PWM (ePWM1)
    GpioCtrlRegs.GPAPUD.bit.GPIO0 = 1;    // Disable pull-up on GPIO0 (EPWM1A)
    GpioCtrlRegs.GPAPUD.bit.GPIO1 = 1;    // Disable pull-up on GPIO1 (EPWM1B)
    GpioCtrlRegs.GPAGMUX1.bit.GPIO0 = 0;  // Configure GPIO0 as EPWM1A
    GpioCtrlRegs.GPAGMUX1.bit.GPIO1 = 0;  // Configure GPIO1 as EPWM1B
    GpioCtrlRegs.GPAMUX1.bit.GPIO0 = 1;   // Configure GPIO0 as EPWM1A
    GpioCtrlRegs.GPAMUX1.bit.GPIO1 = 1;   // Configure GPIO1 as EPWM1B


    EDIS;

}
__interrupt void cpu_timer0_isr(void)
{

    CpuTimer0.InterruptCount++;

#if CONTROLMODE == OPENLOOPCONTROLMODE
        /* Open loop Control - Sinusoidal PWM*/
        fModulationIndexModule1 = fModulationIndexDefault;
        fModulationIndexModule2 = fModulationIndexDefault;
        fEpwm1DutyCycle = (fModulationIndexModule1
                * sin(2 * PI * MOTORFREQUENCY
                        * iSinusoidalPWMCounter/ LOOPFREQUENCY) + 1) / 2;
        fEpwm2DutyCycle = (fModulationIndexModule2
                * sin(2 * PI * MOTORFREQUENCY * iSinusoidalPWMCounter
                        / LOOPFREQUENCY -PI ) + 1) / 2;

        iSinusoidalPWMCounter += 1;
        if (iSinusoidalPWMCounter > ((LOOPFREQUENCY / MOTORFREQUENCY) - 1))
        iSinusoidalPWMCounter = 0;
#endif

#if UNIPOLAR
        EPwm1Regs.CMPA.bit.CMPA = EPwm1Regs.TBPRD * fEpwm1DutyCycle; // (ePWM1)
        EPwm2Regs.CMPA.bit.CMPA = EPwm2Regs.TBPRD * fEpwm2DutyCycle; // (ePWM3)
#endif

#if BIPOLAR
        EPwm1Regs.CMPA.bit.CMPA = EPwm1Regs.TBPRD * fEpwm1DutyCycle; // (ePWM1)
        EPwm2Regs.CMPA.bit.CMPA = EPwm2Regs.TBPRD * fEpwm1DutyCycle; // (ePWM3)
#endif


    PieCtrlRegs.PIEACK.all = PIEACK_GROUP1;
}




void EPWM1Setup(void)
{
    EPwm1Regs.TBCTL.all = 0x00;
    EPwm1Regs.TBCTL.bit.CTRMODE = TB_COUNT_UPDOWN;   // Count up and douwn
    EPwm1Regs.TBCTL.bit.CLKDIV = 0;
    EPwm1Regs.TBCTL.bit.HSPCLKDIV = 0;
    EPwm1Regs.TBPRD = SYSTEMCLOCKFREQUENCY / (SWITCHINGFREQUENCY * 2);
    EPwm1Regs.TBCTR = 0x0000;          // Clear counter
    EPwm1Regs.CMPCTL.all = 0x00;
    EPwm1Regs.CMPCTL.bit.SHDWAMODE = 0; // Shadow mode. Operates as a double buffer. All writes via the CPU access the shadow register
    EPwm1Regs.CMPCTL.bit.LOADAMODE = 1; // Load on CTR = PRD: Time-base counter equal to period
    EPwm1Regs.AQCTLA.all = 0x00;
    EPwm1Regs.AQCTLA.bit.CAU = 1; //set low
    EPwm1Regs.AQCTLA.bit.CAD = 2; //set high
    EPwm1Regs.CMPA.bit.CMPA = EPwm1Regs.TBPRD / 2;    // Set compare A value
    EPwm1Regs.TBPHS.bit.TBPHS = 0x0000;          // Phase is 0

    EPwm1Regs.TBCTL2.all = 0x00;
    EPwm1Regs.CMPCTL2.all = 0x00;
    EPwm1Regs.DBCTL.all = 0x00;
    EPwm1Regs.DBCTL.bit.OUT_MODE = 3;
    EPwm1Regs.DBCTL.bit.POLSEL = 2;
    EPwm1Regs.DBFED.bit.DBFED = DEADTIME / SYSTEMCLOCKPERIOD;
    EPwm1Regs.DBRED.bit.DBRED = DEADTIME / SYSTEMCLOCKPERIOD;
    EPwm1Regs.DBCTL2.all = 0x00;
    EPwm1Regs.ETSEL.all = 0x00;


}

void EPWM2Setup(void)
{

    EPwm2Regs.TBCTL.all = 0x00;
    EPwm2Regs.TBCTL.bit.CTRMODE = TB_COUNT_UPDOWN;   // Count up and douwn
    EPwm2Regs.TBCTL.bit.CLKDIV = 0;    // TBCLOK = EPWMCLOCK/(128*10) = 78125Hz
    EPwm2Regs.TBCTL.bit.HSPCLKDIV = 0;
    EPwm2Regs.TBPRD = SYSTEMCLOCKFREQUENCY / (SWITCHINGFREQUENCY * 2);
    EPwm2Regs.TBCTR = 0x0000;          // Clear counter
    EPwm2Regs.CMPCTL.all = 0x00;
    EPwm2Regs.CMPCTL.bit.SHDWAMODE = 0; // Shadow mode. Operates as a double buffer. All writes via the CPU access the shadow register
    EPwm2Regs.CMPCTL.bit.LOADAMODE = 1; // Load on CTR = PRD: Time-base counter equal to period
    EPwm2Regs.AQCTLA.all = 0x00;
    EPwm2Regs.AQCTLA.bit.CAU = 1; //set low
    EPwm2Regs.AQCTLA.bit.CAD = 2; //set high
    EPwm2Regs.CMPA.bit.CMPA = EPwm2Regs.TBPRD / 2;    // Set compare A value
    EPwm2Regs.TBPHS.bit.TBPHS = 0x0000;          // Phase is 0

    EPwm2Regs.TBCTL2.all = 0x00;
    EPwm2Regs.CMPCTL2.all = 0x00;
    EPwm2Regs.DBCTL.all = 0x00;
    EPwm2Regs.DBCTL.bit.OUT_MODE = 3;
    EPwm2Regs.DBCTL.bit.POLSEL = 2;
    EPwm2Regs.DBFED.bit.DBFED = DEADTIME / SYSTEMCLOCKPERIOD;
    EPwm2Regs.DBRED.bit.DBRED = DEADTIME / SYSTEMCLOCKPERIOD;
    EPwm2Regs.DBCTL2.all = 0x00;



}
