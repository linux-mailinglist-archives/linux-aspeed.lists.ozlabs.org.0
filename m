Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 20AF529CE42
	for <lists+linux-aspeed@lfdr.de>; Wed, 28 Oct 2020 06:51:50 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4CLd4M2qWVzDqRx
	for <lists+linux-aspeed@lfdr.de>; Wed, 28 Oct 2020 16:51:47 +1100 (AEDT)
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::f44;
 helo=mail-qv1-xf44.google.com; envelope-from=joel.stan@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=jms.id.au
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 secure) header.d=jms.id.au header.i=@jms.id.au header.a=rsa-sha256
 header.s=google header.b=biVOtvTo; dkim-atps=neutral
Received: from mail-qv1-xf44.google.com (mail-qv1-xf44.google.com
 [IPv6:2607:f8b0:4864:20::f44])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4CLd460DFwzDqQb
 for <linux-aspeed@lists.ozlabs.org>; Wed, 28 Oct 2020 16:51:32 +1100 (AEDT)
Received: by mail-qv1-xf44.google.com with SMTP id ev17so1892541qvb.3
 for <linux-aspeed@lists.ozlabs.org>; Tue, 27 Oct 2020 22:51:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=jms.id.au; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=ivptHxxQhftHgyoBzLoIivjVLdMVeUmQUQiYI90DY+k=;
 b=biVOtvTokelVcCYqBuxSpR4GEAyHBNOu0e3ai67moGQ9PUqXQevbeTP3EQPSG5t4KW
 QZknf92weGjcRgtNPppIp0IuBbGJT0auk9/z8an/ktFUVl5poSQcNRqQGTfU5RymYBXI
 cjcpWHGyWAcfs8YWA94JxMHzkwtQVK8EGtJO4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=ivptHxxQhftHgyoBzLoIivjVLdMVeUmQUQiYI90DY+k=;
 b=tPegHCBV2T16hiH67wWy2AFo5pbGCXfBA+40jjMzfCMZlzxfHX7PxJc5vp9btFAorA
 Q196mUW8EuM95uIfQuBW7l4z325xcblr1ZolzhCl9H3x+A1KKtWhVgu0v5zIHgHCOXwU
 I1I+t1KQ6uaQBPbVc/9F2Q+VF1ICjbW2ql0q7l1eObxaapq9JAmTm4RYLdi/3sxTgSAj
 rELRhyMR7THkydoy2HSfy6ZSmGwdjQXUvFA+RMFaNXUNPrYVbAM9PyjM3nnFeLEiOoii
 iQ4e/xZAwFxll8Ob5R9J7tTRdOrsj9Ht3rqkDE/bcbNTnzepS1PD5km7R/CEQwi2yfFT
 1wiw==
X-Gm-Message-State: AOAM532+kcP0DOXUejq8X27NBcO4LzWMXx9xjJTh2wGbzCRILMvGnGoH
 QErZGLLGSMCmPf4JQe1KW20iMKwmcqlST4FMDzI=
X-Google-Smtp-Source: ABdhPJwfM53L1Vb7cSSiirBROWiocUW53ldFjVcK9HndOxN7DEYxwB9J1EA2AvJCwIOcJ/HXlPMyDr7Y12nKd1fMQt8=
X-Received: by 2002:a05:6214:11e4:: with SMTP id
 e4mr5659435qvu.61.1603864289957; 
 Tue, 27 Oct 2020 22:51:29 -0700 (PDT)
MIME-Version: 1.0
References: <20200930192507.27847-1-fercerpav@gmail.com>
In-Reply-To: <20200930192507.27847-1-fercerpav@gmail.com>
From: Joel Stanley <joel@jms.id.au>
Date: Wed, 28 Oct 2020 05:51:18 +0000
Message-ID: <CACPK8XdMXBUYZxYnvLeZ1V=mT6=uMhy6rNZ9dsksw0_yf6obeA@mail.gmail.com>
Subject: Re: [PATCH] arm: dts: aspeed-bmc-tiogapass: enable second MAC
To: Paul Fertser <fercerpav@gmail.com>, Vijay Khemka <vijaykhemka@fb.com>
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
Cc: Linux ARM <linux-arm-kernel@lists.infradead.org>,
 linux-aspeed <linux-aspeed@lists.ozlabs.org>
Errors-To: linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org
Sender: "Linux-aspeed"
 <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>

On Wed, 30 Sep 2020 at 19:27, Paul Fertser <fercerpav@gmail.com> wrote:
>
> Tioga Pass reference design includes Intel I210 Ethernet controller
> connected to the BMC with NC/SI.
>
> MAC readout is not supported.
>
> Signed-off-by: Paul Fertser <fercerpav@gmail.com>

Vijay, can I get a review from you on this one please?

> ---
>  arch/arm/boot/dts/aspeed-bmc-facebook-tiogapass.dts | 8 ++++++++
>  1 file changed, 8 insertions(+)
>
> diff --git a/arch/arm/boot/dts/aspeed-bmc-facebook-tiogapass.dts b/arch/arm/boot/dts/aspeed-bmc-facebook-tiogapass.dts
> index 2d44d9ad4e40..b2ba798bf3c4 100644
> --- a/arch/arm/boot/dts/aspeed-bmc-facebook-tiogapass.dts
> +++ b/arch/arm/boot/dts/aspeed-bmc-facebook-tiogapass.dts
> @@ -196,6 +196,14 @@
>         use-ncsi;
>  };
>
> +&mac1 {
> +       status = "okay";
> +
> +       pinctrl-names = "default";
> +       pinctrl-0 = <&pinctrl_rmii2_default>;
> +       use-ncsi;
> +};
> +
>  &adc {
>         status = "okay";
>  };
> --
> 2.17.1
>
