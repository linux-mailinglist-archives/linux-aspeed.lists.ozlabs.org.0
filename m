Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 2F1A3672B6E
	for <lists+linux-aspeed@lfdr.de>; Wed, 18 Jan 2023 23:44:59 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Ny16c3YWnz3cfK
	for <lists+linux-aspeed@lfdr.de>; Thu, 19 Jan 2023 09:44:56 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (1024-bit key; secure) header.d=jms.id.au header.i=@jms.id.au header.a=rsa-sha256 header.s=google header.b=loLOq4wY;
	dkim-atps=neutral
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2a00:1450:4864:20::632; helo=mail-ej1-x632.google.com; envelope-from=joel.stan@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; secure) header.d=jms.id.au header.i=@jms.id.au header.a=rsa-sha256 header.s=google header.b=loLOq4wY;
	dkim-atps=neutral
Received: from mail-ej1-x632.google.com (mail-ej1-x632.google.com [IPv6:2a00:1450:4864:20::632])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Ny16R6msRz3bcw
	for <linux-aspeed@lists.ozlabs.org>; Thu, 19 Jan 2023 09:44:47 +1100 (AEDT)
Received: by mail-ej1-x632.google.com with SMTP id hw16so1063983ejc.10
        for <linux-aspeed@lists.ozlabs.org>; Wed, 18 Jan 2023 14:44:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=jms.id.au; s=google;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=5rDVfmGaTHq7SddtJNWhZM8yAn31bV4+g6pAERHOpLg=;
        b=loLOq4wYdeeCrYxIj7EUgXtnLj1TNav8NpjXyEPBSllezfA0igfvQj1eoLL1+bLNH+
         wU1YQpXqxikSAjwD4urWorUYTDg6wplMfFVQn61BLel4F79Xhm5agvj+ya2rc/K94vdv
         LlVlQtou3hPA7WpYBpFSIXFhVj8UxSajSA8eY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=5rDVfmGaTHq7SddtJNWhZM8yAn31bV4+g6pAERHOpLg=;
        b=7UvXU4nDM0iV/CD7w7CEQkxD6ht/WXC5hztVIVB9mQJaCYbYTyjOBT9Z5b0cydFPm2
         m+ZSTXptugBJ8yTNwBDvFRgm72FKkVJgdEqESdtz//AcvS7k0CrCqhTgJ5UAWqa/6aFv
         HQ9/gutnoKgn983WZ36KT9DWTkaymFVvNXRFkDfkLPT8OR1KL0AkebkxewVLvI7RO84L
         wrCC99S3GSjpOvgdUqVjPaj2w/u0Hp5ERTcy7ReG3Ge23Yjf1Fvjv4cISO3Y7XBK3Yrr
         Gykpr3ixFiwv8FBFg8SoI3aU2pt9iZdgwEQ66m7vgJoK0hwHPGICSBwEzSKpKAZ0DdfC
         czUQ==
X-Gm-Message-State: AFqh2koQtEiOBb8/hf3vQ4TxMhbyLDzOgvE6fYyjBhium2J9nTUziuoF
	B7lUxBYwXH18svOAp1OxSrK/MyDEIrv2JO5llcA=
X-Google-Smtp-Source: AMrXdXuuvLFNYm7lHWC2rdR13oc2fxERzfgrom2b9EwLGCHFygtP/ioTmhiGnTiBauTyAzigAvc19/AK3d7UvVu5/tc=
X-Received: by 2002:a17:906:9394:b0:7c4:efcf:3bc8 with SMTP id
 l20-20020a170906939400b007c4efcf3bc8mr1125299ejx.702.1674081879203; Wed, 18
 Jan 2023 14:44:39 -0800 (PST)
MIME-Version: 1.0
References: <20230118150030.2079226-1-aaelhaj@google.com>
In-Reply-To: <20230118150030.2079226-1-aaelhaj@google.com>
From: Joel Stanley <joel@jms.id.au>
Date: Wed, 18 Jan 2023 22:44:27 +0000
Message-ID: <CACPK8XeAX8de_J7px2R2Bc0V7m7hMgGEfB1xpkwFKDzDDr73Og@mail.gmail.com>
Subject: Re: [PATCH] arm: dts: aspeed: tyan s8036: enable kcs interrupts.
To: Ali El-Haj-Mahmoud <aaelhaj@google.com>
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
Cc: devicetree@vger.kernel.org, linux-aspeed@lists.ozlabs.org, linux-kernel@vger.kernel.org, Rob Herring <robh+dt@kernel.org>, osk@google.com, linux-arm-kernel@lists.infradead.org
Errors-To: linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org
Sender: "Linux-aspeed" <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>

On Wed, 18 Jan 2023 at 15:00, Ali El-Haj-Mahmoud <aaelhaj@google.com> wrote:
>
> When the BIOS is built with kcs interrupts enabled, not enabling
> interrupts on the BMC results in very poor IPMI performance.
> The other way around (BIOS with interrupts disabled, BMC with
> interrupts enabled) doesn't suffer degraded IPMI performance.
> Enabling interrupts on the BMC covers both scenarios, and should
> be the default.
>
> TESTED: manually verified IPMI performance when BIOS is built with and
> without KCS interrupts.
>
> Signed-off-by: Ali El-Haj-Mahmoud <aaelhaj@google.com>

Thanks, I've applied this for 6.3.

> ---
>  arch/arm/boot/dts/aspeed-bmc-tyan-s8036.dts | 1 +
>  1 file changed, 1 insertion(+)
>
> diff --git a/arch/arm/boot/dts/aspeed-bmc-tyan-s8036.dts b/arch/arm/boot/dts/aspeed-bmc-tyan-s8036.dts
> index 708ee78e4b83..f6c4549c0ac4 100644
> --- a/arch/arm/boot/dts/aspeed-bmc-tyan-s8036.dts
> +++ b/arch/arm/boot/dts/aspeed-bmc-tyan-s8036.dts
> @@ -364,6 +364,7 @@ &kcs1 {
>  &kcs3 {
>         status = "okay";
>         aspeed,lpc-io-reg = <0xca2>;
> +       aspeed,lpc-interrupts = <1 IRQ_TYPE_LEVEL_HIGH>;
>  };
>
>  /* Enable BMC VGA output to show an early (pre-BIOS) boot screen */
> --
> 2.39.0.314.g84b9a713c41-goog
>
