# ibex-nexys_a7

![Ibex demo system block diagram](doc/IbexDemoSystemBlockDiagram.png "Ibex demo system block diagram with in the center an Ibex processor connected by a memory bus to the RAM, GPIO, SPI, UART and debug module. Switches, buttons and LEDs are connected to the GPIO. The LCD is driven by SPI. The UART is used for a serial console. Finally, the debug module is used to drive the JTAG.")

This an example RISC-V SoC targeting the Arty-A7 FPGA board. It comprises the
[lowRISC Ibex core](https://www.github.com/lowrisc/ibex) along with the
following features:

* RISC-V debug support (using the [PULP RISC-V Debug Module](https://github.com/pulp-platform/riscv-dbg))
* UART
* GPIO
* PWM
* Timer
* SPI
* A basic peripheral to write ASCII output to a file and halt simulation from software

Debug can be used via a USB connection to the Arty-A7 board. No external JTAG
probe is required.

```bash
# Look in /dev to see available ttyUSB devices
screen /dev/ttyUSB1 115200
```

```bash
./util/load_demo_system.sh run ./program/build/demo/hello_world/demo
```


