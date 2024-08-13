Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 72BFE95095F
	for <lists+linux-aspeed@lfdr.de>; Tue, 13 Aug 2024 17:46:37 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=BK+vCDi0;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4WjwjR2dmBz2yPR
	for <lists+linux-aspeed@lfdr.de>; Wed, 14 Aug 2024 01:46:35 +1000 (AEST)
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=kernel.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=BK+vCDi0;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=145.40.73.55; helo=sin.source.kernel.org; envelope-from=robh@kernel.org; receiver=lists.ozlabs.org)
Received: from sin.source.kernel.org (sin.source.kernel.org [145.40.73.55])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4WjwjL5FLfz2xjk
	for <linux-aspeed@lists.ozlabs.org>; Wed, 14 Aug 2024 01:46:30 +1000 (AEST)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sin.source.kernel.org (Postfix) with ESMTP id 9A431CE14A3;
	Tue, 13 Aug 2024 15:46:29 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 30244C4AF0B;
	Tue, 13 Aug 2024 15:46:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1723563988;
	bh=OvSdMM09vl0EzDvUZOZ3ckjGUvUcbMqlTlXMiqisvpM=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=BK+vCDi0AQmNFPNbEZQ25I7BdA8glOk+cUQX1ar+u9Ji9Z2JWh9QYnXx+cxZ3RS0s
	 xIA/rWmq71oZI4IMaxDQKPkqWKiEookEGU9xZDPI6rhgywrLpkNfoy1TFYGSennB7K
	 lg3opmpqhmeGHrcnJU9Cjaujoz0Fz0MK+y2YakA6Wm/LVN7zhbZ5zylDjhBOLdLdt3
	 e+RnyJRyWy2O0TnuTB89xlgosdkG11c3J6V6EWeitT5JtZ8By+VN5JzEdSkjbU5qVW
	 N2W4P4mMgaiykgGZZl21WmUGnTm2/pguS+n+lvPtCke6BgKuVD65XdF0/HpCCa8VBZ
	 vUo4Rl5SOjJ9g==
Date: Tue, 13 Aug 2024 09:46:26 -0600
From: "Rob Herring (Arm)" <robh@kernel.org>
To: Andrew Jeffery <andrew@codeconstruct.com.au>
Subject: Re: [PATCH v2 2/2] dt-bindings: misc: aspeed,ast2400-cvic: Convert
 to DT schema
Message-ID: <172356398413.1009063.989428547920653092.robh@kernel.org>
References: <20240808-dt-warnings-irq-aspeed-dt-schema-v2-0-c2531e02633d@codeconstruct.com.au>
 <20240808-dt-warnings-irq-aspeed-dt-schema-v2-2-c2531e02633d@codeconstruct.com.au>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240808-dt-warnings-irq-aspeed-dt-schema-v2-2-c2531e02633d@codeconstruct.com.au>
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
Cc: devicetree@vger.kernel.org, Conor Dooley <conor+dt@kernel.org>, linux-aspeed@lists.ozlabs.org, linux-kernel@vger.kernel.org, Krzysztof Kozlowski <krzk+dt@kernel.org>, Thomas Gleixner <tglx@linutronix.de>, linux-arm-kernel@lists.infradead.org
Errors-To: linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org
Sender: "Linux-aspeed" <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>


On Thu, 08 Aug 2024 13:44:25 +0930, Andrew Jeffery wrote:
> Address warnings such as:
> 
>     arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-galaxy100.dtb: interrupt-controller@1e6c0080: 'valid-sources' does not match any of the regexes: 'pinctrl-[0-9]+'
> 
> and
> 
>     arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-galaxy100.dtb: /ahb/copro-interrupt-controller@1e6c2000: failed to match any schema with compatible: ['aspeed,ast2400-cvic', 'aspeed-cvic']
> 
> Note that the conversion to DT schema causes some further warnings to
> be emitted, because the Aspeed devicetrees are not in great shape. These
> new warnings are resolved in a separate series:
> 
> https://lore.kernel.org/lkml/20240802-dt-warnings-bmc-dts-cleanups-v1-0-1cb1378e5fcd@codeconstruct.com.au/
> 
> Signed-off-by: Andrew Jeffery <andrew@codeconstruct.com.au>
> ---
>  .../bindings/misc/aspeed,ast2400-cvic.yaml         | 60 ++++++++++++++++++++++
>  .../devicetree/bindings/misc/aspeed,cvic.txt       | 35 -------------
>  2 files changed, 60 insertions(+), 35 deletions(-)
> 

Applied, thanks!

