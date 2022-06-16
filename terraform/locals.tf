locals {
  bucket_name = "b123123123123-itba-cloud-computing"
  path        = "./resources"

  lambda = {
    path = "${local.path}/lambda"
    runtime = "python3.9"

    functions = {
      testDB = {
        filename      = "db_test.zip"
        handler       = "db_test.main_handler"
        api_call      = "dbtest"
        method        = "GET"
        authorization = "NONE"
      },
      test = {
        filename      = "testLambda.zip"
        handler       = "test_lambda.main"
        api_call      = "test"
        method        = "GET"
        authorization = "NONE"
      }
    }

  }

  s3 = {

    # 1 - Website
    website = {
      bucket_name = local.bucket_name
      path        = "../../resources"

      objects = {
        error = {
          filename     = "html/error.html"
          content_type = "text/html"
        }
        image1 = {
          filename     = "images/image1.png"
          content_type = "image/png"
        }
        image2 = {
          filename     = "images/image2.jpg"
          content_type = "image/jpeg"
        }
      }
    }

    # 2 - WWW Website
    www-website = {
      bucket_name = "www.${local.bucket_name}"
    }
  }
}