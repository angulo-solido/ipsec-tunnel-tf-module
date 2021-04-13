terraform {
  required_version = "~> 0.13.0"

  # If you use any other providers you should also pin them to the
  # major version currently being used.  This practice will help us
  # avoid unwelcome surprises.
  required_providers {
    aws = "~> 3.0"
  }
}
