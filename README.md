
![license](https://img.shields.io/github/license/BALAKRISHNA-EPPILI/dvsd_4bit_binary_counter?color=red)

# 4bit binary counter(dvsd_4bit_binary_counter) RTL2GDS flow
*The purpose of this project is to produce clean GDS (Graphic Design System) Final Layout with all details that is used to print photomasks used in 
fabrication of a behavioral RTL (Register-Transfer Level) of an 4bit binary counter, using SkyWater 130 nm PDK (Process Design Kit)*

# Table of Contents

- [Design](#Design)
- [Pin Configuration](#Pin-Configuration)
- [Pre layout Simulation](#Pre-layout-Simulation)
- [OPENLANE tool](#OPENLANE-tool)
- [OpenLane ](#OpenLane)
- [OpenLane design stages](#OpenLane-design-stages)
- [Installation process](#installation-process)
	- [Setting OpenLane and SKY130_PDK](#Setting-OpenLane-and-SKY130_PDK)
	- [Test](#Test)
	- [The Docker install](#The-Docker-install)
- [Running openlane](#Running-openlane)
- [Magic layout generate](#Magic-layout-generate)
- [Post-layout simulation](#Post-layout-simulation)
- [Key points to Remember](#key-points-to-remember)
- [Area of improvement](#area-of-improvement)
- [References](#references)
- [Acknowledgement](#acknowledgement)
- [Author](#author)

## Design 
![image](https://user-images.githubusercontent.com/88899069/131217542-dacf8cc3-6764-4b8f-b63f-c305ef5c586e.png)

## Pin Configuration
![image](https://user-images.githubusercontent.com/88899069/131217649-179fbb88-ba36-4333-bc7d-a8a3e65793c7.png)


# OPENLANE tool

## OpenLane 

OpenLane is an automated RTL to GDSII flow based on several components including OpenROAD, Yosys, Magic, Netgen, Fault and custom methodology scripts for design exploration and optimization.
For more information check [here](https://openlane.readthedocs.io/)

![openlane flow 1](https://user-images.githubusercontent.com/80625515/130246106-18f73ccc-e8e1-4061-a1b0-8c14bdf711f1.png)

### OpenLane design stagest

1. Synthesis
	- `yosys` - Performs RTL synthesis
	- `abc` - Performs technology mapping
	- `OpenSTA` - Performs static timing analysis on the resulting netlist to generate timing reports
2. Floorplan and PDN
	- `init_fp` - Defines the core area for the macro as well as the rows (used for placement) and the tracks (used for routing)
	- `ioplacer` - Places the macro input and output ports
	- `pdn` - Generates the power distribution network
	- `tapcell` - Inserts welltap and decap cells in the floorplan
3. Placement
	- `RePLace` - Performs global placement
	- `Resizer` - Performs optional optimizations on the design
	- `OpenDP` - Perfroms detailed placement to legalize the globally placed components
4. CTS
	- `TritonCTS` - Synthesizes the clock distribution network (the clock tree)
5. Routing
	- `FastRoute` - Performs global routing to generate a guide file for the detailed router
	- `CU-GR` - Another option for performing global routing.
	- `TritonRoute` - Performs detailed routing
	- `SPEF-Extractor` - Performs SPEF extraction
6. GDSII Generation
	- `Magic` - Streams out the final GDSII layout file from the routed def
	- `Klayout` - Streams out the final GDSII layout file from the routed def as a back-up
7. Checks
	- `Magic` - Performs DRC Checks & Antenna Checks
	- `Klayout` - Performs DRC Checks
	- `Netgen` - Performs LVS Checks
	- `CVC` - Performs Circuit Validity Checks



### Installation process

#### Prerequisites

- Preferred Ubuntu OS)
- Docker 19.03.12+
- GNU Make
- Python 3.6+ with PIP
- Click, Pyyaml: `pip3 install pyyaml click`


##  Setting OpenLane and SKY130_PDK 

The first go to openlane_working_dir path
Then OpenLane by running 
![Screenshot from 2021-08-20 20-54-00](https://user-images.githubusercontent.com/88899069/130256346-8270b98d-4561-4295-9b43-6272249ff6c9.png)


```sh
git clone https://github.com/efabless/openlane.git openlane
cd openlane 
make openlane 
make pdk

```
 

Installation defult pdk directory 

```sh

export PDK_ROOT=<absolute path to where skywater-pdk and open_pdks will reside>
```       
Add this configuration variable

```sh
export STD_CELL_LIBRARY=<Library name>
```       
where the library names is one of:

- sky130_fd_sc_hd
- sky130_fd_sc_hs
- sky130_fd_sc_ms
- sky130_fd_sc_ls
- sky130_fd_sc_hdll

    * You can install the PDK manually, outside of the Makefile, by following the instructions provided [here][30].
    * Refer to [this][24] for more details on OpenLane-compatible PDK structures.
    
       
you can install all Sky130 SCLs 

```sh

make full-pdk
```       
 

##  Test

On successful completion of previous step, then make test that verifies that the flow and the pdk were properly installed

```sh

make test
```

Then show  display the "successful" message. 

Then follow the next step 

##  The Docker install

If docker is installed, if you can see the docker version 19.* and above then docker is present and go to next step else install docker manually

```sh
docker --version

```

you can installed docker file following this link 

https://docs.docker.com/engine/install/


## Pre layout Simulation

 Pre-layout simulatiom command
![simulation command](https://user-images.githubusercontent.com/88899069/130675440-4dff335a-5561-4192-be3c-f06e92111a1c.png)


Pre-layout simulation waveform
![pre-layout counter](https://user-images.githubusercontent.com/88899069/130675943-2c3108c5-ab0c-4a85-ae04-2bae657b57e6.png)



## Running openlane

Once you are sure the docker is present, you have to make mount of the current files in **openlane**

```sh
make mount

```
![T-1](https://user-images.githubusercontent.com/88899069/130261505-b1a52cc4-6ef8-4abc-a47c-bae0914f3a41.png)


Now lets test a design which is already present in `openlane/designs` type 


```sh
bash-4:$

./flow.tcl -design dvsd_4bit_binary_counter -tag binary_counter_bala

```
![T-2](https://user-images.githubusercontent.com/88899069/130261987-11f954b3-f085-4842-8d7e-52ee59ab250e.png)


which shall display the "successful" message.
![success_T-9](https://user-images.githubusercontent.com/88899069/130263259-84a11fb6-2600-4975-99de-1f99d78cb3e0.png)

## Synthesis

Synthesis reports

```
 -Printing statistics.

=== dvsd_4bit_binary_counter ===

   Number of wires:                 50
   Number of wire bits:             53
   Number of public wires:           4
   Number of public wire bits:       7
   Number of memories:               0
   Number of memory bits:            0
   Number of processes:              0
   Number of cells:                 34
     $_ANDNOT_                       5
     $_MUX_                          4
     $_NAND_                         2
     $_NOR_                          1
     $_NOT_                          1
     $_ORNOT_                        1
     $_OR_                           6
     $_XNOR_                         1
     $_XOR_                          5
     sky130_fd_sc_hd__dfxtp_2        4
     sky130_fd_sc_hd__mux2_1         4

```
```
Printing statistics.

=== dvsd_4bit_binary_counter ===

   Number of wires:                 27
   Number of wire bits:             30
   Number of public wires:           4
   Number of public wire bits:       7
   Number of memories:               0
   Number of memory bits:            0
   Number of processes:              0
   Number of cells:                 27
     sky130_fd_sc_hd__a21bo_2        1
     sky130_fd_sc_hd__a31o_2         1
     sky130_fd_sc_hd__buf_1          1
     sky130_fd_sc_hd__dfxtp_2        4
     sky130_fd_sc_hd__inv_2          5
     sky130_fd_sc_hd__mux2_1         4
     sky130_fd_sc_hd__nand2_2        2
     sky130_fd_sc_hd__nor2b_2        4
     sky130_fd_sc_hd__o21a_2         1
     sky130_fd_sc_hd__o22a_2         1
     sky130_fd_sc_hd__o2bb2a_2       1
     sky130_fd_sc_hd__or2_2          2

   Chip area for module '\dvsd_4bit_binary_counter': 261.500800

```

-Yosys synthesis strategies

![Screenshot from 2021-09-26 02-33-53](https://user-images.githubusercontent.com/88899069/134785978-c68f1826-dead-448e-8bdd-c106d405bd70.png)
![Screenshot from 2021-09-26 02-36-10](https://user-images.githubusercontent.com/88899069/134785985-821edeb0-2586-4953-b634-f3050ef249f7.png)



### Floorplanning 


![Screenshot from 2021-10-07 00-36-58](https://user-images.githubusercontent.com/88899069/136267549-a8ae54e7-5c2a-4d3c-bb43-6e15f36b3659.png)

### Placement

- Placement Analysis
```
---------------------------------
total displacement        139.9 u
average displacement        1.4 u
max displacement            9.5 u
original HPWL             477.4 u
legalized HPWL            616.4 u
delta HPWL                   29 %
```


- Routing resources analysis:
```
          Routing      Original      Derated      Resource
Layer     Direction    Resources     Resources    Reduction (%)
---------------------------------------------------------------
li1        Vertical         1350          1150          14.81%
met1       Horizontal       1800          1460          18.89%
met2       Vertical         1350          1197          11.33%
met3       Horizontal        900           832          7.56%
met4       Vertical          540           460          14.81%
met5       Horizontal        180           152          15.56%
---------------------------------------------------------------

Final number of vias: 28
Final usage 3D: 133
```

- Final congestion report:
```
Layer         Resource        Demand        Usage (%)    Max H / Max V / Total Overflow
---------------------------------------------------------------------------------------
li1               1150            27            2.35%             0 /  0 /  0
met1              1460            22            1.51%             0 /  0 /  0
met2              1197             0            0.00%             0 /  0 /  0
met3               832             0            0.00%             0 /  0 /  0
met4               460             0            0.00%             0 /  0 /  0
met5               152             0            0.00%             0 /  0 /  0
---------------------------------------------------------------------------------------
Total             5251            49            0.93%             0 /  0 /  0
```
### Routing

 - Routing resources analysis:
 ```
          Routing      Original      Derated      Resource
Layer     Direction    Resources     Resources    Reduction (%)
---------------------------------------------------------------
li1        Vertical         1350           112          91.70%
met1       Horizontal       1800          1448          19.56%
met2       Vertical         1350          1197          11.33%
met3       Horizontal        900           832          7.56%
met4       Vertical          540           460          14.81%
met5       Horizontal        180           152          15.56%
---------------------------------------------------------------
```
- Final congestion report:
```
Layer         Resource        Demand        Usage (%)    Max H / Max V / Total Overflow
---------------------------------------------------------------------------------------
li1                112             0            0.00%             0 /  0 /  0
met1              1448            37            2.56%             0 /  0 /  0
met2              1197            54            4.51%             0 /  0 /  0
met3               832             0            0.00%             0 /  0 /  0
met4               460             0            0.00%             0 /  0 /  0
met5               152             0            0.00%             0 /  0 /  0
---------------------------------------------------------------------------------------
Total             4201            91            2.17%             0 /  0 /  0

```
- Complete detail routing:
```
Total wire length = 663 um.
Total wire length on LAYER li1 = 0 um.
Total wire length on LAYER met1 = 299 um.
Total wire length on LAYER met2 = 335 um.
Total wire length on LAYER met3 = 28 um.
Total wire length on LAYER met4 = 0 um.
Total wire length on LAYER met5 = 0 um.
Total number of vias = 208.
Up-via summary (total 208):.

----------------------
 FR_MASTERSLICE      0
            li1    105
           met1    100
           met2      3
           met3      0
           met4      0
----------------------
                   208
```
- Final Summary:

```
Run Directory: /openLANE_flow/designs/dvsd_4bit_binary_counter/runs/cutu
----------------------------------------

Magic DRC Summary:
Source: /openLANE_flow/designs/dvsd_4bit_binary_counter/runs/cutu/reports/magic//32-magic.drc
Total Magic DRC violations is 0
----------------------------------------

LVS Summary:
Source: /openLANE_flow/designs/dvsd_4bit_binary_counter/runs/cutu/results/lvs/dvsd_4bit_binary_counter.lvs_parsed.lef.log
LVS reports no net, device, pin, or property mismatches.
Total errors = 0
----------------------------------------

Antenna Summary:
Source: /openLANE_flow/designs/dvsd_4bit_binary_counter/runs/cutu/reports/routing//34-antenna.rpt
Number of pins violated: 0
Number of nets violated: 0
[INFO]: check full report here: /openLANE_flow/designs/dvsd_4bit_binary_counter/runs/cutu/reports/final_summary_report.csv
[INFO]: Saving Runtime Environment
[SUCCESS]: Flow Completed Without Fatal Errors.
```

### Layout vs Schematic

- Subcircuit summary

```
Circuit 1: dvsd_4bit_binary_counter                 |Circuit 2: dvsd_4bit_binary_counter                        
------------------------------------------|--------------------------------------------------
sky130_fd_sc_hd__decap_12                           |sky130_fd_sc_hd__decap_12               
sky130_fd_sc_hd__decap_4                            |sky130_fd_sc_hd__decap_4              
sky130_fd_sc_hd__decap_3                            |sky130_fd_sc_hd__decap_3              
sky130_fd_sc_hd__clkbuf_2                           |sky130_fd_sc_hd__clkbuf_2              
sky130_fd_sc_hd__fill_1                             |sky130_fd_sc_hd__fill_1             
sky130_fd_sc_hd__tapvpwrvgnd_1                      |sky130_fd_sc_hd__tapvpwrvgnd_1                
sky130_fd_sc_hd__decap_6                            |sky130_fd_sc_hd__decap_6               
sky130_fd_sc_hd__decap_8                            |sky130_fd_sc_hd__decap_8               
sky130_fd_sc_hd__fill_2                             |sky130_fd_sc_hd__fill_2                 
sky130_fd_sc_hd__inv_2                              |sky130_fd_sc_hd__inv_2                
sky130_fd_sc_hd__o21a_1                             |sky130_fd_sc_hd__o21a_1               
sky130_fd_sc_hd__nand2_1                            |sky130_fd_sc_hd__nand2_1             
sky130_fd_sc_hd__or2_1                              |sky130_fd_sc_hd__or2_1               
sky130_fd_sc_hd__clkbuf_1                           |sky130_fd_sc_hd__clkbuf_1                 
sky130_fd_sc_hd__clkbuf_16                          |sky130_fd_sc_hd__clkbuf_16              
sky130_fd_sc_hd__o22a_1                             |sky130_fd_sc_hd__o22a_1                 
sky130_fd_sc_hd__nor2b_1                            |sky130_fd_sc_hd__nor2b_1              
sky130_fd_sc_hd__mux2_1                             |sky130_fd_sc_hd__mux2_1              
sky130_fd_sc_hd__a21bo_1                            |sky130_fd_sc_hd__a21bo_1
sky130_fd_sc_hd__dfxtp_1                            |sky130_fd_sc_hd__dfxtp_1
sky130_fd_sc_hd__o2bb2a_1                           |sky130_fd_sc_hd__o2bb2a_1
sky130_fd_sc_hd__a31o_1                             |sky130_fd_sc_hd__a31o_1
sky130_fd_sc_hd__buf_1                              |sky130_fd_sc_hd__buf_1
---------------------------------------------------------------------------------------
Circuits match uniquely.
Netlists match uniquely.
```



##  magic layout generate 

![T-10](https://user-images.githubusercontent.com/88899069/130263482-1cae4239-1f15-4370-bf50-48deca90239a.png)


```sh
bash-4:$

magic dvsd_4bit_binary_counter.mag


```
![Screenshot from 2021-08-20 21-52-38](https://user-images.githubusercontent.com/88899069/130264092-1211e24a-ab7b-4c75-9b3a-03df196cc362.png)
![magic_layout(1)](https://user-images.githubusercontent.com/88899069/130264133-08094a4a-d5e8-41d0-8463-b5da329835de.png)


##  Post layout simulation 
 post-layout simulation command
![post-layout simulation command waveform](https://user-images.githubusercontent.com/88899069/130676619-274a5a5d-1ede-40de-abf7-63303c719678.png)


Post-layout simulation waveform
![Screenshot from 2021-08-28 18-13-21](https://user-images.githubusercontent.com/88899069/131218272-1d1e1643-877b-45bd-8602-0689e8d8a9bb.png)

## Steps to reproduce and explore the design

- Clone the project using following command
 
`git clone https://github.com/BALAKRISHNA-EPPILI/dvsd_4bit_binary_counter.git`

- To explore synthesis of the design

```
make mount
flow.tcl -design dvsd_4bit_binary_counter -synth_explore
```

- To reproduce Pre-layout simulation

```
cd pre_layout/
iverilog -o dvsd_4bit_binary_counter dvsd_4bit_binary_counter.v test_dvsd_4bit_binary_counter.v
./dvsd_pe
gtkwave dvsd_4bit_binary_counter.vcd
```

- To explore floorplan

```
cd floorplan/
magic lef read merged.lef def read dvsd_4bit_binary_counter.floorplan.def &
```

- To explore placement

```
cd placement/ 
magic lef read merged.lef def read dvsd_4bit_binary_counter.placement.def &
```

- To explore final layout

```
cd final_layout/
magic dvsd_4bit_binary_counter.mag
```

- To reproduce Post-layout simulation

```
cd post_layout/
iverilog -o gls -DFUNCTIONAL -DUNIT_DELAY=#1 gls.v primitives.v sky130_fd_sc_hd.v
./gls
gtkwave gls.vcd
```

- Complete details, logs and results can be found under this [folder](https://github.com/Khalique13/dvsd-8-bit-priority-encoder/tree/main/dvsd_pe). 

```
dvsd_4bit_binary_counter
├── config.tcl
├── runs
│   ├── run
│   │   ├── config.tcl
│   │   ├── logs
│   │   │   ├── cts
│   │   │   ├── cvc
│   │   │   ├── floorplan
│   │   │   ├── klayout
│   │   │   ├── magic
│   │   │   ├── placement
│   │   │   ├── routing
│   │   │   └── synthesis
│   │   ├── reports
│   │   │   ├── cts
│   │   │   ├── cvc
│   │   │   ├── floorplan
│   │   │   ├── klayout
│   │   │   ├── magic
│   │   │   ├── placement
│   │   │   ├── routing
│   │   │   └── synthesis
│   │   ├── results
│   │   │   ├── cts
│   │   │   ├── cvc
│   │   │   ├── floorplan
│   │   │   ├── klayout
│   │   │   ├── magic
│   │   │   ├── placement
│   │   │   ├── routing
│   │   │   └── synthesis
│   │   └── tmp
│   │       ├── cts
│   │       ├── cvc
│   │       ├── floorplan
│   │       ├── klayout
│   │       ├── magic
│   │       ├── placement
│   │       ├── routing
│   │       └── synthesis
```

## Key points to Remember

- Keep the top module name and design name always same, else errors would come in the design.

## Area of improvement

- To perform spice simulation of the final GDS layout.

## References

- [GitLab/OpenLane workshop](https://gitlab.com/gab13c/openlane-workshop)
- [The OpenROAD Project/OpenLane](https://github.com/The-OpenROAD-Project/OpenLane)
- Ahmed Ghazy and Mohamed Shalan, "OpenLane: The Open-Source Digital ASIC Implementation Flow", Article No.21, Workshop on Open-Source EDA Technology (WOSET), 2020. [Paper](https://github.com/woset-workshop/woset-workshop.github.io/blob/master/PDFs/2020/a21.pdf)
- [YOUTUBE/OpenLane Overview](https://www.youtube.com/watch?v=d0hPdkYg5QI)
- [GitHUB/openlane_build_script](https://github.com/nickson-jose/openlane_build_script)
- [GitLab/mythcore_synth](https://github.com/deepsita/mythcore_synth)

## Acknowledgement

- [Kunal Ghosh](https://github.com/kunalg123), Founder, VSD Corp. Pvt. Ltd

## Author

- [Balakrishna Eppili](https://github.com/BALAKRISHNA-EPPILI), Bachelor of Technology in Electronics & Communication Engineering,Dronacharya Group of Institutions,Greater Noida, U.P.
