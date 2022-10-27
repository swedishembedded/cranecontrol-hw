*** Settings ***
Variables  ${CURDIR}/variables.py
Library  ${CURDIR}/pcb.py

*** Test Cases ***

All footprints have 3d models
	Pcbnew Check Board 3d Models  ${KICAD_PCB}
