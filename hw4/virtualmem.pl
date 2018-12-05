#!/bin/perl
use IPC::Open3;
use POSIX ":sys_wait_h";
use File::Copy;
use warnings;

# Designed to help grade the virtual memory homework assignment.
# Written by Justin Goins
# Usage: virtualmem.pl sourcecode.c
my $gcc = "/usr/local/classes/eecs/fall2018/cs472/public/gcc/bin/g++ -lm -Wl,-rpath,/nfs/farm/classes/eecs/fall2018/cs472/public/gcc/lib64";

# Define the test cases
my @pagesize = (2048, 4096, 8192);
my @virtualwidth = (16, 20, 22, 24, 30, 32, 32);
my @physicalwidth = (16, 16, 22, 22, 26, 32, 30);

# Set the filename
my $filename = $ARGV[0];
if ($#ARGV != 0) {
	print "Usage: virtualmem.pl sourcecode.c\n";
	exit(1);
}
print "\n";

# Start by checking to make sure that user's code properly works
my $chld_in, my $chld_out, my $chld_err;
my $pid = 0;
$pid = open3($chld_in, $chld_out, $chld_err, "$gcc $filename");
waitpid($pid, 0);

# check to make sure that the code compiled
if ($? != 0) {
	print "Student code did not compile.\n";
	print "Please check to see if the student provided any comments in the TEACH submission.\n";
	print "0/22 points\n";
	print $filename . "\n";
	exit(2);
}


my $numRight = 0;
my $numAnswers = 0;
foreach my $i (0.. $#pagesize) {
	foreach my $j (0.. $#virtualwidth) {
		$answer = ((2**$virtualwidth[$j]) / $pagesize[$i]) * (3 + $physicalwidth[$j]);
		++$numAnswers;
		# run compiled program and check result
		$pid = open3($chld_in, $chld_out, $chld_err, "./a.out $virtualwidth[$j] $physicalwidth[$j] $pagesize[$i]");
		waitpid($pid, 0);
		my $exitcode = $?/256;
		# now check for the answer
		my $isCorrect = 0;
		my $studentAnswer;
		while (my $line = <$chld_out>) {
			chomp $line;
			$studentAnswer = $line;
			if ($line =~ /$answer/) {
				$isCorrect = 1;
				last;
			}
		}
		if ($isCorrect == 1) {
			++$numRight;
		} else {
			print "Called program with \"$virtualwidth[$j] $physicalwidth[$j] $pagesize[$i]\" answer did not match " . $answer . "\n";
			print "\tStudent Answer: " . $studentAnswer . "\n";
		}
	}
}

# print results
$percentage = $numRight/$numAnswers;
if ($percentage == 1) {
	print "Perfect results. 22/22\n"
}  elsif ($numRight > 7) {
	print "Partial credit: " . (22-($numAnswers - $numRight)) . "/22\n";
} elsif ($percentage < 0.4) {
	print "Partial credit: 10/22\n";
} else {
	print "Partial credit: 15/22\n";
}

# remove compiled executable
unlink "./a.out";












