clean:
	find . -type d -name ".terraform" -exec rm -rf {} \;
	find . -type f -name "tf.plan" -exec rm -f {} \;
	find . -type f -name "tf.plan.json" -exec rm -f {} \;

compliance-pass: clean
	cd pass_tf && \
	terraform init && \
	terraform plan --out tf.plan && \
	terraform-compliance -f ../features -p tf.plan -S

compliance-fail: clean
	cd fail_tf && \
	terraform init && \
	terraform plan --out tf.plan && \
	terraform-compliance -f ../features -p ./tf.plan -S

checkov-pass: clean
	cd pass_tf && \
	checkov -f main.tf --external-checks-dir ../checkov --skip-check CKV_GCP_5,CKV_GCP_49 --framework terraform

checkov-fail: clean
	cd fail_tf && \
	checkov -f main.tf --external-checks-dir ../checkov --skip-check CKV_GCP_5,CKV_GCP_49 --framework terraform