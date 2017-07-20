################################################################################
# Automatically-generated file. Do not edit!
################################################################################

-include ../makefile.init

#RM := rm -rf


# All of the sources participating in the build are defined here
-include sources.mk
-include Middlewares/LwIP/apps/httpd/subdir.mk
-include Middlewares/LwIP/Netif/subdir.mk
-include Middlewares/LwIP/Core/IPv4/subdir.mk
-include Middlewares/LwIP/Core/subdir.mk
-include Middlewares/LwIP/Api/subdir.mk
-include Middlewares/FreeRTOS/portable/subdir.mk
-include Middlewares/FreeRTOS/subdir.mk
-include Drivers/STM32F7xx_HAL_Driver/subdir.mk
-include Drivers/CMSIS/subdir.mk
-include Drivers/BSP/STM32F769ZI_Nucleo/subdir.mk
-include Application/User/subdir.mk
-include Application/SW4STM32/subdir.mk
-include subdir.mk
-include objects.mk

ifneq ($(MAKECMDGOALS),clean)
ifneq ($(strip $(S_UPPER_DEPS)),)
-include $(S_UPPER_DEPS)
endif
ifneq ($(strip $(C_DEPS)),)
-include $(C_DEPS)
endif
endif

-include ../makefile.defs

# Add inputs and outputs from these tool invocations to the build variables 
#$(info $$OBJS is [${OBJS}])

# All Target
all: STM32F767ZI_Nucleo.elf

# Tool invocations
STM32F767ZI_Nucleo.elf: $(OBJS) $(USER_OBJS) ../STM32F767ZITx_FLASH.ld
	@echo 'Building target: $@'
	@echo 'Invoking: MCU GCC Linker'
	$(CC) -mcpu=cortex-m7 -mthumb -mfloat-abi=hard -mfpu=fpv5-sp-d16 -specs=nosys.specs -specs=nano.specs -T"../STM32F767ZITx_FLASH.ld" -Wl,-Map=output.map -Wl,--gc-sections -lm -o "STM32F767ZI_Nucleo.elf" @"objects.list" $(USER_OBJS) $(LIBS)
	@echo 'Finished building target: $@'
	@echo ' '
	$(MAKE) --no-print-directory post-build

# Other Targets
clean:
	#-$(RM) *
	find . -type f -name "*.d" -delete
	find . -type f -name "*.o" -delete
	rm -f *.bin
	rm -f *.elf
	-@echo ' '

post-build:
	-@echo 'Generating binary and Printing size information:'
	$(OBJCPY) -O binary "STM32F767ZI_Nucleo.elf" "STM32F767ZI_Nucleo.bin"
	$(SIZE) "STM32F767ZI_Nucleo.elf"
	-@echo ' '

.PHONY: all clean dependents
.SECONDARY: post-build

-include ../makefile.targets
