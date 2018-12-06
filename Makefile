# import config.
# You can change the default config with `make cnf="config_special.env" build`
cnf ?= config.env
include $(cnf)
export $(shell sed 's/=.*//' $(cnf))

# import deploy config
# You can change the default deploy config with `make dpl="deploy_special.env" release`
dpl ?= deploy.env
include $(dpl)
export $(shell sed 's/=.*//' $(dpl))

#build:
#  @docker build -t ${IMG} .
#  @docker tag ${IMG} ${LATEST}
 
#push:
#  @docker push ${NAME}
 
#login:
#  @docker log -u ${DOCKER_USER} -p ${DOCKER_PASS}


# DOCKER TASKS
# Build the container

build: ## Build the container
	docker build -t ${NAME} .
	docker tag ${LATEST} ${IMG}

push:
	docker push $(NAME)

run: ## Run container on port configured in `config.env`
	docker run -i -t --rm --env-file=./config.env -p=$(HOST_PORT):$(CONTAINER_PORT) --name="$(APP_NAME)" $(APP_NAME)

clean: ## Clean the generated/compiles files
	# CompassionJournal/bin
	# CompassionJournal/obj

	echo "nothing clean ..."
