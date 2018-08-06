

#include <stdio.h>
#include "platform.h"
#include "xiicps.h"
#include "xspi.h"
#include "xvtc.h"
#include "xaxivdma.h"
#include "xaxivdma_i.h"
#include "xil_assert.h"

#include "xv_mix.h"
#include "xv_tpg.h"
#include "xvidc.h"


#define IIC_DEVICE_ID		XPAR_XIICPS_0_DEVICE_ID
#define SPI_DEVICE_ID		XPAR_AXI_QUAD_SPI_0_DEVICE_ID

#define IIC_SLAVE_ADDR		0x2A
#define IIC_SCLK_RATE		100000

#define TEST_BUFFER_SIZE	16
#define data				164 //bytes
#define loop				60 // 60 lines
#define DEMO_MAX_FRAME (1280*800)//(800*480)
#define DEMO_STRIDE (1280*4) // (800*4)
#define DISPLAY_NUM_FRAMES 3


XAxiVdma vdma;
XAxiVdma_DmaSetup vdmaDMA;
XAxiVdma_Config *vdmaConfig;


u8 SendBuffer[TEST_BUFFER_SIZE];    /**< Buffer for Transmitting Data */
u8 RecvBuffer[TEST_BUFFER_SIZE];    /**< Buffer for Receiving Data */

int IicPsMasterPolledExample(u16 DeviceId, u16 SpiDeviceId);

u32 frameBuf[DISPLAY_NUM_FRAMES][DEMO_MAX_FRAME];
u32 *pFrames[DISPLAY_NUM_FRAMES];

