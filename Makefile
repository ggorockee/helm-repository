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
	
	@echo "[INFO] Initialize pull repository"
	git pull origin release
	@echo "[INFO] Checkout Branch to 'main'"
	git checkout main
	
	

# git cadd
	git add .

# git commit & push
	git commit -m "Update index.yaml for Helm Repositoryimage tag to ${CURRENT_TIME}"

	git remote remove origin
	git remote add origin https://${GGOROCKEE_USERNAME}:${GGOROCKEE_SECRET}@github.com/ggorockee/helm-repository.git
	git push origin main

