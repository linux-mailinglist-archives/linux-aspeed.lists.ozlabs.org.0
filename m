Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id E1674DD21
	for <lists+linux-aspeed@lfdr.de>; Mon, 29 Apr 2019 09:52:03 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 44sxh13XdzzDqMM
	for <lists+linux-aspeed@lfdr.de>; Mon, 29 Apr 2019 17:52:01 +1000 (AEST)
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=gmail.com
 (client-ip=2607:f8b0:4864:20::842; helo=mail-qt1-x842.google.com;
 envelope-from=joel.stan@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=jms.id.au
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 secure) header.d=jms.id.au header.i=@jms.id.au header.b="JnaDK3rL"; 
 dkim-atps=neutral
Received: from mail-qt1-x842.google.com (mail-qt1-x842.google.com
 [IPv6:2607:f8b0:4864:20::842])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 44sxgx0bGFzDqKs
 for <linux-aspeed@lists.ozlabs.org>; Mon, 29 Apr 2019 17:51:54 +1000 (AEST)
Received: by mail-qt1-x842.google.com with SMTP id h16so5195695qtk.6
 for <linux-aspeed@lists.ozlabs.org>; Mon, 29 Apr 2019 00:51:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=jms.id.au; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=o/wmIhe4nVJv0ub+Zm2BlY4rD9+LMhSkxOTZOnjTqAA=;
 b=JnaDK3rLVxBeSbdPaTiJhcsOtXtzO9cNySiXWlsE5w+lj0KZKm15wU8vDzTYOSAlqm
 EmCQCqUSFilei1MO3YR+pHoWcrnhKrUboEs/6zvzj4Dk2ldjLjZkdVoANx/RMKz4s4yG
 0rDmq3sz8SfxAO26FjsKRA2fQXqJPtIfwGKHc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=o/wmIhe4nVJv0ub+Zm2BlY4rD9+LMhSkxOTZOnjTqAA=;
 b=LaPVOESiq9Yw99+/JR+i86p9NY92QksYT3yiaknd1gsZg7JUZOS7+Tkjpfu6FSxCgy
 ePCUkC3ExxIA8M3EoMsss7sdYsjsjiSUXrIfEBeJRWxFoRrAIbt024nCYZTpX6z7HUWD
 cQ8xKqA/dDs56U2AZlUr3giUDNUcblCW+lu7gUQjlso7oWdmWAZu+UrH4K7PsGcvMpEO
 mZvGSJFvQJJ3MgXaMkLkt5TBtiFFEIdrYio3bjCMEaBu/kIYfBuLNkO8jEy/MxhzUQ2Y
 F8FZRiQxw+JsxXGFlKmpares09/FdJ38QxgYNvXj35reZTS62LtFnxiuEX/ZtJC2K+NN
 bAXQ==
X-Gm-Message-State: APjAAAXlbrorQPdpE9IHY0QZPuG7mUtdO7yvBHulhFvCD8mRu5HFuAt8
 uOVncUNzAJLh3a0yY+nRrLSaacW5M1xY2JPaWqY=
X-Google-Smtp-Source: APXvYqyMZFsWN6kgsok8mRvbEOnKo2YP2o/YvFTM5PkjD6J+ugLl8ckNCMjgT7cwvnyaUovJ0SCbOKC95qDEoQeNkhs=
X-Received: by 2002:a0c:986d:: with SMTP id e42mr47259276qvd.51.1556524312305; 
 Mon, 29 Apr 2019 00:51:52 -0700 (PDT)
MIME-Version: 1.0
References: <1556119194-10917-1-git-send-email-eajames@linux.ibm.com>
In-Reply-To: <1556119194-10917-1-git-send-email-eajames@linux.ibm.com>
From: Joel Stanley <joel@jms.id.au>
Date: Mon, 29 Apr 2019 07:51:40 +0000
Message-ID: <CACPK8XcncJuMMK-MQuu29dbeZbU57+a84RL+kuN9LkctZpFZfA@mail.gmail.com>
Subject: Re: [PATCH v2 4/4] ARM: dts: aspeed-g5: Add video engine
To: Eddie James <eajames@linux.ibm.com>
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
Cc: Mark Rutland <mark.rutland@arm.com>,
 devicetree <devicetree@vger.kernel.org>, linux-aspeed@lists.ozlabs.org,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, hverkuil@xs4all.nl,
 Rob Herring <robh+dt@kernel.org>, mchehab@kernel.org,
 linux-media@vger.kernel.org
Errors-To: linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org
Sender: "Linux-aspeed"
 <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>

On Wed, 24 Apr 2019 at 15:20, Eddie James <eajames@linux.ibm.com> wrote:
>
> Add a node to describe the video engine on the AST2500.
>
> Signed-off-by: Eddie James <eajames@linux.ibm.com>

Applied to the aspeed SoC tree.

Cheers,

Joel

> ---
>  arch/arm/boot/dts/aspeed-g5.dtsi | 10 ++++++++++
>  1 file changed, 10 insertions(+)
>
> diff --git a/arch/arm/boot/dts/aspeed-g5.dtsi b/arch/arm/boot/dts/aspeed-g5.dtsi
> index 85ed9db..c6d5edc 100644
> --- a/arch/arm/boot/dts/aspeed-g5.dtsi
> +++ b/arch/arm/boot/dts/aspeed-g5.dtsi
> @@ -243,6 +243,16 @@
>                                 status = "disabled";
>                         };
>
> +                       video: video@1e700000 {
> +                               compatible = "aspeed,ast2500-video-engine";
> +                               reg = <0x1e700000 0x1000>;
> +                               clocks = <&syscon ASPEED_CLK_GATE_VCLK>,
> +                                        <&syscon ASPEED_CLK_GATE_ECLK>;
> +                               clock-names = "vclk", "eclk";
> +                               interrupts = <7>;
> +                               status = "disabled";
> +                       };
> +
>                         sram: sram@1e720000 {
>                                 compatible = "mmio-sram";
>                                 reg = <0x1e720000 0x9000>;      // 36K
> --
> 1.8.3.1
>
