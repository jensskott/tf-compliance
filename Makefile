clean:
	rm -f tf.plan
	rm -f tf.plan.json
	rm -rf .terraform

compliance: clean
	terraform init && \
	terraform plan --out tf.plan
	terraform-compliance -f features -p tf.plan

checkov: clean
	checkov -f main.tf --external-checks-dir checkov --skip-check CKV_GCP_5,CKV_GCP_49 --framework terraform