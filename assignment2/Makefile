d=$(shell date "+-%d%b%Y")
ifeq ($(MODPERIOD),)
n := 5
else
n := $(MODPERIOD)
endif
lmfiles := $(shell find -mtime -$(n).0|tail  -n +2) #last modifed files
default:
	@echo Usage
	@echo 
	@echo "Type \"make list\" to list all files in current directory  that has been modified within n days, n is value of shell variable MODPERIOD."
	@echo Type \"make backup\" to backup all files in current directory to a tar file with file name \"backup-ddMonthyyyy\" 
list:
	@echo "Files that a modified within $(n) days"
	@find -mtime -$(n).0|tail  -n +2
backup:
	@echo Initaing backup...
	@mkdir ../temp
	@cp $(lmfiles) ../temp
	@tar -cvf backup$(d).tar ../temp
	@rm -r ../temp
	@echo Backup complete, file saved as backup$(d).tar in current directory
