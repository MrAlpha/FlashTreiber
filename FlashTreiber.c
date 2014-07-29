/*
 * FlashTreiber.c
 *
 *  Created on: 22.07.2014
 *      Author: Dave
 *
 *  Driver for the MX25V8005 SPI Flash Memory
 */

#include "FlashTreiber.h"
#include <msp430.h>


/*************************************SPI**************************************************/
/**
 * SPI synchronous write
 */
void spiWrite(unsigned char Data) {
	UCB0TXBUF = Data;
	while (!(IFG2 & UCB0TXIFG))
		;
}


/**
 * SPI synchronous read
 */
unsigned char spiRead(unsigned char data) {
	UCB0TXBUF = data;
	while ((UCB0STAT & UCBUSY))
		;
	data = UCB0RXBUF;
	return data;
}

/***********************************************end SPI*********************************/

void delay(unsigned int ms){
	while(ms--)
		__delay_cycles(16000); // set for 16Mhz change it to 1000 for 1 Mhz
}


void setCSlow(){
	P2OUT &= ~(BIT7);
}
void setCShigh(){
	P2OUT |= BIT7;
}

unsigned char checkWriteEnable() {
	unsigned char gDataBuffer;

	gDataBuffer= getStatusRegister();
	if( (gDataBuffer & 0x02)  == 0x02 )
		return 1;
	else
		return 0;
}

void setWriteEnable(){
	do{
		delay(5);
		setCSlow();
		spiWrite(WREN);
		setCShigh();
		delay(5);
	}while(!(checkWriteEnable()));
}

unsigned char getStatusRegister(){
	unsigned char spiRecive=0;
	setCSlow();
	spiWrite(RDSR);
	spiRecive=spiRead(0x00);
	setCShigh();
	return spiRecive;
}

unsigned char getFlashBusy(){
	unsigned char status=0;
	status=getStatusRegister();
	if((status & WIP)== WIP){
		return 1;
	}
	else
		return 0;
}

unsigned char getFlashID() {
	unsigned char id[3]={0};
	setCSlow();
	spiWrite(RDID);
	id[0]=spiRead(0x00);
	id[1]=spiRead(0x00);
	id[2]=spiRead(0x00);
	setCShigh();
return id[0];
}

void sendFlashAddress(long flashAddress){
	spiWrite((flashAddress >> 16));
	spiWrite((flashAddress >> 8));
	spiWrite((flashAddress));
}

void readData(unsigned long flashAddress, unsigned char *recive, unsigned long byteNumber){
	unsigned long i=0;
	while(getFlashBusy());

	setCSlow();
	spiWrite(FREAD);
	sendFlashAddress(flashAddress);
	spiWrite(0x00);


	for(i=0; i<byteNumber; i++){
		*(recive +i) =spiRead(0x00);
	}
	setCShigh();
}

void writeData(unsigned long flashAddress, unsigned char *send, unsigned long byteNumber){

	unsigned long i=0;

	while(getFlashBusy()) __no_operation();

	setWriteEnable();

	setCSlow();
	spiWrite(PP);
	sendFlashAddress(flashAddress);


	for(i=0; i<byteNumber; i++){
		spiWrite(*(send+i));
	}

	setCShigh();

	while(getFlashBusy()) __no_operation();
}

void eraseSector(unsigned long flashAddress ) {
	while( getFlashBusy()) _NOP();
	// Setting Write Enable Latch bit
	setWriteEnable();
	while(getFlashBusy());
	// Chip select go low to start a flash command
	setCSlow();

	//Write Sector Erase command = 0x20;
	spiWrite( SE );

	sendFlashAddress( flashAddress );

	// Chip select go high to end a flash command
	setCShigh();
	while(getFlashBusy());
}


void eraseFlash(){
	while(getFlashBusy());

	setWriteEnable();
	setCSlow();
	spiWrite(CE);
	setCShigh();

	while(getFlashBusy());
}

