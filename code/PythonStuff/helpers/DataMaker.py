#<soil-temp>;<soil-moist>;<air-temp>;<air-hum>;<sunlight>
#65 - 75; 60 - 90; 30 - 90; 30 - 80; 0 - 100
#[['Sensor Name', 'val; val; val; val; val;'], ['Sensor Name', 'val; val; val; val; val']]
import numpy as np
soil_temp = np.arange(65, 76)
soil_moist = np.arange(60, 91)
air_temp = np.arange(30, 91)
air_hum = np.arange(30, 81)
sunlight = np.arange(0, 101)
sensor1 = np.zeros((150, 5))
sensor2 = np.zeros((150, 5))
def create_data():
    for x in range(150):
        temprand1 = np.random.rand(5)
        temprand2 = np.random.rand(5)
        tempind1 = np.zeros(5)
        tempind1[0] = soil_temp[np.random.randint(len(soil_temp) - 1)]
        tempind1[1] = soil_moist[np.random.randint(len(soil_moist) - 1)]
        tempind1[2] = air_temp[np.random.randint(len(air_temp) - 1)]
        tempind1[3] = air_hum[np.random.randint(len(air_hum) - 1)]
        tempind1[4] = sunlight[np.random.randint(len(sunlight) - 1)]
        sens1 = temprand1*tempind1
        sens2 = temprand2*tempind1
        sensor1[x] = sens1
        sensor2[x] = sens2
    return

create_data()
print("test")
np.savetxt('sensor1.out', sensor1, delimiter=';', fmt='%.4f')
np.savetxt('sensor2.out', sensor2, delimiter=';', fmt='%.4f')