import re

from lark import Token

from checkov.terraform.checks.resource.base_resource_check import BaseResourceCheck
from checkov.common.models.enums import CheckResult, CheckCategories


class MissingTeamsInLabel(BaseResourceCheck):
    def __init__(self):
        name = "Make sure buckets have the correct team label"
        id = "GC_03"
        supported_resources = ['google_storage_bucket']
        # CheckCategories are defined in models/enums.py
        categories = [CheckCategories.BACKUP_AND_RECOVERY]
        super().__init__(name=name, id=id, categories=categories, supported_resources=supported_resources)

    def scan_resource_conf(self, conf):
        """
            Looks after correct teams in team label on buckets:
        :param conf: google_storage_bucket configuration
        :return: <CheckResult>
        """

        if 'labels' in conf.keys():
            environment_tag = Token("IDENTIFIER", "team")
            print(environment_tag)

            if environment_tag in conf['labels'][0].keys():
                match = re.match("^(team1|team2|team3)$", conf['labels'][0][environment_tag])
                is_matched = bool(match)
                
                if not is_matched:
                    return CheckResult.FAILED
                
                return CheckResult.PASSED


scanner = MissingTeamsInLabel()