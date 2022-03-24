package test

import (
	"testing"

	"github.com/gruntwork-io/terratest/modules/terraform"
	"github.com/stretchr/testify/assert"
)

func TestTerraformAwsS3(t *testing.T) {
	t.Parallel()
	// Inputs for the naming module

	var bucket_name = "file-upload-test-challenge"
	var key = "hello_world"
	var file_source = "files/hello_world.txt"
	var email = "jackson_abraham@epam.com"

	expectedName := "file-upload-test-challenge"
	//awsRegion := "us-east-2"

	// Configure terraform directory and inputs

	terraformOptions := terraform.WithDefaultRetryableErrors(t, &terraform.Options{
		TerraformDir: "../../../usage/s3_sns",
		Vars: map[string]interface{}{
			"bucket_name": bucket_name,
			"key":         key,
			"file_source": file_source,
			"email":       email,
		},
	})

	terraform.Init(t, terraformOptions)

	// destory after integration testing
	defer terraform.Destroy(t, terraformOptions)

	terraform.InitAndApply(t, terraformOptions)
	bucketName := terraform.Output(t, terraformOptions, "s3_bucket")

	//check if bucket exists

	t.Run("s3BucketName", func(t *testing.T) {
		assert.Equal(t, expectedName, bucketName)
	})

}
