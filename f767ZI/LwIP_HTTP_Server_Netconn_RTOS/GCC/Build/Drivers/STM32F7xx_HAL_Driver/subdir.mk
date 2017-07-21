
# Add inputs and outputs from these tool invocations to the build variables 

SRCS_DIR =  $(STM_CUBE_FW_DIR)/Drivers/STM32F7xx_HAL_Driver/Src
BUILDDIR = Drivers/STM32F7xx_HAL_Driver

#SRCS = $(wildcard $(SRCS_DIR)/*.c)
SRCS = $(SRCS_DIR)/stm32f7xx_hal.c \
$(SRCS_DIR)/stm32f7xx_hal_cortex.c \
$(SRCS_DIR)/stm32f7xx_hal_dma.c \
$(SRCS_DIR)/stm32f7xx_hal_dma2d.c \
$(SRCS_DIR)/stm32f7xx_hal_eth.c \
$(SRCS_DIR)/stm32f7xx_hal_dsi.c \
$(SRCS_DIR)/stm32f7xx_hal_flash.c \
$(SRCS_DIR)/stm32f7xx_hal_flash_ex.c \
$(SRCS_DIR)/stm32f7xx_hal_gpio.c \
$(SRCS_DIR)/stm32f7xx_hal_i2c.c \
$(SRCS_DIR)/stm32f7xx_hal_i2c_ex.c \
$(SRCS_DIR)/stm32f7xx_hal_ltdc.c \
$(SRCS_DIR)/stm32f7xx_hal_ltdc_ex.c \
$(SRCS_DIR)/stm32f7xx_hal_pwr.c \
$(SRCS_DIR)/stm32f7xx_hal_pwr_ex.c \
$(SRCS_DIR)/stm32f7xx_hal_rcc.c \
$(SRCS_DIR)/stm32f7xx_hal_rcc_ex.c \
$(SRCS_DIR)/stm32f7xx_hal_sdram.c \
$(SRCS_DIR)/stm32f7xx_hal_tim.c \
$(SRCS_DIR)/stm32f7xx_hal_tim_ex.c \
$(SRCS_DIR)/stm32f7xx_hal_uart.c \
$(SRCS_DIR)/stm32f7xx_ll_fmc.c 
#$(info $$SRCS is [${SRCS}])

DPDS= $(addprefix  $(BUILDDIR)/, $(notdir $(SRCS:.c=.d)))

C_SRCS += SRCS

OBJS += $(addprefix  $(BUILDDIR)/, $(notdir $(SRCS:.c=.o)))
C_DEPS += DPDS


# Each subdirectory must supply rules for building sources it contributes
$(BUILDDIR)/%.o: $(SRCS_DIR)/%.c
	@echo 'Building file: $<'
	@echo 'Invoking: MCU GCC Compiler'
	@echo %cd%
	$(CC) $(CFLAGS) $(INCLUDES)  -MF"$(@:%.o=%.d)" -MT"$@" -o "$@" "$<"
	@echo 'Finished building: $<'
	@echo ' '

