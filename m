Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id E8439D07A0
	for <lists+linux-aspeed@lfdr.de>; Wed,  9 Oct 2019 08:48:46 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 46p4Ym2MpgzDqLD
	for <lists+linux-aspeed@lfdr.de>; Wed,  9 Oct 2019 17:48:44 +1100 (AEDT)
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=gmail.com
 (client-ip=2607:f8b0:4864:20::841; helo=mail-qt1-x841.google.com;
 envelope-from=joel.stan@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=jms.id.au
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 secure) header.d=jms.id.au header.i=@jms.id.au header.b="Cs618chO"; 
 dkim-atps=neutral
Received: from mail-qt1-x841.google.com (mail-qt1-x841.google.com
 [IPv6:2607:f8b0:4864:20::841])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 46p4Yf6DCwzDqJj
 for <linux-aspeed@lists.ozlabs.org>; Wed,  9 Oct 2019 17:48:38 +1100 (AEDT)
Received: by mail-qt1-x841.google.com with SMTP id u40so1818145qth.11
 for <linux-aspeed@lists.ozlabs.org>; Tue, 08 Oct 2019 23:48:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=jms.id.au; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=zgBfUQY+R28gSBttNQEeGLkYeI3IaTHfWsiDGp1e1YQ=;
 b=Cs618chOCU4BAxK0MkP0MFxKRI8oPdEoVdZvuOPAUTLTtilchj9sasyCt2jsgu0tcv
 zwhfIzAhdkZMrroMqxeVGvl9U4EVep9JL4KN9te+CJFqyU7swueHwvme0zWpE6Y4D+ZK
 ny5Yiw3gwEymySByyyelsj+szM1zr6VTpkbP8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=zgBfUQY+R28gSBttNQEeGLkYeI3IaTHfWsiDGp1e1YQ=;
 b=gZLQDhkzCbJSQvcwLn6YCKLQCaakZCmwvMJAG/O86hyxzE2cMgym55HIDszPTsx/iL
 wvTOx+0PQfFEENWW+R1J/ngbiyBB1Gpn0em9EQkKkCLGJGpeqda8Q4Q+TLG73KRWx/kw
 uFjDF+/Td8dYWIxYTlIlbwv9yYr8XGGgIVPeD439rhvQC40dkXhB15oC1zvrhXizmGcz
 6HDB9VxQsMRRcfltd4jLfLgZMNSZh9oJ2X2BQr+7DKoCBk3YIFopWk2S0UPrNQvNxmML
 67ltllSJTcqLYz9nwMuJ06IWFP4O4IrEZNI52nwMmEBq1bvagwNBpFkI2OYuxIAynRKN
 IDDg==
X-Gm-Message-State: APjAAAVcEU6oUBdsLeoIGiAbNqZKEHcDpUDpxnLddRUvHg9RqdErTkNr
 DbnatIZUfA6crgcqVBYY9nHwdUSrLtssRSnBoUM=
X-Google-Smtp-Source: APXvYqzDpNm5atjKvJKYNDLJ0Sj3Cb0iqyUJBFzb56Tc8lqcUbfeuBzh91kOgNKka5AHDx19UWduj6OErsEANSZzySE=
X-Received: by 2002:ac8:1207:: with SMTP id x7mr2039112qti.255.1570603715922; 
 Tue, 08 Oct 2019 23:48:35 -0700 (PDT)
MIME-Version: 1.0
References: <CACT4Y+YJ8qK7CrU2S-TY-DVCdt+aY=Wzq7+iiPoDsdGf-m8G8A@mail.gmail.com>
In-Reply-To: <CACT4Y+YJ8qK7CrU2S-TY-DVCdt+aY=Wzq7+iiPoDsdGf-m8G8A@mail.gmail.com>
From: Joel Stanley <joel@jms.id.au>
Date: Wed, 9 Oct 2019 06:48:23 +0000
Message-ID: <CACPK8XcaAa8aRjqV+vYzh71KMp6hEwLi+qV6bcQUC5xATm0zzg@mail.gmail.com>
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
Cc: linux-aspeed <linux-aspeed@lists.ozlabs.org>,
 Wolfram Sang <wsa@the-dreams.de>, Brendan Higgins <brendanhiggins@google.com>,
 syzkaller <syzkaller@googlegroups.com>, linux-i2c@vger.kernel.org,
 Shuah Khan <shuah@kernel.org>
Errors-To: linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org
Sender: "Linux-aspeed"
 <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>

On Tue, 8 Oct 2019 at 14:44, Dmitry Vyukov <dvyukov@google.com> wrote:
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

Wow, this is extensive. It will take me some time to digest it.

Thanks for sending it along.

Cheers,

Joel


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
