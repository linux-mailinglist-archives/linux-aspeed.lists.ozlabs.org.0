Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 9D00311FEBA
	for <lists+linux-aspeed@lfdr.de>; Mon, 16 Dec 2019 08:02:03 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 47bsdf0VQpzDqTl
	for <lists+linux-aspeed@lfdr.de>; Mon, 16 Dec 2019 18:01:58 +1100 (AEDT)
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::544;
 helo=mail-pg1-x544.google.com; envelope-from=rentao.bupt@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b="V4YmLffa"; 
 dkim-atps=neutral
Received: from mail-pg1-x544.google.com (mail-pg1-x544.google.com
 [IPv6:2607:f8b0:4864:20::544])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 47bsdN61L7zDqSk
 for <linux-aspeed@lists.ozlabs.org>; Mon, 16 Dec 2019 18:01:44 +1100 (AEDT)
Received: by mail-pg1-x544.google.com with SMTP id s64so3123091pgb.9
 for <linux-aspeed@lists.ozlabs.org>; Sun, 15 Dec 2019 23:01:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to:user-agent;
 bh=QTc3d1HmVPrybJi2/QarMwHVxM3YGV+FrtECoqhlaVM=;
 b=V4YmLffaWP4s+kQ6BJvq6kVT1zDNR+3hMe/lXQaI/CpjA9B/Yi5Fi9/fZNahOPncH5
 PUWVlR8lNtVE70GoY0Nu0MWnUDvbJJcf0KceehFUqHTJTCmItz8Y31gurqLGiRtTCfZi
 3nLA1Q39WIf44c0UDCUciUgPAx6BSvLG3aQ5LHuOiA+rEEHyawtOwHxTt56S4rT7OBjp
 KvYE/SPWlm66nx+6JfpdEPfbLmaHGV3B85WbYoogHYzWh5K4kIXs/2Wz2Ui6nuEIvu6t
 uIHTdgb1CszgVdzkOG1P83gaG90DhxDUIRm06bM2kM9Ihph8eR6EnBqX4T+76jnVE0dd
 y28A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=QTc3d1HmVPrybJi2/QarMwHVxM3YGV+FrtECoqhlaVM=;
 b=hqkJ3er2hd7N7VoRxx3FIJNTjxTR+fDBUiPUylXWpuBU18mXkcK6hsPoa99lOA2xKD
 yMdZqVECO34ZPnpfqNk8J3kIUbSbinwOlxUk1od20IreiSu+WaR77dqH5BqcTOgVDilO
 nKDdQzJ92JPP2MdZAqU3QFNqBoBFYokN+rJf35Ahbe/XPGXdKOtcDmzdI0Yi2GG0b+OT
 uITBlyclUq3ouCCILOK3u/tCSDcofh2ri7tGs860H1AwszU48wua94skhtPqFAxlw3gn
 Fw/NE6cbOhstAcsw09dBg+igMxPx5CXz6KpUWH1kGwXsMJ4Xb2wj3mTKTCQUgKeqA5lE
 WMZA==
X-Gm-Message-State: APjAAAVTc2oAR7ohvV3XJofpLOG3tzLFpyZS/we8neGh37kSA2bqgRww
 mSlaAWvtfp54iq7wEA0ElkE=
X-Google-Smtp-Source: APXvYqw1S8NeDvux5szO7FbOa9ytvis7sjbDjIn33rJHA9DmPrfRgaJxVhOZcjtvgNbB7S9x0NioTA==
X-Received: by 2002:a63:6946:: with SMTP id e67mr11257641pgc.181.1576479700620; 
 Sun, 15 Dec 2019 23:01:40 -0800 (PST)
