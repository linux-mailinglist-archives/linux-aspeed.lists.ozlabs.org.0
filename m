Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 61466263B4C
	for <lists+linux-aspeed@lfdr.de>; Thu, 10 Sep 2020 05:20:02 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Bn3zM2hnwzDqZq
	for <lists+linux-aspeed@lfdr.de>; Thu, 10 Sep 2020 13:19:59 +1000 (AEST)
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2a00:1450:4864:20::542;
 helo=mail-ed1-x542.google.com; envelope-from=joel.stan@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=jms.id.au
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 secure) header.d=jms.id.au header.i=@jms.id.au header.a=rsa-sha256
 header.s=google header.b=Rgq9EPWW; dkim-atps=neutral
Received: from mail-ed1-x542.google.com (mail-ed1-x542.google.com
 [IPv6:2a00:1450:4864:20::542])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4Bn3zC5twbzDqYb
 for <linux-aspeed@lists.ozlabs.org>; Thu, 10 Sep 2020 13:19:50 +1000 (AEST)
Received: by mail-ed1-x542.google.com with SMTP id w1so4805253edr.3
 for <linux-aspeed@lists.ozlabs.org>; Wed, 09 Sep 2020 20:19:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=jms.id.au; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=EYnG8g1OXjCEZvsNS7qUv8EcZAN6EKkdlhqeP9kn+nY=;
 b=Rgq9EPWWGYiqY2DdgSyemU/sJRKCmZz0UNbwdRAGZUWF7DhqPv+cj2ifMs75KMOUdD
 Q4wAgKHTZJq0763WeDwq45zmTDP50AJpLLBiqwa6Mp/n11La+rwXwqPpddRTxjsNaidZ
 90aIPmV2siYV1gMpuKSAhznKUhi5e4al81epQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=EYnG8g1OXjCEZvsNS7qUv8EcZAN6EKkdlhqeP9kn+nY=;
 b=uMuGFE+2KFNM262qr3MUFRlx2ElZIbyGlUsU285/eEgNv6fBnnM8bPvnkb0CPl94FH
 YtnPgfXNaK+Uqg1+4rpWMQx3GxaWVXs0vOKio3UwkiJC2Lzyr5MiWbKvY8Q5gi2HngeP
 BPBn9xNSPsRPcZ9A5on6HPkeiucF4bMLwfSfMh0cNTZJ8swhTpXQrdtwZqYbXrbNe00s
 6b/P88bjYiJjjBjhYlR7WJYy5wPA+03lQPHhv69hvvNpE3wgtwW5sHQAk3v101rWrGyM
 k/mZnb/faKLZYfIzQhggENOrlj5F12GC2HD6MB12RKKjScoxloPYLgC7Lj7nLHQq9iaE
 hFXA==
X-Gm-Message-State: AOAM532W0KD/6ARLVULPSvmehU8zJ82+P1WsGJuw6NPvBeooI0a6KBdk
 fN45SfMRfSpWR2xbf7F0TuEq7arKlW+CN4IhVXQ=
X-Google-Smtp-Source: ABdhPJztvH21yX503RRfEKAijGeEVGzRJ2v0afoEPzzI9wed+4D7RjfpT7KicJHk4K8nd6aXIBoWTv2Yk6P1EFWq/Sc=
X-Received: by 2002:aa7:c38a:: with SMTP id k10mr7407719edq.325.1599707988052; 
 Wed, 09 Sep 2020 20:19:48 -0700 (PDT)
MIME-Version: 1.0
References: <20200910031143.2997298-1-andrew@aj.id.au>
In-Reply-To: <20200910031143.2997298-1-andrew@aj.id.au>
From: Joel Stanley <joel@jms.id.au>
Date: Thu, 10 Sep 2020 03:19:34 +0000
Message-ID: <CACPK8XeZe2n_a56LGJ16VswvPwRu7jWcSCTH+3grJ5zY9Wq38g@mail.gmail.com>
Subject: Re: [PATCH] ARM: dts: rainier: Disable internal pull-downs on eMMC
 pins
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

On Thu, 10 Sep 2020 at 03:12, Andrew Jeffery <andrew@aj.id.au> wrote:
>
> There's a veritable tug-of-war going on in the design, so disable one of
> the warring parties.
>
> Signed-off-by: Andrew Jeffery <andrew@aj.id.au>

Applied to the aspeed tree for 5.10.

Cheers,

Joel

> ---
>  arch/arm/boot/dts/aspeed-bmc-ibm-rainier.dts | 4 ++++
>  1 file changed, 4 insertions(+)
>
> diff --git a/arch/arm/boot/dts/aspeed-bmc-ibm-rainier.dts b/arch/arm/boot/dts/aspeed-bmc-ibm-rainier.dts
> index 1fa233d2da26..21ae880c7530 100644
> --- a/arch/arm/boot/dts/aspeed-bmc-ibm-rainier.dts
> +++ b/arch/arm/boot/dts/aspeed-bmc-ibm-rainier.dts
> @@ -180,6 +180,10 @@ &emmc_controller {
>         status = "okay";
>  };
>
> +&pinctrl_emmc_default {
> +       bias-disable;
> +};
> +
>  &emmc {
>         status = "okay";
>  };
> --
> 2.25.1
>
