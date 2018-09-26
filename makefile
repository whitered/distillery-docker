APP_NAME ?= `grep 'app:' mix.exs | sed -e 's/\[//g' -e 's/ //g' -e 's/app://' -e 's/[:,]//g'`
APP_VSN ?= `grep 'version:' mix.exs | cut -d '"' -f2`
BUILD ?= `git rev-parse --short HEAD`

docker.build:
	docker build --build-arg APP_NAME=$(APP_NAME) \
    --build-arg APP_VSN=$(APP_VSN) \
    -t $(APP_NAME):$(APP_VSN)-$(BUILD) \
    -t $(APP_NAME):latest .

docker.run:
	docker run --env-file config/docker.env \
    --expose 4000 -p 4000:4000 \
    --rm -it $(APP_NAME):latest
