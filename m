Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 6B32ED0488
	for <lists+linux-aspeed@lfdr.de>; Wed,  9 Oct 2019 02:01:01 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 46nvWG3XCtzDqLK
	for <lists+linux-aspeed@lfdr.de>; Wed,  9 Oct 2019 11:00:58 +1100 (AEDT)
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=google.com
 (client-ip=2607:f8b0:4864:20::643; helo=mail-pl1-x643.google.com;
 envelope-from=brendanhiggins@google.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=google.com header.i=@google.com header.b="jQ25PkDI"; 
 dkim-atps=neutral
Received: from mail-pl1-x643.google.com (mail-pl1-x643.google.com
 [IPv6:2607:f8b0:4864:20::643])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 46nvW90tHHzDqHb
 for <linux-aspeed@lists.ozlabs.org>; Wed,  9 Oct 2019 11:00:50 +1100 (AEDT)
Received: by mail-pl1-x643.google.com with SMTP id w8so138761plq.5
 for <linux-aspeed@lists.ozlabs.org>; Tue, 08 Oct 2019 17:00:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=9ZbjV1DtYpk34EJ1xtvMn0i8wel5DTmAVc9X6bgnLME=;
 b=jQ25PkDI3GQhhIkZMrqDw7+D86d9eTwx5O8ZWcUSTroMqycRkxrch9Aqdi2G2aPdGT
 hjV+fCJCSwWREf0hWc/CU10JbmfyjXa1K/iEFpBZd7ep+gpna3UvQCRZg7mKBOIqiw3Q
 +e0pn1LFZ/WskDWlN/cxOdk5H92qEht014M681oKq1ZeCWoECD//tcz0CKNLZwu6rVBj
 0iI5tYrXcSZkOuwUuGfVR5EP1yl+2msH6aH3wb7sU2ZEWoFkO6kDpiIMk9SK7J00m5Mb
 BDCcxqetJDFGyZ/a1U8pDhHRb0M1B9Gg/aUcowkXqhQEy2ASoXeZ9gFuKJRaHWEZhnwv
 fQ/w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=9ZbjV1DtYpk34EJ1xtvMn0i8wel5DTmAVc9X6bgnLME=;
 b=ifSLOV6+/wYVoQhtr86e4HEWB6I5GOYWv96jZUXVXiv/vvOMXQoEr6/ryCmPTfGdST
 6jht4q49MW3fG0fcbLTDec7PFfCI+LCvs7W4WjgZRnSegncOjVBUjGz41sNw4rQchwHr
 qvzsHhfy4Gk1VpZpq5BfNb8rhD8GPSXOwkd1DKkzrLgDTBjk3A0wqokoJ45lirh74tH3
 r5XRvoKycfKWZUpAKSrcfwpaCKAcijdANDGQR14yWU1iJLbWjK2HmBzv0nndmLk9TMm9
 6XEEYWH/kT7qqEm3EwNbiaRbNP4Jlo7TuURVf8psDuBNyg7rqSX0mSbKUnMChIE6bSYl
 DqhQ==
X-Gm-Message-State: APjAAAW8ehdIBU1a3i4WzMkuJnoGwdkmV5yy0pOIIj23sxShzeqVVFxJ
 MpBPXGGHy0fUXYleqe2dlPHFnVnmyk1h3tscrZD3Zw==
X-Google-Smtp-Source: APXvYqwlpumpcr53qautPqotAY8U4y0Bpq8LPeEYkc6CyB2PcuSXXn4QixEhk+wQ6nSNDEld+2R2p42AazmnqOWI7/U=
X-Received: by 2002:a17:902:8216:: with SMTP id
 x22mr268924pln.232.1570579247540; 
 Tue, 08 Oct 2019 17:00:47 -0700 (PDT)
MIME-Version: 1.0
References: <CACT4Y+YJ8qK7CrU2S-TY-DVCdt+aY=Wzq7+iiPoDsdGf-m8G8A@mail.gmail.com>
In-Reply-To: <CACT4Y+YJ8qK7CrU2S-TY-DVCdt+aY=Wzq7+iiPoDsdGf-m8G8A@mail.gmail.com>
From: Brendan Higgins <brendanhiggins@google.com>
Date: Tue, 8 Oct 2019 17:00:36 -0700
Message-ID: <CAFd5g442rqbUmTYQ2oD87q5bHgxkt4DcJ5841oKs=H7DeXWKQw@mail.gmail.com>
Subject: Re: i2c-aspeed testing with kunit fake and syzkaller
To: Dmitry Vyukov <dvyukov@google.com>
Content-Type: text/plain; charset="UTF-8"
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
Cc: linux-aspeed@lists.ozlabs.org, Wolfram Sang <wsa@the-dreams.de>,
 syzkaller <syzkaller@googlegroups.com>, linux-i2c@vger.kernel.org,
 Shuah Khan <shuah@kernel.org>
Errors-To: linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org
Sender: "Linux-aspeed"
 <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>

+kunit-dev@googlegroups.com

On Tue, Oct 8, 2019 at 7:44 AM Dmitry Vyukov <dvyukov@google.com> wrote:
>
> Hi i2c/aspeed-related people,
>
> Some time ago Brendan and myself did an experiment of testing the
> i2c-aspeed driver in a qemu VM (without any hardware/emulation) using
> kunit-based fake hardware. The fake allowed us to get 10 i2c devices
> successfully probe and appear in /dev/. Which in turn allowed us to
> test the actual driver with syzkaller.
> I will just leave here some details and traces as FYI and for future
> reference. I think this is an important precedent in general.
>
> The kernel branch is here:
> https://github.com/dvyukov/linux/commits/kunit-i2c-stub2
> This is one of kunit branches with this commit on top:
> https://github.com/dvyukov/linux/commit/c9c1706611fdc49679c5bf5bff1e147ab7c7aa79
> This contains lots of hacks to get the fake working on x86 and leave
> persistent devices initialized (rather than shutdown them after
> unit-testing).
>
> This is the kernel config:
> https://gist.githubusercontent.com/dvyukov/72a31dad43b5687e6ffdcdb4cb342175/raw/24b706326e2d9202789fece5bfc17355aadda411/gistfile1.txt
> (some i2c configs + a bunch of debugging configs).
>
> If you boot this kernel with the config in qemu, you should see /dev/i2c-{0,10}.
>
> Probably any syzkaller commit will work, but I just testing on this one:
> https://github.com/google/syzkaller/tree/2ab6c4a4571d4170b0009a5b14b9789b016814b6
> Here is syzkaller config I used:
> https://gist.githubusercontent.com/dvyukov/d0a3c0e9b44cc7d445b36a8a50404ed8/raw/5f6aab34c6515cc4e96dac6cf3a98aaaf5e21b58/gistfile1.txt
>
> Here is kernel coverage we achieved as the result of fuzzing:
> https://drive.google.com/file/d/1JdNshmCWI3crJ3BuVo6uvRuHMBrwH5eB/view?usp=sharing
>
> For crashes, I've got 3 different task hangs:
>
> INFO: task hung in i2c_transfer
> https://gist.githubusercontent.com/dvyukov/25e98a59b643bc868c7489f566ed9eab/raw/67b717488ae9af381a5b0615e5ddf2d226369d3c/gistfile1.txt
>
> INFO: task hung in i2c_smbus_xfer
> https://gist.githubusercontent.com/dvyukov/7ca87fea1b397d46e3393227a34595b9/raw/f5385f025abfc3ad2e91fd4f2616e58c7de8804e/gistfile1.txt
>
> INFO: task hung in aspeed_i2c_master_xfer
> https://gist.githubusercontent.com/dvyukov/dbc51e3ea7034f255c8fd1c99965d91a/raw/a5165e4e6c3b41d593d02fc22996104e468cfab3/gistfile1.txt
>
> And some memory corruptions (non-thread-safe kunit data structures?):
>
> KASAN: use-after-free Read in aspeed_i2c_fake_write_command_reg
> https://gist.githubusercontent.com/dvyukov/6ca5bca5cf7a40a93636360635a4672c/raw/5ad0e7b33907f4b0db102b74c2a11237df612462/gistfile1.txt
>
> KASAN: use-after-free Read in __of_find_property
> https://gist.githubusercontent.com/dvyukov/95ed93a39d38fd215c141b58e5d3ec0f/raw/ea7f2346982a31ab16fca2850f91e1ef11faf687/gistfile1.txt
>
> general protection fault in mock_do_expect
> https://gist.githubusercontent.com/dvyukov/8c2e3def6775d39cb7496b56a77cbcd8/raw/5778337009e21397b484aafe5b24c87ebe64b63f/gistfile1.txt
>
> There are probably a number of things that can be improved in kunit
> platform mock, the fake driver and syzkaller i2c coverage, but this is
> a starting point.
>
> Thanks

The mock_do_expect thing is definitely an issue, but also, not
upstream, so I will fix it before I send that out for review.

As for aspeed_i2c_master_xfer(); the issue appears to be that we do a
wait_for_completion_timeout, which should be interruptible. So I
should probably submit a fix for that.

I was less confident in i2c_transfer, i2c_smbus_xfer, and
__of_find_property; nevertheless:

i2c_transfer doesn't actually look like a bug. It looks like the
faking framework aborted, resulting in a condition which can never
happen in the i2c-core in the real world. Same goes for
i2c_smbus_xfer.

The issue in __of_find_property appears to be that it hits a property
which was not properly initialized when the device_node was
initialized with of_node_init()[1]. I am not an expert in how the
device tree stuff works, but I would expect that of_node_init() should
fully initialize the device_node passed to it. So that might be a
legitimate issue.

I'll take a closer look at i2c_transfer, and i2c_smbus_xfer and see if
I missed anything.

Cheers!
