import re

from lark import Token

from checkov.terraform.checks.resource.base_resource_check import BaseResourceCheck
from checkov.common.models.enums import CheckResult, CheckCategories


class ForbiddenResources(BaseResourceCheck):
    def __init__(self):
        name = "Make sure no forbidden resources are being created"
        id = "GC_04"
        supported_resources = ['google_project_iam_policy']
        # CheckCategories are defined in models/enums.py
        categories = [CheckCategories.BACKUP_AND_RECOVERY]
        super().__init__(name=name, id=id, categories=categories, supported_resources=supported_resources)

    def scan_resource_conf(self, conf):
        """
            Check for forbidden resources:
        :return: <CheckResult>
        """

        return CheckResult.FAILED

scanner = ForbiddenResources()
