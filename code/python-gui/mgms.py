#! /usr/bin/env python3
# -*- coding: utf-8 -*-

# mgms.py
# Main module for GUI front-end
# Sadie Gladden <gladdesm@mail.uc.edu>
# Eric Krenz <krenzew@mail.uc.edu>


import time
import traceback
import threading
from pathlib import Path
import matplotlib.pyplot as plt
import serial
import PySimpleGUI as sg



RADIO_LIST = []
RADIO_DATA_PULL = []
PARSED_RADIO_DATA = []
SAMPLE_RATE = 120


# TODO: radio struct? updated with get radios that contains radios name,
#       location, DH, DL, etc.
class Radio:
    def __init__(self, MY, SH, SL, DB, NI):
        self.MY = MY
        self.SH = SH
        self.SL = SL
        self.DB = DB
        self.NI = NI
        self.filename = str(self.NI, 'UTF-8')

    def print_data(self):
        print(
            "My Radio Info:\nMY: {}\nSH: {}\nSL: {}\nDB: {}\nNI: {}\n".format(
                self.MY, self.SH, self.SL, self.DB, self.NI))
        return


def compare_radios(a, b):
    if a.MY == b.MY and a.SH == b.SH and a.SL == b.SL and a.DB == b.DB \
        and a.NI == b.NI:
        return 1
    return 0


def parse_radio_ids(radio_ids):
    temp_radio_list = []
    radio_ids = radio_ids.replace(b'OK\r', b'')
    radio_ids = radio_ids.replace(b'EEww\r', b'')
    temp = radio_ids.split(b'\r\r')
    for x in range(len(temp) - 1):
        radio = temp[x].split(b'\r')
        if len(radio) == 5:
            temp_radio = Radio(radio[0], radio[1], radio[2], radio[3],
                               radio[4])
            temp_radio_list.append(temp_radio)
        else:
            msg = 'weird radio data'
    return temp_radio_list


def get_sample_rate():
    return SAMPLE_RATE


def clear_historical_data():
    return


def compare_radio_list(temp_radio_list):
    new_radio = 0
    if len(RADIO_LIST) == 0 or len(RADIO_LIST) > len(temp_radio_list):
        RADIO_LIST.clear()
        for each in temp_radio_list:
            RADIO_LIST.append(each)
            new_radio = new_radio + 1
    else:
        for each in temp_radio_list:
            contains = 0
            for x in range(len(RADIO_LIST)):
                if compare_radios(each, RADIO_LIST[x]) == 1:
                    contains = contains + 1
            if contains == 0:
                RADIO_LIST.append(each)
                new_radio = new_radio + 1
    return new_radio


def get_radio_names():
    name = []
    if len(RADIO_LIST) == 0:
        return name
    else:
        for each in RADIO_LIST:
            name.append(str(each.NI, 'UTF-8'))
        return name


def set_sampling_freq(input):
    # TODO: Link these to buttons or something or make GUI to set?
    SAMPLE_RATE = input
    return


def scan_for_radios(serial_port):
    ser = serial.Serial(serial_port, timeout=3)

    ser.write(b'\r')
    time.sleep(1.5)
    # enables command mode (1.5 sec delay is necessary)
    ser.write(b'+++')
    time.sleep(1.5)
    # print('Initiate command mode waiting for OK')
    line = ser.read_until(b'\r', size=None)

    # command mode calls
    ser.write(b'ATND\r')  # Node Discovery
    time.sleep(1.5)

    # response
    # print('trying to get radio list')
    response = ser.read_until(b'\r\r\r')
    #print('data from radio {}'.format(response))
    radio_data = response

    # closes command mode
    ser.write(b'ATCN\r')
    time.sleep(1.5)
    # print('Command ATCN mode waiting for OK')
    line = ser.read_until(b'\r', size=None)

    # closes serial port
    ser.close()

    # return radio data to main function
    return radio_data


