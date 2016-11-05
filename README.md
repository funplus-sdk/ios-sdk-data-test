# Howto

## Run the Tests:

Move `run_tests.pl` to project root directory.

Change the `$simulator_id` in `run_tests.pl` to the correct value.

Run:

```shell
simulator_id={ID of iPhone simulator to use} ./run_tests.pl
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
./upload_to_s3.py
```