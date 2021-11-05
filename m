Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 282B6445D81
	for <lists+linux-aspeed@lfdr.de>; Fri,  5 Nov 2021 02:47:24 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Hlk0B0LScz2ymq
	for <lists+linux-aspeed@lfdr.de>; Fri,  5 Nov 2021 12:47:22 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20210112 header.b=mAWFDjHs;
	dkim-atps=neutral
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=google.com (client-ip=2a00:1450:4864:20::130;
 helo=mail-lf1-x130.google.com; envelope-from=osk@google.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256
 header.s=20210112 header.b=mAWFDjHs; dkim-atps=neutral
Received: from mail-lf1-x130.google.com (mail-lf1-x130.google.com
 [IPv6:2a00:1450:4864:20::130])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4Hlk064Bcqz2xY8
 for <linux-aspeed@lists.ozlabs.org>; Fri,  5 Nov 2021 12:47:18 +1100 (AEDT)
Received: by mail-lf1-x130.google.com with SMTP id bq11so15638492lfb.10
 for <linux-aspeed@lists.ozlabs.org>; Thu, 04 Nov 2021 18:47:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=fFtNxulykeZOJh/+EoHUpNc3awrU+sZTNAA9MYX7v5s=;
 b=mAWFDjHsGmZ4SgKaHQ5gYyw/if9ETe2hBN17fNG9OHf0bd5qDaC+thIqYR1ugNMgQy
 fuA3UlDA4ZtemBg8GmTZQs7y6jw6qMWCCo2fu+dJkwn9vAXXZnH7OKtKXWCN4CyZVDqr
 Wjd4AvI1UeVjk+fFFNVxLIZm/of9AHZuot16xDXeBX2cDCRM+jPabuEhMC1G0wW+8Uzg
 p0DEp4VGlyFRwP4/V67f95Y8bGpHqcgbsOOBljURfcMiCTE5+QUuqixnK4IliyAERUGW
 XodqFhZMajcLrJLb/faze7b8wtYg2I2/2+A41qhotC6Ed6HVdNKFTfBLmGGhZ5vIcky2
 ZvaQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=fFtNxulykeZOJh/+EoHUpNc3awrU+sZTNAA9MYX7v5s=;
 b=XwamXceFp6a0ucW+jClF5Dhy8MoYA9MCS0czPiLkzaDYrcWPmzijbk6qRbt2btpu4l
 xU4gbtTGnq5LAVLVy18j0ihJcdgnnYDhvo1PgualaijN/N1eUC9tccgguwG8ZmswZv0Z
 izRQgDn/26+CQ6UWJtDa3gWEd1g4ScIi6NjcLYLnEZIHJLH3ScJ0YoddQtlGmYNj/9Hq
 BmTpbN1mAjGVHGNczcb/H/Ta0NLBpxiOIIi3Cs0QQFqDaIxb7TR6bvTv2cYvubHnjaot
 JQIaFqAnqaYvwk6VoJTrKFd5qKB5EeXPzZVx+DcR8ODSGoH6JaGfLjzpSge868zqkuX7
 DqUg==
X-Gm-Message-State: AOAM531OKXSj+iqppkTvFatzw9TWt8PKuEwNuM+peAzmUePVdJhhGFfo
 zPcPa5NWWXNozFzDGr4vf6giAs1ADFnkmuJCngJWQw==
X-Google-Smtp-Source: ABdhPJws3413F7L/y672t9JWv/lYGAlogwvZyALLtS39vIVLJojamzzzN+kwfeATdeUednSh8x6zBYPWdsKkQGmv/Is=
X-Received: by 2002:a05:6512:2341:: with SMTP id
 p1mr52103521lfu.243.1636076833611; 
 Thu, 04 Nov 2021 18:47:13 -0700 (PDT)
MIME-Version: 1.0
References: <20211105005955.107419-1-osk@google.com>
 <CACPK8XcXR=V5-Q+sC4MniNJZJgvbiysFD-5yu6v30_2BwDRTSA@mail.gmail.com>
In-Reply-To: <CACPK8XcXR=V5-Q+sC4MniNJZJgvbiysFD-5yu6v30_2BwDRTSA@mail.gmail.com>
From: Oskar Senft <osk@google.com>
Date: Thu, 4 Nov 2021 21:46:57 -0400
Message-ID: <CABoTLcS=s0XuM9jiisYW3=1gXtiwP8WeopqTOeBwnTX1XCky9Q@mail.gmail.com>
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

Hi Joel

Oh man, this is embarrassing!

> I applied this and tried comple testing, and got this warning:
>
>   DTC     arch/arm/boot/dts/aspeed-bmc-tyan-s7106.dtb
> ../arch/arm/boot/dts/aspeed-bmc-tyan-s7106.dts:217.4-14: Warning
> (reg_format): /ahb/apb/bus@1e78a000/i2c-bus@40/nct7802@28/channel@0:reg:
> property has invalid length (4 bytes) (#address-cells == 2,
> #size-cells == 1)
> [...]
> You need to add this to the nct node:
>
> #address-cells = <1>;
> #size-cells = <0>;
Oh yeah, of course. It's even in the example in the binding that I wrote.

> Did you see this with your testing? I'm building on top of v5.15 and
> my distro's dtc is 1.6.0.
I built (as part of OpenBMC) and ran (on actual HW), but these
warnings don't make it out to the console. In my "defense", I did run
checkpatch.pl, though.

Is there an easy way for me to see these types of warnings? Or should
they really come out as errors?

I'll fix and send a PATCH v3.

I'm really sorry, this shouldn't be so much work for you!

Oskar.
