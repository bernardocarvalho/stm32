# Add inputs and outputs from these tool invocations to the build variables
SRCS_DIR =  $(STM_CUBE_FW_DIR)/Projects/STM32F767ZI-Nucleo/Applications/LwIP/LwIP_HTTP_Server_Netconn_RTOS/Src
BUILDDIR = Drivers/CMSIS

#SRCS = $(wildcard $(SRCS_DIR)/*.c)
SRCS = $(SRCS_DIR)/system_stm32f7xx.c

#$(info $$SRCS is [${SRCS}])

C_SRCS += SRCS
DPDS= $(addprefix $(BUILDDIR)/, $(notdir $(SRCS:.c=.d)))

C_SRCS += SRCS

OBJS += $(addprefix $(BUILDDIR)/, $(notdir $(SRCS:.c=.o)))

C_DEPS += DPDS

# Each subdirectory must supply rules for building sources it contributes
$(BUILDDIR)/%.o: $(SRCS_DIR)/%.c
	@echo 'Building file: $<'
	@echo 'Invoking: MCU GCC Compiler'
	@echo %cd%
	$(CC) $(CFLAGS) $(INCLUDES)  -MF"$(@:%.o=%.d)" -MT"$@" -o "$@" "$<"
	@echo 'Finished building: $<'
	@echo ' '

