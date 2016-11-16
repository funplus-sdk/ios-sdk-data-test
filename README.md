# README

## Run the Tests:

Move `run_tests.pl` to project root directory.

Run tests:

```shell
$ cd $proj_root
$ ./run_tests.pl
```

## Upload Data to S3

### Install Boto3

```shell
pip install boto3
```

### Configuration

Edit the `~/.aws/credentials` file and add the following contents:

```ini
[default]
aws_access_key_id = YOUR_ACCESS_KEY
aws_secret_access_key = YOUR_SECRET_KEY
```

### Run the Script

```shell
$ cd $proj_root
$ ./upload_to_s3.py
```
## Work with Jenkins

To work with Jenkins, you should create two Jenkins projects: one for running the tests, and another for uploading data to S3.

### Testing Project

Create a new free style project, and fill in the following settings:

```ini
[Source Code Management > git]
Repository URL = https://github.com/funplus-sdk/ios-sdk-data-test.git
Branch Specifier = */master

[Build Triggers > Build periodically]
Schedule = @hourly

[Build > Execute shell]
Command = '''
export PATH=/usr/local/bin/:$PATH
cd $WORKSPACE && git checkout master && git pull origin master
./run_tests.pl
'''
```

### Reporting Project

Create a new free style project, and fill in the following settings:

```ini
[Build Triggers > Build periodically]
Schedule = H 23 * * *

[Build > Execute shell]
Command = '''
export PATH=/usr/local/bin/:$PATH
cd $WORKSPACE
git checkout master && git pull origin master
./run_tests.pl
'''
```

