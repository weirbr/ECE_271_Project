ORIGINAL = open("./resources/original.do", "r")
GENERATED = open("./resources/N64_wave.do", "w")
SPEC = open("./resources/N64_wave_spec.txt", "r")


def copy_original(line_number):
    idx = 0
    for line in ORIGINAL:
        idx += 1
        if idx >= line_number:
            break
        GENERATED.write(line)


def signal_gen(val, idx, gap):
    if (val == 1):
        string = ', 0 ' + str(gap * idx) + ', 1 ' + str(gap * (idx + 1)) + ', 1 ' + str(gap * (idx + 2)) + ', 1 ' + str(gap * (idx + 3))
    elif (val == 0):
        string = ', 0 ' + str(gap * idx) + ', 1 ' + str(gap * (idx + 1)) + ', 1 ' + str(gap * (idx + 2)) + ', 1 ' + str(gap * (idx + 3))
    return string

def sort_spec():
    GENERATED.write("force -freeze sim:/N64_reciever/N64_in 0 0")

    line_num = 0
    interval_time_flag = False
    values_flag = False
    interval_time = 0
    idx = 1
    for line in SPEC:
        line_num += 1

        if interval_time_flag:
            interval_time_flag = False
            interval_time = int(line)

        if values_flag:
            string = signal_gen(int(line), idx, interval_time)
            GENERATED.write(string)
            idx += 4

        if line == 'interval_time:\n':
            interval_time_flag = True
        if line == 'values:\n':
            values_flag = True



if __name__ == "__main__":
    copy_original(6)
    sort_spec()
    GENERATED.write("\nrun 8929000")



ORIGINAL.close()
GENERATED.close()