Received: from taoren-ubuntu-R90MNF91 (c-24-4-25-55.hsd1.ca.comcast.net.
 [24.4.25.55])
 by smtp.gmail.com with ESMTPSA id 78sm19949249pfu.65.2019.12.15.23.01.39
 (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
 Sun, 15 Dec 2019 23:01:40 -0800 (PST)
Date: Sun, 15 Dec 2019 23:01:32 -0800
From: Tao Ren <rentao.bupt@gmail.com>
To: Joel Stanley <joel@jms.id.au>
Subject: Re: [PATCH] ARM: dts: aspeed: AST2400 disables hw checksum
Message-ID: <20191216070131.GA11755@taoren-ubuntu-R90MNF91>
References: <20191216064132.78015-1-joel@jms.id.au>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20191216064132.78015-1-joel@jms.id.au>
User-Agent: Mutt/1.9.4 (2018-02-28)
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
Cc: Alexander Filippov <a.filippov@yadro.com>, linux-aspeed@lists.ozlabs.org,
 linux-arm-kernel@lists.infradead.org
Errors-To: linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org
Sender: "Linux-aspeed"
 <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>

On Mon, Dec 16, 2019 at 05:41:32PM +1100, Joel Stanley wrote:
> There is no need to specify this property in the device tree as the
> AST2400 does not have working hardware checksum and disables it in the
> driver.
> 
> Signed-off-by: Joel Stanley <joel@jms.id.au>
> ---
>  arch/arm/boot/dts/aspeed-bmc-facebook-wedge100.dts | 1 -
>  arch/arm/boot/dts/aspeed-bmc-facebook-wedge40.dts  | 1 -
>  arch/arm/boot/dts/aspeed-bmc-opp-vesnin.dts        | 3 ---
>  3 files changed, 5 deletions(-)
> 
> diff --git a/arch/arm/boot/dts/aspeed-bmc-facebook-wedge100.dts b/arch/arm/boot/dts/aspeed-bmc-facebook-wedge100.dts
> index b1e10f0c85c9..322587b7b67d 100644
> --- a/arch/arm/boot/dts/aspeed-bmc-facebook-wedge100.dts
> +++ b/arch/arm/boot/dts/aspeed-bmc-facebook-wedge100.dts
> @@ -76,7 +76,6 @@ &uart5 {
>  
>  &mac1 {
>  	status = "okay";
> -	no-hw-checksum;
>  	pinctrl-names = "default";
>  	pinctrl-0 = <&pinctrl_rgmii2_default &pinctrl_mdio2_default>;
>  };
> diff --git a/arch/arm/boot/dts/aspeed-bmc-facebook-wedge40.dts b/arch/arm/boot/dts/aspeed-bmc-facebook-wedge40.dts
> index aaa77a597d1a..54e508530dce 100644
> --- a/arch/arm/boot/dts/aspeed-bmc-facebook-wedge40.dts
> +++ b/arch/arm/boot/dts/aspeed-bmc-facebook-wedge40.dts
> @@ -75,7 +75,6 @@ &uart5 {
>  
>  &mac1 {
>  	status = "okay";
> -	no-hw-checksum;
>  	pinctrl-names = "default";
>  	pinctrl-0 = <&pinctrl_rgmii2_default &pinctrl_mdio2_default>;
>  };
> diff --git a/arch/arm/boot/dts/aspeed-bmc-opp-vesnin.dts b/arch/arm/boot/dts/aspeed-bmc-opp-vesnin.dts
> index affd2c8743b1..041f28e3ac10 100644
> --- a/arch/arm/boot/dts/aspeed-bmc-opp-vesnin.dts
> +++ b/arch/arm/boot/dts/aspeed-bmc-opp-vesnin.dts
> @@ -107,10 +107,7 @@ flash@0 {
>  
>  &mac0 {
>  	status = "okay";
> -
>  	use-ncsi;
> -	no-hw-checksum;
> -
>  	pinctrl-names = "default";
>  	pinctrl-0 = <&pinctrl_rmii1_default>;
>  };
> -- 
> 2.24.0

Thanks for the fix, Joel. I totally forget I added the property in
ast2400 dts.

Reviewed-by: Tao Ren <rentao.bupt@gmail.com>
