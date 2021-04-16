Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 424A1361A91
	for <lists+linux-aspeed@lfdr.de>; Fri, 16 Apr 2021 09:35:22 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4FM7KN1KyBz3bVH
	for <lists+linux-aspeed@lfdr.de>; Fri, 16 Apr 2021 17:35:20 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=bytedance-com.20150623.gappssmtp.com header.i=@bytedance-com.20150623.gappssmtp.com header.a=rsa-sha256 header.s=20150623 header.b=G+yNnwMn;
	dkim-atps=neutral
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=bytedance.com (client-ip=2607:f8b0:4864:20::22c;
 helo=mail-oi1-x22c.google.com; envelope-from=yulei.sh@bytedance.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=bytedance-com.20150623.gappssmtp.com
 header.i=@bytedance-com.20150623.gappssmtp.com header.a=rsa-sha256
 header.s=20150623 header.b=G+yNnwMn; dkim-atps=neutral
Received: from mail-oi1-x22c.google.com (mail-oi1-x22c.google.com
 [IPv6:2607:f8b0:4864:20::22c])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4FM7KK2QqTz301K
 for <linux-aspeed@lists.ozlabs.org>; Fri, 16 Apr 2021 17:35:14 +1000 (AEST)
Received: by mail-oi1-x22c.google.com with SMTP id u16so9667042oiu.7
 for <linux-aspeed@lists.ozlabs.org>; Fri, 16 Apr 2021 00:35:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bytedance-com.20150623.gappssmtp.com; s=20150623;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=tJD4Wffy8UFddOPkdi2YXR6U7i7vtfGmTFUKn6fdSpQ=;
 b=G+yNnwMnLDElOBnF2B2+GxANp7XTkHj2DLoP/s3CNBCAi6w7gglXHy8oFGuZ6Qp2Qm
 OkeIpoc212lPbkc1hyJkm4A51KOcLo2OlS6K9uJ5dEF7gXETSsxiw5XJDsJgsXb3s2oE
 lTp4C8qSueJ08ORlfJ2m5xth4v57F+vKbyegAMM9luRp1wBe//U+v9gUr3+lZXdesng9
 WwQpdi/QHfafpxLKTrJMbumRxFxzlDgN3ecEtb/fdhrAiLMY2USct0BXoIde0q8IFcLB
 IWa4uZRPhHVPfVLPtQM/ta90PyYBStMFJkJZJ9KNDBnVYP5W6ET3vQKd71EAnaMFp0Hu
 7rPg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=tJD4Wffy8UFddOPkdi2YXR6U7i7vtfGmTFUKn6fdSpQ=;
 b=PPOT/Lk4FedAZko0aYp6nDxjR8vOn6mu7MrdtOMp1g6OpFGGfmflkDzcrXrTYZZSjA
 O9VtusoJh+Uh0HX2P0i+CXUb+lLP4/nFoeF9xCLugwJDk5Rp3/e3Qto6r/4ANPbs/w7i
 oTrYW3KRLCjQAQVxm9B5Gwyfu6XrBqWgQOgCidMD6lsg7hLgLc5ji99Zo5xiLfICXq2i
 GmmQJc3iR38laWUii4cy7FZsGwLnKwPD6jss4ErPy7YVntF35aooskb9K30EK7yMhO/2
 L1KzONDjn0H6aZmy6qQaR1pHhTcrwDO4dsY/nq8kk2iAh+y3ftQk1KymIjzqWvh/bCvG
 B1Qw==
X-Gm-Message-State: AOAM533zPstj0AmQvFzHU04gl5Ys/YL3uKltIMrm3EJcPl9qU8KsUHWu
 dmk8AobO+zR3t3xVBb6oZxjvJCV3Cbsm5vtBuyYT4A==
X-Google-Smtp-Source: ABdhPJyyb5uCrc4pETT//wgeijjcWgZHJwhyFG2hghIXA58CpkcDpTKOEaIX3WAcbBOMndCKUQq/lHReczEGRuQm9ms=
X-Received: by 2002:a05:6808:d50:: with SMTP id
 w16mr5521425oik.28.1618558512880; 
 Fri, 16 Apr 2021 00:35:12 -0700 (PDT)
MIME-Version: 1.0
References: <20210316085932.2601-1-troy_lee@aspeedtech.com>
 <CACPK8XeYtaLLWDMR8xZhERrQ_WCUJ2RM_JZmZNQ6oZSvgSDM_w@mail.gmail.com>
In-Reply-To: <CACPK8XeYtaLLWDMR8xZhERrQ_WCUJ2RM_JZmZNQ6oZSvgSDM_w@mail.gmail.com>
From: Lei Yu <yulei.sh@bytedance.com>
Date: Fri, 16 Apr 2021 15:35:01 +0800
Message-ID: <CAGm54UHgQSMh8WLzRf7Swhv9mmzNBuEK6eKf9eX0ASp95hjARw@mail.gmail.com>
Subject: Re: [External] Re: [PATCH v1] ARM: dts: Fix 64MiB OpenBMC flash
 layout and aspeed-ast2600-evb.dts
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
Cc: "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS"
 <devicetree@vger.kernel.org>,
 "moderated list:ARM/ASPEED MACHINE SUPPORT" <linux-aspeed@lists.ozlabs.org>,
 open list <linux-kernel@vger.kernel.org>, Rob Herring <robh+dt@kernel.org>,
 leetroy@gmail.com, "moderated list:ARM/ASPEED MACHINE SUPPORT"
 <linux-arm-kernel@lists.infradead.org>
Errors-To: linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org
Sender: "Linux-aspeed"
 <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>

On Fri, Apr 16, 2021 at 11:03 AM Joel Stanley <joel@jms.id.au> wrote:
>
> On Tue, 16 Mar 2021 at 08:59, Troy Lee <troy_lee@aspeedtech.com> wrote:
> >
> > Aspeed AST2600 u-boot requires 600KiB+ flash space. Sharing the same
> > openbmc-flash-layout-64.dtsi requires to resize the flash partition.
> >
> > The updated flash layout as follows:
> > - u-boot: 896 KiB
> > - u-boot-env: 128 KiB
> > - kernel: 9MiB
> > - rofs: 32 MiB
> > - rwfs: 22 MiB
>
> Changing the 64MB layout will break the systems that are already using
> this layout. I'll get the Bytedance people to chime in, as theirs is
> the only system using this layout so far.
>
> John, Lei?

Because the kernel's offset is updated, several other changes are required:
1. The related offsets, which is already sent to
https://gerrit.openbmc-project.xyz/c/openbmc/meta-phosphor/+/39343
2. The u-boot patch to update the `bootm` address and make sure it
only applies to the 64MiB layout.

Without the above two changes, I would suggest holding the merge.

-- 
BRs,
Lei YU
