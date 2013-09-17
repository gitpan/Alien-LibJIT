
use strict;
use warnings;

use Module::Build 0.3601;
use lib qw{inc}; use Module::Build::AlienLibJIT;

my %module_build_args = (
  "build_requires" => {
    "File::ShareDir" => 0,
    "Module::Build" => "0.3601"
  },
  "configure_requires" => {
    "Module::Build" => "0.3601"
  },
  "dist_abstract" => "your very own libjit for nefarious Perl purposes",
  "dist_author" => [
    "Mattia Barbon <mattia\@barbon.org>",
    "Steffen Mueller <smueller\@cpan.org>"
  ],
  "dist_name" => "Alien-LibJIT",
  "dist_version" => "0.02",
  "license" => "perl",
  "module_name" => "Alien::LibJIT",
  "recommends" => {},
  "recursive_test_files" => 1,
  "requires" => {},
  "script_files" => [],
  "test_requires" => {}
);


unless ( eval { Module::Build->VERSION(0.4004) } ) {
  my $tr = delete $module_build_args{test_requires};
  my $br = $module_build_args{build_requires};
  for my $mod ( keys %$tr ) {
    if ( exists $br->{$mod} ) {
      $br->{$mod} = $tr->{$mod} if $tr->{$mod} > $br->{$mod};
    }
    else {
      $br->{$mod} = $tr->{$mod};
    }
  }
}

my $build = Module::Build::AlienLibJIT->new(%module_build_args);

$build->create_build_script;
