Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 33CE4443AA9
	for <lists+linux-aspeed@lfdr.de>; Wed,  3 Nov 2021 01:59:35 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4HkT1x0pQrz2y7X
	for <lists+linux-aspeed@lfdr.de>; Wed,  3 Nov 2021 11:59:33 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=EwMeJReS;
	dkim-atps=neutral
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::f2a;
 helo=mail-qv1-xf2a.google.com; envelope-from=tcminyard@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20210112 header.b=EwMeJReS; dkim-atps=neutral
Received: from mail-qv1-xf2a.google.com (mail-qv1-xf2a.google.com
 [IPv6:2607:f8b0:4864:20::f2a])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4HkT1s4lyJz2xB8
 for <linux-aspeed@lists.ozlabs.org>; Wed,  3 Nov 2021 11:59:28 +1100 (AEDT)
Received: by mail-qv1-xf2a.google.com with SMTP id u16so967916qvk.4
 for <linux-aspeed@lists.ozlabs.org>; Tue, 02 Nov 2021 17:59:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:date:from:to:cc:subject:message-id:reply-to:references
 :mime-version:content-disposition:in-reply-to;
 bh=h+FtktSBGtvGfOhDF8b/AVzYi4kQSm1ZeFNNHmkXlFM=;
 b=EwMeJReSB5I3854NCV6PTfVNODDjMfIi7fXVX8sLNAJs7szQ29jOR43a/0naPxh2FK
 dYsrIIHNLkKVPC5A22c6boDvb701j14lPPb+5phW1XD9OAVjnwy+ZiBwJrCF0+e/H10a
 nJ373Y21PHBNgyGe/nfkntnZEPgpUUZ+yNelpZTazNFvpBaR4tSM8wi21KL1yLnoTYjz
 hwE4jYmUw735v8q9GWZLc+YkqF7MGBi82AZvMVfxDJwNbS4YyeMPDZ0XWNTAEYCh2bsc
 /UwE/6tw8UWH13cKDz8iUzJ6jek7l8Beiti5KmIuJ5+5M5fV3ZtdsKxreqWcyLmLrAxv
 I1Wg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:date:from:to:cc:subject:message-id
 :reply-to:references:mime-version:content-disposition:in-reply-to;
 bh=h+FtktSBGtvGfOhDF8b/AVzYi4kQSm1ZeFNNHmkXlFM=;
 b=E2InGmvDEyTtAApk+qVwDepI27gKJB57w4TXh38BIxRHYuDiVxm04aaEEUHqCo8eyJ
 3s5A9koIZGJpaq47EgTDWLCOODjhujIc0f8ggeSzmeKLSd12esF0wJItRm+s3v9MKO2B
 PP2U11yrYAs1tj627Pzw+l4GbQzDczfD+GQMvEgY9GAz2sbz1Y8I0AzoyZUM60EGfvt8
 6v99TD8+lgx4Y2I5xQjYRspcay2bO0xyIfGHiW+HUMiKGLxNA3o5yRaTBzGru8fpg+cU
 qjxnqJtSpPzUXhCkgE0pR5mo34gWU6z6tXGcuawTWinBOBkUrVUxECNomZIhiej7noTM
 cTAA==
X-Gm-Message-State: AOAM533JWAhOXNBphkFPPzrnNMpDPapnzwwEWF5vj0nJK4ZIO09Jz+7E
 g7RyKMpc6O7uDH3p5t1GBg==
X-Google-Smtp-Source: ABdhPJxYTFe+/H+/2eDVPHUh15JejRMXQsnrYykDake5H7RlOjK7ucGttAIR9G3rOVHtpUjv1Ci7og==
X-Received: by 2002:a05:622a:d5:: with SMTP id
 p21mr26792476qtw.44.1635901165049; 
 Tue, 02 Nov 2021 17:59:25 -0700 (PDT)
