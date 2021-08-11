all:
	docker build --tag webgui:0.1.0 .
	docker run -it --name vncweb webgui:0.1.0
