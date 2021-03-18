#
# Modular Garden Monitoring System
# Senior Design Project - Group 12
#
# mgms.py
#

# Imports
import serial  # https://pyserial.readthedocs.io/en/latest/shortintro.html
import PySimpleGUI as sg  # https://pysimplegui.readthedocs.io/en/latest/
import time  # time.sleep(N) ~ sleep for N (float) seconds
import matplotlib.pyplot as plt  # https://matplotlib.org/stable/contents.html
import numpy as np

RADIO_LIST = []
RADIO_DATA_PULL = []


# TODO: radio struct? updated with get radios that contains radios name, location, DH, DL, etc.
class Radio:
    def __init__(self, MY, SH, SL, DB, NI):
        self.MY = MY
        self.SH = SH
        self.SL = SL
        self.DB = DB
        self.NI = NI

    def print_data(self):
        print("My Radio Info:\nMY: {}\nSH: {}\nSL: {}\nDB: {}\nNI: {}\n".format(self.MY, self.SH, self.SL, self.DB,
                                                                                self.NI))
        return


def compare_radios(a, b):
    if a.MY == b.MY and a.SH == b.SH and a.SL == b.SL and a.DB == b.DB and a.NI == b.NI:
        return 1
    return 0


test = b'0\r13A200\r40D51989\r24\rTest Responder\r\r0\rXXXXXX\rYYYYYYYY\r24\rTest Responder\r\r0\rAAAAAA\rBBBBBBBB\r24\rTest Responder\r\r\r'


def parse_radio_ids(radio_ids):
    temp_radio_list = []
    temp = radio_ids.split(b'\r\r')
    for x in range(len(temp) - 1):
        radio = temp[x].split(b'\r')
        # for debugging
        # print(radio)
        if len(radio) == 5:
            temp_radio = Radio(radio[0], radio[1], radio[2], radio[3], radio[4])
            temp_radio_list.append(temp_radio)
        else:
            msg = 'weird radio data'
    # for debugging
    # for each in temp_radio_list:
    # each.print_data()
    # print(temp)
    return temp_radio_list


def compare_radio_list(temp_radio_list):
    if len(RADIO_LIST) == 0:
        for each in temp_radio_list:
            RADIO_LIST.append(each)
    else:
        for each in temp_radio_list:
            contains = 0
            for x in range(len(RADIO_LIST)):
                if compare_radios(each, RADIO_LIST[x]) == 1:
                    contains = contains + 1
            if contains == 0:
                RADIO_LIST.append(each)
    return


def get_sampling_freq_input():
    # TODO: Link these to buttons or something or make GUI to set?
    sampling_frequency = int(input("How often would you like to sample data?\nPlease enter a number in minutes.\n"))
    return sampling_frequency


def get_radio_name_input():
    # TODO: Link these to buttons or something or make GUI to set?
    radio_name = input("How would you like to identify this radio?\n")
    return radio_name


def scan_for_radios(serial_port):
    # TODO: use this function to scan for new or existing radios and update radio list/struct/whatever
    ser = serial.Serial(serial_port)

    ser.write(b'\r\r')
    time.sleep(1.5)
    # enables command mode (1.5 sec delay is necessary)
    ser.write(b'+++')
    time.sleep(1.5)
    print('Initiate command mode waiting for OK')
    line = ser.read_until(b'\r', size=None)
    print('data from radio {}'.format(line))  # debugging line

    # command mode calls
    ser.write(b'ATND\r')  # Node Discovery
    time.sleep(1.5)

    # response
    print('trying to get radio list')
    response = ser.read_until(b'\r\r\r')
    print('data from radio {}'.format(response))
    radio_data = response

    # closes command mode
    ser.write(b'ATCN\r')
    time.sleep(1.5)
    print('Command ATCN mode waiting for OK')
    line = ser.read_until(b'\r', size=None)
    print('data from radio {}'.format(line))  # debugging line

    # closes serial port
    ser.close()

    # return radio data to main function
    return radio_data