def sample_radios(serial_port):
    # List for storing radio data (to Return)
    RADIO_DATA_PULL.clear()
    if len(RADIO_LIST) > 1:
        for each in RADIO_LIST:
            # opens serial port
            ser = serial.Serial(serial_port)

            # enables command mode (1.5 sec delay is necessary)
            ser.write(b'\r\r')
            time.sleep(1.5)
            ser.write(b'+++')
            time.sleep(1.5)
            # print('Initiate command mode waiting for OK')
            line = ser.read_until(b'\r', size=None)
            # command mode calls
            DH = b'ATDH 00' + each.SH + b'\r'
            ser.write(DH)  # Correct DH testing
            time.sleep(1.5)
            # print('waiting for OK')
            line = ser.read_until(b'\r', size=None)

            DL = b'ATDL ' + each.SL + b'\r'
            ser.write(DL)  # Correct DL testing
            time.sleep(1.5)
            # print('waiting for OK')
            line = ser.read_until(b'\r', size=None)

            # closes command mode
            ser.write(b'ATCN\r')
            time.sleep(1.5)
            # print('Command ATCN mode waiting for OK')
            line = ser.read_until(b'\r', size=None)

            # requests data
            ser.write(b'\r\r')
            time.sleep(1.5)
            ser.write(b'Request Info\r')
            time.sleep(1.5)
            # line = ser.readline()
            line = ser.read_until(b'\r\r', size=None)
            radio_data = line
            temp_arr = []
            temp_arr.append(each.NI)
            temp_arr.append(radio_data)
            RADIO_DATA_PULL.append(temp_arr)

            # closes serial port
            ser.close()
        # return radio data to main function
        # NEED RADIO WITH DUMMY DATA FROM ALAN
    else:
        radio_data = b'No Radios Set Up\r'
        RADIO_DATA_PULL.append(radio_data)
    return RADIO_DATA_PULL


def parse_radio_data(data):
    # return list of parsed data to main function
    PARSED_RADIO_DATA.clear()
    for each in data:
        temp_arr = []
        temp_arr.append(str(each[0], 'UTF-8'))
        temp = each[1].replace(b'OK\r', b'')
        temp = temp.replace(b'EEww\r', b'')
        temp = temp.replace(b'\r\r', b'')
        value = str(temp, 'UTF-8')
        temp_arr.append(value)
        PARSED_RADIO_DATA.append(temp_arr)
    return PARSED_RADIO_DATA


def background_collection(delay, stop, task):
    next_time = time.time() + delay
    while True:
        if stop():
            break
        time.sleep(max(0, next_time - time.time()))
        try:
            task()
        except Exception:
            traceback.print_exc()
            # in production code you might want to have this instead of course:
            # logger.exception("Problem while executing repetitive task.")
        # skip tasks if we are behind schedule:
        next_time += (time.time() - next_time) // delay * delay + delay


def test_background():
    #todo
    print("sampling time:", time.asctime(time.localtime(time.time())))
    data = sample_radios('COM4')
    names = get_radio_names()
    parsed_radio_data = parse_radio_data(data)
    store_parsed_data(parsed_radio_data)


def store_parsed_data(data):
    #TODO
    return


def clear_radio_list():
    RADIO_LIST.clear()
    return


def parse_data(sensor_data):
    # return list of parsed data to main function
    return sensor_data.split(',')


