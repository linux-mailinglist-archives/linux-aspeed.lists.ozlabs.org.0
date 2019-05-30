Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 5F8D630354
	for <lists+linux-aspeed@lfdr.de>; Thu, 30 May 2019 22:37:29 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 45FKBt1ZYPzDqTN
	for <lists+linux-aspeed@lfdr.de>; Fri, 31 May 2019 06:37:26 +1000 (AEST)
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=lunn.ch
 (client-ip=185.16.172.187; helo=vps0.lunn.ch; envelope-from=andrew@lunn.ch;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=lunn.ch
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=lunn.ch header.i=@lunn.ch header.b="wpGOi1iS"; 
 dkim-atps=neutral
Received: from vps0.lunn.ch (vps0.lunn.ch [185.16.172.187])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 45FKBT3mJyzDqK9
 for <linux-aspeed@lists.ozlabs.org>; Fri, 31 May 2019 06:37:01 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=lunn.ch;
 s=20171124; h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:
 Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=CzZNdS7LKVPhMQrMJpz7Y8+OpXbEAePhifOl33mCSkA=; b=wpGOi1iSqLulaxzZWywII1B+qn
 4EZSokjY+LbuOEdRHIuw+kiYGOjUslhLdD6IvizLXzwuI7rq2b8u3s0WlM7H8X6fYahnJqnPUztJ9
 a4K93qA0l8nJI0J8OvKIwfoohQsd5eNt5C1DAFet3ZVo05Rhh79zrYbz02TwcGMXSEq0=;
Received: from andrew by vps0.lunn.ch with local (Exim 4.89)
 (envelope-from <andrew@lunn.ch>)
 id 1hWRnB-0001ZU-H8; Thu, 30 May 2019 22:36:53 +0200
Date: Thu, 30 May 2019 22:36:53 +0200
From: Andrew Lunn <andrew@lunn.ch>
To: Alexander Filippov <a.filippov@yadro.com>
Subject: Re: [PATCH v2] ARM: dts: aspeed: Add YADRO VESNIN BMC
Message-ID: <20190530203653.GD1561@lunn.ch>
References: <20190530143933.25414-1-a.filippov@yadro.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20190530143933.25414-1-a.filippov@yadro.com>
User-Agent: Mutt/1.5.23 (2014-03-12)
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
 linux-aspeed@lists.ozlabs.org, linux-kernel@vger.kernel.org,
 Rob Herring <robh+dt@kernel.org>, linux-arm-kernel@lists.infradead.org
Errors-To: linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org
Sender: "Linux-aspeed"
 <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>

On Thu, May 30, 2019 at 05:39:33PM +0300, Alexander Filippov wrote:
> VESNIN is an OpenPower machine with an Aspeed 2400 BMC SoC manufactured
> by YADRO.
> 
> Signed-off-by: Alexander Filippov <a.filippov@yadro.com>
> ---
>  arch/arm/boot/dts/Makefile                  |   1 +
>  arch/arm/boot/dts/aspeed-bmc-opp-vesnin.dts | 234 ++++++++++++++++++++
>  2 files changed, 235 insertions(+)
>  create mode 100644 arch/arm/boot/dts/aspeed-bmc-opp-vesnin.dts
> 
> diff --git a/arch/arm/boot/dts/Makefile b/arch/arm/boot/dts/Makefile
> index 834cce80d1b8..811e9312cf22 100644
> --- a/arch/arm/boot/dts/Makefile
> +++ b/arch/arm/boot/dts/Makefile
> @@ -1259,6 +1259,7 @@ dtb-$(CONFIG_ARCH_ASPEED) += \
>  	aspeed-bmc-microsoft-olympus.dtb \
>  	aspeed-bmc-opp-lanyang.dtb \
>  	aspeed-bmc-opp-palmetto.dtb \
> +	aspeed-bmc-opp-vesnin.dtb \
>  	aspeed-bmc-opp-romulus.dtb \
>  	aspeed-bmc-opp-swift.dtb \
>  	aspeed-bmc-opp-witherspoon.dtb \

Hi Alexander

Still not correctly sorted.

      Andrew