def sample_radios(serial_port):
    # List for storing radio data (to Return)
    for each in RADIO_LIST:
        # opens serial port
        ser = serial.Serial(serial_port)

        # enables command mode (1.5 sec delay is necessary)
        ser.write(b'\r\r')
        time.sleep(1.5)
        ser.write(b'+++')
        time.sleep(1.5)
        print('Initiate command mode waiting for OK')
        line = ser.read_until(b'\r', size=None)
        print('data from radio {}'.format(line))  # debugging line
        # command mode calls
        DH = b'ATDH 00' + each.SH + b'\r'
        ser.write(DH)  # Correct DH testing
        time.sleep(1.5)
        print('waiting for OK')
        line = ser.read_until(b'\r', size=None)

        DL = b'ATDL ' + each.SL + b'\r'
        ser.write(DL)  # Correct DL testing
        time.sleep(1.5)
        print('waiting for OK')
        line = ser.read_until(b'\r', size=None)

        # closes command mode
        ser.write(b'ATCN\r')
        time.sleep(1.5)
        print('Command ATCN mode waiting for OK')
        line = ser.read_until(b'\r', size=None)
        print('data from radio {}'.format(line))  # debugging line

        # requests data
        ser.write(b'Request Info\r')
        print('trying to get response from radio info request')  # debugging/breadcrumb line
        time.sleep(1.5)
        # line = ser.readline()
        line = ser.read_until(b'\r', size=None)
        print('data from radio {}'.format(line))  # debugging line
        radio_data = line

        # closes serial port
        ser.close()
    # return radio data to main function
    # NEED RADIO WITH DUMMY DATA FROM ALAN
    return radio_data


def parse_data(sensor_data):
    # return list of parsed data to main function
    return sensor_data.split(',')


