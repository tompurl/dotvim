#!/usr/bin/python
# vim:shiftwidth=4:softtabstop=4:expandtab:foldmethod=marker

"""Test vimwiki's HTML generator.
"""

import os.path
from glob import glob


def get_testname(filename):
    return os.path.splitext(os.path.basename(filename))[0]


def gen_vimwiki_htmls():
    # Generate HTML using vimwiki.
    vimrc_path = 'vimrc'
    vim_command = "exe 'VimwikiIndex' | exe 'VimwikiAll2HTML' | quit"
    command = 'vim -n -u "%s" -c "%s"' % (vimrc_path, vim_command)

    return os.system(command)


def test_all():
    print("Testing...")
    count = 0
    failed_count = 0

    failed_tests = []

    # Compare actual HTML with expected one.
    tests = [get_testname(fname) for fname in glob('wiki/*.wiki')]
    for test in tests:
        expected_name = os.path.join('expected_html', test+'.html')
        actual_name = os.path.join('html', test+'.html')
        if os.path.exists(expected_name):
            expected = open(expected_name).read()
        else:
            expected = ''
        if os.path.exists(actual_name):
            actual = open(actual_name).read()
        else:
            actual = ''

        if expected == actual:
            count += 1
        else:
            failed_count += 1
            failed_tests.append((expected_name, actual_name))

    print("Tests count: {}".format(count+failed_count))
    print("Tests succeeded: {}".format(count))
    print("Tests failed: {}".format(failed_count))

    if failed_count == 0:
        print("Ok!")
    else:
        print("Fail!")

    return failed_tests


def main():
    print("Converting wiki to html...")
    if gen_vimwiki_htmls() != 0:
        raise Exception("vim failed with status %d" % status)

    failed_tests = test_all()
    for expected, actual in failed_tests:
        question = "Would you like to vimdiff failed test named '{}'? (y/n) "
        answer = input(question.format(get_testname(expected)))
        if answer == 'y':
            command = 'vim -d "%s" "%s"' % (expected, actual)
            os.system(command)



if __name__ == '__main__':
    main()

