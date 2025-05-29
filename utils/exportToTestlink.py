from testlink.testlinkapi import TestlinkAPIClient
import xml.etree.ElementTree as ET
import argparse

parser = argparse.ArgumentParser()
parser.add_argument('--project', required=True)
parser.add_argument('--plan', required=True)
parser.add_argument('--build', required=True)
args = parser.parse_args()

def parseRport(report):
    # Load and parse the XML file
    tree = ET.parse(report)
    root = tree.getroot()

    # Find the <tag> section under <statistics>
    tag_stats = root.find(".//statistics/tag")
    results=[]
    # Extract and print each tag's stats
    for stat in tag_stats.findall("stat"):
        name = stat.text
        if "TC-" not in name:
            continue
        passed = stat.attrib.get("pass")
        failed = stat.attrib.get("fail")
        skipped = stat.attrib.get("skip")
        print(f"Tag: {name}, Pass: {passed}, Fail: {failed}, Skip: {skipped}")
        results.append({"name":name, "passed":passed, "failed":failed, "skipped":skipped})
        print("Results parsing done")
    return results


def injectResultsInTestlink(project_name,test_plan,build):
    # TestLink config
    server_url = "http://localhost:8090/testlink/lib/api/xmlrpc/v1/xmlrpc.php"
    dev_key = "441742750ba0c2ebd7279f0eb7338ab2"

    tlc = TestlinkAPIClient(server_url, dev_key)


    testplan=tlc.getTestPlanByName(project_name, test_plan)

    results= parseRport("results/output.xml")
    print(results)

    for result in results:
        res="f"
        external_id = result["name"]

        passed=int(result["passed"])
        failed=int(result["failed"])
        skipped=int(result["skipped"])

        print("set the test result")
        if passed != 0 and failed == 0 and skipped == 0:
            print("passed")
            res = "p"  # use "p" for pass, "f" for fail
        elif passed == 0 and failed != 0 and skipped == 0:
            print("failed")
            res = "f"
        elif passed == 0 and failed == 0 and skipped != 0:
            print("skipped")
            res = "s"
        else:
            print("error in parsing test results")

        print("done with setting the final result")
        print(res)
        tlc.reportTCResult(
            testplanid=testplan[0]['id'],  # Access first item in the list, then get the ID
            testcaseexternalid=external_id,
            buildname=build,
            status=res,  # "P" or "F"
            notes="Automated test executed with Robot Framework"
        )



injectResultsInTestlink(args.project,args.plan,args.build)