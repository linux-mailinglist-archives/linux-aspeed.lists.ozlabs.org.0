Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id CEEE311ED1B
	for <lists+linux-aspeed@lfdr.de>; Fri, 13 Dec 2019 22:43:11 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 47ZPKm2Xd8zDrG3
	for <lists+linux-aspeed@lfdr.de>; Sat, 14 Dec 2019 08:43:08 +1100 (AEDT)
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=209.85.210.66; helo=mail-ot1-f66.google.com;
 envelope-from=robherring2@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=fail (p=none dis=none) header.from=kernel.org
Received: from mail-ot1-f66.google.com (mail-ot1-f66.google.com
 [209.85.210.66])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 47ZPKh0QHRzDrDp
 for <linux-aspeed@lists.ozlabs.org>; Sat, 14 Dec 2019 08:43:01 +1100 (AEDT)
Received: by mail-ot1-f66.google.com with SMTP id a15so785360otf.1
 for <linux-aspeed@lists.ozlabs.org>; Fri, 13 Dec 2019 13:43:01 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=MQB7TjgV5T4jJMqF680Zx8rqtE1zr7TyNkD+NPMNF7I=;
 b=luOwp0l0Mos7THJLJB7cAayW3ZeWoWuSqwAOJB9CxH5t0zg9a3VhpAsiQFoALOIi/c
 JrtMhu51Fp0+rimR3bwf3qv8XWL0iiZuq6iQHL5NxKMQFlGQz7C7HVh+8CpykFFI+EUW
 rN50Vv0qlDuXbQUbsruXVHoYltmw0ao1KqV4DUIMgNx6ss21VaTm0rpIvwrgPvz37Mlv
 u3qB+OrtxkUlcyp4jM8RpbqJTpKxRC+zR8NlJF5Db5YpfR9IBDVn2QO1CqE+oV8y0QR6
 rxit4vsLx/xErKHccEhalqc4GDgMQw+HhtfhBfeQLMCi6SOwlY4mstThHZ/I8ROJd6f5
 C76w==
X-Gm-Message-State: APjAAAVcefgFIdtBL7lHrJa4Aq73gD8UjGv77fa6+B9cvzdADu5Kt9mz
 EaF3cWmr4EmsKPaBXSc+EZTR+CY=
X-Google-Smtp-Source: APXvYqx7rWl74CdJfig+1YJkGKx/BE+J3zlPUfgUhv++wHBmfMeBJCoKxZuNeUbMU8aCLoWVjqAXSg==
X-Received: by 2002:a9d:6a8f:: with SMTP id l15mr16522804otq.59.1576273380100; 
 Fri, 13 Dec 2019 13:43:00 -0800 (PST)
Received: from localhost (24-155-109-49.dyn.grandenetworks.net.
 [24.155.109.49])
 by smtp.gmail.com with ESMTPSA id s83sm3733871oif.33.2019.12.13.13.42.59
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 13 Dec 2019 13:42:59 -0800 (PST)
Date: Fri, 13 Dec 2019 15:42:58 -0600
From: Rob Herring <robh@kernel.org>
To: Joel Stanley <joel@jms.id.au>
Subject: Re: [PATCH v2 1/2] dt-bindings: mfd: Add ast2600 to ASPEED LPC
Message-ID: <20191213214258.GA7625@bogus>
References: <20191129000827.650566-1-joel@jms.id.au>
 <20191129000827.650566-2-joel@jms.id.au>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20191129000827.650566-2-joel@jms.id.au>
User-Agent: Mutt/1.10.1 (2018-07-13)
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
Cc: devicetree@vger.kernel.org, linux-aspeed@lists.ozlabs.org,
 Philipp Zabel <p.zabel@pengutronix.de>, Lee Jones <lee.jones@linaro.org>,
 linux-arm-kernel@lists.infradead.org
Errors-To: linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org
Sender: "Linux-aspeed"
 <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>

On Fri, Nov 29, 2019 at 10:38:26AM +1030, Joel Stanley wrote:
> The AST2600 has the same LPC layout as previous generation SoCs.
> 
> Signed-off-by: Joel Stanley <joel@jms.id.au>
> ---
> v2: Fix cut and paste error in reset bindings
> ---
>  Documentation/devicetree/bindings/mfd/aspeed-lpc.txt | 11 +++++++++--
>  1 file changed, 9 insertions(+), 2 deletions(-)
> 
> diff --git a/Documentation/devicetree/bindings/mfd/aspeed-lpc.txt b/Documentation/devicetree/bindings/mfd/aspeed-lpc.txt
> index 86446074e206..a5d89aa9a3c1 100644
> --- a/Documentation/devicetree/bindings/mfd/aspeed-lpc.txt
> +++ b/Documentation/devicetree/bindings/mfd/aspeed-lpc.txt
> @@ -46,6 +46,7 @@ Required properties
>  - compatible:	One of:
>  		"aspeed,ast2400-lpc", "simple-mfd"
>  		"aspeed,ast2500-lpc", "simple-mfd"
> +		"aspeed,ast2600-lpc", "simple-mfd"
>  
>  - reg:		contains the physical address and length values of the Aspeed
>                  LPC memory region.
> @@ -64,6 +65,7 @@ BMC Node
>  - compatible:	One of:
>  		"aspeed,ast2400-lpc-bmc"
>  		"aspeed,ast2500-lpc-bmc"
> +		"aspeed,ast2600-lpc-bmc"
>  
>  - reg:		contains the physical address and length values of the
>                  H8S/2168-compatible LPC controller memory region
> @@ -128,6 +130,7 @@ Required properties:
>  - compatible:	One of:
>  		"aspeed,ast2400-lpc-ctrl";
>  		"aspeed,ast2500-lpc-ctrl";
> +		"aspeed,ast2600-lpc-ctrl";
>  
>  - reg:		contains offset/length values of the host interface controller
>  		memory regions
> @@ -168,6 +171,7 @@ Required properties:
>  - compatible:	One of:
>  		"aspeed,ast2400-lhc";
>  		"aspeed,ast2500-lhc";
> +		"aspeed,ast2600-lhc";
>  
>  - reg:		contains offset/length values of the LHC memory regions. In the
>  		AST2400 and AST2500 there are two regions.
> @@ -187,8 +191,11 @@ state of the LPC bus. Some systems may chose to modify this configuration.
>  
>  Required properties:
>  
> - - compatible:		"aspeed,ast2500-lpc-reset" or
> -			"aspeed,ast2400-lpc-reset"
> + - compatible:		One of:
> +			"aspeed,ast2400-reset";
> +			"aspeed,ast2500-reset";
> +			"aspeed,ast2600-reset";

Doesn't match what's in the driver.

Rob
