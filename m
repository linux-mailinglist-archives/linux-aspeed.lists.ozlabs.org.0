Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id B36B828D989
	for <lists+linux-aspeed@lfdr.de>; Wed, 14 Oct 2020 07:28:25 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4CB1Cp0qVMzDqpL
	for <lists+linux-aspeed@lfdr.de>; Wed, 14 Oct 2020 16:28:22 +1100 (AEDT)
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::841;
 helo=mail-qt1-x841.google.com; envelope-from=joel.stan@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=jms.id.au
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 secure) header.d=jms.id.au header.i=@jms.id.au header.a=rsa-sha256
 header.s=google header.b=Gl6vpxUK; dkim-atps=neutral
Received: from mail-qt1-x841.google.com (mail-qt1-x841.google.com
 [IPv6:2607:f8b0:4864:20::841])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4CB1Cj1hBpzDqcw
 for <linux-aspeed@lists.ozlabs.org>; Wed, 14 Oct 2020 16:28:17 +1100 (AEDT)
Received: by mail-qt1-x841.google.com with SMTP id h19so1529825qtq.4
 for <linux-aspeed@lists.ozlabs.org>; Tue, 13 Oct 2020 22:28:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=jms.id.au; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=kB//nqoMYrgFKVVbmCReUvvlCp/OH9pTFa1D0WvNeK8=;
 b=Gl6vpxUKtK+nwjlLO+SvrSUeR2dC+PEV5wmiGiSO4POlCr4RCSIgQ3LSh9oI8d/GvE
 3SCz5zqjFohPG3bpCgc3pDGJbq7kbxfM78TQRlzSzCwMCDAMEbi7r8gN5Lx7EeR9WFzp
 ASIh0sC7J1hK0xf8PHJlMZ3xfkynkx3r+Txrk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=kB//nqoMYrgFKVVbmCReUvvlCp/OH9pTFa1D0WvNeK8=;
 b=UaI2kf3R26B0vf1E4ng3yK8Z3kozxxsLfCXx+CSI98mdLKg2JWPSkVAlUFGy67YMD2
 j/za0CjA3D92P7wF7SVODmXLl2D0PAP4ly89MLNf+f6k9A/cT4vFbspsPOB5VJXtZSWO
 Xn7AA6BkPx4w06e+CheM6/82I/o1kwA7K4cuh9NFcxKGCOYadQzo/egEC4mbX1f/NfFt
 wdfDboL8PVGL48k3Uuo8+1ak39IwS88NAUaOKjdYS3UUhQWzuFM2PsWiOP3OACcUxRRx
 1z0eDgfvH62j2B7Pz3KDB3tKd707HbmEAAUv1x91GrA0wc45ZmClfcGWlWlKnZqTmfEd
 9P6w==
X-Gm-Message-State: AOAM532Sc+ZQy5QDvxte6UZOlidLXnBaAkNeqyzqkpQL1wfKD8SO75XW
 9WpSoEipG5+byFm8R+h8IrFQ50SiavXEl0H+Ln4=
X-Google-Smtp-Source: ABdhPJw24gb5jxVKjUGFnb8ILFTaJiae+ZhEB+sYFIQ/Gi83c+wIbHiQ4g4hFhDiM1oYPQWMGp2dm2s2NPDIVlvVANQ=
X-Received: by 2002:ac8:3674:: with SMTP id n49mr3177077qtb.385.1602653292820; 
 Tue, 13 Oct 2020 22:28:12 -0700 (PDT)
MIME-Version: 1.0
References: <20200928070108.14040-1-ryan_chen@aspeedtech.com>
 <20200928070108.14040-2-ryan_chen@aspeedtech.com>
 <160264382296.310579.9835482254268204873@swboyd.mtv.corp.google.com>
In-Reply-To: <160264382296.310579.9835482254268204873@swboyd.mtv.corp.google.com>
From: Joel Stanley <joel@jms.id.au>
Date: Wed, 14 Oct 2020 05:28:00 +0000
Message-ID: <CACPK8Xe-_hTey7hTJjG2-EcDsTN0qOw3bWBcrZZohEK3QOJuvg@mail.gmail.com>
Subject: Re: [PATCH 1/1] clk: aspeed: modify some default clks are critical
To: Stephen Boyd <sboyd@kernel.org>
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
Cc: BMC-SW <bmc-sw@aspeedtech.com>,
 linux-aspeed <linux-aspeed@lists.ozlabs.org>,
 Michael Turquette <mturquette@baylibre.com>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 linux-clk@vger.kernel.org, Linux ARM <linux-arm-kernel@lists.infradead.org>
Errors-To: linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org
Sender: "Linux-aspeed"
 <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>

On Wed, 14 Oct 2020 at 02:50, Stephen Boyd <sboyd@kernel.org> wrote:
>
> Quoting Ryan Chen (2020-09-28 00:01:08)
> > In ASPEED SoC LCLK is LPC clock for all SuperIO device, UART1/UART2 are
> > default for Host SuperIO UART device, eSPI clk for Host eSPI bus access
> > eSPI slave channel, those clks can't be disable should keep default,
> > otherwise will affect Host side access SuperIO and SPI slave device.
> >
> > Signed-off-by: Ryan Chen <ryan_chen@aspeedtech.com>
> > ---
>
> Is there resolution on this thread?

Not yet.

We have a system where the BMC (management controller) controls some
clocks, but the peripherals that it's clocking are outside the BMC's
control. In this case, the host processor us using some UARTs and what
not independent of any code running on the BMC.

Ryan wants to have them marked as critical so the BMC never powers them down.

However, there are systems that don't use this part of the soc, so for
those implementations they are not critical and Linux on the BMC can
turn them off.

Do you have any thoughts? Has anyone solved a similar problem already?

Cheers,

Joel
