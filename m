Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 3207C151592
	for <lists+linux-aspeed@lfdr.de>; Tue,  4 Feb 2020 06:55:15 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 48BYnW1y0zzDqNX
	for <lists+linux-aspeed@lfdr.de>; Tue,  4 Feb 2020 16:55:11 +1100 (AEDT)
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::744;
 helo=mail-qk1-x744.google.com; envelope-from=joel.stan@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=jms.id.au
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 secure) header.d=jms.id.au header.i=@jms.id.au header.a=rsa-sha256
 header.s=google header.b=iVIquOkE; dkim-atps=neutral
Received: from mail-qk1-x744.google.com (mail-qk1-x744.google.com
 [IPv6:2607:f8b0:4864:20::744])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 48BYnL5FhBzDqBx
 for <linux-aspeed@lists.ozlabs.org>; Tue,  4 Feb 2020 16:55:00 +1100 (AEDT)
Received: by mail-qk1-x744.google.com with SMTP id k6so16816709qki.5
 for <linux-aspeed@lists.ozlabs.org>; Mon, 03 Feb 2020 21:55:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=jms.id.au; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=p7n4zoUIIiZA2ALJJ4mJ57lt2Tcsn0/OESnXuVktsWY=;
 b=iVIquOkE279Q+7leFvYOkIFSqSRBJPoOawRF8kQpKRY1g1IVeYzB53msqcbdBWFHuk
 2VKjw/GtlEhJxzocBgubpF/H/yMargA5Txm2lTb8KCXoviEE+uJp3lC4f+4eqacg0pDq
 NKAdbraEwRWewqIh8YdXUBf/heEP4vlAfXjac=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=p7n4zoUIIiZA2ALJJ4mJ57lt2Tcsn0/OESnXuVktsWY=;
 b=p3Go3wiGYhobb+UkIhxzJpxi93+q0tTTRahNBMMMqy+7uNjRA1vdlo/E8NgE/+XFh3
 QN4Ts8cE22rxVhlpMOZNdesXZqJIntsMol1tWeV0zVrj7Jx/RgBnEfeJ+cnIu8jaU2Z+
 Pb7NrXk6YESRv3DLmed4Ehjt5F9da2iZp0xkH0y0xdLZ9YT/H+v8EzwQ8xEG8pQHI8O8
 kCsqO5Kt1E3p94pNdMg+/HD+8aaUqrimEdPE5ZvBJDadqFb775n7OEdfKhc9a0HeZm1Q
 t3mCGN0uIcvatNkb4efwUysfY/ZUbvr4VgebiXhu6n2buc91ZrtRcc3F0spGztJjs24n
 oLSg==
X-Gm-Message-State: APjAAAUeF0V5wMJll4xlcLQ1C2P2Mz23oaHn35z1g95k1SVXyGl7YBto
 FLdZ61c1px855JjoqAHqJ4h7SBgawcSKStEs2mo=
X-Google-Smtp-Source: APXvYqzF7uxnpiHtFepL2gYUO8yy3dYQIdv2llaISfPr13fI0OQDLILTDeVHgt8XFYYHzXLAZwTJy/dPVgzXJUE43Ec=
X-Received: by 2002:ae9:e702:: with SMTP id m2mr26659032qka.208.1580795697026; 
 Mon, 03 Feb 2020 21:54:57 -0800 (PST)
MIME-Version: 1.0
References: <20200202163939.13326-1-linux@roeck-us.net>
In-Reply-To: <20200202163939.13326-1-linux@roeck-us.net>
From: Joel Stanley <joel@jms.id.au>
Date: Tue, 4 Feb 2020 05:54:44 +0000
Message-ID: <CACPK8XeLWZT-VvuErtz6oE1tv1dhwwOnpZbV7PVr2PxgT2fopA@mail.gmail.com>
Subject: Re: [PATCH] ARM: dts: aspeed: tacoma: Enable eMMC controller
To: Guenter Roeck <linux@roeck-us.net>
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
 linux-aspeed <linux-aspeed@lists.ozlabs.org>,
 Linux ARM <linux-arm-kernel@lists.infradead.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Errors-To: linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org
Sender: "Linux-aspeed"
 <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>

On Sun, 2 Feb 2020 at 16:39, Guenter Roeck <linux@roeck-us.net> wrote:
>
> Enabling emmc without enabling its controller doesn't do any good.
> Enable its controller as well to make it work.
>
> Cc: Andrew Jeffery <andrew@aj.id.au>
> Cc: Joel Stanley <joel@jms.id.au>
> Signed-off-by: Guenter Roeck <linux@roeck-us.net>

Thanks Guenter. The description in aspeed-g6.dtsi changed at some
point and Tacoma was not updated.

> ---
>  arch/arm/boot/dts/aspeed-bmc-opp-tacoma.dts | 4 ++++
>  1 file changed, 4 insertions(+)
>
> diff --git a/arch/arm/boot/dts/aspeed-bmc-opp-tacoma.dts b/arch/arm/boot/dts/aspeed-bmc-opp-tacoma.dts
> index ff49ec76fa7c..47293a5e0c59 100644
> --- a/arch/arm/boot/dts/aspeed-bmc-opp-tacoma.dts
> +++ b/arch/arm/boot/dts/aspeed-bmc-opp-tacoma.dts
> @@ -132,6 +132,10 @@
>         use-ncsi;
>  };
>
> +&emmc_controller {
> +       status = "okay";
> +};
> +
>  &emmc {
>         status = "okay";
>  };

This node is redundant, as it is not disabled in the dtsi.

Andrew, should we add disabled to the emmc node?

Or remove the label completely, and just have emmc_controller?

Cheers,

Joel

> --
> 2.17.1
>
