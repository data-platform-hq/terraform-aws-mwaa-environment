resource "aws_mwaa_environment" "this" {
  count                            = var.create ? 1 : 0
  name                             = var.name
  source_bucket_arn                = var.source_bucket_arn
  dag_s3_path                      = var.dag_s3_path
  execution_role_arn               = var.execution_role_arn
  airflow_configuration_options    = var.airflow_configuration_options
  airflow_version                  = var.airflow_version
  environment_class                = var.environment_class
  kms_key                          = var.kms_key
  min_workers                      = var.min_workers
  max_workers                      = var.max_workers
  plugins_s3_path                  = var.plugins_s3_path
  plugins_s3_object_version        = var.plugins_s3_object_version
  requirements_s3_path             = var.requirements_s3_path
  requirements_s3_object_version   = var.requirements_s3_object_version
  startup_script_s3_path           = var.startup_script_s3_path
  startup_script_s3_object_version = var.startup_script_s3_object_version
  schedulers                       = var.schedulers
  tags                             = var.tags
  webserver_access_mode            = var.public_environment ? "PUBLIC_ONLY" : "PRIVATE_ONLY"
  weekly_maintenance_window_start  = var.weekly_maintenance_window_start

  network_configuration {
    security_group_ids = concat(aws_security_group.mwaa[*].id, var.additional_security_group_ids)
    subnet_ids         = var.subnet_ids
  }

  dynamic "logging_configuration" {
    for_each = local.logging_enabled ? [1] : []
    content {
      dynamic "dag_processing_logs" {
        for_each = local.dag_processing_logs_enabled ? [1] : []
        content {
          enabled   = true
          log_level = local.dag_processing_logs_log_level
        }
      }
      dynamic "scheduler_logs" {
        for_each = local.scheduler_logs_enabled ? [1] : []
        content {
          enabled   = true
          log_level = local.scheduler_logs_log_level
        }
      }
      dynamic "task_logs" {
        for_each = local.task_logs_enabled ? [1] : []
        content {
          enabled   = true
          log_level = local.task_logs_log_level
        }
      }
      dynamic "webserver_logs" {
        for_each = local.webserver_logs_enabled ? [1] : []
        content {
          enabled   = true
          log_level = local.webserver_logs_log_level
        }
      }
      dynamic "worker_logs" {
        for_each = local.worker_logs_enabled ? [1] : []
        content {
          enabled   = true
          log_level = local.worker_logs_log_level
        }
      }
    }
  }
}