def show_gui(parsed_data):
    # green theme for green project
    sg.theme('Green')

    # Title and description shown at top of GUI
    description = sg.Column(
        [[sg.Text(f'My Garden', font=('Arial Rounded MT Bold', 18), pad=((10, 0), (10, 0)))],
         [sg.Text(f'Modular Garden Monitoring System', font=('Arial', 12), pad=((10, 10), (0, 10)))]],
        key='COL1')

    # Data type labels shown in the Left Body of the GUI
    data_types = sg.Column(
        [[sg.Text(f'Soil Moisture:', font=('Arial', 12))],
         [sg.Text(f'Soil Temperature:', font=('Arial', 12))],
         [sg.Text(f'Air Humidity:', font=('Arial', 12))],
         [sg.Text(f'Air Temperature:', font=('Arial', 12))],
         [sg.Text(f'Sunlight:', font=('Arial', 12))]],
        element_justification='left', key='COL2')

    # Current sensor values shown in the Right Body of the GUI
    sensor_data = sg.Column(
        [[sg.Text(f'{parsed_data[0]} %', font=('Arial Rounded MT Bold', 12))],
         [sg.Text(f'{parsed_data[1]} °F', font=('Arial Rounded MT Bold', 12))],
         [sg.Text(f'{parsed_data[2]} %', font=('Arial Rounded MT Bold', 12))],
         [sg.Text(f'{parsed_data[3]} °F', font=('Arial Rounded MT Bold', 12))],
         [sg.Text(f'{parsed_data[4]} %', font=('Arial Rounded MT Bold', 12))]],
        element_justification='left', key='COL3')

    # Buttons for pop-up windows that include graphs
    data_buttons = sg.Column(
        [[sg.Button('Graph', font=('Arial', 8), key='soil_m')],
         [sg.Button('Graph', font=('Arial', 8), key='soil_t')],
         [sg.Button('Graph', font=('Arial', 8), key='air_m')],
         [sg.Button('Graph', font=('Arial', 8), key='air_t')],
         [sg.Button('Graph', font=('Arial', 8), key='sun')]],
        element_justification='left', key='COL4')

    # Buttons to close out of gui
    button_ok = sg.Column(
        [[sg.Button('Close', font=('Arial', 12), pad=((0, 20), (10, 10)))]],
        element_justification='left', key='COL5')

    # Button to scan for radios
    button_scan = sg.Column(
        [[sg.Button('Scan for Radios', font=('Arial', 12), pad=((20, 0), (10, 10)), key='scan')]],
        element_justification='right', key='COL6')

    # everything that shows up in the GUI
    layout = [[description],
              [data_types, sensor_data, data_buttons],
              [button_ok, button_scan]]

    # create and open window
    window = sg.Window(layout=layout, title='Modular Garden Monitoring System', margins=(0, 0),
                       finalize=True, element_justification='center', no_titlebar=False, grab_anywhere=True)

    # loop keeps window open, executes events, reads values
    while True:
        event, values = window.read()

        # if user closes window or clicks close button
        if event == sg.WIN_CLOSED or event == 'Close':
            break

        # Popup for scanning for radios
        if event == 'scan':
            new_radios = 0
            sg.Popup('Successfully Scanned for Radios.', f'Found {new_radios} new radios.', title='Scan for Radios')

        # Popup for Soil Moisture
        if event == 'soil_m':
            popup_text = '[insert plot w/ matplotlib here]'
            # TODO add charts to popups in GUI
            sg.Popup('This is a pop-up for Soil Moisture', popup_text, title='Soil Moisture')

        # Popup for Soil Temperature
        if event == 'soil_t':
            popup_text = '[insert plot w/ matplotlib here]'
            # TODO add charts to popups in GUI
            sg.Popup('This is a pop-up for Soil Temperature', popup_text, title='Soil Temperature')

        # Popup for Air Humidity
        if event == 'air_m':
            popup_text = '[insert plot w/ matplotlib here]'
            # TODO add charts to popups in GUI
            sg.Popup('This is a pop-up for Air Humidity', popup_text, title='Air Humidity')

        # Popup for Air Temperature
        if event == 'air_t':
            popup_text = '[insert plot w/ matplotlib here]'
            # TODO add charts to popups in GUI
            sg.Popup('This is a pop-up for Air Temperature', popup_text, title='Air Temperature')

        # Popup for Sunlight
        if event == 'sun':
            popup_text = '[insert plot w/ matplotlib here]'
            # TODO add charts to popups in GUI
            sg.Popup('This is a pop-up for Sunlight', popup_text, title='Sunlight')

    # closes window
    window.close()


# Main Function - Start Here
def main():
    # Step 1: Collect Sensor Data
    # TODO RECIEVE AND PARSE DATA
    #############################TESTING AREA COMMAND MODE SHIT#########################################################
    test_radio_list = scan_for_radios('COM3')  # using windows - /dev/ttyUSB0 for linux
    radios = parse_radio_ids(test_radio_list) # takes scanned radios and creates radio objects
    compare_radio_list(radios) # Compares list of radio objects to MASTER RADIO LIST
    print("radio list after first addition")
    for each in RADIO_LIST:
        each.print_data()
    sample_radios('COM3') # "Samples" from single radio

    ####################################################################################################################
    ###############################TESTING AREA FOR SCANNING FOR RADIOS#################################################
    test_radio_list = scan_for_radios('COM3') # using windows - /dev/ttyUSB0 for linux
    radios = parse_radio_ids(test_radio_list) # scans for single radio i have
    compare_radio_list(radios)
    print("radio list after first addition")
    for each in RADIO_LIST:
        each.print_data()

    radios = parse_radio_ids(test) # testing for recieving multiple radios from ATND test is a dummy byte strand
    compare_radio_list(radios)
    print("radio list after second and third addition and one repeat radio")
    for each in RADIO_LIST:
        each.print_data()
    ###################################################################################################################
    # Step 2: Parse Collected Data
    # Alan has data format ready
    # dummy data since i don't have the radio
    sensor_data = "12,34,46,78,90"
    parsed_data = parse_data(sensor_data)

    # Step 3: Visualize Data
    # TODO make charts with matplotlib

    # Step 4: GUI
    show_gui(parsed_data)


if __name__ == '__main__':
    main()
