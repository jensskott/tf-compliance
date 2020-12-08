import re

from lark import Token

from checkov.terraform.checks.resource.base_resource_check import BaseResourceCheck
from checkov.common.models.enums import CheckResult, CheckCategories


class MissingTeamLabel(BaseResourceCheck):
    def __init__(self):
        name = "Make sure buckets have team label"
        id = "GC_02"
        supported_resources = ['google_storage_bucket']
        # CheckCategories are defined in models/enums.py
        categories = [CheckCategories.BACKUP_AND_RECOVERY]
        super().__init__(name=name, id=id, categories=categories, supported_resources=supported_resources)

    def scan_resource_conf(self, conf):
        """
            Looks after team label on buckets:
        :param conf: google_storage_bucket configuration
        :return: <CheckResult>
        """

        if 'labels' in conf.keys():
            environment_tag = Token("IDENTIFIER", "team")
            if not environment_tag:
                return CheckResult.FAILED
            return CheckResult.PASSED


scanner = MissingTeamLabel()