def show_gui(parsed_data, sensor1_data, sensor2_data, thread):
    # green theme for green project
    sg.theme('Green')

    # Title and description shown at top of GUI
    description = sg.Column([[
        sg.Text(f'My Garden',
                font=('Arial Rounded MT Bold', 18),
                pad=((10, 0), (10, 0)))
    ],
                             [
                                 sg.Text(f'Modular Garden Monitoring System',
                                         font=('Arial', 12),
                                         pad=((10, 10), (0, 10)))
                             ]],
                            key='COL1')

    # Data type labels shown in the Left Body of the GUI
    data_types = sg.Column(
        [[sg.Text(f'Soil Moisture:', font=('Arial', 12))],
         [sg.Text(f'Soil Temperature:', font=('Arial', 12))],
         [sg.Text(f'Air Humidity:', font=('Arial', 12))],
         [sg.Text(f'Air Temperature:', font=('Arial', 12))],
         [sg.Text(f'Sunlight:', font=('Arial', 12))]],
        element_justification='left',
        key='COL2')

    # Current sensor values shown in the Right Body of the GUI
    sensor_data = sg.Column(
        [[sg.Text(f'{parsed_data[0]} %', font=('Arial Rounded MT Bold', 12))],
         [sg.Text(f'{parsed_data[1]} °F', font=('Arial Rounded MT Bold', 12))],
         [sg.Text(f'{parsed_data[2]} %', font=('Arial Rounded MT Bold', 12))],
         [sg.Text(f'{parsed_data[3]} °F', font=('Arial Rounded MT Bold', 12))],
         [sg.Text(f'{parsed_data[4]} %', font=('Arial Rounded MT Bold', 12))]],
        element_justification='left',
        key='COL3')

    # Buttons for pop-up windows that include graphs
    data_buttons = sg.Column(
        [[sg.Button('Graph', font=('Arial', 8), key='soil_m')],
         [sg.Button('Graph', font=('Arial', 8), key='soil_t')],
         [sg.Button('Graph', font=('Arial', 8), key='air_m')],
         [sg.Button('Graph', font=('Arial', 8), key='air_t')],
         [sg.Button('Graph', font=('Arial', 8), key='sun')]],
        element_justification='left',
        key='COL4')

    # Buttons to close out of gui
    button_ok = sg.Column(
        [[sg.Button('Close', font=('Arial', 12), pad=((0, 20), (0, 10)))]],
        element_justification='right',
        key='COL7')

    # Button Clears Radios...
    button_clear = sg.Column([[
        sg.Button(
            'Clear', font=('Arial', 12), pad=((0, 0), (10, 10)), key='clear')
    ]],
                             element_justification='left',
                             key='COL8')

    # Button to scan for radios
    button_scan = sg.Column([[
        sg.Button('Scan for Radios',
                  font=('Arial', 12),
                  pad=((0, 10), (10, 10)),
                  key='scan')
    ]],
                            element_justification='left',
                            key='COL5')

    # Button to collect data
    button_collect = sg.Column([[
        sg.Button('Collect Data',
                  font=('Arial', 12),
                  pad=((0, 0), (10, 10)),
                  key='collect')
    ]],
                               element_justification='right',
                               key='COL6')

    button_setup = sg.Column([[
        sg.Button(
            'Setup', font=('Arial', 12), pad=((0, 0), (0, 10)), key='setup')
    ]],
                             element_justification='right',
                             key='COL9')

    button_auto_collect = sg.Column([[
        sg.Button('Auto Collect',
                  font=('Arial', 12),
                  pad=((0, 0), (0, 10)),
                  key='auto_collect')
    ]],
                                    element_justification='right',
                                    key='COL10')

    # everything that shows up in the GUI
    layout = [[description], [data_types, sensor_data, data_buttons],
              [button_scan, button_collect],
              [button_ok, button_setup, button_auto_collect]]

    # create and open window
    window = sg.Window(layout=layout,
                       title='Modular Garden Monitoring System',
                       margins=(0, 0),
                       finalize=True,
                       element_justification='center',
                       no_titlebar=False,
                       grab_anywhere=True)

    # loop keeps window open, executes events, reads values
    while True:
        event, values = window.read()

        # if user closes window or clicks close button
        if event == sg.WIN_CLOSED or event == 'Close':
            break

        # Popup for scanning for radios
        if event == 'scan':
            prev_num_radios = len(RADIO_LIST)
            try:
                test_radio_list = scan_for_radios(
                    'COM4')  # using windows - /dev/ttyUSB0 for linux
                radios = parse_radio_ids(
                    test_radio_list
                )  # takes scanned radios and creates radio objects
                num_radios = compare_radio_list(
                    radios
                )  # Compares list of radio objects to MASTER RADIO LIST
                names = get_radio_names()
                if len(radios) == 0:
                    sg.Popup(
                        'Successfully Scanned for Radios.',
                        f'{len(RADIO_LIST)} Current Radios.\n'
                        'No New Radios Found',
                        'Please Ensure Your Radio Is In Range And Powered On',
                        title='Scan for Radios')
                elif prev_num_radios > len(radios):
                    lost_radios = prev_num_radios - num_radios
                    sg.Popup('Successfully Scanned for Radios.',
                             f'Found {num_radios} radios.',
                             f'Number of Radios Lost: '
                             f'{lost_radios}',
                             f'Current Radios: {names}',
                             title='Scan for Radios')
                elif prev_num_radios < len(radios):
                    total_radios = prev_num_radios + num_radios
                    sg.Popup('Successfully Scanned for Radios.',
                             f'Found {total_radios} radios.',
                             f'Number of New Radios: '
                             f'{num_radios}',
                             f'Current Radios: {names}',
                             title='Scan for Radios')
                else:
                    sg.Popup(
                        'Successfully Scanned for Radios.',
                        f'{len(RADIO_LIST)} Current Radios.\n'
                        'No New Radios Found',
                        f'Current Radios: {names}',
                        title='Scan for Radios')
            except:
                sg.Popup('Error No Coordinator Connected',
                         title='Scan for Radios')

        # Popup for collect current data
        if event == 'collect':
            if len(RADIO_LIST) == 0:
                sg.Popup('No Connected Radios.\nPlease Scan for Radios',
                         title='Current Data')
            else:
                data = sample_radios('COM4')
                names = get_radio_names()
                parsed_radio_data = parse_radio_data(data)
                sg.Popup(
                    f'Successfully Collected Current Data From '
                    f'{len(RADIO_LIST)} Radios.',
                    f'Radio Names: {names}',
                    f'Raw Radio Data: {parsed_radio_data}',
                    title='Current Data')

        # Popup for clear radio list internal use only
        if event == 'clear':
            clear_radio_list()

        # Popup to set collection time
        if event == 'setup':
            sample_freq = sg.popup_get_text(
                'Please enter a sampling frequency in minutes', title='Setup')
            set_sampling_freq(sample_freq)

        # Sets to start auto collecting data
        if event == 'auto_collect':
            if len(RADIO_LIST) == 0:
                sg.Popup('No Connected Radios.\nPlease Scan for Radios',
                         title='Auto Collect Data')
            else:
                if not thread.is_alive():
                    thread.start()
                    sg.Popup(f'Collecting Data Every {SAMPLE_RATE} Seconds',
                             title='Auto Collect Data')
                else:
                    sg.Popup('Auto Collection Error',
                             title='Auto Collect Data')

        # Popup for Soil Moisture
        if event == 'soil_m':
            plt.close('all')
            plot_sensor1 = []
            plot_sensor2 = []
            hours_ago = [
                -5.00, -4.75, -4.5, -4.25, -4.00, -3.75, -3.5, -3.25, -3.00,
                -2.75, -2.5, -2.25, -2.00, -1.75, -1.5, -1.25, -1.00, -0.75,
                -0.5, -0.25
            ]
            for i in range(20):
                plot_sensor1.append(sensor1_data[i][1])
                plot_sensor2.append(sensor2_data[i][1])
            plt.plot(hours_ago, plot_sensor1, 'g', label="Sensor 1")
            plt.plot(hours_ago, plot_sensor2, 'y', label="Sensor 2")
            plt.title('Soil Moisture Plot - Past 5 Hours')
            plt.xlabel('Time (Hours Ago)')
            plt.ylabel('Soil Moisture (%)')
            plt.xlim([-5, 0])
            plt.ylim([0, 100])
            plt.legend()
            plt.show(block=False)
            # popup_text = '[insert plot w/ matplotlib here]'
            # TODO add charts to popups in GUI
            # sg.Popup('This is a pop-up for Soil Moisture',
            #          popup_text, title='Soil Moisture')

        # Popup for Soil Temperature
        if event == 'soil_t':
            plt.close('all')
            plot_sensor1 = []
            plot_sensor2 = []
            hours_ago = [
                -5.00, -4.75, -4.5, -4.25, -4.00, -3.75, -3.5, -3.25, -3.00,
                -2.75, -2.5, -2.25, -2.00, -1.75, -1.5, -1.25, -1.00, -0.75,
                -0.5, -0.25
            ]
            for i in range(20):
                plot_sensor1.append(sensor1_data[i][0])
                plot_sensor2.append(sensor2_data[i][0])
            plt.plot(hours_ago, plot_sensor1, 'g', label="Sensor 1")
            plt.plot(hours_ago, plot_sensor2, 'y', label="Sensor 2")
            plt.title('Soil Temperature Plot - Past 5 Hours')
            plt.xlabel('Time (Hours Ago)')
            plt.ylabel('Soil Temperature (°F)')
            plt.xlim([-5, 0])
            plt.ylim([0, 100])
            plt.legend()
            plt.show(block=False)
            # popup_text = '[insert plot w/ matplotlib here]'
            # TODO add charts to popups in GUI
            # sg.Popup('This is a pop-up for Soil Temperature',
            #          popup_text, title='Soil Temperature')

        # Popup for Air Humidity
        if event == 'air_m':
            plt.close('all')
            plot_sensor1 = []
            plot_sensor2 = []
            hours_ago = [
                -5.00, -4.75, -4.5, -4.25, -4.00, -3.75, -3.5, -3.25, -3.00,
                -2.75, -2.5, -2.25, -2.00, -1.75, -1.5, -1.25, -1.00, -0.75,
                -0.5, -0.25
            ]
            for i in range(20):
                plot_sensor1.append(sensor1_data[i][1])
                plot_sensor2.append(sensor2_data[i][1])
            plt.plot(hours_ago, plot_sensor1, 'g', label="Sensor 1")
            plt.plot(hours_ago, plot_sensor2, 'y', label="Sensor 2")
            plt.title('Air Humidity Plot - Past 5 Hours')
            plt.xlabel('Time (Hours Ago)')
            plt.ylabel('Air Humidity (%)')
            plt.xlim([-5, 0])
            plt.ylim([0, 100])
            plt.legend()
            plt.show(block=False)
            # popup_text = '[insert plot w/ matplotlib here]'
            # TODO add charts to popups in GUI
            # sg.Popup('This is a pop-up for Air Humidity',
            #          popup_text, title='Air Humidity')

        # Popup for Air Temperature
        if event == 'air_t':
            plt.close('all')
            plot_sensor1 = []
            plot_sensor2 = []
            hours_ago = [
                -5.00, -4.75, -4.5, -4.25, -4.00, -3.75, -3.5, -3.25, -3.00,
                -2.75, -2.5, -2.25, -2.00, -1.75, -1.5, -1.25, -1.00, -0.75,
                -0.5, -0.25
            ]
            for i in range(20):
                plot_sensor1.append(sensor1_data[i][2])
                plot_sensor2.append(sensor2_data[i][2])
            plt.plot(hours_ago, plot_sensor1, 'g', label="Sensor 1")
            plt.plot(hours_ago, plot_sensor2, 'y', label="Sensor 2")
            plt.title('Air Temperature Plot - Past 5 Hours')
            plt.xlabel('Time (Hours Ago)')
            plt.ylabel('Air Temperature (°F)')
            plt.xlim([-5, 0])
            plt.ylim([0, 100])
            plt.legend()
            plt.show(block=False)
            # popup_text = '[insert plot w/ matplotlib here]'
            # TODO add charts to popups in GUI
            # sg.Popup('This is a pop-up for Air Temperature',
            #          popup_text, title='Air Temperature')

        # Popup for Sunlight
        if event == 'sun':
            plt.close('all')
            plot_sensor1 = []
            plot_sensor2 = []
            hours_ago = [
                -5.00, -4.75, -4.5, -4.25, -4.00, -3.75, -3.5, -3.25, -3.00,
                -2.75, -2.5, -2.25, -2.00, -1.75, -1.5, -1.25, -1.00, -0.75,
                -0.5, -0.25
            ]
            for i in range(20):
                plot_sensor1.append(sensor1_data[i][4])
                plot_sensor2.append(sensor2_data[i][4])
            plt.plot(hours_ago, plot_sensor1, 'g', label="Sensor 1")
            plt.plot(hours_ago, plot_sensor2, 'y', label="Sensor 2")
            plt.title('Sunlight Plot - Past 5 Hours')
            plt.xlabel('Time (Hours Ago)')
            plt.ylabel('Sunlight (%)')
            plt.xlim([-5, 0])
            plt.ylim([0, 100])
            plt.legend()
            plt.show()
            # popup_text = '[insert plot w/ matplotlib here]'
            # TODO add charts to popups in GUI
            # sg.Popup('This is a pop-up for Sunlight',
            #          popup_text, title='Sunlight')

    # closes window
    window.close()


