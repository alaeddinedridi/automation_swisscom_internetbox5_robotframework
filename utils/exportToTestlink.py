from testlink.testlinkapi import TestlinkAPIClient

# Your TestLink config
SERVER_URL = "http://localhost:8090/testlink/lib/api/xmlrpc/v1/xmlrpc.php"
DEV_KEY = "441742750ba0c2ebd7279f0eb7338ab2"

tlc = TestlinkAPIClient(SERVER_URL, DEV_KEY)

test_plan = "Swisscom_InternetBox5"
project_name = "Sanity"
build = "Sanity-test-build"
external_id = "TC-1"
result = "p"  # use "p" for pass, "f" for fail

testplan=tlc.getTestPlanByName(test_plan, project_name)

tlc.reportTCResult(
    testplanid = testplan[0]['id'],  # Access first item in the list, then get the ID
    testcaseexternalid=external_id,
    buildname=build,
    status=result,  # "P" or "F"
    notes="Reported from Robot Framework"
)
