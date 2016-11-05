#!/usr/bin/env python
import boto3
import botocore
import json
import os
import re

s3 = boto3.resource('s3')

# Print out bucket names
#for bucket in s3.buckets.all():
#    print(bucket.name)

bucket = s3.Bucket('funplus-public-data')
print "Connected to S3"

#for key in bucket.objects.all():
#    print(key.key)

dir = os.path.dirname(os.path.abspath(__file__))
os.chdir(dir)

def upload(filename, content):
    s3.Object('funplus-public-data', 'sdk_test/events/' + filename).put(Body=content)
    os.system('mv log/%s log/archive' % filename)

    print "Uploaded file: %s" % filename
    print
    print "Uploaded contents: \n%s" % content


for filename in os.listdir('log'):
   if filename.endswith('success.log'):
        with open('log/' + filename) as f:
            contents = []
            file_content = f.read()
            file_content = re.sub(r'\*\* TEST SUCCEEDED \*\*\s*', '', file_content)
            lines = file_content.splitlines()
            for line in lines:
                m = re.search('\] Trace Data event\: (.*)$', line)
                if m and m.group(0):
                    content = m.group(1)
                    try:
                        json.loads(content)
                    except Exception, e:
                        # print line
                        print e
                        continue
                    contents.append(content)
            if contents:
                print filename
                upload(filename, "\n".join(contents))