# Load given TXT file
def load_file(filename):
    # Reads data from .txt file
    text_file = open(filename, 'r')
    lines = text_file.read().splitlines()
    text_file.close()

    # Creates new empty list
    file_contents = []  # list values in form of: [P, N, Stressed]

    # Saves "Not Stressed" values into "studyResults" List
    for j in range(0, 20):
        if ";" in lines[j]:
            new_line = lines[j].split(';')
        else:
            new_line = lines[j].split()
        file_contents.append(new_line)

    # Converts all string values in "studyResults" to float
    file_contents = [list(map(float, sublist)) for sublist in file_contents]

    return file_contents


# Main Function - Start Here
def main():
    # Step 1: Collect Sensor Data
    # TODO RECIEVE AND PARSE DATA

    # Step 2: Parse Collected Data
    # Alan has data format ready
    # dummy data since i don't have the radio
    # <soil-temp>;<soil-moist>;<air-temp>;<air-hum>;<sunlight> 58;56;69;43;27
    sensor_data = "56,58,43,69,27"
    parsed_data = parse_data(sensor_data)

    # Step 3: Visualize Data
    # TODO make charts with matplotlib
    # Read contents of 'HW2_data.txt'
    sensor1 = load_file(str(Path(__file__).resolve().parent / 'sensor1.txt'))
    sensor2 = load_file(str(Path(__file__).resolve().parent / 'sensor2.txt'))
    # print(len(sensor1))
    # print(len(sensor2))

    # Step 4: GUI
    stop_threads = False
    th = threading.Thread(
        target=(lambda x, y, z: background_collection(x, y, z)),
        args=(SAMPLE_RATE, lambda: stop_threads, test_background))
    show_gui(parsed_data, sensor1, sensor2, th)
    time.sleep(1)
    stop_threads = True
    if th.is_alive():
        print('where all threads go to die')
        th.join()


if __name__ == '__main__':
    main()
