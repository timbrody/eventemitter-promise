package EventEmitter::Promise;

use EventEmitter;

use 5.006000;
use strict;
use warnings;

our @ISA = qw(EventEmitter);

our $VERSION = '0.01';

# Preloaded methods go here.

sub new
{
	my ($class) = @_;

	my $self;

	return bless \$self, $class;
}

sub resolve
{
	my ($self, @params) = @_;

	$self->emit('resolved', @params);

	$self->DESTROY;
}

sub reject
{
	my ($self, @params) = @_;

	my @listeners = $self->listeners('error');

	if (@listeners) {
		$self->emit('error', @params);
	}
	else {
		die @params;
	}

	$self->DESTROY;
}

sub then
{
	my ($self, $on_success, $on_error) = @_;

	$self->on('resolved', $on_success);
	$self->on('error', $on_error) if defined $on_error;
}

1;
__END__
# Below is stub documentation for your module. You'd better edit it!

=head1 NAME

EventEmitter::Promise - promises for events

=head1 SYNOPSIS

  use EventEmitter::Promise;

  my $promise = EventEmitter::Promise->new;
  &asyncfunction(sub {
	  my ($val) = @_;
	  $promise.resolve($val);
  });
  $promise.then(sub {
	  my ($val) = @_;
	  print "Got value: $val\n";
  }, sub {
	  my ($err) = @_;
	  die $err;
  });

=head1 DESCRIPTION

From node-promise:

	Promises provide a clean separation of concerns between asynchronous
	behavior and the interface so asynchronous functions can be called without
	callbacks, and callback interaction can be done on the generic promise
	interface.

The practical outcome is that code dealing with the result of an asynchronous
function can be defined in the source after the call to that function. This has
a two-fold benefit 1) the code is laid in its logical order and 2) the hell
of callbacks-within-callbacks can be unwrapped.

This module aims to be a minimalist implementation of promises, based on the
node-promise API.

=head1 METHODS

=over 4

=item $promise = EventEmitter::Promise->new;

Returns a new promise object.

=item $promise->resolve(@params)

Resolve the promise, passing @params to the promise's listeners.

=item $promise->reject(@params)

Reject the promise, passing @params to the promise's error listeners.

=item $promise->then($callback, $err_callback)

When the promise is fulfilled call $callback, otherwise on error call $err_callback.

=back

=head1 SEE ALSO

https://github.com/kriszyp/node-promise

=head1 AUTHOR

Tim Brody, E<lt>tdb2@ecs.soton.ac.ukE<gt>

=head1 COPYRIGHT AND LICENSE

Copyright (C) 2013 by Tim Brody

This library is free software; you can redistribute it and/or modify
it under the same terms as Perl itself, either Perl version 5.14.2 or,
at your option, any later version of Perl 5 you may have available.


=cut
