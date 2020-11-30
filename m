Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 3F57B2C7E43
	for <lists+linux-aspeed@lfdr.de>; Mon, 30 Nov 2020 07:38:18 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4CkwXl1wnQzDrGp
	for <lists+linux-aspeed@lfdr.de>; Mon, 30 Nov 2020 17:38:15 +1100 (AEDT)
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::734;
 helo=mail-qk1-x734.google.com; envelope-from=joel.stan@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=jms.id.au
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 secure) header.d=jms.id.au header.i=@jms.id.au header.a=rsa-sha256
 header.s=google header.b=dnf1RaF9; dkim-atps=neutral
Received: from mail-qk1-x734.google.com (mail-qk1-x734.google.com
 [IPv6:2607:f8b0:4864:20::734])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4CkwXf0vFxzDr7x
 for <linux-aspeed@lists.ozlabs.org>; Mon, 30 Nov 2020 17:38:09 +1100 (AEDT)
Received: by mail-qk1-x734.google.com with SMTP id y197so9921828qkb.7
 for <linux-aspeed@lists.ozlabs.org>; Sun, 29 Nov 2020 22:38:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=jms.id.au; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=8aZH7xH1QClemQN3cgWizp/vs6QuuxBKUGXhMGD3Yrw=;
 b=dnf1RaF9He5u7B7kCVjE3mq49sOOHfEKNobnfTtzM9J1L3A8BY+SLwQCUALTbVtjQ9
 CtTG+NlxBt0Ibuwgt9p/fBWHT9seZvEiNKfp1hwdSGjGaoULJadvpudwhJJKx51XkjDS
 86hnkjOjf6PlCqqgNJbCmQeF4Ggc3QCNKwqJs=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=8aZH7xH1QClemQN3cgWizp/vs6QuuxBKUGXhMGD3Yrw=;
 b=PARJIjXXPG1vAHApdFV/8o5ne4AcBQG78h4zQcn3alTCfQ33carjR/Ign8a+PLVKw7
 2XIA7NwkUitaAGku9AKqzTsiG88P/x7PqVXppu5vlz0SBPq1Q/FGqoHCgYv7oSaK7puh
 bHxLgiiMJla7/+J1FX75s//yi9E5UAQif/eUDaIey6RyRluh3oN1pQaVdY/TZg785mfi
 vrMDNpOdtWdBSV2c3sYwJyFBYdkaU/2BtHze9yWaMIOv6S6AzIxmgTSpeZ9xm/o/2ZaG
 pVTO9X1J5Ms/s4ITXLCNLaMUnmNPWWuiVm1CyVyweqloavwaCTHoZjjy68tRojOcBG2y
 cuUA==
X-Gm-Message-State: AOAM533CPU1igo2RcWNRWUCY1Vk2/ZWzScZh9gAAV9fLCVLRgYncbpmQ
 /134B7ksIujNk8RSJnbyRITXPydufqNw6tczF0k=
X-Google-Smtp-Source: ABdhPJxAEMvfikp/jML+4aNUOqTwtkbn7fThOwCxc075GAV7c9ruhKnxeHHLCnRB2VLfe8V0zUi3fQ8Kl5Ulo0RaUV4=
X-Received: by 2002:a37:6805:: with SMTP id d5mr21254604qkc.66.1606718285247; 
 Sun, 29 Nov 2020 22:38:05 -0800 (PST)
MIME-Version: 1.0
References: <CACPK8Xfd7AmuEaUdFfYLu4ktcrpTnYUgwQSxUbC-McB02hvo_g@mail.gmail.com>
In-Reply-To: <CACPK8Xfd7AmuEaUdFfYLu4ktcrpTnYUgwQSxUbC-McB02hvo_g@mail.gmail.com>
From: Joel Stanley <joel@jms.id.au>
Date: Mon, 30 Nov 2020 06:37:53 +0000
Message-ID: <CACPK8Xf-agBq2iBJyXOn_XKBoOaE1FPtY00P+n3Z2gNDuy88QA@mail.gmail.com>
Subject: Re: [GIT PULL] ARM: aspeed: soc changes for 5.11
To: SoC Team <soc@kernel.org>, arm <arm@kernel.org>
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
 Linux ARM <linux-arm-kernel@lists.infradead.org>
