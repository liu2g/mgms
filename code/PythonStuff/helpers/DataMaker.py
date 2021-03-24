#<soil-temp>;<soil-moist>;<air-temp>;<air-hum>;<sunlight>
#65 - 75; 60 - 90; 30 - 90; 30 - 80; 0 - 100
#[['Sensor Name', 'val; val; val; val; val;'], ['Sensor Name', 'val; val; val; val; val']]
import numpy as np
soil_temp = np.arange(65, 76)
soil_moist = np.arange(60, 91)
air_temp = np.arange(30, 91)
air_hum = np.arange(30, 81)
sunlight = np.arange(0, 101)
sensor1 = np.zeros((20, 5))
sensor2 = np.zeros((20, 5))


print("test")
np.savetxt('sensor1.out', sensor1, delimiter=';', fmt='%.4f')
np.savetxt('sensor2.out', sensor2, delimiter=';', fmt='%.4f')