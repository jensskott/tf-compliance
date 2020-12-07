import re

from checkov.terraform.checks.resource.base_resource_check import BaseResourceCheck
from checkov.common.models.enums import CheckResult, CheckCategories


class BucketLabels(BaseResourceCheck):
    def __init__(self):
        name = "Make sure buckets are named correct"
        id = "GC_01"
        supported_resources = ['google_storage_bucket']
        # CheckCategories are defined in models/enums.py
        categories = [CheckCategories.BACKUP_AND_RECOVERY]
        super().__init__(name=name, id=id, categories=categories, supported_resources=supported_resources)

    def scan_resource_conf(self, conf):
        """
            Looks for prefix in names:
        :param conf: google_storage_bucket configuration
        :return: <CheckResult>
        """

        if 'name' in conf.keys():
            matched = re.match("^(prefix-)+", conf['name'][0])
            is_match = bool(matched)
            if not is_match:
                return CheckResult.FAILED

            return CheckResult.PASSED


scanner = BucketLabels()
