use 5.006000;
use ExtUtils::MakeMaker;
# See lib/ExtUtils/MakeMaker.pm for details of how to influence
# the contents of the Makefile that is written.
WriteMakefile(
    NAME              => 'EventEmitter::Promise',
    VERSION_FROM      => 'lib/EventEmitter/Promise.pm', # finds $VERSION
    PREREQ_PM         => {
		'Test::More'        =>  0,
		'EventEmitter'      =>  0,
	}, # e.g., Module::Name => 1.1
    ($] >= 5.005 ?     ## Add these new keywords supported since 5.005
      (ABSTRACT_FROM  => 'lib/EventEmitter/Promise.pm', # retrieve abstract from module
       AUTHOR         => 'Tim Brody <tdb2@ecs.soton.ac.uk>') : ()),
);
