module "my-lambda" {
	source = "./modules"
	function_name                  = "Lambda_Function"
        handler                        = "index.lambda_handler"
        runtime                        = "python3.8"
}
