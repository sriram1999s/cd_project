default:
	python3 controller.py $(argument)
clean:
	rm parser.out parsetab.py 
	rm -r __pycache__