int main()
{
    init_platform();
    int status;
    u32 height, width;

    XVtc	VtcInst;
    XVtc_Config *vtc_config;
    XVtc_Timing vtcTiming;
    XVtc_SourceSelect SourceSelect;

    XV_mix xv_mix;
    XV_mix_Config *xv_config;

    XV_tpg tpg,tpg1,tpg2;
    XV_tpg_Config *tpg_config,*tpg_config1,*tpg_config2;


    //ProbeCom_Init();
    xv_config = XV_mix_LookupConfig(XPAR_XV_MIX_0_DEVICE_ID);
    XV_mix_CfgInitialize(&xv_mix,xv_config,xv_config->BaseAddress);

    tpg_config = XV_tpg_LookupConfig(XPAR_XV_TPG_0_DEVICE_ID);
    XV_tpg_CfgInitialize(&tpg, tpg_config, tpg_config->BaseAddress);
	status = XV_tpg_IsReady(&tpg);
	printf("Status %u \n\r", (unsigned int) status);
	status = XV_tpg_IsIdle(&tpg);
	printf("Status %u \n\r", (unsigned int) status);
	XV_tpg_Set_height(&tpg, (u32)400);
	XV_tpg_Set_width(&tpg, (u32)640);
	height = XV_tpg_Get_height(&tpg);
	width = XV_tpg_Get_width(&tpg);
	XV_tpg_Set_colorFormat(&tpg,XVIDC_CSF_RGB);
	XV_tpg_Set_maskId(&tpg, 0x0);
	XV_tpg_Set_motionSpeed(&tpg, 0x4);
	printf("info from tpg %u %u \n\r", (unsigned int)height, (unsigned int)width);
	XV_tpg_Set_bckgndId(&tpg, XTPG_BKGND_TARTAN_COLOR_BARS);
	status = XV_tpg_Get_bckgndId(&tpg);
	printf("Status %x \n\r", (unsigned int) status);
	XV_tpg_EnableAutoRestart(&tpg);
	XV_tpg_Start(&tpg);
	status = XV_tpg_IsIdle(&tpg);
	printf("Status %u \n\r", (unsigned int) status);

	tpg_config1 = XV_tpg_LookupConfig(XPAR_XV_TPG_1_DEVICE_ID);
	XV_tpg_CfgInitialize(&tpg1, tpg_config1, tpg_config1->BaseAddress);
	status = XV_tpg_IsReady(&tpg1);
	printf("Status %u \n\r", (unsigned int) status);
	status = XV_tpg_IsIdle(&tpg1);
	printf("Status %u \n\r", (unsigned int) status);
	XV_tpg_Set_height(&tpg1, (u32)400);
	XV_tpg_Set_width(&tpg1, (u32)640);
	height = XV_tpg_Get_height(&tpg1);
	width = XV_tpg_Get_width(&tpg1);
	XV_tpg_Set_colorFormat(&tpg1,XVIDC_CSF_RGB);
	XV_tpg_Set_maskId(&tpg1, 0x0);
	XV_tpg_Set_motionSpeed(&tpg1, 0x4);
	printf("info from tpg %u %u \n\r", (unsigned int)height, (unsigned int)width);
	XV_tpg_Set_bckgndId(&tpg1, XTPG_BKGND_ZONE_PLATE);
	status = XV_tpg_Get_bckgndId(&tpg1);
	printf("Status %x \n\r", (unsigned int) status);
	XV_tpg_EnableAutoRestart(&tpg1);
	XV_tpg_Start(&tpg1);
	status = XV_tpg_IsIdle(&tpg1);
	printf("Status %u \n\r", (unsigned int) status);

	tpg_config2 = XV_tpg_LookupConfig(XPAR_XV_TPG_2_DEVICE_ID);
	XV_tpg_CfgInitialize(&tpg2, tpg_config2, tpg_config2->BaseAddress);
	status = XV_tpg_IsReady(&tpg2);
	printf("Status %u \n\r", (unsigned int) status);
	status = XV_tpg_IsIdle(&tpg2);
	printf("Status %u \n\r", (unsigned int) status);
	XV_tpg_Set_height(&tpg2, (u32)400);
	XV_tpg_Set_width(&tpg2, (u32)640);
	height = XV_tpg_Get_height(&tpg2);
	width = XV_tpg_Get_width(&tpg2);
	XV_tpg_Set_colorFormat(&tpg2,XVIDC_CSF_RGB);
	XV_tpg_Set_maskId(&tpg2, 0x0);
	XV_tpg_Set_motionSpeed(&tpg2, 0x4);
	printf("info from tpg %u %u \n\r", (unsigned int)height, (unsigned int)width);
	XV_tpg_Set_bckgndId(&tpg2, XTPG_BKGND_HV_RAMP);
	status = XV_tpg_Get_bckgndId(&tpg2);
	printf("Status %x \n\r", (unsigned int) status);
	XV_tpg_EnableAutoRestart(&tpg2);
	XV_tpg_Start(&tpg2);
	status = XV_tpg_IsIdle(&tpg2);
	printf("Status %u \n\r", (unsigned int) status);

    XV_mix_Set_HwReg_width(&xv_mix, (u32)1280);
    XV_mix_Set_HwReg_height(&xv_mix, (u32) 800);
	XV_mix_Set_HwReg_layerEnable(&xv_mix,(u32)15);


	XV_mix_Set_HwReg_layerStartX_0(&xv_mix,(u32)0);
	XV_mix_Set_HwReg_layerStartY_0(&xv_mix,0);
	XV_mix_Set_HwReg_layerWidth_0(&xv_mix,(u32)640);
	XV_mix_Set_HwReg_layerHeight_0(&xv_mix,(u32)400);
	XV_mix_Set_HwReg_layerAlpha_0(&xv_mix, 255);

	XV_mix_Set_HwReg_layerStartX_1(&xv_mix,640);
	XV_mix_Set_HwReg_layerStartY_1(&xv_mix,400);
	XV_mix_Set_HwReg_layerWidth_1(&xv_mix,(u32)640);
	XV_mix_Set_HwReg_layerHeight_1(&xv_mix,(u32)400);
	XV_mix_Set_HwReg_layerAlpha_1(&xv_mix, 255);

	XV_mix_Set_HwReg_layerStartX_2(&xv_mix,640);
	XV_mix_Set_HwReg_layerStartY_2(&xv_mix,0);
	XV_mix_Set_HwReg_layerWidth_2(&xv_mix,(u32)640);
	XV_mix_Set_HwReg_layerHeight_2(&xv_mix,(u32)400);
	XV_mix_Set_HwReg_layerAlpha_2(&xv_mix, 255);

	XV_mix_Set_HwReg_layerStartX_3(&xv_mix,0);
	XV_mix_Set_HwReg_layerStartY_3(&xv_mix,400);
	XV_mix_Set_HwReg_layerWidth_3(&xv_mix,(u32)640);
	XV_mix_Set_HwReg_layerHeight_3(&xv_mix,(u32)400);
	XV_mix_Set_HwReg_layerAlpha_3(&xv_mix, 255);

	XV_mix_EnableAutoRestart(&xv_mix);
	XV_mix_Start(&xv_mix);

    vtc_config = XVtc_LookupConfig(XPAR_VTC_0_DEVICE_ID);
	XVtc_CfgInitialize(&VtcInst, vtc_config, vtc_config->BaseAddress);




//	vtcTiming.HActiveVideo = 800;
//	vtcTiming.HFrontPorch = 40;
//	vtcTiming.HSyncWidth = 128;
//	vtcTiming.HBackPorch = 88;
//	vtcTiming.HSyncPolarity = 0;
//	vtcTiming.VActiveVideo = 480;
//	vtcTiming.V0FrontPorch = 8;//8;
//	vtcTiming.V0SyncWidth = 2;
//	vtcTiming.V0BackPorch = 35;
//	vtcTiming.V1FrontPorch = 3;
//	vtcTiming.V1SyncWidth = 2;
//	vtcTiming.V1BackPorch = 35;
//	vtcTiming.VSyncPolarity = 0;
//	vtcTiming.Interlaced = 0;

	vtcTiming.HActiveVideo = 1280;
	vtcTiming.HFrontPorch = 65;
	vtcTiming.HSyncWidth = 55;
	vtcTiming.HBackPorch = 40;
	vtcTiming.HSyncPolarity = 0;
	vtcTiming.VActiveVideo = 800;
	vtcTiming.V0FrontPorch = 7;//8;
	vtcTiming.V0SyncWidth = 4;
	vtcTiming.V0BackPorch = 12;
	vtcTiming.V1FrontPorch = 7;
	vtcTiming.V1SyncWidth = 4;
	vtcTiming.V1BackPorch = 12;
	vtcTiming.VSyncPolarity = 0;
	vtcTiming.Interlaced = 0;

	memset((void *)&SourceSelect, 0, sizeof(SourceSelect));
	SourceSelect.VBlankPolSrc = 1;
	SourceSelect.VSyncPolSrc = 1;
	SourceSelect.HBlankPolSrc = 1;
	SourceSelect.HSyncPolSrc = 1;
	SourceSelect.ActiveVideoPolSrc = 1;
	SourceSelect.ActiveChromaPolSrc= 1;
	SourceSelect.VChromaSrc = 1;
	SourceSelect.VActiveSrc = 1;
	SourceSelect.VBackPorchSrc = 1;
	SourceSelect.VSyncSrc = 1;
	SourceSelect.VFrontPorchSrc = 1;
	SourceSelect.VTotalSrc = 1;
	SourceSelect.HActiveSrc = 1;
	SourceSelect.HBackPorchSrc = 1;
	SourceSelect.HSyncSrc = 1;
	SourceSelect.HFrontPorchSrc = 1;
	SourceSelect.HTotalSrc = 1;


	XVtc_RegUpdateEnable(&VtcInst);
	XVtc_SetGeneratorTiming(&VtcInst,&vtcTiming);
	XVtc_SetSource(&VtcInst, &SourceSelect);
	XVtc_EnableGenerator(&VtcInst);

	status = XVtc_GetDetectionStatus(&VtcInst);
	printf("vtc status %u\n\r",status);

	printf("Hello World\n\r");

	printf("VTC\n\r");

    printf("Hello World 2016.4\n\r");

	for (int i = 0; i < 3; i++)
	{
		pFrames[i] = frameBuf[i];
	}

	vdmaConfig = XAxiVdma_LookupConfig(XPAR_AXIVDMA_0_DEVICE_ID);
	XAxiVdma_CfgInitialize(&vdma, vdmaConfig, vdmaConfig->BaseAddress);

	vdmaDMA.FrameDelay = 0;
	vdmaDMA.EnableCircularBuf = 1;
	vdmaDMA.EnableSync = 0;
	vdmaDMA.PointNum = 0;
	vdmaDMA.EnableFrameCounter = 0;
	vdmaDMA.VertSizeInput = 800;
	vdmaDMA.HoriSizeInput = (1280*4);
	vdmaDMA.FixedFrameStoreAddr = 0;
	vdmaDMA.FrameStoreStartAddr[0] = (u32)  pFrames[0];
	vdmaDMA.FrameStoreStartAddr[1] = (u32)  pFrames[1];
	vdmaDMA.FrameStoreStartAddr[2] = (u32)  pFrames[2];
	vdmaDMA.Stride = DEMO_STRIDE;

	XAxiVdma_DmaConfig(&vdma, XAXIVDMA_READ, &(vdmaDMA));
	XAxiVdma_DmaSetBufferAddr(&vdma, XAXIVDMA_READ,vdmaDMA.FrameStoreStartAddr);
	XAxiVdma_DmaStart(&vdma, XAXIVDMA_READ);
	XAxiVdma_StartParking(&vdma,0,XAXIVDMA_READ);
    IicPsMasterPolledExample(IIC_DEVICE_ID, SPI_DEVICE_ID);
    cleanup_platform();
    return 0;
}


