Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 39A384DD667
	for <lists+linux-aspeed@lfdr.de>; Fri, 18 Mar 2022 09:46:52 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4KKd0p0NPRz30NW
	for <lists+linux-aspeed@lfdr.de>; Fri, 18 Mar 2022 19:46:50 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (1024-bit key; secure) header.d=jms.id.au header.i=@jms.id.au header.a=rsa-sha256 header.s=google header.b=Z5aK/m5h;
	dkim-atps=neutral
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::836;
 helo=mail-qt1-x836.google.com; envelope-from=joel.stan@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 secure) header.d=jms.id.au header.i=@jms.id.au header.a=rsa-sha256
 header.s=google header.b=Z5aK/m5h; dkim-atps=neutral
Received: from mail-qt1-x836.google.com (mail-qt1-x836.google.com
 [IPv6:2607:f8b0:4864:20::836])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4KKd0h3JJQz2yyf
 for <linux-aspeed@lists.ozlabs.org>; Fri, 18 Mar 2022 19:46:43 +1100 (AEDT)
Received: by mail-qt1-x836.google.com with SMTP id i8so6367364qtx.6
 for <linux-aspeed@lists.ozlabs.org>; Fri, 18 Mar 2022 01:46:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=jms.id.au; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=HX28KG1ETTyJqfzKGPZZd77iKDoX+t1pmuXVdkh9BBc=;
 b=Z5aK/m5hJp461lI1t0YTLkryZtCz8/3HW4RW38wNu7h2EGUqR5UuMrj7IZGKTu0qKc
 xqozWfz6HUk279WPyFj16B30DdNahbNTYWsIbBSEex9sA3PsaUSBV+ktq32E+IVv++KN
 JVM+hWttBMY+pzT/KNggcxpvmXVD20QHebxdo=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=HX28KG1ETTyJqfzKGPZZd77iKDoX+t1pmuXVdkh9BBc=;
 b=Go4tbHGgJdUr93Wd+R2WjxUPs9K2NNvb0GzuzruFCIwC9e3QWEQdRNbJTPTRmRVBZ0
 YlXbAj+e1KLKa9Q89RV96saflS12omrml+83C9VVHnyTK9ULY05TWkFOxpoN/mQpUImX
 lr0jCUmu/N404q07X+bk+0/A7j8dDsGr1FGMOJE3OEXaEUWWQw1iei6HG4aZkP9ldmBW
 0lpPrmB2tV3zWxkzxpsHIlKAu6mxNKhSdyJkmI6sV0G8ZuH6tYOuhTPf9+VeMwRyK7W9
 fB8VRoG//aVfFyt+JqhFnqHrAwpGCmMP8TPBxtaKdLOSdoRAEDGjMUKTwurTLojzuP/u
 9aFA==
X-Gm-Message-State: AOAM533kKeCmh8kUFrXk2BAu5lfLfgo6dlF/FWdebZfc3HTfJgVzreu9
 R8p+XMTDKEcEFTMR/YIVoKD1uYpjJ6FTFmiXyUIR4p/60fo=
X-Google-Smtp-Source: ABdhPJwbpE/yU8SuU3bVcc+6HfWkUhrdPIgYdcuCEFhWvubB6MvFcV8t9gzlh4c9xyYxHO1Eosyq9q6syDlj8eCbRI4=
X-Received: by 2002:a05:622a:14c8:b0:2e1:d626:66ea with SMTP id
 u8-20020a05622a14c800b002e1d62666eamr6640121qtx.58.1647593200510; Fri, 18 Mar
 2022 01:46:40 -0700 (PDT)
MIME-Version: 1.0
References: <SG2PR06MB2315A7BAE2F1B384CDADB57FE6139@SG2PR06MB2315.apcprd06.prod.outlook.com>
In-Reply-To: <SG2PR06MB2315A7BAE2F1B384CDADB57FE6139@SG2PR06MB2315.apcprd06.prod.outlook.com>
From: Joel Stanley <joel@jms.id.au>
Date: Fri, 18 Mar 2022 08:46:28 +0000
Message-ID: <CACPK8XdYHb-PgVVQuTtMBokxu4GTObG7nCohm4dosK9XWzE9ow@mail.gmail.com>
Subject: Re: [PATCH v1] ARM: dts: aspeed: ast2600-evb: Enable RX delay for
 MAC0/MAC1
To: Howard Chiu <howard_chiu@aspeedtech.com>
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
Cc: "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
 "linux-aspeed@lists.ozlabs.org" <linux-aspeed@lists.ozlabs.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "robh+dt@kernel.org" <robh+dt@kernel.org>,
 "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>
Errors-To: linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org
Sender: "Linux-aspeed"
 <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>

Hi Howard,

On Fri, 18 Mar 2022 at 08:09, Howard Chiu <howard_chiu@aspeedtech.com> wrote:
>
> Since mac0/1 and mac2/3 are physically located on different die,
> they have different properties by nature, which is mac0/1 has smaller delay step.
>
> The property 'phy-mode' on ast2600 mac0 and mac1 is recommended to set to 'rgmii-rxid'
> which enables the RX interface delay from the PHY chip.
> Refer page 45 of SDK User Guide v08.00
> https://github.com/AspeedTech-BMC/openbmc/releases/download/v08.00/SDK_User_Guide_v08.00.pdf
>
> Set mac delay according to the mactest result.

This bit confused me. How does the rxid relate to the mac delay
numbers? Which device and code is responsible for using them?

>
> Signed-off-by: Howard Chiu <howard_chiu@aspeedtech.com>
> ---
>  arch/arm/boot/dts/aspeed-ast2600-evb.dts | 19 +++++++++++++++++--
>  1 file changed, 17 insertions(+), 2 deletions(-)
>
> diff --git a/arch/arm/boot/dts/aspeed-ast2600-evb.dts b/arch/arm/boot/dts/aspeed-ast2600-evb.dts
> index b7eb552640cb..db16ba307e97 100644
> --- a/arch/arm/boot/dts/aspeed-ast2600-evb.dts
> +++ b/arch/arm/boot/dts/aspeed-ast2600-evb.dts
> @@ -103,7 +103,7 @@ ethphy3: ethernet-phy@0 {
>  &mac0 {
>         status = "okay";
>
> -       phy-mode = "rgmii";
> +       phy-mode = "rgmii-rxid";
>         phy-handle = <&ethphy0>;
>
>         pinctrl-names = "default";
> @@ -114,7 +114,7 @@ &mac0 {
>  &mac1 {
>         status = "okay";
>
> -       phy-mode = "rgmii";
> +       phy-mode = "rgmii-rxid";
>         phy-handle = <&ethphy1>;
>
>         pinctrl-names = "default";
> @@ -141,6 +141,21 @@ &mac3 {
>         pinctrl-0 = <&pinctrl_rgmii4_default>;
>  };
>
> +&syscon {
> +       mac0-clk-delay = <0x10 0x0a
> +                         0x10 0x10
> +                         0x10 0x10>;

These properties aren't supported by the mainline kernel. Do you have
some code coming for that support?

> +       mac1-clk-delay = <0x10 0x0a
> +                         0x10 0x10
> +                         0x10 0x10>;
> +       mac2-clk-delay = <0x08 0x04
> +                         0x08 0x04
> +                         0x08 0x04>;
> +       mac3-clk-delay = <0x08 0x04
> +                         0x08 0x04
> +                         0x08 0x04>;
> +};
> +
>  &emmc_controller {
>         status = "okay";
>  };
> --
> 2.25.1
>
