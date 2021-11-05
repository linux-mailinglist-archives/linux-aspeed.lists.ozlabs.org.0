Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id ED656445DA9
	for <lists+linux-aspeed@lfdr.de>; Fri,  5 Nov 2021 02:56:11 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4HlkBK5lxRz2yZv
	for <lists+linux-aspeed@lfdr.de>; Fri,  5 Nov 2021 12:56:09 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20210112 header.b=IxszP5A3;
	dkim-atps=neutral
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=google.com (client-ip=2a00:1450:4864:20::12b;
 helo=mail-lf1-x12b.google.com; envelope-from=osk@google.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256
 header.s=20210112 header.b=IxszP5A3; dkim-atps=neutral
Received: from mail-lf1-x12b.google.com (mail-lf1-x12b.google.com
 [IPv6:2a00:1450:4864:20::12b])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4HlkB94TPDz2xSH
 for <linux-aspeed@lists.ozlabs.org>; Fri,  5 Nov 2021 12:55:59 +1100 (AEDT)
Received: by mail-lf1-x12b.google.com with SMTP id bi35so15649353lfb.9
 for <linux-aspeed@lists.ozlabs.org>; Thu, 04 Nov 2021 18:55:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=MQ5rx0ih4ImPc1lQ/4TmMDxVD6bAbyAbRYZrdiz+dqM=;
 b=IxszP5A3m4BSkHIF+6XK27KLraJpaPXPDKK/xS9G6jvRIw5LkesIvUoxQLffwQK1C8
 uUlJdR2eAxmr+zwqs1OUapvIGKsA/roR7TygBWGeGcWLKYMGz1L77jsN6uh43LElBGQ+
 Cj7GAD+Nh2Mkoiu9hQAHrF7qMmVtpOsKv27pH8flr8JIRvxKBw+8crEYS+5EKHenJjfR
 RW65ZOygMfaIyNcUkylcdN45BknAkQa6a3/ExPWyvZcEU32Axn1OBonZBb9XPA+OnWzl
 CP1qyEpT0ayEEy/QjQ9G2k8Cn5x9ttRtSnWx7Lcs5P3eSdVFmXLee/tlsIjLFN9/Ra8p
 fScg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=MQ5rx0ih4ImPc1lQ/4TmMDxVD6bAbyAbRYZrdiz+dqM=;
 b=HB8k9CBi2geMGzMB67g1oRmW3MxiX0YT7N/RD/tGXrSGjXOPO0hSRwEtUIAQOBzGxr
 zmIjNaiNbl6Og3TMOtZAXdGJvNpDMicLzn1X8xNudsD3rSjFLLjVW33vRtXKdk9GJLJa
 633ABhDcQNu1niaMJgzxMXhhk9GnxupR0THiD1O5+7m32D8eCk2Ct+E4gsBmi7pscdbr
 ZA+jqVXFbzyFR5nnD+/ISE8B0J/RRWRDSvPMHkvOF55MHnm0JZso0z1p9anpT6ksF6+u
 oPhrrBhud4rij5lD0AxCrSZgych0eDoDqlzWjJCMVzcBty+qFIkTs8knjZmssjrMYrHg
 GXhA==
X-Gm-Message-State: AOAM530xsL1spoKSYIPh305uXnaWJWoElyO5hTIT8fX06XeIiFH4QgfD
 7q9uCXOQNI8eIq67vVFGTtHG1esCVB3GrhECudEOcA==
X-Google-Smtp-Source: ABdhPJxDNQ3NpaQv5bX1NdFnU5Xuxljz59rmlGzJNPgHe5vI0SvIqz2Djc3K4bRYHI/sIf7AP+kOUjIsvTFytbhLdhA=
X-Received: by 2002:ac2:4f02:: with SMTP id k2mr49131299lfr.635.1636077355028; 
 Thu, 04 Nov 2021 18:55:55 -0700 (PDT)
MIME-Version: 1.0
References: <20211105005955.107419-1-osk@google.com>
 <CACPK8XcXR=V5-Q+sC4MniNJZJgvbiysFD-5yu6v30_2BwDRTSA@mail.gmail.com>
 <CABoTLcS=s0XuM9jiisYW3=1gXtiwP8WeopqTOeBwnTX1XCky9Q@mail.gmail.com>
In-Reply-To: <CABoTLcS=s0XuM9jiisYW3=1gXtiwP8WeopqTOeBwnTX1XCky9Q@mail.gmail.com>
From: Oskar Senft <osk@google.com>
Date: Thu, 4 Nov 2021 21:55:39 -0400
Message-ID: <CABoTLcRyc0B5HXSzEusPKWOwO+BG6GfSmmv0miDd6Y4rRCYTiw@mail.gmail.com>
Subject: Re: [PATCH v2] ARM: dts: aspeed: tyan-s7106: Update nct7802 config
To: Joel Stanley <joel@jms.id.au>
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
Cc: Rob Herring <robh+dt@kernel.org>,
 linux-aspeed <linux-aspeed@lists.ozlabs.org>,
 Linux ARM <linux-arm-kernel@lists.infradead.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Errors-To: linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org
Sender: "Linux-aspeed"
 <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>

To answer my own question and as a reminder for myself ...

> > I applied this and tried comple testing, and got this warning:
> >
> >   DTC     arch/arm/boot/dts/aspeed-bmc-tyan-s7106.dtb
> > ../arch/arm/boot/dts/aspeed-bmc-tyan-s7106.dts:217.4-14: Warning
> > (reg_format): /ahb/apb/bus@1e78a000/i2c-bus@40/nct7802@28/channel@0:reg:
> > property has invalid length (4 bytes) (#address-cells == 2,
> > #size-cells == 1)
> Is there an easy way for me to see these types of warnings? Or should
> they really come out as errors?

Yes, there is:

1) Copy the .config from the OpenBMC build directory:
cp ~/src/openbmc/build/s7106/tmp/work/s7106-openbmc-linux-gnueabi/linux-aspeed/5.15+gitAUTOINC+da6376d789-r0/linux-s7106-standard-build/.config
.

2) Run
ARCH="arm" make aspeed-bmc-tyan-s7106.dtb


Oskar.
