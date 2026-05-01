abstract class FeaturedPlansState {
  const FeaturedPlansState();
}

class FeaturedPlansInitial extends FeaturedPlansState {
  const FeaturedPlansInitial();
}

class FeaturedPlansLoading extends FeaturedPlansState {
  const FeaturedPlansLoading();
}

class FeaturedPlansLoaded extends FeaturedPlansState {
  const FeaturedPlansLoaded();
}

class FeaturedPlansError extends FeaturedPlansState {
  final String message;

  const FeaturedPlansError(this.message);
}