int IicPsMasterPolledExample(u16 DeviceId, u16 SpiDeviceId)
{
	int Status,i,segment,x,y,iPixelAddr;

	u8 Buffer[data];
	u8 Image[loop][data];
	XIicPs_Config *Config;
	XSpi_Config *SpiConfig;
	XSpi SpiInstancePtr;
	XIicPs Iic;
	u32 op ;
	Config = XIicPs_LookupConfig(DeviceId);
	if (NULL == Config) {
		return XST_FAILURE;
	}

	Status = XIicPs_CfgInitialize(&Iic, Config, Config->BaseAddress);
	if (Status != XST_SUCCESS) {
		return XST_FAILURE;
	}

	Status = XIicPs_SelfTest(&Iic);
	if (Status != XST_SUCCESS) {
		return XST_FAILURE;
	}

	XIicPs_SetSClk(&Iic, IIC_SCLK_RATE);

	SpiConfig = XSpi_LookupConfig(SpiDeviceId);
	if (NULL == SpiConfig) {
		return XST_FAILURE;
	}

	XSpi_Reset(&SpiInstancePtr);

	Status = XSpi_CfgInitialize(&SpiInstancePtr, SpiConfig,SpiConfig->BaseAddress);
		if (Status != XST_SUCCESS) {
			return XST_FAILURE;
		}

	Status = XSpi_SelfTest(&SpiInstancePtr);
		if (Status != XST_SUCCESS) {
			return XST_FAILURE;
		}

	XSpi_SetOptions(&SpiInstancePtr, XSP_MASTER_OPTION | XSP_CLK_ACTIVE_LOW_OPTION
				|XSP_CLK_PHASE_1_OPTION |XSP_MANUAL_SSELECT_OPTION );

	XSpi_Start(&SpiInstancePtr);
	XSpi_IntrGlobalDisable(&SpiInstancePtr);

	//read status
	SendBuffer[0] = 0x00;
	SendBuffer[1] = 0x02;
	XIicPs_MasterSendPolled(&Iic, SendBuffer,2, IIC_SLAVE_ADDR);
	while (XIicPs_BusIsBusy(&Iic)) {
		/* NOP */
	}

	//read and op status
	XIicPs_MasterRecvPolled(&Iic, RecvBuffer,2, IIC_SLAVE_ADDR);
	for(i =0; i<16; i++){
	xil_printf("%X ", RecvBuffer[i]);
	}
	xil_printf("\n\r ");
	while (XIicPs_BusIsBusy(&Iic)) {
		/* NOP */
	}

	// set the AGC to enable
	SendBuffer[0] = 0x00;
	SendBuffer[1] = 0x08;
	SendBuffer[2] = 0x00;
	SendBuffer[3] = 0x01;
	XIicPs_MasterSendPolled(&Iic, SendBuffer,4, IIC_SLAVE_ADDR);
	while (XIicPs_BusIsBusy(&Iic)) {
		/* NOP */
	}

	SendBuffer[0] = 0x00;
	SendBuffer[1] = 0x0A;
	SendBuffer[2] = 0x00;
	SendBuffer[3] = 0x00;
	XIicPs_MasterSendPolled(&Iic, SendBuffer,4, IIC_SLAVE_ADDR);
	while (XIicPs_BusIsBusy(&Iic)) {
		/* NOP */
	}

	SendBuffer[0] = 0x00;
	SendBuffer[1] = 0x06;
	SendBuffer[2] = 0x00;
	SendBuffer[3] = 0x02;
	XIicPs_MasterSendPolled(&Iic, SendBuffer,4, IIC_SLAVE_ADDR);
	while (XIicPs_BusIsBusy(&Iic)) {
		/* NOP */
	}

	SendBuffer[0] = 0x00;
	SendBuffer[1] = 0x04;
	SendBuffer[2] = 0x01;
	SendBuffer[3] = 0x01;
	XIicPs_MasterSendPolled(&Iic, SendBuffer,4, IIC_SLAVE_ADDR);
	while (XIicPs_BusIsBusy(&Iic)) {
		/* NOP */
	}
	//set rx buffer to 0
	for(i =0; i<16; i++){
	RecvBuffer[i] =0;
	}

	//read back AGC is enabled command
	SendBuffer[0] = 0x00;
	SendBuffer[1] = 0x04;
	SendBuffer[2] = 0x01;
	SendBuffer[3] = 0x00;
	XIicPs_MasterSendPolled(&Iic, SendBuffer,4, IIC_SLAVE_ADDR);
	while (XIicPs_BusIsBusy(&Iic)) {
		/* NOP */
	}

	//set rx buffer to 0
	for(i =0; i<16; i++){
	RecvBuffer[i] =0;
	}

	// read back data and display
	XIicPs_MasterRecvPolled(&Iic, RecvBuffer,4, IIC_SLAVE_ADDR);
	while (XIicPs_BusIsBusy(&Iic)) {
		/* NOP */
	}
	for(i =0; i<16; i++){
	xil_printf("%X ", RecvBuffer[i]);
	}
	xil_printf("\n\r ");

	//read and output status buffer
	SendBuffer[0] = 0x00;
	SendBuffer[1] = 0x02;
	XIicPs_MasterSendPolled(&Iic, SendBuffer,2, IIC_SLAVE_ADDR);
	while (XIicPs_BusIsBusy(&Iic)) {
		/* NOP */
	}
	XIicPs_MasterRecvPolled(&Iic, RecvBuffer,2, IIC_SLAVE_ADDR);
	while (XIicPs_BusIsBusy(&Iic)) {
		/* NOP */
	}
	for(i =0; i<16; i++){
	xil_printf("%X ", RecvBuffer[i]);
	}

	//
	SendBuffer[0] = 0x00;
	SendBuffer[1] = 0x04;
	SendBuffer[2] = 0x02;
	SendBuffer[3] = 0x42;
	XIicPs_MasterSendPolled(&Iic, SendBuffer,4, IIC_SLAVE_ADDR);
	while (XIicPs_BusIsBusy(&Iic)) {
		/* NOP */
	}

	//usleep(200000);

	for(x = 0; x < (800); x++)
			{
			iPixelAddr = x;
				for(y = 0; y < 640; y++)
				{
					//pFrames[iPixelAddr] =  0xaafdfeff;
					//pFrames[iPixelAddr] =  0xaa000000;
					pFrames[iPixelAddr] =  0xaa000000;
					iPixelAddr += (800);
				}

			}
//Xil_DCacheFlushRange((unsigned int) pFrames, DEMO_MAX_FRAME);
	//usleep(200000);

while(1){
	//xil_printf("here\n\r ");
//read out the image from the Camera module, resynchronising as necessary
for(segment = 0; segment <loop; segment++){
	XSpi_SetSlaveSelect(&SpiInstancePtr,0x01);
	XSpi_Transfer(&SpiInstancePtr, Buffer , Buffer,	data);
	if((Buffer[0] != 0xff)){
		for(i =0; i<data/2; i++){
			//scale to 8 bit as 8 bit op e.g. 8 bit red 8 bit blue 8 bit green we are using only one
			Image[segment][i] = ((Buffer[2*i] << 8 | Buffer[2*i+1])>>8); //should scale to 8 bit
			//mage[segment][i] = Buffer;
		}
	}
	else {
		segment = 0;
	}

}

int scalex, scaley;
scalex =8;
scaley =8;
for(x = 0; x < (640); x++) //6201276
		{
			iPixelAddr = x;
			for(y = (0); y < (400); y++) //476 720
			{
				//op = Image[(y/8)][(x/8)+4];
				//pFrames[iPixelAddr] = op;
				//pFrames[iPixelAddr] = Image[(y/8)][(x/8)+4];
				pFrames[iPixelAddr] = (u32) (((Image[(y/scaley)][(x/scalex)+4])<<16)|
											((Image[(y/scaley)][(x/scalex)+4])<<8)|
											((Image[(y/scaley)][(x/scalex)+4])));
				//pFrames[iPixelAddr] =  0xaafdfeff;
				iPixelAddr += (1280);
			}
		}
//Xil_DCacheFlushRange((unsigned int) pFrames, DEMO_MAX_FRAME);
}


	return XST_SUCCESS;
}
