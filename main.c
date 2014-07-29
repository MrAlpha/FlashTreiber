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

    long foo;
    for(foo=0; foo<64; foo++){
    	payload[foo]=1;
    }

    readData(0,pre,64);
    eraseSector(0);
//    eraseFlash();

//    writeData(0,payload,64);
    readData(0,check,64);


    getFlashID();
    getStatusRegister();
    
    return (0);
}
