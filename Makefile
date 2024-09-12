include .env
CURRENT_TIME=`date +'%y.%m.%d %H:%M:%S'`


# run
run: create_repo_index git_action


# Helm repo index
create_repo_index:
	@echo "[INFO] Create Repository Index File"
	helm repo index chart

git_action:
# git configuration
	@echo "[INFO] Git Configuration..."
	git config user.email "${GGOROCKEE_EMAIL}"
	git config user.name "${GGOROCKEE_USERNAME}"

# git cadd
	git add .

# git commit
	git commit -m "Update index.yaml for Helm Repositoryimage tag to ${CURRENT_TIME}"

