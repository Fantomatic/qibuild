import os
import qisrc.git

import pytest
def test_name_from_url_common():
    examples = [
        ("git@git:foo/bar.git", "foo/bar.git"),
        ("/srv/git/foo/bar.git", "bar.git"),
        ("file:///srv/git/foo/bar.git", "bar.git"),
        ("ssh://git@review:29418/foo/bar.git", "foo/bar.git"),
        ("ssh://git@example.com/spam/eggs.git", "spam/eggs.git"),
        ("ssh://git@example.com/eggs.git", "eggs.git"),
        ("http://github.com/john/bar.git", "john/bar.git")

    ]
    for (url, expected) in  examples:
        actual = qisrc.git.name_from_url(url)
        assert actual == expected

def test_name_from_url_win():
    if not os.name == 'nt':
        return
    url = r"file://c:\path\to\bar.git"
    assert qisrc.git.name_from_url(url) == "bar.git"

def test_set_tracking_branch_on_empty_repo(tmpdir):
    git = qisrc.git.Git(tmpdir.strpath)
    git.init()
    # pylint: disable-msg=E1101
    with pytest.raises(Exception) as e:
        git.set_tracking_branch("master", "master", "origin")
    assert "no commit yet" in str(e)

def test_set_tracking_branch_existing_branch_tracking_none(tmpdir):
    git = qisrc.git.Git(tmpdir.strpath)
    git.init()
    git.commit("-m", "empty", "--allow-empty")
    git.set_tracking_branch("master", "master", "origin")

def test_set_tracking_branch_existing_branch_tracking_ok(tmpdir):
    git = qisrc.git.Git(tmpdir.strpath)
    git.init()
    git.commit("-m", "empty", "--allow-empty")
    git.set_tracking_branch("master", "origin")
    git.set_tracking_branch("master", "origin")

def test_set_tracking_branch_existing_branch_tracking_other(tmpdir):
    git = qisrc.git.Git(tmpdir.strpath)
    git.init()
    git.commit("-m", "empty", "--allow-empty")
    git.set_tracking_branch("master", "origin")
    git.set_tracking_branch("master", "other")
