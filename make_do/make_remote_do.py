# tek0001CH1.csv
# TIME,CH1
import math

WAVEFORM = open("./resources/tek0001CH1.csv", "r")
GENERATED = open("./resources/remote_wave.do", "w")
NEW_WAVEFORM = open("./resources/new_waveform.csv", "w")

only_wave_form = True

def parse_line_for_val (line):
    found_flag = False
    idx = 0
    for char in line:
        if (found_flag):
            return float(line[idx:len(line) - 1])
        if (char == ','):
            found_flag = True
        idx += 1

def parse_line_for_time (line):
    idx = 0
    val = None
    exp = 0
    for char in line:
        if (char == 'e'):
            snip =  float(line[0:idx])
            exp =  - float(line[idx + 3])
            return snip * (10 ** exp)
        idx += 1

def turn_into_force_section(time, val_a):
    val_b = 0
    if (val_a > 3.3/2):
        val_b = 1
    else:
        val_b = 0
    GENERATED.write(", " + str(val_b) + " " + str(time + .012));

def sort_wave_form():
    GENERATED.write("force sim:/N64_reciever/remote_in 0 0")
    val_prev = 0
    val_cur = 0
    valid_idx = 500
    wave_start_flag = False
    for line in WAVEFORM:
        if wave_start_flag:
            val_cur = parse_line_for_val(line)
            diff = val_cur - val_prev
            if valid_idx == 10 or abs(diff) > 0.5:
                NEW_WAVEFORM.write(line)
                if not only_wave_form:
                    turn_into_force_section(parse_line_for_time(line), val_cur)
                    valid_idx = 0
            val_prev = val_cur
            valid_idx += 1
        if line == "TIME,CH1\n":
            wave_start_flag = True


if __name__ == "__main__":
    GENERATED.write("delete wave sim:/N64_reciever/remote_in\n")
    GENERATED.write("add wave -posistion end sim:/N64_reciever/remote_in\n")
    sort_wave_form()
    GENERATED.write("\nrun 8929000")
	
NEW_WAVEFORM.close()
GENERATED.close()
WAVEFORM.close()
