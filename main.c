/*
 * ======== Standard MSP430 includes ========
 */
#include <msp430.h>

/*
 * ======== Grace related includes ========
 */
#include <ti/mcu/msp430/Grace.h>

/*
 *  ======== main ========
 */

#include "FlashTreiber.h"

//volatile extern unsigned char spiTransmit;



int main(void)
{
    Grace_init();                   // Activate Grace-generated configuration
    WDTCTL = WDTPW + WDTHOLD; // Stop Watchdog Timer
    setCShigh();
    unsigned char payload[64]={1};
    unsigned char check[64]={0};
    unsigned char pre[64]={0};

    unsigned char bar=0;
    long foo;
    for(foo=0; foo<64; foo++){
    	bar=1^bar;
    	payload[foo]=bar;
    }

    eraseFlash();
    readData(0,pre,64);
    writeData(0,payload,64);

    readData(0,pre,64);

//    eraseSector(0);


    writeData(0,payload,64);
    readData(0,check,64);


    getFlashID();
    getStatusRegister();
    
    return (0);
}
