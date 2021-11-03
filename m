Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 59D5E444AEE
	for <lists+linux-aspeed@lfdr.de>; Wed,  3 Nov 2021 23:46:02 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Hl21N0xJ5z2y7W
	for <lists+linux-aspeed@lfdr.de>; Thu,  4 Nov 2021 09:46:00 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (1024-bit key; secure) header.d=jms.id.au header.i=@jms.id.au header.a=rsa-sha256 header.s=google header.b=euRqBpHe;
	dkim-atps=neutral
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::f29;
 helo=mail-qv1-xf29.google.com; envelope-from=joel.stan@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 secure) header.d=jms.id.au header.i=@jms.id.au header.a=rsa-sha256
 header.s=google header.b=euRqBpHe; dkim-atps=neutral
Received: from mail-qv1-xf29.google.com (mail-qv1-xf29.google.com
 [IPv6:2607:f8b0:4864:20::f29])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4Hl21H6nlCz2xXW
 for <linux-aspeed@lists.ozlabs.org>; Thu,  4 Nov 2021 09:45:53 +1100 (AEDT)
Received: by mail-qv1-xf29.google.com with SMTP id v2so4037571qve.11
 for <linux-aspeed@lists.ozlabs.org>; Wed, 03 Nov 2021 15:45:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=jms.id.au; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=nfe3D7clHGl1YZgkT5Ms1GXNSAPyz9/B35wGZ6BRdJA=;
 b=euRqBpHe7zof/gB/pdWm00nUw8LAFIzWvENcia2nOQMD2qz1YnuiNRezwdzo38FXUo
 2q5KmkChXs2ZtGgnd9wZY/P9FTU3Zfc9V2/i3nTZFGzyHp6gU9v4SJqv8grVvOieatZX
 pvCloJ6RcCSdwejgGZXUiGz6W5m6hReIcmig8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=nfe3D7clHGl1YZgkT5Ms1GXNSAPyz9/B35wGZ6BRdJA=;
 b=7fScx/4dViOEQItWJMUJaDdjuYVFwWSnL0/sets5ylndCE4wnTmDhXwQfZkpHYOO9d
 KPRg+5LVCKdUV9ygTbsQXuKyP8A8C3iSzZj3OMRl1qYly3JrYlddYyi+mM2i94bua/fc
 YXmhsxSaDYtiuJMDsdJfVzN71WVXR5TaXyTanCU1x5xgeWcY9b0OL72eQki+Sfmh4NuQ
 nq4bmLfmnZIsLxz1qxy/TIH1r4ZkSmHLWXBRx46Ynjd3IgEiFW/cSCfCZRbLRlk53DeR
 AL57hP9vmTU/vgRm3YpEl1LzKA8VMZ+BZ66V86bWH/34ge4CW0ThzG5OR7C9bI8lJB0l
 iKBA==
X-Gm-Message-State: AOAM5303rwaLtrQbWNJRZxvg+riu98WfEpnwnZ/pOtHIK1J/gjEcdvI6
 j1fDDbPnWHHQ6xPTCoU5uihQrfapeDjCTSiGN70=
X-Google-Smtp-Source: ABdhPJyBiuFpsngJvByWOWn/hd5diNY6ZjO2cLNra4+McwuXCw/CxnR55yD0wt8Ff3yfRdCVM6/BkLr0XUpHaiHuzhk=
X-Received: by 2002:a0c:c784:: with SMTP id k4mr46084501qvj.43.1635979550880; 
 Wed, 03 Nov 2021 15:45:50 -0700 (PDT)
MIME-Version: 1.0
References: <20211102203717.96794-1-jae.hyun.yoo@intel.com>
 <20211102203717.96794-6-jae.hyun.yoo@intel.com>
 <1635902437.654631.3880388.nullmailer@robh.at.kernel.org>
 <8db279c9-4c76-91a5-3617-a17effb2d103@linux.intel.com>
 <CAL_Jsq+SwCqFycKz4+agRsB3qr4Rbfra55Q6tNbMH2bNtoX+hA@mail.gmail.com>
 <796e0c02-5bca-e8a9-a17f-898aafec237f@linux.intel.com>
In-Reply-To: <796e0c02-5bca-e8a9-a17f-898aafec237f@linux.intel.com>
From: Joel Stanley <joel@jms.id.au>
Date: Wed, 3 Nov 2021 22:45:38 +0000
Message-ID: <CACPK8Xcwkz1QLOvN0MiSkX+jj2NZY10--1qo7M8UMyEmQQtYmA@mail.gmail.com>
Subject: Re: [PATCH -next v2 5/6] dt-bindings: ipmi: aspeed,kcs-bmc: add
 'clocks' as a required property
To: Jae Hyun Yoo <jae.hyun.yoo@linux.intel.com>
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
Cc: Rob Herring <robh@kernel.org>, Corey Minyard <minyard@acm.org>,
 linux-aspeed <linux-aspeed@lists.ozlabs.org>,
 devicetree <devicetree@vger.kernel.org>, Jae Hyun Yoo <jae.hyun.yoo@intel.com>,
 linux-arm-kernel <linux-arm-kernel@lists.infradead.org>,
 openipmi-developer@lists.sourceforge.net,
 Haiyue Wang <haiyue.wang@linux.intel.com>, Cedric Le Goater <clg@kaod.org>
Errors-To: linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org
Sender: "Linux-aspeed"
 <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>

On Wed, 3 Nov 2021 at 17:27, Jae Hyun Yoo <jae.hyun.yoo@linux.intel.com> wrote:
>
> On 11/3/2021 9:29 AM, Rob Herring wrote:

> > It's possible that 'clocks' was always required or that it never
> > worked without clocks, then this change is okay. Looking at this
> > patch, I have no way to know that. The commit message has to explain
> > that. A commit message needs to answer WHY are you making the change.
> > You don't really need WHAT the change is as anyone can read the diff.
>
> Then what would be better? Would it be good enough if I add more detail
> commit message including a note that dtb recompiling is required? Or,
> should I change this series to treat the 'clocks' as an optional
> property? Can you please share your thought?

Make it essential. It was only by accident that things have worked
without this change.

While keeping backwards compatibility with dtbs is a goal we strive
for, in practice we use the dtb from the corresponding kernel source
tree, so as long as the patch to the driver is applied in the same
place as the patch to the device tree no systems will break.
