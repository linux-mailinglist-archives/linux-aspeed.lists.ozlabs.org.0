Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 46A2DD0799
	for <lists+linux-aspeed@lfdr.de>; Wed,  9 Oct 2019 08:45:28 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 46p4Tx30S3zDqKS
	for <lists+linux-aspeed@lfdr.de>; Wed,  9 Oct 2019 17:45:25 +1100 (AEDT)
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=google.com
 (client-ip=2607:f8b0:4864:20::741; helo=mail-qk1-x741.google.com;
 envelope-from=dvyukov@google.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=google.com header.i=@google.com header.b="b2bYt4KU"; 
 dkim-atps=neutral
Received: from mail-qk1-x741.google.com (mail-qk1-x741.google.com
 [IPv6:2607:f8b0:4864:20::741])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 46ng9972v5zDqPR
 for <linux-aspeed@lists.ozlabs.org>; Wed,  9 Oct 2019 01:44:22 +1100 (AEDT)
Received: by mail-qk1-x741.google.com with SMTP id y144so16969462qkb.7
 for <linux-aspeed@lists.ozlabs.org>; Tue, 08 Oct 2019 07:44:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=mime-version:from:date:message-id:subject:to;
 bh=77S/fCndU2ebwOJQnycUXPA5+chmlFYMx3LZwIty4+w=;
 b=b2bYt4KUBY6/oGk2hzre4AVwdwFNJKFzT/WR4vYnhD79dT91djC0Jc6uH5noy/amBM
 Qwq48fDbaKRjHBSLjGOGbIwwt8irFyoMpfKsJ3+wVtFJq9J5PXhCoCxTJIBJkB2Fjqjs
 a9SZrAwSCiqjvLkrOIZRsPnm2gM6eNd0p2nYZJvgAFMqy7GV5B1Q3klgClPqr9XD5v46
 n3fDAgTjlS/xgBJJjWvreszKnPDrpBBK0u1WwbhAEvk9lDNKSltDZIle9kXqZdxlbThT
 C7/CCcb8wIGuwn/q6XQylGL/PqoLDfXCOSjSISLjvyGKyVY0JMJt1Wy2dKBOoEwVyvis
 UIpQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:from:date:message-id:subject:to;
 bh=77S/fCndU2ebwOJQnycUXPA5+chmlFYMx3LZwIty4+w=;
 b=R0PhHcF8fKI+U3Z2XExF6Sg+xOe5QVoxW8c9O+7ItsiFCRU7t1fYnCfiqt0dWQ6WGX
 Ze0dXjdbzvoWy3srx7rp1rLGDFPcGZln1/aoCAaG/nYxHCJLJNGErsethWniKYzpMQxZ
 neaVZ0vr5M1kPGW2u9INUNGgFe9d9ANB5OkoOPMFwiiWXnk8AoacsE9hBhdbKaW+pkQ5
 ASBTS64DVYmEwf8tyKGVd1lkWozULEsQpGkhGJu+V3Gmn/BBBK4ssgQSExdRPm8sxWoF
 7263p4of/86DEuXDgetF1MNlu1wiFBnVm5uE/gQb1zaFB4fNVCNYd7epzv0ASxWTHhpp
 EsCg==
X-Gm-Message-State: APjAAAV6Eo+1Wvg7N2wiDjVdcHUplluMJJ1vcrpCu63tkFlAAhbEe6WE
 +uAaVpfRYkruZSNWQLckyUX4L6aIiGPsYlpTSpxMwQ==
X-Google-Smtp-Source: APXvYqx9KXd17N5JZ7Ztsu2CjTXciBgsPHwNXmzDG74FSy+C9F629m94FucdVgJnwXQr6EPjGyJkhBwq1JlZCYl5NCE=
X-Received: by 2002:a37:985:: with SMTP id 127mr28956985qkj.43.1570545859940; 
 Tue, 08 Oct 2019 07:44:19 -0700 (PDT)
MIME-Version: 1.0
From: Dmitry Vyukov <dvyukov@google.com>
Date: Tue, 8 Oct 2019 16:44:08 +0200
Message-ID: <CACT4Y+YJ8qK7CrU2S-TY-DVCdt+aY=Wzq7+iiPoDsdGf-m8G8A@mail.gmail.com>
Subject: i2c-aspeed testing with kunit fake and syzkaller
To: linux-i2c@vger.kernel.org, Brendan Higgins <brendanhiggins@google.com>, 
 Benjamin Herrenschmidt <benh@kernel.crashing.org>, joel@jms.id.au,
 linux-aspeed@lists.ozlabs.org, 
 wsa@the-dreams.de, syzkaller <syzkaller@googlegroups.com>, 
 Shuah Khan <shuah@kernel.org>
Content-Type: text/plain; charset="UTF-8"
X-Mailman-Approved-At: Wed, 09 Oct 2019 17:41:41 +1100
X-BeenThere: linux-aspeed@lists.ozlabs.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Linux ASPEED SoC development <linux-aspeed.lists.ozlabs.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/linux-aspeed>,
 <mailto:linux-aspeed-request@lists.ozlabs.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/linux-aspeed/>
List-Post: <mailto:linux-aspeed@lists.ozlabs.org>
List-Help: <mailto:linux-aspeed-request@lists.ozlabs.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/linux-aspeed>,
 <mailto:linux-aspeed-request@lists.ozlabs.org?subject=subscribe>
Errors-To: linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org
Sender: "Linux-aspeed"
 <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>

Hi i2c/aspeed-related people,

Some time ago Brendan and myself did an experiment of testing the
i2c-aspeed driver in a qemu VM (without any hardware/emulation) using
kunit-based fake hardware. The fake allowed us to get 10 i2c devices
successfully probe and appear in /dev/. Which in turn allowed us to
test the actual driver with syzkaller.
I will just leave here some details and traces as FYI and for future
reference. I think this is an important precedent in general.

The kernel branch is here:
https://github.com/dvyukov/linux/commits/kunit-i2c-stub2
This is one of kunit branches with this commit on top:
https://github.com/dvyukov/linux/commit/c9c1706611fdc49679c5bf5bff1e147ab7c7aa79
This contains lots of hacks to get the fake working on x86 and leave
persistent devices initialized (rather than shutdown them after
unit-testing).

This is the kernel config:
https://gist.githubusercontent.com/dvyukov/72a31dad43b5687e6ffdcdb4cb342175/raw/24b706326e2d9202789fece5bfc17355aadda411/gistfile1.txt
(some i2c configs + a bunch of debugging configs).

If you boot this kernel with the config in qemu, you should see /dev/i2c-{0,10}.

Probably any syzkaller commit will work, but I just testing on this one:
https://github.com/google/syzkaller/tree/2ab6c4a4571d4170b0009a5b14b9789b016814b6
Here is syzkaller config I used:
https://gist.githubusercontent.com/dvyukov/d0a3c0e9b44cc7d445b36a8a50404ed8/raw/5f6aab34c6515cc4e96dac6cf3a98aaaf5e21b58/gistfile1.txt

Here is kernel coverage we achieved as the result of fuzzing:
https://drive.google.com/file/d/1JdNshmCWI3crJ3BuVo6uvRuHMBrwH5eB/view?usp=sharing

For crashes, I've got 3 different task hangs:

INFO: task hung in i2c_transfer
https://gist.githubusercontent.com/dvyukov/25e98a59b643bc868c7489f566ed9eab/raw/67b717488ae9af381a5b0615e5ddf2d226369d3c/gistfile1.txt

INFO: task hung in i2c_smbus_xfer
https://gist.githubusercontent.com/dvyukov/7ca87fea1b397d46e3393227a34595b9/raw/f5385f025abfc3ad2e91fd4f2616e58c7de8804e/gistfile1.txt

INFO: task hung in aspeed_i2c_master_xfer
https://gist.githubusercontent.com/dvyukov/dbc51e3ea7034f255c8fd1c99965d91a/raw/a5165e4e6c3b41d593d02fc22996104e468cfab3/gistfile1.txt

And some memory corruptions (non-thread-safe kunit data structures?):

KASAN: use-after-free Read in aspeed_i2c_fake_write_command_reg
https://gist.githubusercontent.com/dvyukov/6ca5bca5cf7a40a93636360635a4672c/raw/5ad0e7b33907f4b0db102b74c2a11237df612462/gistfile1.txt

KASAN: use-after-free Read in __of_find_property
https://gist.githubusercontent.com/dvyukov/95ed93a39d38fd215c141b58e5d3ec0f/raw/ea7f2346982a31ab16fca2850f91e1ef11faf687/gistfile1.txt

general protection fault in mock_do_expect
https://gist.githubusercontent.com/dvyukov/8c2e3def6775d39cb7496b56a77cbcd8/raw/5778337009e21397b484aafe5b24c87ebe64b63f/gistfile1.txt

There are probably a number of things that can be improved in kunit
platform mock, the fake driver and syzkaller i2c coverage, but this is
a starting point.

Thanks