Errors-To: linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org
Sender: "Linux-aspeed"
 <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>

On Mon, 30 Nov 2020 at 06:30, Joel Stanley <joel@jms.id.au> wrote:
>
> Hello Soc maintainers,
>
> Here are some ASPEED changes for the 5.11 merge window.

Despite the subject, these are the device tree changes. Apologies for
the confusion.

>
> The following changes since commit 2ba56f464f0c1a7264160f8675063b3df92e7966:
>
>   ARM: dts: aspeed: ast2600evb: Add MAC0 (2020-11-19 22:31:18 +1030)
>
> are available in the Git repository at:
>
>   git://git.kernel.org/pub/scm/linux/kernel/git/joel/aspeed.git
> tags/aspeed-5.11-devicetree
>
> for you to fetch changes up to 2ba56f464f0c1a7264160f8675063b3df92e7966:
>
>   ARM: dts: aspeed: ast2600evb: Add MAC0 (2020-11-19 22:31:18 +1030)
>
> ----------------------------------------------------------------
> ASPEED device tree updates for 5.11
>
>  - New machines
>
>    * Bytedance G220A, an AST2500 BMC for an x86 server
>    * Facebook Galaxy100, an AST2400 BMC for a network switch
>    * IBM Rainier 4U, an AST2600 BMC for a PowerPC server
>
>  - Reworking of Facebook device trees to use common dtsi
>
>  - A 64MB flash layout used by the G220A
>
>  - Misc updates to tiogapass, ethanolx, s2600wf, tacoma and rainier
>
> ----------------------------------------------------------------
> Andrew Jeffery (4):
>       ARM: dts: tacoma: Fix node vs reg mismatch for flash memory
>       ARM: dts: rainier: Add reserved memory for ramoops
>       ARM: dts: tacoma: Add reserved memory for ramoops
>       ARM: dts: aspeed: rainier: Don't shout addresses
>
> Billy Tsai (1):
>       ARM: dts: aspeed-g6: Fix the GPIO memory size
>
> Eddie James (2):
>       ARM: dts: aspeed: rainier: Add 4U device-tree
>       ARM: dts: aspeed: rainier: Mark FSI SPI controllers as restricted
>
> George Liu (1):
>       ARM: dts: Fix label address for 64MiB OpenBMC flash layout
>
> Joel Stanley (2):
>       ARM: dts: aspeed: s2600wf: Fix VGA memory region location
>       ARM: dts: aspeed: ast2600evb: Add MAC0
>
> John Wang (2):
>       ARM: dts: Add 64MiB OpenBMC flash layout
>       ARM: dts: aspeed: g220a: Add some gpios
>
> Konstantin Aladyshev (4):
>       ARM: dts: aspeed: amd-ethanolx: Update KCS nodes to use v2 binding
>       ARM: dts: aspeed: amd-ethanolx: Enable KCS channel 3
>       ARM: dts: aspeed: amd-ethanolx: Enable devices for the iKVM functionality
>       ARM: dts: aspeed: amd-ethanolx: Add GPIO line names
>
> Lotus Xu (1):
>       ARM: dts: aspeed: Add Bytedance g220a BMC machine
>
> Paul Fertser (1):
>       arm: dts: aspeed: tiogapass: Enable second MAC
>
> Tao Ren (6):
>       ARM: dts: aspeed: Common dtsi for Facebook AST2400 Network BMCs
>       ARM: dts: aspeed: wedge40: Use common dtsi
>       ARM: dts: aspeed: wedge100: Use common dtsi
>       ARM: dts: aspeed: Add Facebook Galaxy100 (AST2400) BMC
>       ARM: dts: aspeed: wedge400: Fix FMC flash0 layout
>       ARM: dts: aspeed: minipack: Fixup I2C tree
>
> Vijay Khemka (1):
>       ARM: dts: aspeed: tiogapass: Remove vuart
