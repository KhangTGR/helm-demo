clear

echo "+=====================================================+"
echo "|         Please enter your AWS credentials           |"
echo "+=====================================================+"

echo -n "- AWS Access Key ID:\t\t" && read aws_access_key_id
echo "AWS_ACCESS_KEY_ID=$aws_access_key_id" > .env

echo -n "- AWS Secret Access Key:\t"  && read aws_secret_access_key
echo "AWS_SECRET_ACCESS_KEY=$aws_secret_access_key" >> .env

echo -n "- AWS Region:\t\t\t"  && read aws_region
echo "AWS_REGION=$aws_region" >> .env

echo "+=====================================================+"

clear # clear all for credential security