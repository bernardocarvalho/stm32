# Add inputs and outputs from these tool invocations to the build variables
SRCS_DIR =  $(STM_CUBE_FW_DIR)/Middlewares/Third_Party/FreeRTOS/Source
BUILDDIR = Middlewares/FreeRTOS/portable

#SRCS = $(wildcard $(SRCS_DIR)/*.c)
SRCS = $(SRCS_DIR)/CMSIS_RTOS/cmsis_os.c 
SRCS += $(SRCS_DIR)/portable/MemMang/heap_4.c 
SRCS += $(SRCS_DIR)/portable/GCC/ARM_CM7/r0p1/port.c 

#$(info $$SRCS is [${SRCS}])

C_SRCS += SRCS
DPDS= $(addprefix $(BUILDDIR)/, $(notdir $(SRCS:.c=.d)))

C_SRCS += SRCS

OBJS += $(addprefix $(BUILDDIR)/, $(notdir $(SRCS:.c=.o)))

C_DEPS += DPDS

# Each subdirectory must supply rules for building sources it contributes
$(BUILDDIR)/cmsis_os.o: $(SRCS_DIR)/CMSIS_RTOS/cmsis_os.c
	@echo 'Building file: $<'
	@echo 'Invoking: MCU GCC Compiler'
	@echo %cd%
	$(CC) $(CFLAGS) $(INCLUDES)  -MF"$(@:%.o=%.d)" -MT"$@" -o "$@" "$<"
	@echo 'Finished building: $<'
	@echo ' '

$(BUILDDIR)/heap_4.o: $(SRCS_DIR)/portable/MemMang/heap_4.c
	@echo 'Building file: $<'
	@echo 'Invoking: MCU GCC Compiler'
	@echo %cd%
	$(CC) $(CFLAGS) $(INCLUDES)  -MF"$(@:%.o=%.d)" -MT"$@" -o "$@" "$<"
	@echo 'Finished building: $<'
	@echo ' '

$(BUILDDIR)/port.o: $(SRCS_DIR)/portable/GCC/ARM_CM7/r0p1/port.c
	@echo 'Building file: $<'
	@echo 'Invoking: MCU GCC Compiler'
	@echo %cd%
	$(CC) $(CFLAGS) $(INCLUDES)  -MF"$(@:%.o=%.d)" -MT"$@" -o "$@" "$<"
	@echo 'Finished building: $<'
	@echo ' '

