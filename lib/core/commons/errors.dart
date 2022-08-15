class GetNoticesUsecaseError extends Error {
  final String message;

  GetNoticesUsecaseError({
    required this.message,
  });
}

class GetNoticesRepositoryError extends Error {
  final String message;

  GetNoticesRepositoryError({
    required this.message,
  });
}
