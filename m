Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id DF9892947AD
	for <lists+linux-aspeed@lfdr.de>; Wed, 21 Oct 2020 07:05:46 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4CGJNS2L3HzDqgb
	for <lists+linux-aspeed@lfdr.de>; Wed, 21 Oct 2020 16:05:44 +1100 (AEDT)
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
 header.s=google header.b=l8CzAUud; dkim-atps=neutral
Received: from mail-qt1-x841.google.com (mail-qt1-x841.google.com
 [IPv6:2607:f8b0:4864:20::841])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4CGJND1VYQzDqVT
 for <linux-aspeed@lists.ozlabs.org>; Wed, 21 Oct 2020 16:05:27 +1100 (AEDT)
Received: by mail-qt1-x841.google.com with SMTP id h12so1140248qtu.1
 for <linux-aspeed@lists.ozlabs.org>; Tue, 20 Oct 2020 22:05:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=jms.id.au; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=78wXEbS6ekdukUkUx63JywMGATdAYjZFw03TanW/IpQ=;
 b=l8CzAUudEDswINpyB+hifa2QzeewX76VbvBA98pOOcnwvHvhw4asi5BgCyGbdOsFZv
 yFeYi9EmGWt4Pmgfp3vT0WScIZbotse9ceH3XBYgqM8NVSVnWLYXgw4DMNaBIXWVF49/
 TH/ETgYtYTxlLaUlXLHyJ8QJlJNp3JP6nEVKI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=78wXEbS6ekdukUkUx63JywMGATdAYjZFw03TanW/IpQ=;
 b=dq3PzXlmVV543HAj+FAuuJWIttC2ux4Z6m22rWQ6wn0jrsY93gi7zm+NCHBwyz+d31
 8XnMLOU5nGWzj5AcBiKIvynszfK7ZpEDgNHQBruUrAaJEjueKx1NOQvPu/jpNQ/x2J27
 GC7ilzvjLdcD3Cj+8e6XI+JulnFspjZozwe9aoynK0GT+B8xYi+LlsrQcbHSttWxTp5D
 /9LQl0bu7lx+0Ec/qaS8Fr3rARaBqgtw2qGfaoWg3L58+QaKEE6EZ3zMlO6cvLGkH5tW
 U8rk/5/rdOrA+WTxuKt1yOwMwVcQBMMcmG10HTk/GPsHlxxQQdmuHxczYzevFHvF76I7
 e2UA==
X-Gm-Message-State: AOAM531zDCpcIIJefWm61JmJERnuYVhMYItIJ2v/Mq8va0C0cDdATrcI
 GM9l0459xP0/B/7IVQG/h6Aq7G9KnysGGex3gGI=
X-Google-Smtp-Source: ABdhPJxYC3k0wPRhs+0XdUEQkPAhu2L6CxPNS4viq8Grxc8wAS+/fGWEFzckw41+y/kZrEgskwke7fKqeZA9N/Y3SEM=
X-Received: by 2002:aed:3325:: with SMTP id u34mr1553632qtd.263.1603256723674; 
 Tue, 20 Oct 2020 22:05:23 -0700 (PDT)
MIME-Version: 1.0
References: <20201016043513.119841-1-andrew@aj.id.au>
 <20201016043513.119841-3-andrew@aj.id.au>
In-Reply-To: <20201016043513.119841-3-andrew@aj.id.au>
From: Joel Stanley <joel@jms.id.au>
Date: Wed, 21 Oct 2020 05:05:11 +0000
Message-ID: <CACPK8XeiPBPyLu5pvjCgYquCKh+PynVKGyibUSAi+W_xw0Awfg@mail.gmail.com>
Subject: Re: [PATCH 2/2] ARM: dts: tacoma: Add reserved memory for ramoops
To: Andrew Jeffery <andrew@aj.id.au>
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
Cc: devicetree <devicetree@vger.kernel.org>, Rob Herring <robh+dt@kernel.org>,
 linux-aspeed <linux-aspeed@lists.ozlabs.org>,
 Linux ARM <linux-arm-kernel@lists.infradead.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Errors-To: linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org
Sender: "Linux-aspeed"
 <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>

On Fri, 16 Oct 2020 at 04:36, Andrew Jeffery <andrew@aj.id.au> wrote:
>
> Reserve a 1.5MiB region of memory to record kmsg dumps, console and
> userspace message state into 16kiB ring-buffer slots. The sizing allows
> for up to 32 dumps to be captured and read out.
>
> Set max-reason to KMSG_DUMP_EMERG to capture bad-path reboots.
>
> Signed-off-by: Andrew Jeffery <andrew@aj.id.au>
> ---
>  arch/arm/boot/dts/aspeed-bmc-opp-tacoma.dts | 9 +++++++++
>  1 file changed, 9 insertions(+)
>
> diff --git a/arch/arm/boot/dts/aspeed-bmc-opp-tacoma.dts b/arch/arm/boot/dts/aspeed-bmc-opp-tacoma.dts
> index 46f2f538baba..4f7e9b490e1a 100644
> --- a/arch/arm/boot/dts/aspeed-bmc-opp-tacoma.dts
> +++ b/arch/arm/boot/dts/aspeed-bmc-opp-tacoma.dts
> @@ -26,6 +26,15 @@ reserved-memory {
>                 #size-cells = <1>;
>                 ranges;
>
> +               ramoops@b9e80000 {
> +                       compatible = "ramoops";
> +                       reg = <0xb9e80000 0x180000>;

I take that r-b back. When booting, we see:

[    0.000000] region@ba000000 (0xb8000000--0xbc000000) overlaps with
ramoops@b9e80000 (0xb9e80000--0xba000000)

Which appears to be a true statement.

> +                       record-size = <0x4000>;
> +                       console-size = <0x4000>;
> +                       pmsg-size = <0x4000>;
> +                       max-reason = <3>; /* KMSG_DUMP_EMERG */
> +               };
> +
>                 flash_memory: region@ba000000 {
>                         no-map;
>                         reg = <0xb8000000 0x4000000>; /* 64M */
> --
> 2.25.1
>
