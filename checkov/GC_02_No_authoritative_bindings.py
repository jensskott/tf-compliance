from checkov.terraform.checks.resource.base_resource_check import BaseResourceCheck
from checkov.common.models.enums import CheckResult, CheckCategories


class NoAuthoritativeBindings(BaseResourceCheck):
    def __init__(self):
        name = "Do not allow authoritative bindings"
        id = "GC_02"
        supported_resources = ['google_project_iam_binding', 'google_project_iam_policy', 'google_project_iam_audit_config']
        # CheckCategories are defined in models/enums.py
        categories = [CheckCategories.BACKUP_AND_RECOVERY]
        super().__init__(name=name, id=id, categories=categories, supported_resources=supported_resources)

    def scan_resource_conf(self, conf):
        """
            Looks for prefix in names:
        :param conf: google_storage_bucket configuration
        :return: <CheckResult>
        """
        wrong_resource = bool(conf)
        if wrong_resource:
            return CheckResult.FAILED

        return CheckResult.PASSED


scanner = NoAuthoritativeBindings()
