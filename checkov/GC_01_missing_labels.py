import re

from lark import Token

from checkov.terraform.checks.resource.base_resource_check import BaseResourceCheck
from checkov.common.models.enums import CheckResult, CheckCategories


class MissingBucketLabels(BaseResourceCheck):
    def __init__(self):
        name = "Make sure buckets have labels"
        id = "GC_01"
        supported_resources = ['google_storage_bucket']
        # CheckCategories are defined in models/enums.py
        categories = [CheckCategories.BACKUP_AND_RECOVERY]
        super().__init__(name=name, id=id, categories=categories, supported_resources=supported_resources)

    def scan_resource_conf(self, conf):
        """
            Looks labels on buckets:
        :param conf: google_storage_bucket configuration
        :return: <CheckResult>
        """

        if not 'labels' in conf.keys():
            return CheckResult.FAILED

        return CheckResult.PASSED


scanner = MissingBucketLabels()
