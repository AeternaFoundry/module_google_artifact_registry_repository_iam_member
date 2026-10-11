resource "google_artifact_registry_repository_iam_member" "artifact_registry_repository_iam_members" {
  for_each = var.artifact_registry_repository_iam_members

  member     = each.value.member
  repository = each.value.repository
  role       = each.value.role
  location   = each.value.location
  project    = each.value.project

  dynamic "condition" {
    for_each = each.value.condition != null ? [each.value.condition] : []
    content {
      description = condition.value.description
      expression  = condition.value.expression
      title       = condition.value.title
    }
  }
}

