#! /usr/bin/env python2
from subprocess import check_output

def fetch_pass(account):
    return check_output("pass Mail/" + account, shell=True).splitlines()[0]

nametrans_google_in = {
    '[Gmail]/All Mail':     'All',
    '[Gmail]/Chats':        'Chats',
    '[Gmail]/Drafts':       'Drafts',
    '[Gmail]/Sent Mail':    'Sent',
    '[Gmail]/Important':    'Important',
    '[Gmail]/Spam':         'Spam',
    '[Gmail]/Starred':      'Starred',
    '[Gmail]/Trash':        'Trash'
}

nametrans_google_out = {
    v: k for k, v in nametrans_google_in.iteritems()
}

folderfilter_google = lambda folder: folder not in [
                                                '[Gmail]/All Mail',
                                                '[Gmail]/Important',
                                                '[Gmail]/Starred'
                                                ]
