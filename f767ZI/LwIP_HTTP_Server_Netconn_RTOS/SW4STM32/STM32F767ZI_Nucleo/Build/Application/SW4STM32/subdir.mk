# Add inputs and outputs from these tool invocations to the build variables
SRCS_DIR =  $(STM_CUBE_FW_DIR)/Projects/STM32F767ZI-Nucleo/Applications/LwIP/LwIP_HTTP_Server_Netconn_RTOS/SW4STM32
BUILDDIR = Application/SW4STM32

#SRCS = $(wildcard $(SRCS_DIR)/*.c)
SRCS = $(SRCS_DIR)/startup_stm32f767xx.s \
	   $(SRCS_DIR)/syscalls.c 

#$(info $$SRCS is [${SRCS}])

C_SRCS += SRCS
DPDS= $(addprefix $(BUILDDIR)/, $(notdir $(SRCS:.c=.d)))

C_SRCS += SRCS

#OBJS += $(addprefix $(BUILDDIR)/, $(notdir $(SRCS:.c=.o)))
#OBJS += $(addprefix $(BUILDDIR)/, $(notdir $(SRCS:.s=.o)))
OBJS += $(addprefix $(BUILDDIR)/, startup_stm32f767xx.o)
OBJS += $(addprefix $(BUILDDIR)/, syscalls.o)
#$(info $$OBJS is [${OBJS}])

C_DEPS += DPDS

# Each subdirectory must supply rules for building sources it contributes
$(BUILDDIR)/syscalls.o: $(SRCS_DIR)/syscalls.c
	@echo 'Building file: $<'
	@echo 'Invoking: MCU GCC Compiler'
	@echo %cd%
	$(CC) $(CFLAGS) $(INCLUDES)  -MF"$(@:%.o=%.d)" -MT"$@" -o "$@" "$<"
	@echo 'Finished building: $<'
	@echo ' '

$(BUILDDIR)/startup_stm32f767xx.o: $(SRCS_DIR)/startup_stm32f767xx.s
	@echo 'Building file: $<'
	@echo 'Invoking: MCU GCC Assembles'
	@echo %cd%
	$(AS) -mcpu=cortex-m7 -mthumb -mfloat-abi=hard -mfpu=fpv5-sp-d16 -g -o "$@" "$<"
	@echo 'Finished building: $<'
	@echo ' '

