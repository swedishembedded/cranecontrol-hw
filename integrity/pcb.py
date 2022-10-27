#!/usr/bin/python3
import pcbnew
import os
from robot.api import logger

KICAD_PATH = os.environ["KICAD_PATH"] if ("KICAD_PATH" in os.environ) else "/usr/share/kicad/"

def pcbnew_check_board_3d_models(kicad_pcb):
    print("Checking: "+kicad_pcb)
    board = pcbnew.LoadBoard(kicad_pcb);

    ignore = [
            # TPS regulator
            "SwedishEmbedded:RGX_VQFN-11",
            # MOSFETS
            "SwedishEmbedded:PowerPack-8x8-Dual",
            # Connectors
            "SwedishEmbedded:ANYTEK_7.62mm_2x_3P_32A",
            "SwedishEmbedded:PhoenixContact_Power41A_25_2-G-762_1x02_P7.62mm_Horizontal",
            "SwedishEmbedded:RJ45_Tranformer",
            "SwedishEmbedded:CONN_SENSOR",
            "SwedishEmbedded:CONN_CAN",
            "SwedishEmbedded:CONN_BUTTON",
            "SwedishEmbedded:CONN_HALL",
            "SwedishEmbedded:CONN_POWER_10A",
            "SwedishEmbedded:CONN_BRKRES",
            "SwedishEmbedded:CONN_JOYSTICK",
            "SwedishEmbedded:CONN_ENCODER",
            "SwedishEmbedded:CONN_AN_OUT",
            # RESET switch
            "SwedishEmbedded:SW_PTS540",
            # PCB elements
            "SwedishEmbedded:TestPoint_Pad_0.5x0.5mm",
            "SwedishEmbedded:MountingHole_3.2mm_M3_Pad",
            "SwedishEmbedded:GND_100X30",
            "SwedishEmbedded:GND_ANALOG_IN",
            "SwedishEmbedded:GND_ANALOG_OUT",
            "SwedishEmbedded:GND_MOTOR_DRIVER",
    ]
    not_found = 0
    for f in board.Footprints():
        if f.GetFPIDAsString() in ignore:
            continue
        if not f.Models().size():
            raise Exception("Footprint: "+f.GetFPIDAsString()+" has no model!");
        for m in f.Models():
            fname = m.m_Filename.replace("${KICAD6_3DMODEL_DIR}", KICAD_PATH+"/3dmodels")
            if not os.path.exists(fname):
                not_found += 1
                logger.console("Missing 3d model ("+f.GetFPIDAsString()+"): "+fname)

    if not_found:
        raise Exception("Some 3D models are missing (%d in total)! Please fix this!" % (not_found))
