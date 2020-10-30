Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 2EA3529FC56
	for <lists+linux-aspeed@lfdr.de>; Fri, 30 Oct 2020 04:56:25 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4CMpQG0ZvdzDqtG
	for <lists+linux-aspeed@lfdr.de>; Fri, 30 Oct 2020 14:56:22 +1100 (AEDT)
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
 header.s=google header.b=jRHMIHN7; dkim-atps=neutral
Received: from mail-qk1-x744.google.com (mail-qk1-x744.google.com
 [IPv6:2607:f8b0:4864:20::744])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4CMpDg6fYQzDqf9
 for <linux-aspeed@lists.ozlabs.org>; Fri, 30 Oct 2020 14:48:03 +1100 (AEDT)
Received: by mail-qk1-x744.google.com with SMTP id k9so3815082qki.6
 for <linux-aspeed@lists.ozlabs.org>; Thu, 29 Oct 2020 20:48:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=jms.id.au; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=IV173zBqFl+Nd3q2klgfVNAcerg3fmVbHR0gIkMTLmQ=;
 b=jRHMIHN7cvodtRtpitWz1f5G94/VR65Hri+wxGanETse+Bq/fYMNmEcGIu4h6d8QIO
 d46EzUegUSyNUJxpCEEBzlpqGWxAwXPP9rpqiYVd5eDJgmVpfdXdX4MRPzHfOTvClHib
 D6O+IYm801uIXGf0zKtPqQSw13XeiwUnDBib8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=IV173zBqFl+Nd3q2klgfVNAcerg3fmVbHR0gIkMTLmQ=;
 b=dGpkSE/0s8RhwO/74hIsxW182t6t4gp4PImFbjBFyjTOj4rUFqNHsUxIdEIc6fcjE/
 c3NyEqI9WKa715T1VLvDP40MXTyUEb1z2WkIlqwBAj9iQ2VrXWOPtP4RkNm6EDNLmlui
 IaGev36tDghQSk4WgtNmyiPdcjQphytUW/mYuVK6lh62Vhu/uOdwLIz74nVn2C6buLjc
 i4MctEQ8xV4EG/N2IJ1jBMBA1EKltbxorb0Okb7SuV5gt09kjESAec192h/w8CU6Kwh6
 ek86b8WTQ/UmP3xiOJ2ih8icSLMTUUGQKajYgYc88RXxE3OH15JL2P5mDKSqwjaGoJ4Q
 Myww==
X-Gm-Message-State: AOAM530JN1Abe2/a29AIlmU8J6clmeUUW2vgmOFwaiceYYHlJ9RzXJiC
 KrIclXlloYiTMGZTPTazqR2T+bviYqIbbPi+Hg0=
X-Google-Smtp-Source: ABdhPJz8dFRcEhMlqq1wlKnf6IBKOhndQxJdT1pNedv0ylUO8Z0m31UekBTKZL0DBjBeNhb37UXzMHszpOp+nnkyREQ=
X-Received: by 2002:ae9:e90d:: with SMTP id x13mr436553qkf.66.1604029678730;
 Thu, 29 Oct 2020 20:47:58 -0700 (PDT)
MIME-Version: 1.0
References: <20201029062723.20798-1-dylan_hung@aspeedtech.com>
In-Reply-To: <20201029062723.20798-1-dylan_hung@aspeedtech.com>
From: Joel Stanley <joel@jms.id.au>
Date: Fri, 30 Oct 2020 03:47:45 +0000
Message-ID: <CACPK8XcJ6oWkj04kb3cjNkYY4q48Vk2p7zitCDp1_Q8etjFb1w@mail.gmail.com>
Subject: Re: [PATCH] ARM: dts: aspeed-g6: Fix HVI3C function-group in pinctrl
 dtsi
To: Dylan Hung <dylan_hung@aspeedtech.com>
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
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Rob Herring <robh+dt@kernel.org>,
 Linux ARM <linux-arm-kernel@lists.infradead.org>
Errors-To: linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org
Sender: "Linux-aspeed"
 <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>

On Thu, 29 Oct 2020 at 06:28, Dylan Hung <dylan_hung@aspeedtech.com> wrote:
>
> The HVI3C shall be a group of I3C function, not an independent function.
> Correct the function name from "HVI3C" to "I3C".
>
> Signed-off-by: Dylan Hung <dylan_hung@aspeedtech.com>

Fixes: f510f04c8c83 ("ARM: dts: aspeed: Add AST2600 pinmux nodes")

I have a few device tree fixes for 5.10 that I will include this in.

Cheers,

Joel

> ---
>  arch/arm/boot/dts/aspeed-g6-pinctrl.dtsi | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
>
> diff --git a/arch/arm/boot/dts/aspeed-g6-pinctrl.dtsi b/arch/arm/boot/dts/aspeed-g6-pinctrl.dtsi
> index 7028e21bdd98..910eacc8ad3b 100644
> --- a/arch/arm/boot/dts/aspeed-g6-pinctrl.dtsi
> +++ b/arch/arm/boot/dts/aspeed-g6-pinctrl.dtsi
> @@ -208,12 +208,12 @@
>         };
>
>         pinctrl_hvi3c3_default: hvi3c3_default {
> -               function = "HVI3C3";
> +               function = "I3C3";
>                 groups = "HVI3C3";
>         };
>
>         pinctrl_hvi3c4_default: hvi3c4_default {
> -               function = "HVI3C4";
> +               function = "I3C4";
>                 groups = "HVI3C4";
>         };
>
> --
> 2.17.1
>