Received: from serve.minyard.net ([47.184.156.158])
 by smtp.gmail.com with ESMTPSA id q4sm427526qkn.61.2021.11.02.17.59.24
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 02 Nov 2021 17:59:24 -0700 (PDT)
Received: from minyard.net (unknown
 [IPv6:2001:470:b8f6:1b:b4e0:932d:f90c:fafb])
 by serve.minyard.net (Postfix) with ESMTPSA id 93C741800B9;
 Wed,  3 Nov 2021 00:59:23 +0000 (UTC)
Date: Tue, 2 Nov 2021 19:59:22 -0500
From: Corey Minyard <minyard@acm.org>
To: jae.hyun.yoo@intel.com
Subject: Re: [PATCH -next v2 0/6] Add LCLK control into Aspeed LPC sub drivers
Message-ID: <20211103005922.GN4667@minyard.net>
References: <20211102203717.96794-1-jae.hyun.yoo@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20211102203717.96794-1-jae.hyun.yoo@intel.com>
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
Reply-To: minyard@acm.org
Cc: linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org,
 linux-aspeed@lists.ozlabs.org, Rob Herring <robh+dt@kernel.org>,
 openipmi-developer@lists.sourceforge.net,
 Haiyue Wang <haiyue.wang@linux.intel.com>, Cedric Le Goater <clg@kaod.org>
Errors-To: linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org
Sender: "Linux-aspeed"
 <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>

On Tue, Nov 02, 2021 at 01:37:11PM -0700, jae.hyun.yoo@intel.com wrote:
> From: Jae Hyun Yoo <jae.hyun.yoo@linux.intel.com>
> 
> Hello all,
> 
> This series is for appliying below fix to all Aspped LPC sub drivers.
> https://lore.kernel.org/all/20201208091748.1920-1-wangzhiqiang.bj@bytedance.com/

Ok, I've added this to my next tree.

There was some duplicated code between the aspeed and bt files, but I'm
not sure it's enough to matter.

-corey

> 
> An LPC sub driver can be enabled without using the lpc-ctrl driver or it
> can be registered ahead of lpc-ctrl depends on each system configuration and
> this difference introduces that LPC can be enabled without heart beating of
> LCLK so it causes improper handling on host interrupts when the host sends
> interrupts in that time frame. Then kernel eventually forcibly disables the
> interrupt with dumping stack and printing a 'nobody cared this irq' message
> out.
> 
> To prevent this issue, all LPC sub drivers should enable LCLK individually
> so this patch adds clock control logic into the remaining Aspeed LPC sub
> drivers.
> 
> Please review this series.
> 
> Thanks,
> Jae
> 
> Changes sinve v1:
>  - Added 'clocks' property into ibt and kcs-bmc bindings using
>    'aspeed,ast2400-ibt-bmc.txt' and 'aspeed,ast2400-kcs-bmc.yaml'
>    respectively because these are not merged into 'aspeed-lpc.yaml' yet.
>    The bindings merging could be done using a separate patch later.
> 
> Jae Hyun Yoo (6):
>   ARM: dts: aspeed: add LCLK setting into LPC IBT node
>   dt-bindings: ipmi: bt-bmc: add 'clocks' as a required property
>   ipmi: bt: add clock control logic
>   ARM: dts: aspeed: add LCLK setting into LPC KCS nodes
>   dt-bindings: ipmi: aspeed,kcs-bmc: add 'clocks' as a required property
>   ipmi: kcs_bmc_aspeed: add clock control logic
> 
>  .../bindings/ipmi/aspeed,ast2400-ibt-bmc.txt  |  2 ++
>  .../bindings/ipmi/aspeed,ast2400-kcs-bmc.yaml |  7 +++++
>  arch/arm/boot/dts/aspeed-g4.dtsi              |  1 +
>  arch/arm/boot/dts/aspeed-g5.dtsi              |  5 +++
>  arch/arm/boot/dts/aspeed-g6.dtsi              |  5 +++
>  drivers/char/ipmi/bt-bmc.c                    | 24 +++++++++++++-
>  drivers/char/ipmi/kcs_bmc_aspeed.c            | 31 ++++++++++++++++---
>  7 files changed, 70 insertions(+), 5 deletions(-)
> 
> -- 
> 2.25.1
> 
