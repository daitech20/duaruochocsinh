# -*- coding: utf-8 -*-
import uuid

import boto3
from vietphone.settings.config import sconfigs


class S3Connect:
    def __init__(self):
        self.bucket_name = sconfigs.BUCKET_NAME
        self.access_key_id = sconfigs.CLOUDFLARE_ACCESS_KEY_ID
        self.account_id = sconfigs.CLOUDFLARE_ACCOUNT_ID
        self.secret_access_key = sconfigs.CLOUDFLARE_SECRET_ACCESS_KEY

        self.s3 = boto3.client(
            service_name="s3",
            endpoint_url=f"https://{self.account_id}.r2.cloudflarestorage.com",
            aws_access_key_id=self.access_key_id,
            aws_secret_access_key=self.secret_access_key,
        )

    def get_object_infomation(self, file_name: str):
        try:
            object_information = self.s3.head_object(
                Bucket=self.bucket_name, Key=file_name
            )
            return object_information
        except Exception as e:
            print(str(e))
            return None

    def upload_file_obj(self, file_name, file_content):
        try:
            check_file_exist = self.get_object_infomation(file_name=file_name)
            if check_file_exist:
                file_name_without_ext, file_extension = file_name.split(".")
                unique_file_name = (
                    f"{file_name_without_ext}_{str(uuid.uuid4())}.{file_extension}"
                )
                self.s3.upload_fileobj(file_content, self.bucket_name, unique_file_name)

            return unique_file_name
        except Exception as e:
            raise Exception(str(e))
