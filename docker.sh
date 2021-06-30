sudo docker build -t tdl .
sudo docker run -it --rm -v $(pwd):/home/rails/webapp -p 3000:3000 tdl /bin/bash
