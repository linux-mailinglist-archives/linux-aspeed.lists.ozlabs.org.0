Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 047A94540A5
	for <lists+linux-aspeed@lfdr.de>; Wed, 17 Nov 2021 07:06:33 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4HvC9f5pmdz2yb6
	for <lists+linux-aspeed@lfdr.de>; Wed, 17 Nov 2021 17:06:30 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (1024-bit key; secure) header.d=jms.id.au header.i=@jms.id.au header.a=rsa-sha256 header.s=google header.b=Xa5f5PaU;
	dkim-atps=neutral
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::f31;
 helo=mail-qv1-xf31.google.com; envelope-from=joel.stan@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 secure) header.d=jms.id.au header.i=@jms.id.au header.a=rsa-sha256
 header.s=google header.b=Xa5f5PaU; dkim-atps=neutral
Received: from mail-qv1-xf31.google.com (mail-qv1-xf31.google.com
 [IPv6:2607:f8b0:4864:20::f31])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4HvC9Z6CXjz2yLJ
 for <linux-aspeed@lists.ozlabs.org>; Wed, 17 Nov 2021 17:06:25 +1100 (AEDT)
Received: by mail-qv1-xf31.google.com with SMTP id gu12so1284708qvb.6
 for <linux-aspeed@lists.ozlabs.org>; Tue, 16 Nov 2021 22:06:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=jms.id.au; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=exxQZeTlLjwyYOEXvP2J7ckZPmIHzoNG3ykObH7i1Jg=;
 b=Xa5f5PaU6GwK+axztDEsAzgk22vSmE794lLj4cFjYWA/uhyo3wOod3NyMQUuDvuN3j
 RjeoTU1HsdGxqm1LlfItecJJ9wBftlAUgQohX9WD01hsqldml9/5T9l7sCi+I94N2jl9
 GKca4147Fl74hQzyY/UGIRKGDkAbjLIUEGRRs=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=exxQZeTlLjwyYOEXvP2J7ckZPmIHzoNG3ykObH7i1Jg=;
 b=HyB5yGTKSdG2T0Yk3i1KuNImPWsITL+apJuLmsI72Cn+8wPOpV7gkrYCAMCc3Et51M
 b8/n/GthOHnNaVApYxXGJ1rg6wBu7Yb0FCLXNEbRFrarLuAXrGCse3xzU/X9Wu39rDiG
 PazRBmJkKuewMNlaARcHAsF6Vfly9XpRIkg38ltUy12t/kX7EUA0BDVCcX2VQo9v/+dY
 hfeAODBjptaVWQmnNbpOMhHNNK6zrmdTSOvNb5b1ZCfzkVwEwf9pTc5xtfPKw2CrMwgX
 wYEVAtkz8kPyf6yT+LwnsiesF+KA0fcKh8dCTYOoyOHGbha1mL9ngBoWlHmgrfCreAUr
 7OwQ==
X-Gm-Message-State: AOAM533Xze4q4WBacLCP/iNfYLiuX1a3xxCWF3qC2sXzHApCrxURHzp4
 TQaHN/waM5U6XFS6wMyz/EeEgrgmed22tjmLMpQ=
X-Google-Smtp-Source: ABdhPJyy+O6dLRTx7HA3aDStqUGjsNbJahcCfn9Mfvr+JYEnDxr5XxCFJ999s+LaaSrJJJfMSMqhU+u5CKh8Spk7Ztk=
X-Received: by 2002:a0c:eb90:: with SMTP id x16mr52902167qvo.41.1637129182078; 
 Tue, 16 Nov 2021 22:06:22 -0800 (PST)
MIME-Version: 1.0
References: <20211117054518.3555-1-tommy_huang@aspeedtech.com>
In-Reply-To: <20211117054518.3555-1-tommy_huang@aspeedtech.com>
From: Joel Stanley <joel@jms.id.au>
Date: Wed, 17 Nov 2021 06:06:10 +0000
Message-ID: <CACPK8XdUHZBAwcwT96Su+Fa_nenYSa75vCNpskh864Cvx04y8Q@mail.gmail.com>
Subject: Re: [PATCH v3 0/4] Add Aspeed AST2600 soc display support
To: tommy-huang <tommy_huang@aspeedtech.com>
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
Cc: devicetree <devicetree@vger.kernel.org>,
 linux-aspeed <linux-aspeed@lists.ozlabs.org>, BMC-SW <BMC-SW@aspeedtech.com>,
 David Airlie <airlied@linux.ie>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 "open list:DRM DRIVERS" <dri-devel@lists.freedesktop.org>,
 Rob Herring <robh+dt@kernel.org>, Daniel Vetter <daniel@ffwll.ch>,
 Linux ARM <linux-arm-kernel@lists.infradead.org>
Errors-To: linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org
Sender: "Linux-aspeed"
 <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>

On Wed, 17 Nov 2021 at 05:45, tommy-huang <tommy_huang@aspeedtech.com> wrote:
>
> v3:
>   Refine the patch for clear separate purpose.
>   Skip to send devicetree patch

Thanks Tommy. A few things:

 - Set up your authorship in git:

 git config --global user.name "Tommy Haung"

- The "Add AST2600 chip support" patch is the same as the one I sent,
you can put mine back in your series now

- We should add a device tree bindings document

Can you confirm you tested these changes on both the ast2500 and the
ast2600? How did you test?

Cheers,

Joel


>
> v2:
>   Remove some unnecessary patch.
>   Refine for reviwer request.
>
> v1:
>   First add patch.
>
> Joel Stanley (2):
>   ARM: dts: aspeed: Add GFX node to AST2600
>   ARM: dts: aspeed: ast2600-evb: Enable GFX device
>
> tommy-huang (2):
>   drm/aspeed: Update INTR_STS handling
>   drm/aspeed: Add AST2600 chip support
>
>  arch/arm/boot/dts/aspeed-ast2600-evb.dts | 18 ++++++++++++++++++
>  arch/arm/boot/dts/aspeed-g6.dtsi         | 11 +++++++++++
>  drivers/gpu/drm/aspeed/aspeed_gfx.h      |  1 +
>  drivers/gpu/drm/aspeed/aspeed_gfx_drv.c  | 15 ++++++++++++++-
>  4 files changed, 44 insertions(+), 1 deletion(-)
>
> --
> 2.17.1
>
