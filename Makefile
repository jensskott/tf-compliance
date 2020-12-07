clean:
	rm -f tf.plan
	rm -f tf.plan.json
	rm -rf .terraform

compliance: clean
	terraform init && \
	terraform plan --out tf.plan
	terraform-compliance -f features -p tf.plan