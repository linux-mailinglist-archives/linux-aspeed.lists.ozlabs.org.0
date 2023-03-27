Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 0734A6C9913
	for <lists+linux-aspeed@lfdr.de>; Mon, 27 Mar 2023 02:47:09 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4PlDfX2Yp2z3cdD
	for <lists+linux-aspeed@lfdr.de>; Mon, 27 Mar 2023 11:47:00 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (1024-bit key; secure) header.d=jms.id.au header.i=@jms.id.au header.a=rsa-sha256 header.s=google header.b=JtsN+5D9;
	dkim-atps=neutral
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2a00:1450:4864:20::530; helo=mail-ed1-x530.google.com; envelope-from=joel.stan@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; secure) header.d=jms.id.au header.i=@jms.id.au header.a=rsa-sha256 header.s=google header.b=JtsN+5D9;
	dkim-atps=neutral
Received: from mail-ed1-x530.google.com (mail-ed1-x530.google.com [IPv6:2a00:1450:4864:20::530])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4PlDfM5Qjhz3brQ
	for <linux-aspeed@lists.ozlabs.org>; Mon, 27 Mar 2023 11:46:50 +1100 (AEDT)
Received: by mail-ed1-x530.google.com with SMTP id b20so29387052edd.1
        for <linux-aspeed@lists.ozlabs.org>; Sun, 26 Mar 2023 17:46:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=jms.id.au; s=google; t=1679878006;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=iwNKwWEmP0+GBVy7Aoyp0/jnxyDCmqGAIfdYaEYV01Q=;
        b=JtsN+5D9e8csHqSMHYvyo6EvP2mKy0R29zsl3MPx8eDxeScV0UoljmM81XYMTbwJR5
         eOPbWx8UipBzCi4sVdxaoljBRNz1wezsTWSkQEjo92pPAFbbU/nqgJAYM4Re3vxDGkoi
         mJ0a9BtjTpJQpX3aoxzHISwCH1bm0Zt21sLRY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1679878006;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=iwNKwWEmP0+GBVy7Aoyp0/jnxyDCmqGAIfdYaEYV01Q=;
        b=gnIC07Yc+QAnajABGHKGopaJNbmV5lJXQtftNgtSM2E3gfYbQEzXTFBSv6ojI3GlkJ
         bDRFtAM1JW2lXoQqN//zP9mB1U5DAZwSWR5WpVrApKa1DN05NoZNFsoWSay+8QzuKCx8
         vsMJSaRSr6WhoHfXkYAitBJN9ZFE04DCruPR55K2e8loQhwFXtOQStPOM3G+crCoH24J
         BZyfvnzrByxt9ua4JMvkk+Kr1exsUcpfM8WHGKYeYzeLBbFI0huCq/vrI8Vvgyvl69xw
         yQ39MF4zdTwJ3WqhCni3QOPx4+IFGmYlsu5u2drgVovo2kCjDO3joaPR/Kylp7befI4W
         COZg==
X-Gm-Message-State: AAQBX9e6m8SBmvZMuGsR6ma1bzVXjVkXrTXE1PIeHJkcGJpkYjIxdgvG
	qqP+P16V9EPcipdNQgK/JthkRTJjf49arBHHmVY=
X-Google-Smtp-Source: AKy350YxyRrBNpB+l72B0KEPxWYOuuDAh8I+xWUczm85SPuXBBnshTxQkofqnrgwImaPDip50XzGGVfk680VYgKGsNQ=
X-Received: by 2002:a17:906:eec7:b0:93e:186f:ea0d with SMTP id
 wu7-20020a170906eec700b0093e186fea0dmr4376106ejb.15.1679878005645; Sun, 26
 Mar 2023 17:46:45 -0700 (PDT)
MIME-Version: 1.0
References: <20230322140348.569397-1-eajames@linux.ibm.com> <20230322140348.569397-5-eajames@linux.ibm.com>
In-Reply-To: <20230322140348.569397-5-eajames@linux.ibm.com>
From: Joel Stanley <joel@jms.id.au>
Date: Mon, 27 Mar 2023 00:46:33 +0000
Message-ID: <CACPK8XfJr03L43KbWcZ44nAiVhpPF8Pao2OM4R2F36b=bkQ-fQ@mail.gmail.com>
Subject: Re: [PATCH v3 4/4] ARM: dts: aspeed: bonnell: Add DIMM SPD
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
Cc: devicetree@vger.kernel.org, arnd@arndb.de, linux-aspeed@lists.ozlabs.org, gregkh@linuxfoundation.org, linux-kernel@vger.kernel.org, robh+dt@kernel.org, krzysztof.kozlowski+dt@linaro.org
Errors-To: linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org
Sender: "Linux-aspeed" <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>

On Wed, 22 Mar 2023 at 14:04, Eddie James <eajames@linux.ibm.com> wrote:
>
> Add the DIMM SPD to the processor I2C busses.
>
> Signed-off-by: Eddie James <eajames@linux.ibm.com>

Reviewed-by: Joel Stanley <joel@jms.id.au>

I will take this through the aspeed tree.

> ---
>  arch/arm/boot/dts/aspeed-bmc-ibm-bonnell.dts | 20 ++++++++++++++++++++
>  1 file changed, 20 insertions(+)
>
> diff --git a/arch/arm/boot/dts/aspeed-bmc-ibm-bonnell.dts b/arch/arm/boot/dts/aspeed-bmc-ibm-bonnell.dts
> index 79516dc21c01..ab99d915b50e 100644
> --- a/arch/arm/boot/dts/aspeed-bmc-ibm-bonnell.dts
> +++ b/arch/arm/boot/dts/aspeed-bmc-ibm-bonnell.dts
> @@ -232,18 +232,38 @@ cfam0_i2c1: i2c-bus@1 {
>
>                         cfam0_i2c10: i2c-bus@a {
>                                 reg = <10>;     /* OP3A */
> +
> +                               eeprom@50 {
> +                                       compatible = "atmel,at30tse004a";
> +                                       reg = <0x50>;
> +                               };
>                         };
>
>                         cfam0_i2c11: i2c-bus@b {
>                                 reg = <11>;     /* OP3B */
> +
> +                               eeprom@50 {
> +                                       compatible = "atmel,at30tse004a";
> +                                       reg = <0x50>;
> +                               };
>                         };
>
>                         cfam0_i2c12: i2c-bus@c {
>                                 reg = <12>;     /* OP4A */
> +
> +                               eeprom@50 {
> +                                       compatible = "atmel,at30tse004a";
> +                                       reg = <0x50>;
> +                               };
>                         };
>
>                         cfam0_i2c13: i2c-bus@d {
>                                 reg = <13>;     /* OP4B */
> +
> +                               eeprom@50 {
> +                                       compatible = "atmel,at30tse004a";
> +                                       reg = <0x50>;
> +                               };
>                         };
>
>                         cfam0_i2c14: i2c-bus@e {
> --
> 2.31.1
>
