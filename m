Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id D5B2216FCB2
	for <lists+linux-aspeed@lfdr.de>; Wed, 26 Feb 2020 11:56:26 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 48SCQw1W0RzDqdx
	for <lists+linux-aspeed@lfdr.de>; Wed, 26 Feb 2020 21:56:24 +1100 (AEDT)
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::842;
 helo=mail-qt1-x842.google.com; envelope-from=joel.stan@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=jms.id.au
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 secure) header.d=jms.id.au header.i=@jms.id.au header.a=rsa-sha256
 header.s=google header.b=giOc/T0T; dkim-atps=neutral
Received: from mail-qt1-x842.google.com (mail-qt1-x842.google.com
 [IPv6:2607:f8b0:4864:20::842])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 48SCQn12xMzDqdX
 for <linux-aspeed@lists.ozlabs.org>; Wed, 26 Feb 2020 21:56:14 +1100 (AEDT)
Received: by mail-qt1-x842.google.com with SMTP id p34so1904580qtb.6
 for <linux-aspeed@lists.ozlabs.org>; Wed, 26 Feb 2020 02:56:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=jms.id.au; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=z3j9UKE4CU10RkojeSW3IlQzPeeFXpX/sxvomC4elck=;
 b=giOc/T0TXl+iIxlOUYfUQ+tWKJrb3RxKjhDveWCkvkLIVtnsOdxkcnt0ESXCKSc1TS
 FiRS/OcFWkNbN6ZZbnISyj+Gcaq5JHAlfQbkSUkEMT/fl1OcnIu7vgqbMCuNMug80vmL
 2PWczE+el7IRqrtvshhUbc5PCoiYZhO9GfaNw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=z3j9UKE4CU10RkojeSW3IlQzPeeFXpX/sxvomC4elck=;
 b=lUyCqidnMgJoo+OgLBnSVMoN+XQGGVHa1AESaY/5IDZMQVcERH5FYRHIAx5Q8d8yEi
 LC8/KCDXoueH2U1MRqPkbikqUbRky3uF0vMw71s1HhoEnsg19gnAomV/HZKbETHBrXcw
 blx43ruatnt7MQKDl9crTSrcN8TTCnY8ljeo/5sspBQhgdjT1Rxm5MqnU7Oin1/fC4WM
 R7WeooLQ08pv4vKgFJ7xPOwvSVwHi8zaQ1+Bo2ZPRsfppxmlYF0KF07hD1NnDukselk9
 21ipVmTrhm6sDpUgXcgmU2Fya6JKnDrycCUdlv+XOIzw7XDntmfUk9UUwDW4aXHvVLl5
 FmqA==
X-Gm-Message-State: APjAAAU8TxRYe35NykF0wXYId+NHVDeH6IvE4QFTG7qcXE5aRRyr8TBo
 HuJRKtCPXecTVMCfmaKdQbIZaewlTpYPJh6Vez4=
X-Google-Smtp-Source: APXvYqzIPt5oXV3k/5jmxtXuEfikPuiPbXvjlG9fRqNJ2BaeGuQJX0lMhbp46aXUXmxRSrxBf1S4ddt08lc8oggcF+8=
X-Received: by 2002:ac8:1ac1:: with SMTP id h1mr4525735qtk.255.1582714570954; 
 Wed, 26 Feb 2020 02:56:10 -0800 (PST)
MIME-Version: 1.0
References: <20200220055255.22809-1-Ben_Pai@wistron.com>
In-Reply-To: <20200220055255.22809-1-Ben_Pai@wistron.com>
From: Joel Stanley <joel@jms.id.au>
Date: Wed, 26 Feb 2020 10:55:59 +0000
Message-ID: <CACPK8Xf=t+PY42qxF9jProYGGZZJONb=H1D4xZJc7teFWJ2FrA@mail.gmail.com>
Subject: Re: [PATCH v1] ARM: dts: mihawk: Change the name of mihawk led
To: Ben Pai <Ben_Pai@wistron.com>
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
 devicetree <devicetree@vger.kernel.org>,
 linux-aspeed <linux-aspeed@lists.ozlabs.org>, Claire_Ku@wistron.com,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, wangat@tw.ibm.com,
 Rob Herring <robh+dt@kernel.org>,
 Linux ARM <linux-arm-kernel@lists.infradead.org>
Errors-To: linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org
Sender: "Linux-aspeed"
 <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>

On Thu, 20 Feb 2020 at 05:53, Ben Pai <Ben_Pai@wistron.com> wrote:
>
> 1.Change the name of power, fault and rear-id.
> 2.Remove the two leds.

The patch looks okay. Why do you remove the other two leds?

Reviewed-by: Joel Stanley <joel@jms.id.au>

>
> Signed-off-by: Ben Pai <Ben_Pai@wistron.com>
> ---
>  arch/arm/boot/dts/aspeed-bmc-opp-mihawk.dts | 17 +++--------------
>  1 file changed, 3 insertions(+), 14 deletions(-)
>
> diff --git a/arch/arm/boot/dts/aspeed-bmc-opp-mihawk.dts b/arch/arm/boot/dts/aspeed-bmc-opp-mihawk.dts
> index e55cc454b17f..6c11854b9006 100644
> --- a/arch/arm/boot/dts/aspeed-bmc-opp-mihawk.dts
> +++ b/arch/arm/boot/dts/aspeed-bmc-opp-mihawk.dts
> @@ -120,35 +120,24 @@
>         leds {
>                 compatible = "gpio-leds";
>
> -               fault {
> +               front-fault {
>                         retain-state-shutdown;
>                         default-state = "keep";
>                         gpios = <&gpio ASPEED_GPIO(AA, 0) GPIO_ACTIVE_LOW>;
>                 };
>
> -               power {
> +               power-button {
>                         retain-state-shutdown;
>                         default-state = "keep";
>                         gpios = <&gpio ASPEED_GPIO(AA, 1) GPIO_ACTIVE_LOW>;
>                 };
>
> -               rear-id {
> +               front-id {
>                         retain-state-shutdown;
>                         default-state = "keep";
>                         gpios = <&gpio ASPEED_GPIO(AA, 2) GPIO_ACTIVE_LOW>;
>                 };
>
> -               rear-g {
> -                       retain-state-shutdown;
> -                       default-state = "keep";
> -                       gpios = <&gpio ASPEED_GPIO(AA, 4) GPIO_ACTIVE_LOW>;
> -               };
> -
> -               rear-ok {
> -                       retain-state-shutdown;
> -                       default-state = "keep";
> -                       gpios = <&gpio ASPEED_GPIO(Y, 0) GPIO_ACTIVE_LOW>;
> -               };
>
>                 fan0 {
>                         retain-state-shutdown;
> --
> 2.17.1
>
>
> ---------------------------------------------------------------------------------------------------------------------------------------------------------------
> This email contains confidential or legally privileged information and is for the sole use of its intended recipient.
> Any unauthorized review, use, copying or distribution of this email or the content of this email is strictly prohibited.
> If you are not the intended recipient, you may reply to the sender and should delete this e-mail immediately.
> ---------------------------------------------------------------------------------------------------------------------------------------------------------------
