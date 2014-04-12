use 5.006;
use strict;
use warnings FATAL => 'all';
use inc::Module::Install;

name     'DocExamples';
all_from 'lib/DocExamples.pm';
author   q{Colin Newell <colin.newell@gmail.com>};
license  'artistic';

perl_version 5.006;

tests_recursive('t');

resources (
   #homepage   => 'http://yourwebsitehere.com',
   #IRC        => 'irc://irc.perl.org/#DocExamples',
   license    => 'http://www.perlfoundation.org/artistic_license_1_0',
   #repository => 'git://github.com/Colin Newell/DocExamples.git',
   bugtracker => 'http://rt.cpan.org/NoAuth/Bugs.html?Dist=DocExamples',
);

configure_requires (
   'Module::Install' => 0,
);

build_requires (
   'Test::More' => 0,
);

requires (
   'Test::Most'       => 0,
   'Test::DBIx::Class' => 0,
   'DBIx::Class'        => 0,
   'DBIx::Class::Candy' => 0,
);

install_as_cpan;
auto_install;
WriteAll;
