variable "create" {
  description = "Controls if resources should be created (affects nearly all resources)"
  type        = bool
  default     = true
}

variable "tags" {
  description = "A map of tags to add to all resources"
  type        = map(string)
  default     = {}
}

################################################################################
# MWAA environment
################################################################################
variable "name" {
  description = "The name of the Apache Airflow Environment"
  type        = string
}

variable "source_bucket_arn" {
  description = "The Amazon Resource Name (ARN) of your Amazon S3 storage bucket"
  type        = string
}

variable "dag_s3_path" {
  description = "The relative path to the DAG folder on your Amazon S3 storage bucket"
  type        = string
}

variable "execution_role_arn" {
  description = "The Amazon Resource Name (ARN) of the task execution role that the Amazon MWAA and its environment can assume"
  type        = string
}

variable "subnet_ids" {
  description = "The private subnet IDs in which the environment should be created. MWAA requires two subnets"
  type        = list(string)
}

variable "additional_security_group_ids" {
  description = "Additional security groups to attach"
  type        = list(string)
  default     = []
}

variable "airflow_configuration_options" {
  description = "The airflow_configuration_options parameter specifies airflow override options"
  type        = map(string)
  default     = {}
}

variable "airflow_version" {
  description = "Airflow version of your environment"
  type        = string
  default     = null
}

variable "environment_class" {
  description = "Environment class for the cluster. Possible options are mw1.small, mw1.medium, mw1.large"
  type        = string
  default     = null
}

variable "kms_key" {
  description = "The Amazon Resource Name (ARN) of your KMS key that you want to use for encryption"
  type        = string
  default     = null
}

variable "min_workers" {
  description = "The minimum number of workers that you want to run in your environment"
  type        = number
  default     = null
}

variable "max_workers" {
  description = "The maximum number of workers that can be automatically scaled up"
  type        = number
  default     = null
}

variable "plugins_s3_path" {
  description = "The relative path to the plugins.zip file on your Amazon S3 storage bucket"
  type        = string
  default     = null
}

variable "plugins_s3_object_version" {
  description = "The plugins.zip file version you want to use"
  type        = string
  default     = null
}

variable "requirements_s3_path" {
  description = "The relative path to the requirements.txt file on your Amazon S3 storage bucket"
  type        = string
  default     = null
}

variable "requirements_s3_object_version" {
  description = "The requirements.txt file version you want to use"
  type        = string
  default     = null
}

variable "startup_script_s3_path" {
  description = "The relative path to the script hosted in your bucket"
  type        = string
  default     = null
}

variable "startup_script_s3_object_version" {
  description = "The version of the startup shell script you want to use"
  type        = string
  default     = null
}

variable "schedulers" {
  description = "The number of schedulers that you want to run in your environment"
  type        = number
  default     = null
}

variable "public_environment" {
  description = "Whether the webserver should be accessible over the internet"
  type        = bool
  default     = false
}

variable "weekly_maintenance_window_start" {
  description = "Specifies the start date for the weekly maintenance window"
  type        = string
  default     = null
}

variable "all_logs_enabled" {
  description = "Whether to enable all logs (DAG processing, Scheduler, Task, Webserver, Worker)"
  type        = bool
  default     = false
}

variable "all_logs_log_level" {
  description = "Logging level. Valid values: CRITICAL, ERROR, WARNING, INFO, DEBUG"
  type        = string
  default     = "INFO"
}

variable "dag_processing_logs_enabled" {
  description = "Whether to enable DAGs processing logs. Specify if some of logs should be enabled. Otherwise - use all_logs_enabled variable"
  type        = bool
  default     = false
}

variable "dag_processing_logs_log_level" {
  description = "Logging level. Valid values: CRITICAL, ERROR, WARNING, INFO, DEBUG. Specify if some of logs should be enabled. Otherwise - use all_logs_log_level variable"
  type        = string
  default     = "INFO"
}

variable "scheduler_logs_enabled" {
  description = "Whether to enable Scheduler logs. Specify if some of logs should be enabled. Otherwise - use all_logs_enabled variable"
  type        = bool
  default     = false
}

variable "scheduler_logs_log_level" {
  description = "Logging level. Valid values: CRITICAL, ERROR, WARNING, INFO, DEBUG. Specify if some of logs should be enabled. Otherwise - use all_logs_log_level variable"
  type        = string
  default     = "INFO"
}

variable "task_logs_enabled" {
  description = "Whether to enable Task logs. Specify if some of logs should be enabled. Otherwise - use all_logs_enabled variable"
  type        = bool
  default     = false
}

variable "task_logs_log_level" {
  description = "Logging level. Valid values: CRITICAL, ERROR, WARNING, INFO, DEBUG. Specify if some of logs should be enabled. Otherwise - use all_logs_log_level variable"
  type        = string
  default     = "INFO"
}

variable "webserver_logs_enabled" {
  description = "Whether to enable Webserver logs. Specify if some of logs should be enabled. Otherwise - use all_logs_enabled variable"
  type        = bool
  default     = false
}

variable "webserver_logs_log_level" {
  description = "Logging level. Valid values: CRITICAL, ERROR, WARNING, INFO, DEBUG. Specify if some of logs should be enabled. Otherwise - use all_logs_log_level variable"
  type        = string
  default     = "INFO"
}

variable "worker_logs_enabled" {
  description = "Whether to enable Worker logs. Specify if some of logs should be enabled. Otherwise - use all_logs_enabled variable"
  type        = bool
  default     = false
}

variable "worker_logs_log_level" {
  description = "Logging level. Valid values: CRITICAL, ERROR, WARNING, INFO, DEBUG. Specify if some of logs should be enabled. Otherwise - use all_logs_log_level variable"
  type        = string
  default     = "INFO"
}
