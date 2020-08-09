import time

now = time.localtime()

today = str(now.tm_year)+str(now.tm_mon)+str(now.tm_mday)
print(today)
