Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id F0074156D97
	for <lists+linux-aspeed@lfdr.de>; Mon, 10 Feb 2020 03:28:37 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 48G8wM3T61zDqRC
	for <lists+linux-aspeed@lfdr.de>; Mon, 10 Feb 2020 13:28:35 +1100 (AEDT)
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::741;
 helo=mail-qk1-x741.google.com; envelope-from=joel.stan@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=jms.id.au
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 secure) header.d=jms.id.au header.i=@jms.id.au header.a=rsa-sha256
 header.s=google header.b=KOjhJo+j; dkim-atps=neutral
Received: from mail-qk1-x741.google.com (mail-qk1-x741.google.com
 [IPv6:2607:f8b0:4864:20::741])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 48G8wD7448zDqQT
 for <linux-aspeed@lists.ozlabs.org>; Mon, 10 Feb 2020 13:28:28 +1100 (AEDT)
Received: by mail-qk1-x741.google.com with SMTP id h4so5161835qkm.0
 for <linux-aspeed@lists.ozlabs.org>; Sun, 09 Feb 2020 18:28:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=jms.id.au; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=A2hVfVVesl1I7h398CNSJxTmpIb+Kk1JFe2I8ygn1Xg=;
 b=KOjhJo+j/14twubHUiQecoKuUMzxJsS2AExv5XM8clrpBmyY1O0IiCtrsp+JtqycO8
 treo2jRBtklijyTDszDf6YngLha8w3jbTOIK9ckqgEXwW5yw1NMSbWVrf8SBN/ukoOm5
 0ayg/fAfeQ0vlXenhKzDCe6Djb2kFPnnKivJ4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=A2hVfVVesl1I7h398CNSJxTmpIb+Kk1JFe2I8ygn1Xg=;
 b=m6LMm65A07OR7q9X1X342cnC3uES6J44pcW8Ms2E1QDHUTh01zV1JtzNaKg6RyrZ5o
 Y8vsDnoSKGWekSj3bGLTaqV+p3nwKmxEIAUVxeru8/ifaQ5bHlTYIXDLs/H2DyfY2dJD
 WRn//WXVrG5loqXGK6gTRAc9AXg5ox9r8xcO/v81X1+CEzrwWn+B/uJz2W6RUFKjZfLa
 6Y7QPGB7cLfEeC28asJO0q4fi2vTCmrudNdBgBqDFS8aw31io43CTkwDhubPVDMiBg8B
 SIZJt0Hp6RvysKZrWhzaCYyPu+P8vt80jbIwkMy5WU3P4iWH632+huXO7RXE7HeM9AwY
 TECQ==
X-Gm-Message-State: APjAAAXUw0piJxBBAfhqbWiC/Ux1zd5TZ2t8l2retaiPZunn6VB4V2T0
 KflK3kAcjK1hOF6Pm1DW6k9t2nNLMQo7dM/NE8Y=
X-Google-Smtp-Source: APXvYqzUlkkO8FdUe/RhG1U+nakzNskPxmR8Aa8M/wDnOL2BqgGPWFC9+/BP9Ggn8sDUkznCBnfkkds1gvWmNMOmwHY=
X-Received: by 2002:a05:620a:c96:: with SMTP id
 q22mr8923890qki.330.1581301704884; 
 Sun, 09 Feb 2020 18:28:24 -0800 (PST)
MIME-Version: 1.0
References: <20200204224908.19967-1-eajames@linux.ibm.com>
 <20200204224908.19967-2-eajames@linux.ibm.com>
In-Reply-To: <20200204224908.19967-2-eajames@linux.ibm.com>
From: Joel Stanley <joel@jms.id.au>
Date: Mon, 10 Feb 2020 02:28:13 +0000
Message-ID: <CACPK8XcYSoAM0VZFZSnVTRXHsEcib+-s8e3p7HD67VV35hEA=Q@mail.gmail.com>
Subject: Re: [PATCH 1/2] ARM: dts: aspeed: ast2500: Fix SCU IRQ controller
 node address
To: Eddie James <eajames@linux.ibm.com>, Andrew Jeffery <andrew@aj.id.au>
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

On Tue, 4 Feb 2020 at 22:49, Eddie James <eajames@linux.ibm.com> wrote:
>
> The node was defined with a unit address but had no reg property,
> resulting in a warning. The address is unecessary, so drop it.

Please add a reg property instead of removing the unit address.

The hardware still lives at that address, even if your driver doesn't
currently use that information.

Cheers,

Joel

>
> Signed-off-by: Eddie James <eajames@linux.ibm.com>
> ---
>  arch/arm/boot/dts/aspeed-g5.dtsi | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/arch/arm/boot/dts/aspeed-g5.dtsi b/arch/arm/boot/dts/aspeed-g5.dtsi
> index 569f9d74c696..aeee18fc1e7e 100644
> --- a/arch/arm/boot/dts/aspeed-g5.dtsi
> +++ b/arch/arm/boot/dts/aspeed-g5.dtsi
> @@ -222,7 +222,7 @@ syscon: syscon@1e6e2000 {
>                                 #clock-cells = <1>;
>                                 #reset-cells = <1>;
>
> -                               scu_ic: interrupt-controller@18 {
> +                               scu_ic: interrupt-controller {
>                                         #interrupt-cells = <1>;
>                                         compatible = "aspeed,ast2500-scu-ic";
>                                         interrupts = <21>;
> --
> 2.24.0
>
