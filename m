Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id B7C8011002C
	for <lists+linux-aspeed@lfdr.de>; Tue,  3 Dec 2019 15:31:46 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 47S4Db1N9FzDqXR
	for <lists+linux-aspeed@lfdr.de>; Wed,  4 Dec 2019 01:31:43 +1100 (AEDT)
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=kernel.org (client-ip=198.145.29.99; helo=mail.kernel.org;
 envelope-from=robh+dt@kernel.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=kernel.org
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=kernel.org header.i=@kernel.org header.b="KZ3PkNns"; 
 dkim-atps=neutral
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 47S4DL3BcxzDqVs
 for <linux-aspeed@lists.ozlabs.org>; Wed,  4 Dec 2019 01:31:29 +1100 (AEDT)
Received: from mail-qv1-f41.google.com (mail-qv1-f41.google.com
 [209.85.219.41])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 4C8112073C
 for <linux-aspeed@lists.ozlabs.org>; Tue,  3 Dec 2019 14:31:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1575383487;
 bh=paDjy7hZsmQkcUp7jKSH70ftPLffSgdTsEFpUetgz24=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=KZ3PkNnslqc7BEkuj8s892JHiyp111mpjo13oyKF2LEIsAAcH/hc5JifebD94uck3
 nvVaUSye1Jaz8ajRoUANeZarO5PaXCebynHCFsWg9UsJyvHq5vbTBbBh+fkKJlWy4n
 ygD9D5lhomlPo1jbX8Cgfpm0LyJHYR996Q4klzU0=
Received: by mail-qv1-f41.google.com with SMTP id i3so1563758qvv.7
 for <linux-aspeed@lists.ozlabs.org>; Tue, 03 Dec 2019 06:31:27 -0800 (PST)
X-Gm-Message-State: APjAAAWcCDKbbvPL3Llyi5Gb7L0LMXXzvi8RiYykKpWKhprCekg+s59m
 bEXFY36g/BI7YvAU6yAhMhRc8jwl6CarloPhAw==
X-Google-Smtp-Source: APXvYqxDBnGQNKjTk3qSKKiOvMvxPKQPV7m6ur08FqhiSl9j9w8DAHBF3481M9puWdGG8hXS2X7yJKuiKlMAjUfp4E0=
X-Received: by 2002:a05:6214:11ac:: with SMTP id
 u12mr5420247qvv.85.1575383483847; 
 Tue, 03 Dec 2019 06:31:23 -0800 (PST)
MIME-Version: 1.0
References: <cover.5630f63168ad5cddf02e9796106f8e086c196907.1575376664.git-series.andrew@aj.id.au>
 <3da2492c244962c27b21aad87bfa6bf74f568f1d.1575376664.git-series.andrew@aj.id.au>
In-Reply-To: <3da2492c244962c27b21aad87bfa6bf74f568f1d.1575376664.git-series.andrew@aj.id.au>
From: Rob Herring <robh+dt@kernel.org>
Date: Tue, 3 Dec 2019 08:31:10 -0600
X-Gmail-Original-Message-ID: <CAL_Jsq+3qXJbTu9G42g11PLJH-A0XeSQmJKj0obO32QFna3dEA@mail.gmail.com>
Message-ID: <CAL_Jsq+3qXJbTu9G42g11PLJH-A0XeSQmJKj0obO32QFna3dEA@mail.gmail.com>
Subject: Re: [PATCH 1/3] dt-bindings: ipmi: aspeed: Introduce a v2 binding for
 KCS
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
Cc: Mark Rutland <mark.rutland@arm.com>, devicetree@vger.kernel.org,
 Corey Minyard <minyard@acm.org>, Arnd Bergmann <arnd@arndb.de>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 linux-aspeed@lists.ozlabs.org, openipmi-developer@lists.sourceforge.net,
 "moderated list:ARM/FREESCALE IMX / MXC ARM ARCHITECTURE"
 <linux-arm-kernel@lists.infradead.org>
Errors-To: linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org
Sender: "Linux-aspeed"
 <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>

On Tue, Dec 3, 2019 at 6:36 AM Andrew Jeffery <andrew@aj.id.au> wrote:
>
> The v2 binding utilises reg and renames some of the v1 properties.
>
> Signed-off-by: Andrew Jeffery <andrew@aj.id.au>
> ---
>  Documentation/devicetree/bindings/ipmi/aspeed-kcs-bmc.txt | 20 +++++---
>  1 file changed, 14 insertions(+), 6 deletions(-)
>
> diff --git a/Documentation/devicetree/bindings/ipmi/aspeed-kcs-bmc.txt b/Documentation/devicetree/bindings/ipmi/aspeed-kcs-bmc.txt
> index d98a9bf45d6c..76b180ebbde4 100644
> --- a/Documentation/devicetree/bindings/ipmi/aspeed-kcs-bmc.txt
> +++ b/Documentation/devicetree/bindings/ipmi/aspeed-kcs-bmc.txt
> @@ -1,9 +1,10 @@
> -* Aspeed KCS (Keyboard Controller Style) IPMI interface
> +# Aspeed KCS (Keyboard Controller Style) IPMI interface
>
>  The Aspeed SOCs (AST2400 and AST2500) are commonly used as BMCs
>  (Baseboard Management Controllers) and the KCS interface can be
>  used to perform in-band IPMI communication with their host.
>
> +## v1
>  Required properties:
>  - compatible : should be one of
>      "aspeed,ast2400-kcs-bmc"
> @@ -12,14 +13,21 @@ Required properties:
>  - kcs_chan : The LPC channel number in the controller
>  - kcs_addr : The host CPU IO map address
>
> +## v2
> +Required properties:
> +- compatible : should be one of
> +    "aspeed,ast2400-kcs-bmc-v2"
> +    "aspeed,ast2500-kcs-bmc-v2"
> +- reg : The address and size of the IDR, ODR and STR registers
> +- interrupts : interrupt generated by the controller
> +- slave-reg : The host CPU IO map address

aspeed,slave-reg

>
>  Example:
>
> -    kcs3: kcs3@0 {
> -        compatible = "aspeed,ast2500-kcs-bmc";
> -        reg = <0x0 0x80>;
> +    kcs3: kcs@24 {
> +        compatible = "aspeed,ast2500-kcs-bmc-v2";
> +        reg = <0x24 0x1>, <0x30 0x1>, <0x3c 0x1>;

What are the other registers in this address space? I'm not so sure
this is an improvement if you end up with a bunch of nodes with single
registers.

>          interrupts = <8>;
> -        kcs_chan = <3>;
> -        kcs_addr = <0xCA2>;
> +        slave-reg = <0xca2>;
>          status = "okay";
>      };
> --
> git-series 0.9.1
