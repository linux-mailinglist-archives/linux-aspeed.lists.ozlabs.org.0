Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 137D52F76EF
	for <lists+linux-aspeed@lfdr.de>; Fri, 15 Jan 2021 11:47:01 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4DHHtV2PtQzDsfQ
	for <lists+linux-aspeed@lfdr.de>; Fri, 15 Jan 2021 21:46:58 +1100 (AEDT)
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2a00:1450:4864:20::22a;
 helo=mail-lj1-x22a.google.com; envelope-from=fercerpav@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=IfKiigvw; dkim-atps=neutral
Received: from mail-lj1-x22a.google.com (mail-lj1-x22a.google.com
 [IPv6:2a00:1450:4864:20::22a])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4DHHtK0hvhzDq7F
 for <linux-aspeed@lists.ozlabs.org>; Fri, 15 Jan 2021 21:46:45 +1100 (AEDT)
Received: by mail-lj1-x22a.google.com with SMTP id p13so9914123ljg.2
 for <linux-aspeed@lists.ozlabs.org>; Fri, 15 Jan 2021 02:46:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to:user-agent;
 bh=HFix5lhrDvWuvTYP+J9B23RG/cixkCW5Vh+giTcORR4=;
 b=IfKiigvw7rabeBypXKMIk+HUS/nn4+nBWb+Q5dVSfhEH0O2Slqb2RczTz+6MU7p9wm
 ttWhUOu3v8cUhJJan0fmOqejf2/w7xcZhoqkR46tyE0l1mMP86tSgW1q4Z31Wdj+fy3R
 nuyrVHpgPaCdn+Losuyyk78q+NtJEcOrLE0rDEi4CMWChYeI+rq7VHIrOX7vZ32PiZNb
 9m5ErrMvG2Qg7KcXOiWUY4rqNJWh5fizktu81DF7iCbKBb6l0y4k5Z1X/Rq19m6B3FEZ
 vvnGMOcnhr6xu1cOBHQY7EPi32fZ6wCvOmBe7PUlJSXppDAefemAFo7hXsZBdoP+hljP
 k5pA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=HFix5lhrDvWuvTYP+J9B23RG/cixkCW5Vh+giTcORR4=;
 b=b1wkihPH7W4Fb2dfvLtF/qDKPzW/Tdx2UhdPNGJoxFFglvv6DRYOEtaoSOdlx9K2Xy
 7juiKnSMz+uO8JWdthYXvxffXQ4/X0qNZ8yoUbYgCB6yhWqYkaZcKwc19Of1uOzeetMG
 shecjyKe1DamU1JMFRDhFzH4JdiwX7Bosscs6PbjGVPnEyNTdXKV2JqC68mAhgKCrjMV
 05h5GWONqCqZg++yd1lvPKEHcPPbRm8uKgZXVR4U/sh3ma9oLVS/P94+7ElfCLzou9Nw
 TSCWvgNPTo5Xxl24GXKTIOqmiyUK3fRvAmD1RnhewGV+OeeuQ5xinoKLLM1Lvko8PHP5
 +TDg==
X-Gm-Message-State: AOAM532MGqU0ZvciIg1cbjqD9Dm+5BJOeZBbKWOuyWdB1nkW9vzNKFKB
 Mi/VDdtK5V9DwG5/9ny1Dco=
X-Google-Smtp-Source: ABdhPJywQNSylPcjzVHIN5StuUgLOe9rq9AjfMuFfjtSMpvP39Hjj4VxWqmJJF0xcw/sff47Y2cGHg==
X-Received: by 2002:a2e:a377:: with SMTP id i23mr5424974ljn.103.1610707600305; 
 Fri, 15 Jan 2021 02:46:40 -0800 (PST)
Received: from home.paul.comp (paulfertser.info.
 [2001:470:26:54b:226:9eff:fe70:80c2])
 by smtp.gmail.com with ESMTPSA id 12sm853414lfm.235.2021.01.15.02.46.39
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 15 Jan 2021 02:46:39 -0800 (PST)
Received: from home.paul.comp (home.paul.comp [IPv6:0:0:0:0:0:0:0:1])
 by home.paul.comp (8.15.2/8.15.2/Debian-14~deb10u1) with ESMTP id
 10FAkao0004477; Fri, 15 Jan 2021 13:46:37 +0300
Received: (from paul@localhost)
 by home.paul.comp (8.15.2/8.15.2/Submit) id 10FAkZc3004476;
 Fri, 15 Jan 2021 13:46:35 +0300
Date: Fri, 15 Jan 2021 13:46:35 +0300
From: Paul Fertser <fercerpav@gmail.com>
To: Ernesto Corona <ernesto.corona@intel.com>
Subject: Re: [PATCH v29 0/6] JTAG driver introduction
Message-ID: <20210115104635.GA2971@home.paul.comp>
References: <20200413222920.4722-1-ernesto.corona@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200413222920.4722-1-ernesto.corona@intel.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
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
Cc: linux-aspeed@lists.ozlabs.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-doc@vger.kernel.org
Errors-To: linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org
Sender: "Linux-aspeed"
 <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>

Hello,

This is a multi-part review of the series, with general notes inline
in this message, and specific points raised as replies to the
individual patches.

On Mon, Apr 13, 2020 at 03:29:14PM -0700, Ernesto Corona wrote:
> We propose to implement general JTAG interface and infrastructure
> to communicate with user layer application.

Working with a Tioga Pass server platform I needed to use the JTAG
master controller of an ASPEED AST2500 SoC to configure a Lattice
LCMXO2-4000HC CPLD. I'm mentioning these fine details because that's
the only proper runtime testing I performed, but my review is not
limited to that.

Being a long-time OpenOCD community member, I got familiar with many
different facilities and protocols offered by hardware JTAG adapters,
and of wide range of usecases as I was providing end-user
support. This is my perspective when looking at these patches.

I have to note that the current v29 version of the series is broken in
several aspects:

1. The aspeed driver fails probe(), see the driver review for details;

2. The uapi include header is unusable;

3. The offered userspace implementation wasn't updated to the latest
API, but even with the changes to make it compile it's still a mess
too horrible to be used in production;

Points 1 and 2 will be addressed in separate mails. To workaround
point 3 I prepared a recipe with an additional patch[0] so that
mlnx_cpldprog can be at least compiled and used for some minimal
testing.

The shortcomings of mlnx_cpldprog are numerous:

1. It doesn't consistently choose between hardware and bitbang modes;

2. Even though it checks TDO it doesn't print any errors on mismatch
and continues playing back the SVF as if it's all right;

3. It has JTAG speed hardcoded;

4. It doesn't implement RUNTEST so with the CPLD I'm using it's always
_not_ working properly, failing silently;

5. It is just awfully slow, taking about 40 minutes to play back a
file that takes 1.5 minutes with OpenOCD with the same hardware and
kernel driver.

So I added support for the proposed API to OpenOCD: patch that applies
to the version in OpenBMC[1], patch for the latest version[2]. And
since it can do much more than just playing back SVF I hope this can
highlight some essential API shortcomings if it's meant to be
generic. My impression is that in its current state it's not adequate
for the purpose.

[0] https://bitbucket.org/paulfertser/mlnx_cpldprog_bitbake
[1] http://openocd.zylin.com/#/c/5976/
[2] http://openocd.zylin.com/#/c/5975/
-- 
Be free, use free (http://www.gnu.org/philosophy/free-sw.html) software!
mailto:fercerpav@gmail.com
