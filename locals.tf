locals {
  logging_enabled               = var.all_logs_enabled || var.dag_processing_logs_enabled || var.scheduler_logs_enabled || var.task_logs_enabled || var.webserver_logs_enabled || var.worker_logs_enabled ? true : false
  dag_processing_logs_enabled   = var.dag_processing_logs_enabled || var.all_logs_enabled ? true : false
  dag_processing_logs_log_level = var.dag_processing_logs_enabled ? var.dag_processing_logs_log_level : var.all_logs_enabled ? var.all_logs_log_level : null
  scheduler_logs_enabled        = var.scheduler_logs_enabled || var.all_logs_enabled ? true : false
  scheduler_logs_log_level      = var.scheduler_logs_enabled ? var.scheduler_logs_log_level : var.all_logs_enabled ? var.all_logs_log_level : null
  task_logs_enabled             = var.task_logs_enabled || var.all_logs_enabled ? true : false
  task_logs_log_level           = var.task_logs_enabled ? var.task_logs_log_level : var.all_logs_enabled ? var.all_logs_log_level : null
  webserver_logs_enabled        = var.webserver_logs_enabled || var.all_logs_enabled ? true : false
  webserver_logs_log_level      = var.webserver_logs_enabled ? var.webserver_logs_log_level : var.all_logs_enabled ? var.all_logs_log_level : null
  worker_logs_enabled           = var.worker_logs_enabled || var.all_logs_enabled ? true : false
  worker_logs_log_level         = var.worker_logs_enabled ? var.worker_logs_log_level : var.all_logs_enabled ? var.all_logs_log_level : null
}
